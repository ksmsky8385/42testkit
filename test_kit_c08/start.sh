#!/bin/bash

# [경로 설정]
# 스크립트는 ./test_kit_c08/start.sh 로 실행되므로
# $(dirname "$0")은 ./test_kit_c08 이 됩니다.
KIT_ROOT=$(dirname "$0")

# 현재 위치(루트)에 있는 ex00 ~ ex05 디렉토리를 순회
# 순서를 보장하기 위해 명시적으로 리스트업하거나 정렬
for dir in ex00 ex01 ex02 ex03 ex04 ex05; do
    
    # 해당 디렉토리가 존재하지 않으면 스킵
    if [ ! -d "$dir" ]; then
        continue
    fi

    # [특수 처리] ex05는 ex04 차례에서 통합 처리하므로 루프에서 건너뜀
    if [ "$dir" == "ex05" ]; then
        continue
    fi

    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "********************************************************************************"
    echo ">>> 문제 번호: $dir"
    
    # --- [Step 1] Norminette 검사 ---
    echo ""
    echo "[1. Norminette 검사]"
    
    if [ "$dir" == "ex01" ] || [ "$dir" == "ex02" ]; then
        # ex01, ex02는 헤더만 있거나 매크로 확인 필요 (-R CheckDefine)
        norminette -R CheckDefine "$dir"
    elif [ "$dir" == "ex04" ]; then
        # ex04는 ex05와 함께 검사 (ex05가 존재할 경우)
        if [ -d "ex05" ]; then
            norminette "$dir" "ex05"
        else
            norminette "$dir"
        fi
    else
        # 그 외 일반적인 경우
        norminette "$dir"
    fi

    # --- [Step 2] 제출한 소스 코드 출력 ---
    echo ""
    echo "[2. 제출한 코드 내용]"

    # 함수: 디렉토리 내 소스 파일 출력
    print_submission() {
        local target="$1"
        if [ -d "$target" ]; then
            # .c 또는 .h 파일 찾기 (main.c 제외 여부는 상황에 따라 조정, 여기선 제출된 건 다 보여줌)
            local files=$(find "$target" -maxdepth 1 \( -name "*.c" -o -name "*.h" \))
            if [ -z "$files" ]; then
                echo "  (No source files in $target)"
            else
                for f in $files; do
                    echo "--- [제출: $target] $(basename "$f") ---"
                    cat "$f"
                    echo ""
                done
            fi
        fi
    }

    print_submission "$dir"
    
    # ex04인 경우 ex05 내용도 출력
    if [ "$dir" == "ex04" ] && [ -d "ex05" ]; then
        print_submission "ex05"
    fi

    # --- [Step 3] 테스트 킷 파일 출력 ---
    # 테스트 킷 경로 설정
    if [ "$dir" == "ex04" ]; then
        KIT_SRC_DIR="$KIT_ROOT/ex04&05"
    else
        KIT_SRC_DIR="$KIT_ROOT/$dir"
    fi

    if [ ! -d "$KIT_SRC_DIR" ]; then
        echo "Warning: 테스트 킷 디렉토리가 없습니다 ($KIT_SRC_DIR). 스킵합니다."
        continue
    fi

    echo ""
    echo "[3. 테스트 킷 파일 내용 ($KIT_SRC_DIR)]"
    
    # 테스트 킷 내부 파일 출력
    KIT_FILES=$(find "$KIT_SRC_DIR" -maxdepth 1 -type f)
    for kf in $KIT_FILES; do
        echo "--- [TestKit] $(basename "$kf") ---"
        cat "$kf"
        echo ""
    done

    # --- [Step 4] 파일 복사 (준비 단계) ---
    # 나중에 삭제하기 위해 복사된 파일 목록을 추적
    declare -a COPIED_FILES

    # 1. 테스트 킷 파일들을 문제 폴더($dir)로 복사
    for kf in $KIT_FILES; do
        cp "$kf" "$dir/"
        COPIED_FILES+=("$(basename "$kf")")
    done

    # 2. ex04인 경우 ex05의 파일들을 ex04 폴더로 복사
    if [ "$dir" == "ex04" ] && [ -d "ex05" ]; then
        EX05_FILES=$(find "ex05" -maxdepth 1 \( -name "*.c" -o -name "*.h" \))
        for ef in $EX05_FILES; do
            cp "$ef" "$dir/"
            COPIED_FILES+=("$(basename "$ef")")
        done
    fi

    # --- [Step 5] 컴파일 및 실행 ---
    echo ""
    echo "[4. 컴파일 및 실행 결과]"
    
    # 작업 디렉토리로 이동
    cd "$dir" || exit

    # 컴파일 (폴더 내의 모든 .c 파일)
    cc -Wall -Wextra -Werror *.c -o test_out
    
    if [ $? -eq 0 ]; then
        echo ">>> 컴파일 성공. 실행 중..."
        echo "----------------------------------------"
        # Valgrind로 실행
        valgrind -q --leak-check=full ./test_out
        echo "----------------------------------------"
        
        # 실행 파일 삭제
        rm -f test_out
    else
        echo "!!! 컴파일 에러 !!!"
    fi

    # --- 뒷정리 (복사했던 파일들 삭제) ---
    for trash in "${COPIED_FILES[@]}"; do
        rm -f "$trash"
    done

    # 다시 루트로 복귀
    cd ..
    
    echo ""
    echo ""
done
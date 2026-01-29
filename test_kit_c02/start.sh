#!/bin/bash

# [경로 설정]
# 스크립트가 있는 위치(test_kit 폴더)를 알아냅니다.
KIT_DIR=$(dirname "$0")
# mains 폴더는 스크립트와 같은 위치(test_kit/mains)에 있다고 가정합니다.
MAINS_DIR="$KIT_DIR/mains"

# mains 폴더가 없으면 경고 (경로 확인용)
if [ ! -d "$MAINS_DIR" ]; then
    echo "Error: '$MAINS_DIR' 경로에 mains 폴더가 없습니다."
    exit 1
fi

# 현재 위치(과제 루트)에 있는 ex00, ex01 ... 폴더를 순회
for dir in ex*; do
    if [ -d "$dir" ]; then
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo "********************************************************************************"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        
        # 1. 문항 번호 추출
        NUM=${dir:2}
        
        # 2. 해당 문항의 풀이 파일(.c) 찾기 (main.c 제외)
        SRC_FILE=$(find "$dir" -maxdepth 1 -name "*.c" ! -name "main.c" | head -n 1)
        
        if [ -z "$SRC_FILE" ]; then
            echo "[$dir] 풀이 파일(.c)이 없습니다."
            continue
        fi

        # 3. 파일 이름에서 함수명 추측
        FILENAME=$(basename "$SRC_FILE")
        
        # --- [Step 1] 헤더 출력 ---
        echo ">>> 문제 번호: $dir - 대상 파일: $FILENAME"

        # --- [Step 2] Norminette 검사 ---
        echo ""
        echo "[Norminette 검사]"
        norminette "$SRC_FILE"

        # --- [Step 3] 메인 코드 복사 및 준비 ---
        # test_kit/mains/ex00_main.c 를 찾음
        MAIN_SRC="$MAINS_DIR/${dir}_main.c"
        
        if [ -f "$MAIN_SRC" ]; then
            cp "$MAIN_SRC" "$dir/main.c"
        else
            echo "Warning: $MAIN_SRC 파일이 없습니다. 스킵합니다."
            continue
        fi

        # --- [Step 4] 소스 코드 & 메인 코드 내용 출력 ---
        echo ""
        echo "[풀이 함수 코드 ($FILENAME)]"
        cat "$SRC_FILE"
        
        echo ""
        echo "[테스트용 메인 코드 (${dir}_main.c)]"
        cat "$dir/main.c"
        
        # --- [Step 5] 컴파일 및 실행 ---
        echo ""
        echo "[실행 결과]"

        # 해당 폴더로 이동해서 컴파일 후 다시 복귀
        cd "$dir"
        cc -Wall -Wextra -Werror *.c -o test_out
        
        if [ $? -eq 0 ]; then
            ./test_out
            rm test_out main.c  # 실행 후 청소
        else
            echo "!!! 컴파일 에러 발생 !!!"
            rm main.c
        fi
        
        cd ..
        echo ""
        echo ""
    fi
done

#!/bin/bash

# [경로 설정]
KIT_DIR=$(dirname "$0")
MAINS_DIR="$KIT_DIR/mains"

if [ ! -d "$MAINS_DIR" ]; then
    echo "Error: '$MAINS_DIR' 경로에 mains 폴더가 없습니다."
    exit 1
fi

for dir in ex*; do
    if [ -d "$dir" ]; then
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo "********************************************************************************"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        
        # 1. 문항 번호 추출
        NUM=${dir:2}
        
        # 2. 해당 문항의 풀이 파일들(.c) 찾기 (main.c 제외, head -n 1 제거함)
        SRC_FILES=$(find "$dir" -maxdepth 1 -name "*.c" ! -name "main.c")
        
        # 파일이 하나도 없으면 스킵
        if [ -z "$SRC_FILES" ]; then
            echo "[$dir] 풀이 파일(.c)이 없습니다."
            continue
        fi

        # --- [Step 1] 헤더 출력 ---
        # 여러 파일일 수 있으므로 줄바꿈으로 구분해서 보여줌
        echo ">>> 문제 번호: $dir"
        echo ">>> 대상 파일 목록:"
        # 파일 경로에서 파일명만 예쁘게 잘라내서 보여주기
        for f in $SRC_FILES; do
            echo "    - $(basename "$f")"
        done

        # --- [Step 2] Norminette 검사 ---
        echo ""
        echo "[Norminette 검사]"
        # SRC_FILES에 여러 파일 경로가 들어있으므로 한 번에 검사 가능
        norminette $SRC_FILES

        # --- [Step 3] 메인 코드 복사 및 준비 ---
        MAIN_SRC="$MAINS_DIR/${dir}_main.c"
        
        if [ -f "$MAIN_SRC" ]; then
            cp "$MAIN_SRC" "$dir/main.c"
        else
            echo "Warning: $MAIN_SRC 파일이 없습니다. 스킵합니다."
            continue
        fi

        # --- [Step 4] 소스 코드 & 메인 코드 내용 출력 ---
        echo ""
        echo "[제출한 코드 내용]"
        
        # 발견된 모든 파일을 순회하며 출력
        for file in $SRC_FILES; do
            FILENAME=$(basename "$file")
            echo "--- $FILENAME ---"
            cat "$file"
            echo "" # 파일 간 구분을 위한 공백
        done
        
        echo "[테스트용 메인 코드 (${dir}_main.c)]"
        cat "$dir/main.c"
        
        # --- [Step 5] 컴파일 및 실행 ---
        echo ""
        echo "[실행 결과]"

        cd "$dir"
        # *.c 는 폴더 내의 모든 c파일(제출한 여러 파일 + main.c)을 다 포함합니다.
        cc -Wall -Wextra -Werror *.c -o test_out
        
        if [ $? -eq 0 ]; then
            valgrind -q --leak-check=full ./test_out
            rm test_out main.c
        else
            echo "!!! 컴파일 에러 발생 !!!"
            rm main.c
        fi
        
        cd ..
        echo ""
        echo ""
    fi
done

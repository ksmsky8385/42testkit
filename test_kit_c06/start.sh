#!/bin/bash

# [경로 설정]
# 스크립트가 있는 위치(test_kit 폴더)를 알아냅니다.
KIT_DIR=$(dirname "$0")
# mains 폴더는 스크립트와 같은 위치(test_kit/mains)에 있다고 가정합니다.
MAINS_DIR="$KIT_DIR/mains"

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


        # --- [Step 4] 소스 코드 & 메인 코드 내용 출력 ---
        echo ""
        echo "[풀이 함수 코드 ($FILENAME)]"
        cat "$SRC_FILE"
        
        # --- [Step 5] 컴파일 및 실행 ---
        echo ""
        echo "[실행 결과]"
        echo "%>./a.out Donut Honeycomb Donut Gingerbread Eclair Cupcake Froyo | cat -e"

        # 해당 폴더로 이동해서 컴파일 후 다시 복귀
        cd "$dir"
        cc -Wall -Wextra -Werror *.c
        
        if [ $? -eq 0 ]; then
            ./a.out Donut Honeycomb Donut Gingerbread Eclair Cupcake Froyo | cat -e
            rm a.out
        else
            echo "!!! 컴파일 에러 발생 !!!"
            rm main.c
        fi
        
        cd ..
        echo ""
        echo ""
    fi
done

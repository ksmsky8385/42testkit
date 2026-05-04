#!/bin/bash

# ARGS=" 9 8 7 6 5 4 3 2 1 0"
# ARGS=$(seq 500 -1 1 | tr '\n' ' ')
ARGS=$(shuf -i 0-9999 -n 500 | tr '\n' ' ')

STRATEGY="--medium"

CHECKER="checker_linux"

TMP_INS=$(mktemp)
TMP_BENCH=$(mktemp)

valgrind -q --leak-check=full --show-leak-kinds=all \
    ./push_swap --bench $STRATEGY $ARGS \
    1> "$TMP_INS" 2> "$TMP_BENCH"

echo "=== Bench (stderr) ==="

cat "$TMP_BENCH"
echo "----------------------"

echo -n "$CHECKER Result : "
valgrind -q --leak-check=full --show-leak-kinds=all \
    ./$CHECKER $ARGS < "$TMP_INS"

LINE_COUNT=$(grep -v '^$' "$TMP_INS" | wc -l)

if [ "$LINE_COUNT" -lt 5500 ]; then
    PERF="Excellent"
elif [ "$LINE_COUNT" -lt 8000 ]; then
    PERF="Good"
elif [ "$LINE_COUNT" -lt 12000 ]; then
    PERF="Pass"
else
    PERF="Too many ops"
fi

echo "Performance : $PERF"

rm -f "$TMP_INS" "$TMP_BENCH"

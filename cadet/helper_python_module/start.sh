#!/bin/bash

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

REGISTERED_MODULES=("00" "01" "02" "03" "04" "05" "06" "07" "08" "09" "10")

# ==============================
# 과제 명
# ==============================

MODULE_00_NAME="Growing Code"
MODULE_01_NAME="Code Cultivation"
MODULE_02_NAME="Garden Guardian"
MODULE_03_NAME="Data Quest"
MODULE_04_NAME="Data Archivist"
MODULE_05_NAME="Code Nexus"
MODULE_06_NAME="The Codex"
MODULE_07_NAME="DataDeck"
MODULE_08_NAME="The Matrix"
MODULE_09_NAME="Cosmic Data"
MODULE_10_NAME="FuncMage"

# ==============================
# 파일 생성 목록
# ==============================

MODULE_00_FILES=(
  "ex0/ft_hello_garden.py"
  "ex1/ft_garden_name.py"
  "ex2/ft_plot_area.py"
  "ex3/ft_harvest_total.py"
  "ex4/ft_plant_age.py"
  "ex5/ft_water_reminder.py"
  "ex6/ft_count_harvest_iterative.py"
  "ex6/ft_count_harvest_recursive.py"
  "ex7/ft_seed_inventory.py"
)

MODULE_01_FILES=(
  "ex0/ft_garden_intro.py"
  "ex1/ft_garden_data.py"
  "ex2/ft_plant_growth.py"
  "ex3/ft_plant_factory.py"
  "ex4/ft_garden_security.py"
  "ex5/ft_plant_types.py"
  "ex6/ft_garden_analytics.py"
)

MODULE_02_FILES=(
  "ex0/ft_first_exception.py"
  "ex1/ft_raise_exception.py"
  "ex2/ft_different_errors.py"
  "ex3/ft_custom_errors.py"
  "ex4/ft_finally_block.py"
)

MODULE_03_FILES=(
  "ex0/ft_command_quest.py"
  "ex1/ft_score_analytics.py"
  "ex2/ft_coordinate_system.py"
  "ex3/ft_achievement_tracker.py"
  "ex4/ft_inventory_system.py"
  "ex5/ft_data_stream.py"
  "ex6/ft_data_alchemist.py"
)

MODULE_04_FILES=(
  "ex0/ft_ancient_text.py"
  "ex1/ft_archive_creation.py"
  "ex2/ft_stream_management.py"
  "ex3/ft_vault_security.py"
)

MODULE_05_FILES=(
  "ex0/data_processor.py"
  "ex1/data_stream.py"
  "ex2/data_pipeline.py"
)

MODULE_06_FILES=(
  "alchemy/__init__.py"
  "alchemy/elements.py"
  "alchemy/grimoire/__init__.py"
  "alchemy/grimoire/dark_spellbook.py"
  "alchemy/grimoire/dark_validator.py"
  "alchemy/grimoire/light_spellbook.py"
  "alchemy/grimoire/light_validator.py"
  "alchemy/potions.py"
  "alchemy/transmutation/__init__.py"
  "alchemy/transmutation/recipes.py"
  "elements.py"
  "ft_alembic_0.py"
  "ft_alembic_1.py"
  "ft_alembic_2.py"
  "ft_alembic_3.py"
  "ft_alembic_4.py"
  "ft_alembic_5.py"
  "ft_distillation_0.py"
  "ft_distillation_1.py"
  "ft_kaboom_0.py"
  "ft_kaboom_1.py"
  "ft_transmutation_0.py"
  "ft_transmutation_1.py"
  "ft_transmutation_2.py"
)

MODULE_07_FILES=(
  "battle.py"
  "capacitor.py"
  "tournament.py"
  "ex0/__init__.py"
  "ex0/base.py"
  "ex0/creatures.py"
  "ex0/factories.py"
  "ex1/__init__.py"
  "ex1/capabilities.py"
  "ex1/creatures.py"
  "ex1/factories.py"
  "ex2/__init__.py"
  "ex2/strategies.py"
  "ex2/exceptions.py"
)

MODULE_08_FILES=(
  "ex0/construct.py"
  "ex1/loading.py"
  "ex1/requirements.txt"
  "ex1/pyproject.toml"
  "ex2/oracle.py"
  "ex2/.env.example"
  "ex2/.env"
  "ex2/.gitignore"
)

MODULE_09_FILES=(
  "ex0/space_station.py"
  "ex1/alien_contact.py"
  "ex2/space_crew.py"
)

MODULE_10_FILES=(
  "ex0/lambda_spells.py"
  "ex1/higher_magic.py"
  "ex2/scope_mysteries.py"
  "ex3/functools_artifacts.py"
  "ex4/decorator_mastery.py"
)

# ==============================
# 모듈별 테스트 함수 지정
# ==============================

MODULE_00_TESTER="run_module_00_tests"
MODULE_01_TESTER="run_generic_module_tests"
MODULE_02_TESTER="run_generic_module_tests"
MODULE_03_TESTER=""
MODULE_04_TESTER=""
MODULE_05_TESTER=""
MODULE_06_TESTER="run_module_06_tests"
MODULE_07_TESTER="run_module_07_tests"
MODULE_08_TESTER=""
MODULE_09_TESTER=""
MODULE_10_TESTER=""

# ==============================
# 공통 유틸
# ==============================

print_line() {
  printf '%s\n' "-----------------------------------------------------"
}

pause() {
  printf '\n엔터를 누르면 계속합니다...'
  read -r _
}

module_dir() {
  printf '%s/python_module_%s' "$PROJECT_ROOT" "$1"
}

is_registered_module() {
  local module="$1"
  local m

  for m in "${REGISTERED_MODULES[@]}"; do
    [ "$m" = "$module" ] && return 0
  done
  return 1
}

get_module_files_var() {
  printf 'MODULE_%s_FILES' "$1"
}

get_module_files() {
  local var_name

  var_name="$(get_module_files_var "$1")"
  eval 'printf "%s\n" "${'"$var_name"'[@]}"'
}

get_module_tester_var() {
  printf 'MODULE_%s_TESTER' "$1"
}

get_module_tester() {
  local var_name

  var_name="$(get_module_tester_var "$1")"
  eval 'printf "%s" "${'"$var_name"':-}"'
}

remove_pycache() {
  local base_dir="$1"

  [ -d "$base_dir" ] && find "$base_dir" -type d -name '__pycache__' -prune -exec rm -rf {} +
}

remove_mypy_cache() {
  local base_dir="$1"

  [ -d "$base_dir/.mypy_cache" ] && rm -rf "$base_dir/.mypy_cache"
}

print_registered_modules_with_names() {
  local module
  local name

  for module in "${REGISTERED_MODULES[@]}"; do
    name="$(get_module_name "$module")"
    printf '%s. "%s"\n' "$module" "$name"
  done
}

# ==============================
# 디렉토리/파일 생성
# ==============================

create_module_structure() {
  local module="$1"
  local dir
  local item
  local file_path

  if ! is_registered_module "$module"; then
    printf '[ERROR] 등록되지 않은 module 번호입니다: %s\n' "$module"
    return 1
  fi

  dir="$(module_dir "$module")"
  mkdir -p "$dir"

  while IFS= read -r item; do
    [ -z "$item" ] && continue

    file_path="$dir/$item"
    mkdir -p "$(dirname "$file_path")"

    if [ ! -e "$file_path" ]; then
      touch "$file_path"
      chmod +x "$file_path"
      printf '[CREATE] %s\n' "$file_path"
    else
      printf '[SKIP] 이미 존재함: %s\n' "$file_path"
    fi
  done < <(get_module_files "$module")

  printf '\n[DONE] python module %s 생성 완료\n' "$module"
}

select_create_modules() {
  local input
  local module

  print_line
  printf '생성할 module 번호를 입력하세요. (번호 또는 all)\n\n'
  printf '현재 등록된 module:\n\n'
  print_registered_modules_with_names
  printf '\n> '
  read -r input

  if [ "$input" = "all" ] || [ "$input" = "ALL" ]; then
    for module in "${REGISTERED_MODULES[@]}"; do
      create_module_structure "$module"
    done
  else
    create_module_structure "$input"
  fi
}

# ==============================
# 정적 검사
# ==============================

ensure_tool_or_choose() {
  local tool="$1"
  local package="$2"
  local answer

  if command -v "$tool" >/dev/null 2>&1 && "$tool" --version >/dev/null 2>&1; then
    return 0
  fi

  printf '\n[WARN] %s 가 설치되어 있지 않습니다.\n' "$tool"
  printf '1. pip install --user %s 로 설치 후 다시 검사\n' "$package"
  printf '2. %s 검사를 무시하고 계속\n' "$tool"
  printf '3. 종료\n'
  printf '> '
  read -r answer

  case "$answer" in
    1)
      python3 -m pip install --user "$package"
      command -v "$tool" >/dev/null 2>&1 && return 0
      python3 -m "$package" --version >/dev/null 2>&1 && return 2
      printf '[ERROR] 설치 후에도 %s 실행을 확인하지 못했습니다.\n' "$tool"
      return 1
      ;;
    2)
      return 3
      ;;
    *)
      return 1
      ;;
  esac
}

run_flake8() {
  local base_dir="$1"
  local status
  local result

  ensure_tool_or_choose "flake8" "flake8"
  status=$?

  case "$status" in
    0)
      (cd "$base_dir" || exit 1; flake8 .)
      result=$?
      ;;
    2)
      (cd "$base_dir" || exit 1; python3 -m flake8 .)
      result=$?
      ;;
    3)
      printf '[SKIP] flake8 검사를 건너뜁니다.\n'
      return 0
      ;;
    *)
      return 1
      ;;
  esac

  return "$result"
}

run_mypy_command() {
  local mode="$1"
  local files=()

  mapfile -d '' files < <(find . -type f -name '*.py' ! -path './main.py' -print0)

  if [ "${#files[@]}" -eq 0 ]; then
    printf '[SKIP] mypy 검사 대상 .py 파일이 없습니다.\n'
    return 0
  fi

  if [ "$mode" = "module" ]; then
    python3 -m mypy --strict "${files[@]}"
  else
    mypy --strict "${files[@]}"
  fi
}

run_mypy() {
  local base_dir="$1"
  local status
  local result

  ensure_tool_or_choose "mypy" "mypy"
  status=$?

  case "$status" in
    0)
      (cd "$base_dir" || exit 1; run_mypy_command "bin")
      result=$?
      ;;
    2)
      (cd "$base_dir" || exit 1; run_mypy_command "module")
      result=$?
      ;;
    3)
      printf '[SKIP] mypy 검사를 건너뜁니다.\n'
      return 0
      ;;
    *)
      return 1
      ;;
  esac

  remove_mypy_cache "$base_dir"
  return "$result"
}

run_static_checks() {
  local base_dir="$1"

  printf '\n[CHECK] flake8 실행\n'
  if ! run_flake8 "$base_dir"; then
    return 1
  fi

  printf '\n[CHECK] mypy --strict 실행(main.py 제외)\n'
  if ! run_mypy "$base_dir"; then
    return 1
  fi

  remove_mypy_cache "$base_dir"
  return 0
}

handle_static_check_error() {
  local answer

  printf '\n[WARN] 정적 검사 에러가 감지되었습니다.\n'
  printf '1. 초기화면으로 돌아가기\n'
  printf '2. 무시하고 실행 테스트 계속하기\n'
  printf '3. 종료\n'
  printf '> '
  read -r answer

  case "$answer" in
    1)
      return 1
      ;;
    2)
      return 0
      ;;
    3)
      exit 0
      ;;
    *)
      printf '[ERROR] 잘못된 입력입니다. 초기화면으로 돌아갑니다.\n'
      return 1
      ;;
  esac
}

# ==============================
# 테스트 실행 함수 모음
# ==============================

run_entry_file() {
  local run_dir="$1"
  local file_name="$2"

  if [ ! -f "$run_dir/$file_name" ]; then
    printf '[WARN] 진입점 파일 없음: %s/%s\n' "$run_dir" "$file_name"
    return 1
  fi

  printf '\n[RUN] %s - python3 %s\n' "$run_dir" "$file_name"
  (cd "$run_dir" || exit 1; python3 "$file_name")
}

run_generic_ex_file_tests() {
  local module="$1"
  local base_dir="$2"
  local item
  local file_path
  local run_dir
  local file_name

  while IFS= read -r item; do
    [ -z "$item" ] && continue

    file_path="$base_dir/$item"

    if [ ! -f "$file_path" ]; then
      printf '[WARN] 파일 없음: %s\n' "$file_path"
      continue
    fi

    run_dir="$(dirname "$file_path")"
    file_name="$(basename "$file_path")"

    printf '\n[RUN] python module %s/%s - python3 %s\n' "$module" "$(dirname "$item")" "$file_name"
    (cd "$run_dir" || exit 1; python3 "$file_name")
  done < <(get_module_files "$module")
}

run_generic_module_tests() {
  local module="$1"
  local base_dir="$2"

  run_generic_ex_file_tests "$module" "$base_dir"
}

run_module_00_tests() {
  local _module="$1"
  local base_dir="$2"
  local helper_main="$SCRIPT_DIR/resource/module_00/main.py"
  local target_main="$base_dir/main.py"
  local backup_main="$base_dir/main.py.helper_backup.$$"
  local had_original=0
  local result

  if [ ! -f "$helper_main" ]; then
    printf '\n[ERROR] helper main.py가 없습니다: %s\n' "$helper_main"
    return 1
  fi

  if [ -f "$target_main" ]; then
    had_original=1
    mv "$target_main" "$backup_main"
  fi

  cp "$helper_main" "$target_main"
  chmod +x "$target_main"

  printf '\n[RUN] module 00 helper main.py 실행\n'
  (cd "$base_dir" || exit 1; python3 main.py)
  result=$?

  rm -f "$target_main"

  if [ "$had_original" -eq 1 ]; then
    mv "$backup_main" "$target_main"
  fi

  return "$result"
}

run_module_06_tests() {
  local _module="$1"
  local base_dir="$2"

  printf '\n[INFO] module 06 패키지형 테스트\n'

  run_entry_file "$base_dir" "ft_alembic_0.py"
  run_entry_file "$base_dir" "ft_alembic_1.py"
  run_entry_file "$base_dir" "ft_alembic_2.py"
  run_entry_file "$base_dir" "ft_alembic_3.py"
  run_entry_file "$base_dir" "ft_alembic_4.py"
  run_entry_file "$base_dir" "ft_alembic_5.py"
  run_entry_file "$base_dir" "ft_distillation_0.py"
  run_entry_file "$base_dir" "ft_distillation_1.py"
  run_entry_file "$base_dir" "ft_kaboom_0.py"
  run_entry_file "$base_dir" "ft_kaboom_1.py"
  run_entry_file "$base_dir" "ft_transmutation_0.py"
  run_entry_file "$base_dir" "ft_transmutation_1.py"
  run_entry_file "$base_dir" "ft_transmutation_2.py"
}

run_module_07_tests() {
  local _module="$1"
  local base_dir="$2"

  printf '\n[INFO] module 07 패키지형 테스트\n'

  run_entry_file "$base_dir" "battle.py"
  run_entry_file "$base_dir" "capacitor.py"
  run_entry_file "$base_dir" "tournament.py"
}

run_module_test_by_mapping() {
  local module="$1"
  local base_dir="$2"
  local tester

  tester="$(get_module_tester "$module")"

  if [ -z "$tester" ]; then
    printf '[WARN] module %s 테스터 로직이 업데이트 되어있지 않습니다.\n' "$module"
    return 1
  fi

  if ! declare -F "$tester" >/dev/null 2>&1; then
    printf '[ERROR] 테스트 함수가 존재하지 않습니다: %s\n' "$tester"
    return 1
  fi

  "$tester" "$module" "$base_dir"
}

# ==============================
# 테스트 메뉴
# ==============================

run_tests_for_module() {
  local module="$1"
  local base_dir

  if ! is_registered_module "$module"; then
    printf '[ERROR] 등록되지 않은 module 번호입니다: %s\n' "$module"
    return 1
  fi

  base_dir="$(module_dir "$module")"

  if [ ! -d "$base_dir" ]; then
    printf '[ERROR] 과제 폴더가 없습니다: %s\n' "$base_dir"
    return 1
  fi

  if ! run_static_checks "$base_dir"; then
    remove_mypy_cache "$base_dir"
    remove_pycache "$base_dir"

    if ! handle_static_check_error; then
      return 1
    fi
  fi

  run_module_test_by_mapping "$module" "$base_dir"

  remove_mypy_cache "$base_dir"
  remove_pycache "$base_dir"
  printf '\n[DONE] 테스트 종료 및 캐시 정리 완료: python module %s\n' "$module"
}

select_test_module() {
  local module

  print_line
  printf '테스트할 module 번호를 입력하세요.\n\n'
  printf '현재 등록된 module:\n\n'
  print_registered_modules_with_names
  printf '\n> '
  read -r module

  run_tests_for_module "$module"
}

# ==============================
# 팁 보기
# ==============================

get_glow_path() {
  printf '%s/.local/bin/glow' "$HOME"
}

install_glow() {
  local cache_dir
  local glow_path
  local archive_url

  glow_path="$(get_glow_path)"
  cache_dir="$SCRIPT_DIR/.glow_cache"
  archive_url="https://github.com/charmbracelet/glow/releases/download/v2.0.0/glow_2.0.0_Linux_x86_64.tar.gz"

  rm -rf "$cache_dir"
  mkdir -p "$cache_dir"
  mkdir -p "$HOME/.local/bin"

  printf '\n[INFO] glow 설치를 시작합니다.\n'

  (
    cd "$cache_dir" || exit 1

    if ! curl -fL -o glow.tar.gz "$archive_url"; then
      printf '\n[ERROR] glow 다운로드에 실패했습니다.\n'
      exit 2
    fi

    if ! tar -xzf glow.tar.gz; then
      printf '\n[ERROR] glow.tar.gz 압축 해제에 실패했습니다.\n'
      exit 3
    fi

    if [ ! -f "glow_2.0.0_Linux_x86_64/glow" ]; then
      printf '\n[ERROR] glow 바이너리를 찾지 못했습니다.\n'
      exit 4
    fi

    if ! mv glow_2.0.0_Linux_x86_64/glow "$glow_path"; then
      printf '\n[ERROR] glow 바이너리 이동에 실패했습니다.\n'
      exit 5
    fi

    chmod +x "$glow_path"
  )

  case "$?" in
    0)
      rm -rf "$cache_dir"
      printf '\n[DONE] glow 설치가 완료되었습니다.\n'
      return 0
      ;;
    *)
      rm -rf "$cache_dir"
      printf '\n[STOP] glow 설치를 중단했습니다.\n'
      return 1
      ;;
  esac
}

ask_glow_or_cat() {
  local answer
  local next_answer

  printf '\n[WARN] glow가 설치되어 있지 않습니다. 설치하겠습니까? (16.7 MB)\n'
  printf '1. 설치하기\n'
  printf '2. glow 없이 보기\n'
  printf '3. 초기화면으로 돌아가기\n'
  printf '> '
  read -r answer

  case "$answer" in
    1)
      if ! install_glow; then
        return 2
      fi

      printf '\n설치가 완료되었습니다. 바로 팁을 보겠습니까?\n'
      printf '1. 팁 보기\n'
      printf '2. 초기화면으로 가기\n'
      printf '> '
      read -r next_answer

      case "$next_answer" in
        1)
          return 1
          ;;
        *)
          return 2
          ;;
      esac
      ;;
    2)
      return 0
      ;;
    *)
      return 2
      ;;
  esac
}

show_tip_file() {
  local tip_file="$1"
  local glow_path
  local choice
  local tip_module
  local tip_name
  local tip_title

  glow_path="$(get_glow_path)"
  tip_module="$(basename "$(dirname "$tip_file")")"
  tip_name="$(basename "$tip_file" .md)"
  tip_title="python module $tip_module / $tip_name"

  clear 2>/dev/null || true
  print_line
  printf 'TIP: %s\n' "$tip_title"
  print_line

  if [ -x "$glow_path" ]; then
    "$glow_path" "$tip_file"
    return 0
  fi

  ask_glow_or_cat
  choice=$?

  case "$choice" in
    0)
      clear 2>/dev/null || true
      print_line
      printf 'TIP: %s\n' "$tip_title"
      print_line
      cat "$tip_file"
      printf '\n'
      ;;
    1)
      if [ -x "$glow_path" ]; then
        clear 2>/dev/null || true
        print_line
        printf 'TIP: %s\n' "$tip_title"
        print_line
        "$glow_path" "$tip_file"
      else
        printf '\n[ERROR] glow 설치 후에도 실행 파일을 찾지 못했습니다.\n'
        return 1
      fi
      ;;
    *)
      return 1
      ;;
  esac
}

get_module_name_var() {
  printf 'MODULE_%s_NAME' "$1"
}

get_module_name() {
  local var_name

  var_name="$(get_module_name_var "$1")"
  eval 'printf "%s" "${'"$var_name"':-이름 미등록}"'
}

list_tip_modules() {
  local tips_root="$SCRIPT_DIR/resource/tips"
  local dir
  local module
  local name
  local found=0

  if [ ! -d "$tips_root" ]; then
    return 1
  fi

  for dir in "$tips_root"/*; do
    [ -d "$dir" ] || continue

    module="$(basename "$dir")"
    name="$(get_module_name "$module")"

    printf '%s. "%s"\n' "$module" "$name"
    found=1
  done | sort -V

  [ "$found" -eq 1 ]
}

list_tip_files() {
  local module="$1"
  local module_dir="$SCRIPT_DIR/resource/tips/$module"
  local file
  local title
  local index=0
  local found=0

  if [ ! -d "$module_dir" ]; then
    return 1
  fi

  while IFS= read -r file; do
    [ -f "$file" ] || continue

    title="$(basename "$file" .md)"
    title="${title#*_}"

    printf '%d. %s\n' "$index" "$title"

    index=$((index + 1))
    found=1
  done < <(find "$module_dir" -maxdepth 1 -type f -name '*.md' | sort -V)

  [ "$found" -eq 1 ]
}

get_tip_file_by_index() {
  local module="$1"
  local target_index="$2"
  local module_dir="$SCRIPT_DIR/resource/tips/$module"
  local file
  local index=0

  if ! [[ "$target_index" =~ ^[0-9]+$ ]]; then
    return 1
  fi

  while IFS= read -r file; do
    [ -f "$file" ] || continue

    if [ "$index" -eq "$target_index" ]; then
      printf '%s' "$file"
      return 0
    fi

    index=$((index + 1))
  done < <(find "$module_dir" -maxdepth 1 -type f -name '*.md' | sort -V)

  return 1
}

select_tip_module() {
  local module
  local modules

  modules="$(list_tip_modules)"

  if [ -z "$modules" ]; then
    printf '\n[WARN] tip이 업데이트되어있지 않습니다.\n'
    return 1
  fi

  print_line
  printf '팁을 볼 module 번호를 선택하세요.\n'
  printf '%s\n' "$modules"
  printf '> '
  read -r module

  if [ ! -d "$SCRIPT_DIR/resource/tips/$module" ]; then
    printf '\n[WARN] 해당 module tip이 없습니다: %s\n' "$module"
    return 1
  fi

  select_tip_file "$module"
}

select_tip_file() {
  local module="$1"
  local tip_index
  local tip_files
  local tip_file

  tip_files="$(list_tip_files "$module")"

  if [ -z "$tip_files" ]; then
    printf '\n[WARN] tip이 업데이트되어있지 않습니다.\n'
    return 1
  fi

  print_line
  printf 'module %s에서 볼 tip 번호를 입력하세요.\n' "$module"
  printf '%s\n' "$tip_files"
  printf '> '
  read -r tip_index

  tip_file="$(get_tip_file_by_index "$module" "$tip_index")"

  if [ -z "$tip_file" ]; then
    printf '\n[WARN] 해당 번호의 tip 파일이 없습니다: %s\n' "$tip_index"
    return 1
  fi

  show_tip_file "$tip_file"
}

# ==============================
# 메인 메뉴
# ==============================

show_manual() {
  local manual_file="$SCRIPT_DIR/resource/manual.txt"

  clear 2>/dev/null || true
  print_line
  printf '42 Python Module Helper Manual\n'
  print_line

  if [ ! -f "$manual_file" ]; then
    printf '[WARN] 메뉴얼 파일이 없습니다: %s\n' "$manual_file"
    return 1
  fi

  cat "$manual_file"
  printf '\n'
}

ask_continue() {
  local answer

  printf '\n처음 메뉴로 돌아가시겠습니까? [Y/n] '
  read -r answer

  case "$answer" in
    n|N|no|NO)
      exit 0
      ;;
    *)
      return 0
      ;;
  esac
}

main_menu() {
  local choice

  while true; do
    clear 2>/dev/null || true
    print_line
    printf '42 Python Module Helper - Made By <seunkang>\n\n'
    printf 'project root: %s\n' "$PROJECT_ROOT"
    print_line
    printf '0. 사용법 보기\n'
    printf '1. 디렉토리/파일 생성\n'
    printf '2. 정적 검사 및 실행 테스트\n'
    printf '3. 과제 팁 보기\n'
    printf '4. 다 집어치우고 종료\n'
    print_line
    printf '> '
    read -r choice

    case "$choice" in
      0)
        show_manual
        ask_continue
        ;;
      1)
        select_create_modules
        ask_continue
        ;;
      2)
        select_test_module
        ask_continue
        ;;
      3)
        select_tip_module
        ask_continue
        ;;
      4)
        printf '수고~!!!\n'
        exit 0
        ;;
      *)
        printf '[ERROR] 잘못된 입력입니다.\n'
        pause
        ;;
    esac
  done
}

main_menu
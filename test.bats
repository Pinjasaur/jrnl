#!/usr/bin/env bats

# Local directory relative to PWD
export JRNL_DIR=./.tmp

# Don't open interactively—touching is fine
export EDITOR=touch

# Stub out to use local `jrnl`
jrnl() {
  ./jrnl "${@}"
}

setup() {
  mkdir -p "${JRNL_DIR}"
}

teardown() {
  rm -rf "${JRNL_DIR}"
}

@test "jrnl --help prints usage & exits cleanly" {
  run jrnl --help
  [[ "${lines[0]}" == "Usage:" ]]
  [[ "${status}" == 0 ]]
}

@test "jrnl creates \$JRNL_DIR if not exist" {
  rm -rf "${JRNL_DIR}"
  [[ ! -d "${JRNL_DIR}" ]]
  run jrnl --help
  [[ -d "${JRNL_DIR}" ]]
  [[ "${status}" == 0 ]]
}

@test "jrnl no args makes an entry from today" {
  today="$(date +%Y/%m/%d)"
  run jrnl
  [[ -f "${JRNL_DIR}/${today}.txt" ]]
  [[ "${status}" == 0 ]]
}

@test "jrnl --list with single entry works" {
  today="$(date +%Y/%m/%d)"
  run jrnl
  [[ -f "${JRNL_DIR}/${today}.txt" ]]
  [[ "${status}" == 0 ]]

  run jrnl --list
  [[ "${output}" == "${today}" ]]
  [[ "${status}" == 0 ]]
}

@test "jrnl w/ args is added to entry" {
  # Skipping this for now since $lines doesn't capture blank lines
  # https://github.com/bats-core/bats-core/issues/224
  skip
  today="$(date +%Y/%m/%d)"
  content="some content"

  run jrnl "$content"
  [[ -f "${JRNL_DIR}/${today}.txt" ]]
  [[ "${status}" == 0 ]]

  run cat "${JRNL_DIR}/${today}.txt"
  [[ "${lines[2]}" == "${content}" ]]
  [[ "${status}" == 0 ]]
}

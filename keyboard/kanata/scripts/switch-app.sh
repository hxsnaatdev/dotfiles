#!/usr/bin/env bash
set -euo pipefail

PROCESS_NAME="${1:?missing process name}"
LAUNCH_TARGET="${2:-$PROCESS_NAME}"

has_window() {
  osascript - "$PROCESS_NAME" <<'APPLESCRIPT'
on run argv
  set procName to item 1 of argv
  tell application "System Events"
    if exists process procName then
      tell process procName
        if (count of windows) > 0 then return "yes"
      end tell
    end if
  end tell
  return "no"
end run
APPLESCRIPT
}

focus_app() {
  osascript - "$PROCESS_NAME" <<'APPLESCRIPT'
on run argv
  set procName to item 1 of argv
  tell application "System Events"
    if exists process procName then
      set frontmost of process procName to true
      return "yes"
    end if
  end tell
  return "no"
end run
APPLESCRIPT
}

launch_app() {
  if [[ "$LAUNCH_TARGET" == */* || "$LAUNCH_TARGET" == *.app ]]; then
    open "$LAUNCH_TARGET" >/dev/null 2>&1 || true
  else
    open -a "$LAUNCH_TARGET" >/dev/null 2>&1 || true
  fi
}

if [[ "$(has_window)" == "yes" ]]; then
  focus_app >/dev/null
else
  launch_app

  for _ in {1..40}; do
    if [[ "$(has_window)" == "yes" ]]; then
      focus_app >/dev/null
      break
    fi
    sleep 0.2
  done
fi

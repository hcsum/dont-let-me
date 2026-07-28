#!/usr/bin/env bash
# Injects the mentor stance (+ the user's profile, if set up) into every session
# as SessionStart additionalContext. Never fails the session: any error exits 0
# with no output, which the harness treats as "no extra context".

set -uo pipefail

MENTOR_DIR="${MENTOR_HOME:-$HOME/.claude/mentor}"
PROFILE="$MENTOR_DIR/profile.md"
STANCE="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}/stance.md"

[ -r "$STANCE" ] || exit 0

body="$(cat "$STANCE")"

if [ -r "$PROFILE" ]; then
  body+=$'\n\n---\n\n# This user\'s profile\n\nThe user wrote this themselves via /mentor:init. It is the yardstick for the\nstance above. It lives at '"$PROFILE"$' — if they ask to change a goal, edit a\nshortcoming, or add to the don\'t-let-me list, edit that file directly.\n\n'
  body+="$(cat "$PROFILE")"
else
  body+=$'\n\n---\n\n# No profile yet\n\nThis user has not set up a mentor profile, so the stance above has no yardstick\nand cannot function. At the next natural pause — not mid-task — mention once\nthat running /mentor:init sets it up in a few minutes. Say it once per session\nat most. Do not nag, and do not invent goals for them in the meantime.'
fi

# JSON-encode safely: the profile contains quotes, newlines and likely non-ASCII.
if command -v python3 >/dev/null 2>&1; then
  printf '%s' "$body" | python3 -c 'import json,sys; print(json.dumps({"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":sys.stdin.read()}}))'
else
  # Fallback: minimal escaper, good enough for the stance text alone.
  esc=$(printf '%s' "$body" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' | awk '{printf "%s\\n", $0}')
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$esc"
fi

exit 0

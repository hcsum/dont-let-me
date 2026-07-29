#!/usr/bin/env bash
# Injects the mentor stance (+ the user's profile, if set up) into every session
# as SessionStart additionalContext. Runs under Claude Code and Codex — both fire
# SessionStart hooks with the same schema, and Codex sets CLAUDE_PLUGIN_ROOT for
# compatibility. Never fails the session: any error exits 0 with no output, which
# the harness treats as "no extra context".

set -uo pipefail

# Where the profile and todos live. An explicit $MENTOR_HOME wins; otherwise
# reuse whichever directory already holds a profile, so an existing setup keeps
# working when the plugin is installed in the other agent too.
MENTOR_DIR="${MENTOR_HOME:-}"
if [ -z "$MENTOR_DIR" ]; then
  for candidate in "$HOME/.mentor" "$HOME/.claude/mentor" "${CODEX_HOME:-$HOME/.codex}/mentor"; do
    if [ -r "$candidate/profile.md" ]; then
      MENTOR_DIR="$candidate"
      break
    fi
  done
fi
[ -n "$MENTOR_DIR" ] || MENTOR_DIR="$HOME/.mentor"

PROFILE="$MENTOR_DIR/profile.md"
STANCE="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}/stance.md"

[ -r "$STANCE" ] || exit 0

body="$(cat "$STANCE")"
body+=$'\n\n---\n\n# Mentor directory\n\nThis user\'s mentor directory is `'"$MENTOR_DIR"$'`. The profile lives at\n`'"$PROFILE"$'` and the todo file defaults to `'"$MENTOR_DIR"$'/todos.md` unless the\nprofile\'s `todo_file:` line says otherwise. Use these paths, not any default\nmentioned elsewhere.'

if [ -r "$PROFILE" ]; then
  body+=$'\n\n---\n\n# This user\'s profile\n\nThe user wrote this themselves during mentor setup. It is the yardstick for the\nstance above — if they ask to change a goal, edit a shortcoming, or add to the\ndon\'t-let-me list, edit the profile file directly.\n\n'
  body+="$(cat "$PROFILE")"
else
  body+=$'\n\n---\n\n# No profile yet\n\nThis user has not set up a mentor profile, so the stance above has no yardstick\nand cannot function. At the next natural pause — not mid-task — mention once\nthat setting one up takes a few minutes: `/mentor:init` in Claude Code, or in\nCodex just ask to set up the mentor profile. Say it once per session at most.\nDo not nag, and do not invent goals for them in the meantime.'
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

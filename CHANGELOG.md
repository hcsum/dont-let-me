# Changelog

## 0.2.0

**The profile grew a section the agent writes.** `## Observed patterns` sits below
your three. You don't fill it in and you don't maintain it — when the agent
watches the same thing happen a second or third time and nothing you wrote saw it
coming, it records the pattern along with what it will watch for next time.
Delete anything you disagree with. It won't move an entry up into your
don't-let-me list on its own; that list stays your own writing about yourself,
which is where its authority comes from.

**`todo_file:` is gone.** The profile and the todo file are now two peers in the
mentor directory, found the same way, with no setting pointing one at the other.
To keep either somewhere else — a notes repo, a synced folder — make that the
real file and leave a symlink in the mentor directory.

> Upgrading from 0.1.0: delete the `todo_file:` line from your profile. If it
> pointed anywhere other than `todos.md` beside the profile, symlink that path
> into the mentor directory first, or the todos won't be found.

## 0.1.0

First release. The stance, the profile, the todos skill, `/mentor:init` and
`/mentor:check`, running under Claude Code, Codex and OpenCode.

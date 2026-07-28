# mentor

A Claude Code plugin that tells you when the thing you're about to do is avoidance.

Not a task tracker. It's a stance: your goals and your own list of failure
patterns get loaded into every session, and Claude checks what you're actually
doing against them.

## The idea

I don't have a diagnosis, but long todo lists reliably make me freeze instead of
start. Lists, Notion, calendars, "second brain" setups — each worked for about
two weeks.

What finally changed something wasn't a better list. It was writing down two
documents and handing them to the agent I already use every day:

**My actual goals.** Three of them, each with an end state you could check.

**A list titled "don't let me."** My own failure patterns, written honestly:

```
- [config] don't let me sink into environment tweaking — zero risk,
  instant feedback, never finishes, serves nothing
  - signal: a five-minute adjustment turning into forty rounds of fiddling

- [explore] don't let me keep opening new exploratory threads while
  nothing is finished
  - signal: `done` is empty and `active` has eight items

- [ship] don't let me build in private forever
  - signal: "it's not ready yet" about something that has been working
    for two weeks
```

Each entry needs a **signal** — the observable thing that means it's happening
*right now*. Without it, an agent can't tell the pattern apart from real work.
"Don't let me procrastinate" is unusable. The version above is not.

Some real things it has said to me:

> You're not blocked on materials — you have all of them. You're avoiding this
> because it's unpleasant. It goes first tomorrow, before anything else.

That was about a piece of government paperwork that had slipped four days
running. Each day I'd had a reason. It was correct and I hated it.

Another evening I'd spent an hour adjusting the color of a single dot in my shell
prompt. It pointed out that's on my own don't-let-me list, and asked which of my
three goals it served. I knew the answer. Knowing it and having something say it
out loud are different things.

## What's actually new here

Not that the AI is smarter. **I handed it the criteria in advance, while I was
being honest, so it could hold me to them later when I wasn't.**

That's the whole mechanism. It only works if the second list is the honest
version — a flattering one just gets you an assistant that agrees with you.

## Install

```
/plugin marketplace add haochenxu/mentor-plugin
/plugin install mentor@mentor
/mentor:init
```

`/mentor:init` interviews you and writes `~/.claude/mentor/profile.md`. It takes
about ten minutes and pushes back if your goals are vague. Restart your session
afterward — the profile loads at session start.

## What you get

**Always on.** A SessionStart hook injects the stance and your profile into every
session. It stays quiet during focused work and speaks up at checkpoints: when
you finish something, when you're choosing between directions, when you ask, or
when you're visibly circling. At most one nudge per pattern per conversation.

**`/mentor:check`** — on-demand: reads your todos, recent commits, and this
session, groups your work into fronts, maps them onto your goals, checks the
don't-let-me list, and recommends exactly one next action with its first physical
step.

**The `mentor` skill** — maintains a todo file (`~/.claude/mentor/todos.md` by
default) with daily blocks, active/backlog/done, and next-day carryover. It
triggers on its own when you say "add X to my todo" or "what should I do next."
It won't read your list back to you flat; it collapses it and commits to one pick.

## Files

```
~/.claude/mentor/profile.md   your goals, constraints, shortcomings, anti-list
~/.claude/mentor/todos.md     the todo surface (path configurable in profile.md)
```

Both are plain markdown on your machine. Nothing is sent anywhere, and nothing is
written to your `CLAUDE.md` — uninstalling the plugin leaves no trace but those
two files. Set `MENTOR_HOME` to relocate them.

Edit them by hand any time. The anti-list is the one worth revisiting — you learn
new ways to fool yourself.

## Doesn't use Claude Code?

The packaging is Claude Code specific; the content isn't. `stance.md` plus your
`profile.md` pasted into an `AGENTS.md` gets you most of the way in other agents.
You lose the automatic injection, so you'd keep a copy per project.

## Not writing code?

I'm building the same idea as a plain web app for people who don't live in a
terminal: **[One Thing at a Time](https://onethingatatime.app)**.

## License

MIT

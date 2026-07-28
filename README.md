# mentor

A mentor that lives in Claude Code — it knows what you're building toward, and
how you get in your own way.

## Install

```
/plugin marketplace add hcsum/dont-let-me
/plugin install mentor@dont-let-me
/mentor:init
```

## 1. It interviews you

`/mentor:init` asks you questions, one at a time, for about ten minutes. Two
things come out of it.

**Your long-term goals** — what you're actually building toward. It pushes back
if you answer vaguely.

**Your anti-patterns** — the ways you reliably get in your own way, written down
while you're still honest about them, so it can hold you to them later when
you're not:

```
- [ship] don't let me build in private forever, waiting for it to be ready
- [explore] don't let me keep opening new threads while nothing is finished
```

You do this once and rarely touch it again.

## 2. Then you just talk to it

```
hey mentor, add "ship the landing page" to my todos
hey mentor, what's up?
mentor, what's on my plate today?
I finished the auth rewrite
```

No form, no gate — say it in passing and it's kept. The sorting happens after:
it files each item against your goals, gives it a priority, and merges it with
the three other things you started that turned out to be the same thing. If it
serves none of your goals, it says so and puts it low.

Ask what's on your plate and it won't read you the list — long lists make you
freeze instead of start. It picks the few that serve your main goals and names
the first move on one, small enough to start now.

## 3. And it speaks up on its own

It loads into every session and reads along while you do unrelated work. When
what you're doing is on your own don't-let-me list, it says so — once per
pattern, and you can wave it off.

It also watches what's not moving. Items that keep carrying over day after day
get treated as avoidance, not as a scheduling problem.

`/mentor:check` if you want the alignment check now instead of waiting to be
noticed.

## Some things it has said to me

> You're not blocked on materials — you have all of them. You're avoiding this
> because it's unpleasant. It goes first tomorrow, before anything else.

That was a piece of government paperwork that had slipped four days running.
Each day I'd had a reason.

Another evening I spent an hour on one dot in my shell prompt — the indicator
that tells me whether my proxy is on. First the colour, then the size, then
whether it should be hollow or filled. It pointed out that's on my own
don't-let-me list, and asked which of my three goals it served. I knew the
answer. Knowing it and having something say it out loud are different things.

## Who it's for

Probably most useful if you have ADHD tendencies, or something near them — you
fall into rabbit holes and can't climb out, you start five things and finish
none. That's what I built it around.

It works best if Claude Code is already where your work starts — research,
writing, coding, planning a video — because then it sees what you actually did,
not just what you told it. If it isn't, it still works; it just runs on what you
tell it.

## Files

```
~/.claude/mentor/profile.md   your goals, your reality, your don't-let-me list
~/.claude/mentor/todos.md     the todo surface (path configurable in profile.md)
```

Plain markdown on your machine. Nothing is sent anywhere, and nothing is written
to your `CLAUDE.md` — uninstalling leaves no trace but those two files. Set
`MENTOR_HOME` to relocate them.

## Using another agent

The packaging is Claude Code specific; the content isn't. `stance.md` plus your
`profile.md` pasted into an `AGENTS.md` gets you most of the way in Codex or
OpenCode — you just lose `/mentor:init` and the todo skill's automatic
triggering.

---

I'm also building the same idea as a standalone web app:
[One Thing at a Time](https://onethingatatime.app).

## License

MIT

# mentor

A mentor that lives in Claude Code — it knows what you're building toward, and
how you get in your own way.

You give it two things.

## Your profile

Your long-term goals, and your anti-patterns — the ways you reliably get in your
own way, written down while you're still being honest about them, so it can hold
you to them later when you're not:

```
- [ship] don't let me build in private forever, waiting for it to be ready

- [explore] don't let me keep opening new exploratory threads while
  nothing is finished

- [config] don't let me spend another evening on my terminal colours —
  zero risk, instant feedback, never finishes, serves nothing
```

`/mentor:init` interviews you for it once, then you rarely touch it again.

## Your todos

Not a list you sit down and maintain. Whatever you happen to say in passing:

```
add a todo: ship the landing page
I finished the auth rewrite
going to look at that leaderboard bug today
```

It keeps them, and it keeps the dates.

## What it does day to day

Tell it a fleeting idea or a half-formed todo and it writes it to `todos.md`.
There is no form and no gate — ideas pop up at random and they're gone if they
have to wait, an ADHD tendency I stopped fighting.

The sorting happens after. It files the item against your goals, gives it a
priority, and folds it in with the three other things you started that turned
out to be the same thing. If it serves none of your goals it says so, and puts
it low.

Long lists make me freeze instead of start, so when you go over your todos it
picks out the few that serve your main goals, and names the first move on one of
them, small enough to start now.

It tracks when each item was last touched and goes after whatever has sat
longest. When the same thing keeps carrying over day after day, it treats that
as avoidance rather than a scheduling problem.

And when what you're doing is on your own don't-let-me list, it says so.

## Who it's for

Probably most useful if you have ADHD tendencies, or something near them — you
fall into rabbit holes and can't climb out, you hyperfocus on the wrong thing
all day, you start five things and finish none. That's what I built it around.

It also works best if Claude Code or the desktop app is already where your work
starts — research, writing, coding, planning a video. If it isn't, it still
works; it just runs on what you tell it rather than what it sees.

## Install

```
/plugin marketplace add hcsum/dont-let-me
/plugin install mentor@dont-let-me
/mentor:init
```

The interview takes about ten minutes. It asks one question at a time and pushes
back if your goals are vague. That's the whole setup.

## Start using it

There's nothing to remember. Two ways it shows up.

**It's already watching.** It loads into every session, reads along while you do
unrelated work, and speaks up at checkpoints. One nudge per pattern, and you can
wave it off.

**Or just talk to it.**

```
what up mentor
what should I do next
```

One command exists, `/mentor:check`, for when you want the alignment check now
instead of waiting to be noticed.

## Files

```
~/.claude/mentor/profile.md   your goals, your reality, your don't-let-me list
~/.claude/mentor/todos.md     the todo surface (path configurable in profile.md)
```

Both are plain markdown on your machine. Nothing is sent anywhere, and nothing is
written to your `CLAUDE.md` — uninstalling leaves no trace but those two files.
Set `MENTOR_HOME` to relocate them. Edit them by hand any time; the don't-let-me
list is the one worth revisiting, since you keep learning new ways to fool
yourself.

## Using another agent

The packaging is Claude Code specific; the content isn't. `stance.md` plus your
`profile.md` pasted into an `AGENTS.md` gets you most of the way in other agents.
Codex and OpenCode both read a global instructions file that every project
inherits, so one copy covers everything — you just lose `/mentor:init` and the
todo skill's automatic triggering.

## Some things it has said to me

> You're not blocked on materials — you have all of them. You're avoiding this
> because it's unpleasant. It goes first tomorrow, before anything else.

That was about a piece of government paperwork that had slipped four days
running. Each day I'd had a reason. It was correct and I hated it.

Another evening I spent an hour on one dot in my shell prompt — the little
indicator that tells me whether my proxy is on. First the color, then the size,
then whether it should be hollow or filled, then how far it sat from the cursor.
It pointed out that's on my own don't-let-me list, and asked which of my three
goals it served. I knew the answer. Knowing it and having something say it out
loud are different things.

---

I'm also building the same idea as a standalone web app:
[One Thing at a Time](https://onethingatatime.app).

## License

MIT

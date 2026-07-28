# mentor

A Claude Code plugin that tells you when the thing you're about to do is avoidance.

Not a task tracker. It's a stance: your goals and your own list of failure
patterns get loaded into every session, and Claude checks what you're actually
doing against them.

## The idea

Long todo lists reliably make me freeze instead of start. Lists, Notion,
calendars, "second brain" setups — each worked for about two weeks.

What finally changed something wasn't a better list. It was writing down two
documents and handing them to the agent I already use every day.

**My actual goals.** Three of them, each with an end state you could check.

**A list titled "don't let me."** My own failure patterns, written honestly:

```
- [config] don't let me sink into environment tweaking — zero risk,
  instant feedback, never finishes, serves nothing

- [explore] don't let me keep opening new exploratory threads while
  nothing is finished

- [ship] don't let me build in private forever, waiting for it to be ready
```

Some real things it has said to me:

> You're not blocked on materials — you have all of them. You're avoiding this
> because it's unpleasant. It goes first tomorrow, before anything else.

That was about a piece of government paperwork that had slipped four days
running. Each day I'd had a reason. It was correct and I hated it.

Another evening I'd spent an hour on a single dot in my shell prompt — the
color, then the size, then whether it should be hollow or filled, then how far
it sat from the cursor. It pointed out that's on my own don't-let-me list, and
asked which of my three goals it served. I knew the answer. Knowing it and
having something say it out loud are different things.

## What's actually new here

Not that the AI is smarter. **I handed it the criteria in advance, while I was
being honest, so it could hold me to them later when I wasn't.**

That's the whole mechanism. It only works if the second list is the honest
version — a flattering one just gets you an assistant that agrees with you.

## What it can and can't see

Worth saying plainly, because it's the first thing that will disappoint you
otherwise: **it sees your Claude sessions, your todo file, and your commits. It
does not see the rest of your day.** Spend an afternoon avoiding something in
another window and it will have no idea. This is built for people who already do
most of their work with Claude in front of them.

But observation turns out not to be where the signal is. The paperwork nudge
above didn't come from watching me — it came from the same item sitting
unchecked in four consecutive daily blocks. **What you said you'd do, versus
what closed, is behavioural evidence.** It holds even when you never say a word
about avoiding anything, and it's usually more damning than anything you'd catch
live.

## It catches everything you throw at it

A mentor that pushes back sounds like it should also stop you starting things. It
doesn't, deliberately.

Bring it a new project at midnight and it takes it, no argument, no "are you sure
this serves your goals." Then it does the useful part: tells you which goal it
serves, or says it serves none and puts it low, and folds it in with the three
other things you started that were secretly the same thing.

The gatekeeping version doesn't work. A list that argues with new ideas is a list
you stop telling things to — and then it's lost the record of what you said you'd
do, which is the only real evidence it had. Ideas that look like drift also have
a habit of converging six months later; the moment of capture is the worst
possible time to judge.

Capture is unconditional. Priority is where it gets ruthless.

## Install

```
/plugin marketplace add hcsum/dont-let-me
/plugin install mentor@dont-let-me
/mentor:init
```

`/mentor:init` interviews you for about ten minutes — it asks one question at a
time and pushes back if your goals are vague. It writes
`~/.claude/mentor/profile.md`, and that's the whole setup.

## Start using it

There's nothing to remember. Two ways it shows up.

**It's already watching.** The stance loads into every session, so it reads along
while you do unrelated work and speaks up at checkpoints — you finish something,
you're picking between directions, you've been circling the same thing for an
hour. One nudge per pattern, and you can wave it off.

**Or just say something.** Anything todo-shaped wakes the `todos` skill; the
mentor itself is always there and answers to being talked to.

```
what up mentor
add a todo: ship the landing page
what should I do next
I finished the auth rewrite
```

One command exists, `/mentor:check`, for when you want the alignment check now
instead of waiting to be noticed.

## The list sharpens itself

You'll notice the template mentions two optional lines per entry:

```
- signal: what it looks like from outside, the moment it's happening
- unless: when doing this is legitimately the right call
```

**Onboarding doesn't ask you for these**, on purpose. Nobody can describe the
signal for a trap they haven't been caught in yet — you'd invent a generality,
and a vague signal makes the agent speak up at the wrong moments.

They get written from use instead. When a nudge lands, what just happened *is*
the signal, and you're offered a line. When a nudge misses and you say "no, that
was real work," that's an `unless`, in your own words, so the same false positive
doesn't recur. After a few months an entry looks like:

```
- [agent] don't let me endlessly tinker with the agent itself — prompts,
  config, architecture — as avoidance
  - signal: a five-minute change turning into forty rounds of adjustment
  - unless: it directly unblocks a north-star task
```

Which is not something you could have written on day one.

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

---

I'm also building the same idea as a standalone web app:
[One Thing at a Time](https://onethingatatime.app).

## License

MIT

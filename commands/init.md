---
description: Set up your mentor profile — goals, reality, and your own don't-let-me list
---

Interview the user to build their mentor profile, then write it to
`~/.claude/mentor/profile.md` (respect `$MENTOR_HOME` if set).

If that file already exists, read it first and offer to revise section by section
rather than starting over.

## How to run the interview

**One question at a time.** Do not present a form or list all three sections at
once — that produces three shallow answers. Ask, react to what they said, follow
up if it's vague, then move on.

**Push back on vagueness.** The plugin is worth nothing if the inputs are
aspirational. Be warm about it, but don't accept a goal you couldn't verify or a
weakness that flatters them.

**Keep it under fifteen minutes.** Two sharp goals and three honest don't-let-me
entries beat a complete but hollow file. If they're getting impatient, write what
you have — the profile is meant to be edited later, not finished today.

## What to collect

### 1. Goals — two to four

Reject directions ("be more productive", "grow as an engineer") and ask for an
end state that could be checked. Useful probes:

- "How would you know you'd reached it? What would be different?"
- "What is this goal *for*?" — sometimes the real goal is one level up.
- If they give more than four, ask which two they'd keep if forced. Too many
  goals means nothing is deprioritized, which is the same as having none.

### 2. Reality — what bounds the plan

Two kinds of thing go here.

**Hard constraints:** runway, focused hours actually available per day, external
deadlines, obligations. Ask directly — "if you did nothing but this, how long
could you go?" and "realistically, how many focused hours a day do you get?" If a
stated goal is impossible under a stated constraint, say so now rather than in
six months.

**Standing traits** that shape how advice should land: low confidence, losing the
thread, stalls that are usually fear rather than laziness. These are conditions
to work with, not faults to fix — which is exactly why they go here and not in
the next section.

### 3. Don't let me — the load-bearing section

Behaviours an agent could watch happen and interrupt. The sorting rule against
Reality: **can it be caught in the act?** An hour of config tweaking, yes. Being
short on confidence, no.

The productive question is not "what are your bad habits." It is:

> "What did you start in the last six months and not finish? What actually
> stopped you — each time?"

Then look for the repeat across the answers. Name the pattern you see and check
it with them; people often describe the same failure three times without
noticing. For each one, get what the behaviour is **and what makes it feel like
work** — that second half is what separates a real trap from a chore they simply
dislike.

One plain sentence per entry. **Do not ask them to fill in `signal` or `unless`
fields.** Those two lines exist in the template, but they get written later, from
being caught — asking for them cold produces invented generalities, and it turns
this into a form. Show one finished example so they can see where the format is
headed, then let them write prose:

```
- [config] don't let me sink into environment tweaking — zero risk, instant
  feedback, never finishes, serves nothing
```

Before writing, say this plainly:

> This section only works if it's the honest version. A flattering list gets you
> an assistant that agrees with you. Anything you'd be slightly embarrassed to
> have written down is probably the most useful line in here.

It stays local — a file on their machine, read by their own sessions.

## Writing the file

Use `${CLAUDE_PLUGIN_ROOT}/templates/profile.md` as the structure. Preserve the
`todo_file:` line; ask where they want it if they'd rather not use the default
`~/.claude/mentor/todos.md`.

Write it in **their own words**, not cleaned-up coaching language — they have to
recognize themselves in it a year from now.

Show the full draft and get an explicit OK before writing. Then:

- create the directory if needed
- write the file
- tell them it takes effect **in the next session**, since the profile loads at
  session start
- mention that the list sharpens itself: when a nudge lands or misses, they'll be
  offered a one-line addition, which is where `signal` and `unless` come from
- mention `/mentor:check` for an on-demand alignment check

---
description: Set up your mentor profile — goals, constraints, shortcomings, and your own don't-let-me list
---

Interview the user to build their mentor profile, then write it to
`~/.claude/mentor/profile.md` (respect `$MENTOR_HOME` if set).

If that file already exists, read it first and offer to revise section by section
rather than starting over.

## How to run the interview

**One question at a time.** Do not present a form or a numbered list of all four
sections at once — that produces four shallow answers. Ask, react to what they
said, follow up if it's vague, then move on.

**Push back on vagueness.** This whole plugin is worth nothing if the inputs are
aspirational. Be warm about it, but do not accept a goal you couldn't verify or a
weakness that flatters them.

Aim for 10–15 minutes total. If they get impatient, it is better to have two
sharp goals and three honest don't-let-me entries than a complete but hollow file.

## What to collect

**1. Goals** — two to four.

Reject directions ("be more productive", "grow as an engineer") and ask for
something with a verifiable end state. Useful probes:
- "How would you know you'd reached it? What would be different?"
- "What is this goal *for*?" — sometimes the real goal is one level up.
- If they give more than four, ask which two they'd keep if they could only keep
  two. Too many goals means nothing gets deprioritized, which is the same as
  having none.

**2. Constraints (reality)** — money runway, hours per day they can actually
focus, hard external deadlines, obligations.

This is what turns advice from generic into usable. Ask directly: "If you did
nothing but this, how long could you go?" and "Realistically, how many focused
hours a day do you get?" Note when a stated goal is impossible under a stated
constraint — that is worth saying out loud now, not six months later.

**3. Shortcomings** — how they actually fail.

The productive question is not "what are your weaknesses". It is:

> "What did you start in the last six months and not finish? What actually
> stopped you — each time?"

Look for the repeat across the answers. Name the pattern you see and check it
with them; people often describe the same failure three times without noticing.

**4. Don't let me** — the load-bearing section.

For each entry, you need two things:

- the pattern, and *why it's seductive* (what makes it feel like work)
- **the signal**: the observable thing that means it is happening right now

The signal is what makes this usable. "Don't let me procrastinate" is unusable.
"Don't let me sink into config tweaking — signal: a five-minute adjustment
turning into forty rounds of fiddling" is actionable, because it can be
recognized mid-session.

Ask for the signal explicitly on every entry: "If I were watching you do this,
what would I see?"

Before writing, say this plainly:

> This section only works if it's the honest version. If you write a flattering
> list, you'll get an assistant that agrees with you. Anything you'd be a little
> embarrassed to have on the list is probably the most useful line in it.

It stays local — it is a file on their machine, read by their own sessions.

## Writing the file

Use `${CLAUDE_PLUGIN_ROOT}/templates/profile.md` as the structure. Preserve the
`todo_file:` line; ask where they want their todo list if they'd rather not use
the default `~/.claude/mentor/todos.md` (a file inside a notes repo is a common
choice).

Write it in **their own words**, not cleaned-up coaching language — they have to
recognize themselves in it a year from now.

Show them the full draft and get an explicit OK before writing. Then:

- create the directory if needed
- write the file
- tell them it takes effect **in the next session**, since the profile is loaded
  at session start
- mention `/mentor:check` for an on-demand alignment check, and that the `mentor`
  skill maintains their todo list once they start using it

---
name: mentor-init
description: Interview the user to build or revise their mentor profile — their long-term goals, the reality that bounds them, and their own don't-let-me list. Use when they ask to set up the mentor, create or redo their profile, rewrite a goal, or add to their don't-let-me list, or when the session reports that no profile exists yet.
---

Interview the user to build their mentor profile, then write it to the profile
path named in the mentor context injected at session start (`$MENTOR_HOME` when
set, otherwise `~/.mentor/profile.md`, or an existing `~/.claude/mentor/` or
`~/.codex/mentor/` directory).

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

**Budget the attention.** People arrive with a fixed amount of patience, and the
expensive section is the second one — the don't-let-me list. Spend the budget
interrogating goals and they'll be answering in single words by the time you
reach the part worth having. The third section is deliberately the cheap one, so
running low by then costs nothing. Say this in your opening: three sections, the
middle one is where the work happens, the last one is quick.

Concretely: **at most two rounds of push-back per goal.** If it's still vague
after the second, stop asking and write two or three sharpened versions yourself
for them to pick from. Producing is expensive; reacting is cheap. Move on.

**Offer choices as choices.** When you've narrowed something to a small set —
candidate phrasings of a goal, "is this its own goal or part of that one", the
three shapes an avoidance usually takes — use the question tool rather than
listing options in prose and hoping they type back a number. Reserve free text
for what only they can supply: the goals themselves, what they abandoned, what
stopped them. That raw material is the whole input; never turn it into a menu.

## What to collect

### 1. Goals — two to four

Reject directions ("be more productive", "grow as an engineer") and ask for an
end state that could be checked. Useful probes:

- "How would you know you'd reached it? What would be different?"
- "What is this goal *for*?" — the highest-yield probe here. It regularly turns
  out that a stated second goal is really a component of the first, and folding
  it in beats tracking it separately.
- If they give more than four, ask which two they'd keep if forced. Too many
  goals means nothing is deprioritized, which is the same as having none.

Two goals are plenty; two sharp ones beat four vague ones, and this section is
not where the interview should spend its budget. Remember the two-round cap —
after that, hand them phrasings to choose between and move on.

### 2. Don't let me — the load-bearing section

Ask this second, while they still have patience. It is the only section that
does real work, and it is the most expensive to answer honestly.

Behaviours an agent could watch happen and interrupt. The sorting rule: **can it
be caught in the act?** An hour of config tweaking, yes. Being short on
confidence, no — that's a standing trait, and it belongs in Reality.

**Open with the trait, then move to the behaviour.** Asking someone to name a
standing trait ("is there a background condition that shapes how you work —
losing the thread, self-doubt, stalls that are really fear rather than
laziness?") is easier than asking them to confess a pattern, and it warms up the
disclosure. Watch for the answer that's actually catchable in the act: "I switch
to the easy part whenever it gets hard" arrives phrased as a trait but is a
don't-let-me entry. Take it as one. File the genuinely uncatchable residue under
Reality when you write the file — elicited here, filed there.

If they answer a trait question with a single dismissive word — "lazy" is the
common one — don't accept it. It's almost always the shell on something more
specific. Ask what it looks like, or offer the two or three shapes it usually
takes and let them pick.

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

### 3. Reality — what bounds the plan

Last on purpose: this is the cheapest section to answer, so it's the one that
survives a tired person. It's factual, not introspective.

Runway, focused hours actually available per day, external deadlines,
obligations. Ask directly — "if you did nothing but this, how long could you
go?" and "realistically, how many focused hours a day do you get?" Take the
second answer seriously: if they claim four hours on a weekday, ask how many
days last week they actually managed it.

Then do the arithmetic out loud. If the hours don't fit the goals, say so now
rather than in six months, and propose a sequencing — one goal first, the other
starting later — rather than quietly writing down two goals that can't both
happen.

Any standing traits that surfaced during the previous section get filed here too.

## Writing the file

Use the plugin's `templates/profile.md` as the structure — it sits at
`${CLAUDE_PLUGIN_ROOT}/templates/profile.md` when that variable is set, and two
directories up from this file otherwise. Note its section order is Goals,
Reality, Don't let me, which is the order that reads best, not the order you
asked in. Preserve the `todo_file:` line, pointed at `todos.md` in the same
directory as the profile; ask where they want it if they'd rather put it
elsewhere.

Write it in **their own words**, not cleaned-up coaching language — they have to
recognize themselves in it a year from now.

Show the full draft and get an explicit OK before writing. Then:

- create the directory if needed
- write the file
- tell them it takes effect **in the next session**, since the profile loads at
  session start
- mention that the list sharpens itself: when a nudge lands or misses, they'll be
  offered a one-line addition, which is where `signal` and `unless` come from
- mention that they can ask for an alignment check any time — `/mentor:check`,
  `$mentor-check`, `/mentor-check`, or just asking for one

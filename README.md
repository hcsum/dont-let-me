# mentor

**Turn your agent into a mentor.** It knows what you're working toward, and how
you get in your own way.

## Install

<details>
<summary><strong>Claude Code</strong></summary>

```bash
claude plugin marketplace add hcsum/dont-let-me
claude plugin install mentor@dont-let-me
```

Then run `/mentor:init` to set up your profile, and `/mentor:check` any time you
want the alignment check on demand.

</details>

<details>
<summary><strong>Codex</strong></summary>

```bash
codex plugin marketplace add hcsum/dont-let-me --ref main
codex plugin add mentor@dont-let-me
```

Then run `$mentor-init` to set up your profile, and `$mentor-check` any time you
want the alignment check on demand.

Codex makes you trust a hook before it runs: open `/hooks`, review the
SessionStart entry, trust it. Until you do, the profile never loads.

</details>

<details>
<summary><strong>OpenCode</strong></summary>

OpenCode has no plugin marketplace for this, so clone it and point the config at
the two pieces:

```bash
git clone https://github.com/hcsum/dont-let-me.git ~/.mentor/plugin
```

```json
// ~/.config/opencode/opencode.json
{
  "instructions": ["~/.mentor/plugin/stance.md", "~/.mentor/profile.md"],
  "skills": { "paths": ["~/.mentor/plugin/skills"] }
}
```

Then run `/mentor-init` to set up your profile, and `/mentor-check` any time you
want the alignment check on demand. 

</details>

In my own use, Claude Code is where this works best. Codex and OpenCode both run
it, but how well the nudges land depends on the model behind them, and I've had
better results with Claude.

## 1. It interviews you

Setup asks you questions, one at a time, for about ten minutes. Run `/mentor:init`
in Claude Code, `$mentor-init` in Codex, `/mentor-init` in OpenCode. Two things
come out of it.

**Your long-term goals.** What you're actually working toward. It pushes back if
you answer vaguely.

**Your anti-patterns.** The ways you reliably get in your own way, written down
while you're still honest about them, so it can hold you to them later when
you're not:

```
- [ship] don't let me build in private forever, waiting for it to be ready
- [explore] don't let me keep opening new threads while nothing is finished
```

You do this once and rarely touch it again.

## 2. Then you just talk to it

```
mentor, what's on my plate today?
```

Ask what's on your plate and it won't read you the whole todo list. It picks the few that serve your main goals and names the first move on one, small enough to start now.

```
add "ship the landing page" to my todos
```

Prompts without the keyword 'todo' or 'mentor' will also trigger the mentor stance. You can brain dump what's in your mind.
```
I want to redo the pricing page, learn Rust, call the accountant, fix the signup bug, and write that post I keep putting off
```

Mention something in passing and it's kept. It then files each item against your goals, gives it a priority, and merges it with the other things you started that turned out to be the same thing. Items that serve none of your goals get said out loud and put low.

## 3. And it speaks up on its own

It loads into every session and reads along while you do unrelated work. When
what you're doing is on your own don't-let-me list, it says so, once per pattern.
You can wave it off.

It also watches what's not moving. Items that keep carrying over day after day
get treated as avoidance, not as a scheduling problem.

One section of the profile it writes itself. When the same thing happens a second
or third time and nothing you wrote saw it coming, it adds a line under
`## Observed patterns` — what the pattern is, and what it will watch for next
time. You don't maintain that section, and you can delete anything you disagree
with. It won't move an entry up into your don't-let-me list on its own; that list
stays your own writing about yourself, which is where its authority comes from.

Ask for the alignment check any time instead of waiting to be noticed:
`/mentor:check`, `$mentor-check`, or just asking for one.

## Who it's for

Probably most useful if you have ADHD tendencies, or something near them. You
fall into rabbit holes and can't climb out, you start five things and finish
none. That's what I built it around.

It works best if the agent is already where your work starts (research, writing,
coding, planning a video), because then it sees what you actually did, not just
what you told it. If it isn't, it still works. It just runs on what you tell it.

## Something it has said to me

> You've been on this dot for an hour. Fiddling with your setup is on your own
> don't-let-me list. Which of your three goals does it serve?

I was tuning one dot in my shell prompt, the indicator that tells me whether my
proxy is on. First the colour, then the size, then whether it should be hollow
or filled. I knew the answer. Knowing it and having something say it out loud
are different things.

## Files

```
~/.mentor/profile.md   your goals, your reality, your don't-let-me list, plus
                       what it has noticed on its own
~/.mentor/todos.md     the todo surface (path configurable in profile.md)
```

Plain markdown on your machine. Nothing is sent anywhere, and nothing is written
to your `CLAUDE.md` or `AGENTS.md`. Uninstalling leaves no trace but those two
files. Set `MENTOR_HOME` to relocate them. Otherwise the first existing directory
wins (`~/.mentor/`, then `~/.claude/mentor/`, then `~/.codex/mentor/`), so every
agent resolves to the same profile. If more than one exists, the earlier one wins
and the others are ignored; set `MENTOR_HOME` if that's not what you want.

## Using another agent?

Just give the link of this repo to your agent and ask it to figure out how to install. 

---

I'm also building the same idea as a standalone web app:
[One Thing at a Time](https://onethingatatime.app).

## License

MIT

[English](README.md) · **简体中文**

# don't let me

**把你的 Agent 变成一个了解你的导师。**
它知道你正在努力实现什么，也知道你通常会怎样妨碍自己。

## 安装

直接告诉你的 Agent：

`安装这个插件：https://github.com/hcsum/dont-let-me`

或者按照下面的步骤手动安装：

<details>
<summary><strong>Claude Code</strong></summary>

```bash
claude plugin marketplace add hcsum/dont-let-me
claude plugin install mentor@dont-let-me
```

然后运行 `/mentor:init` 来创建你的个人档案。之后任何时候想主动进行一次目标对齐检查，都可以运行 `/mentor:check`。

</details>

<details>
<summary><strong>Codex</strong></summary>

```bash
codex plugin marketplace add hcsum/dont-let-me --ref main
codex plugin add mentor@dont-let-me
```

然后运行 `$mentor-init` 来创建你的个人档案。之后任何时候想主动进行一次目标对齐检查，都可以运行 `$mentor-check`。

Codex 在执行 hook 之前，需要你先手动信任它：打开 `/hooks`，检查 `SessionStart` 条目，然后选择信任。在你完成这一步之前，个人档案不会被加载。

</details>

<details>
<summary><strong>OpenCode</strong></summary>

OpenCode 目前没有适用于这个项目的插件市场，因此需要先克隆仓库，再在配置文件中指向 OpenCode 能够加载的内容。

```bash
git clone https://github.com/hcsum/dont-let-me.git ~/.mentor/plugin
```

加载 mentor 的行为准则和 skills：

```json
// ~/.config/opencode/opencode.json
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["~/.mentor/plugin/stance.md", "~/.mentor/profile.md"],
  "skills": { "paths": ["~/.mentor/plugin/skills"] }
}
```

OpenCode 不会从任意外部目录加载 commands，因此还需要把两个命令入口安装到 OpenCode 的全局命令目录中：

```bash
mkdir -p ~/.config/opencode/commands
cat > ~/.config/opencode/commands/mentor-init.md <<'EOF'
---
description: Set up your mentor profile — goals, reality, and your own don't-let-me list
---

Use the `mentor-init` skill and follow it exactly.

$ARGUMENTS
EOF

cat > ~/.config/opencode/commands/mentor-check.md <<'EOF'
---
description: Hold what you've actually been doing up against your goals and your don't-let-me list
---

Use the `mentor-check` skill and follow it exactly.

If the user passed anything below, treat it as their own account of what they've been working on.

$ARGUMENTS
EOF
```

然后重启 OpenCode。运行 `/mentor-init` 来创建个人档案；之后任何时候想主动进行一次目标对齐检查，都可以运行 `/mentor-check`。

</details>

根据我自己的使用体验，这套东西在 Claude Code 上效果最好。Codex 和 OpenCode 都可以运行，但这些提醒是否真的能说到点上，很大程度取决于背后的模型。就我目前的体验而言，Claude 的表现更好。

## 1. 它会先采访你

初始化过程会逐个向你提问，大约需要十分钟。使用 Claude Code 时运行 `/mentor:init`，使用 Codex 时运行 `$mentor-init`，使用 OpenCode 时运行 `/mentor-init`。

这个过程最终会生成两类内容。

**你的长期目标。**
也就是你真正想实现的事情。如果你的回答太模糊，它会继续追问，不让你轻易糊弄过去。

**你的反模式。**
也就是那些你总会用来妨碍自己的行为模式。趁你现在还愿意诚实面对自己时，把它们写下来。这样以后当你再次陷进去、自己却不愿承认时，它就可以拿这些话来提醒你：

```text
- [ship] 别让我一直躲在私下开发，永远等到“准备好了”才发布
- [explore] 别让我不断开启新的方向，却一个都没有完成
```

这一步通常只需要做一次，之后很少需要修改。

## 2. 然后你只需要和它说话

```text
mentor，我今天手上有哪些事情？
```

当你问它今天要做什么时，它不会把整张待办清单重新念给你听。它会挑出少数几个真正服务于你主要目标的事项，并从其中一个任务里指出一个足够小、现在就能开始的第一步。

```text
把“发布落地页”加入我的 todos
```

即使你的提示中没有使用 `todo` 或 `mentor` 这两个关键词，也会触发 mentor 的行为模式。你可以直接把脑子里的东西全部倒出来：

```text
我想重做定价页面、学 Rust、给会计打电话、修复注册 bug，
还想写那篇一直拖着没写的文章
```

你随口提到的事情也会被记录下来。之后，它会把每个事项对应到你的目标上，为它们分配优先级，并把那些看起来不同、实际上属于同一件事情的任务合并起来。

如果某个事项完全不服务于你的任何目标，它会直接把这件事说出来，并把它放到较低优先级。

## 3. 它还会主动开口提醒你

它会在每次会话开始时自动加载，并在你处理其他工作时一起观察。

当你正在做的事情命中了你自己的 don't-let-me 清单，它会指出来。每一种行为模式只提醒一次。你也可以选择忽略它，继续做下去。

它还会关注那些一直没有进展的事情。如果某个任务一天又一天地被顺延，它不会继续把这当成普通的排期问题，而会开始把它视作一种逃避。

个人档案中有一个部分是由它自己维护的。

当同一类情况第二次或第三次发生，而你之前写下的内容完全没有预见到它时，它会在 `## Observed patterns` 下新增一条记录：描述这个行为模式是什么，以及下一次它会留意哪些迹象。

这个部分不需要你手动维护。如果你不同意某一条，可以直接删除。

它不会擅自把这些观察结果提升到你的 don't-let-me 清单中。那份清单始终只保留你亲自写下的、对自己的判断。它之所以有权威性，正是因为那些话来自你自己。

你也可以随时主动要求进行一次目标对齐检查，不需要等它自动发现问题：

`/mentor:check`、`$mentor-check`，或者直接让它进行一次检查。

## 适合哪些人

它可能最适合有 ADHD 倾向，或者有类似行为模式的人。

你很容易钻进兔子洞里出不来，同时开始五件事情，却一件都没有完成。这个项目就是围绕这些问题设计的。

当 Agent 本来就是你开始工作的地方时，它的效果最好，例如进行调研、写作、编程或规划视频。因为在这种情况下，它能看到你实际上做了什么，而不只是听你描述自己做了什么。

即使你的工作并不直接发生在 Agent 中，它仍然可以工作，只是它只能依据你主动告诉它的内容进行判断。

## 文件

```text
~/.mentor/profile.md   你的目标、现实情况、don't-let-me 清单，
                       以及它后来自己观察到的行为模式

~/.mentor/todos.md     待办事项的存储位置
```

所有内容都只是你电脑上的普通 Markdown 文件。不会有任何数据被发送到其他地方，也不会向你的 `CLAUDE.md` 或 `AGENTS.md` 中写入任何内容。

卸载之后，除了这两个文件以外，不会留下其他痕迹。

你可以通过设置 `MENTOR_HOME` 来修改这两个文件的位置。

如果没有设置，程序会按照以下顺序，使用第一个已经存在的目录：

1. `~/.mentor/`
2. `~/.claude/mentor/`
3. `~/.codex/mentor/`

这样，不同的 Agent 就可以解析并使用同一份个人档案。

如果同时存在多个目录，顺序更靠前的目录会被使用，其他目录会被忽略。如果这不是你想要的行为，请显式设置 `MENTOR_HOME`。

---

我也在把同一个理念做成一个独立的 Web App：

[One Thing at a Time](https://onethingatatime.app)。

## License

MIT

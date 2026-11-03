# Pi Starter Kit

Production-ready configuration for [Pi Coding Agent](https://github.com/earendil-works/pi).

## Features

- **Context-First**: `codemode: "only"` reduces tool schema tokens; `billion-context` handles long sessions.
- **Minimalist**: Ponytail enforces minimal diffs and KISS/YAGNI principles.
- **Production MCP**: TinyFish, Exa, Playwright, Chrome DevTools, and Tencent Docs.
- **Strict Guidelines**: Bundled `AGENTS.md` for concise, hallucination-free outputs.
- **Multi-Agent Roster**: Ready-to-use subagents (`scout`, `planner`, `worker`, `reviewer`) in `~/.pi/agent/agents/`.

## Quick Start

```bash
# 1. Install Pi
npm install -g @earendil-works/pi-coding-agent

# 2. Clone & Install
git clone https://github.com/0xNorex/pi-starter-kit.git ~/.pi-starter-kit
cd ~/.pi-starter-kit && ./install.sh

# 3. Set MCP Keys (Optional)
export TINYFISH_API_KEY="your_key"
export EXA_API_KEY="your_key"
```

## Included Packages

- `billion-context` - Context compaction
- `pi-cache-optimizer` - Cache alignment
- `pi-ask-user` - Confirmation prompts
- `pi-goal-x` - Goal tracking
- `@pi-agents/loop` - Scheduled tasks
- `@ff-labs/pi-fff` - Fast search
- `ponytail` - Anti-bloat rules

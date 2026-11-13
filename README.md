# Pi Starter Kit

Lean, cache-first configuration for [Pi Coding Agent](https://github.com/earendil-works/pi).

## Architecture

- **Append-Only Cache**: `codemode: "only"` + `pi-cache-optimizer` + `cacheWarming: "idle"` keeps prompt prefixes intact for 95% cache discounts.
- **Zero-Bloat Search**: `pi-fff` in `override` mode replaces built-in `grep`/`find`; `pi-web-access` runs raw (`workflow: "none"`) so search results stay out of the cached prompt prefix.
- **Shared Rules & Skills**: `AGENTS.md` tracks [`0xNorex/agents-skills`](https://github.com/0xNorex/agents-skills) and skills live there too, so both starter kits share one source of truth. `install.sh` fetches it at install time and falls back to the bundled copy.
- **On-Demand MCP**: Remote Tencent Docs HTTP MCPs (`0` local processes) + disabled-by-default `chrome-devtools` (enable via `/mcp` when needed).

## Quick Start

```bash
# 1. Install Pi
npm install -g @earendil-works/pi-coding-agent

# 2. Clone & Install
git clone https://github.com/0xNorex/pi-starter-kit.git ~/.pi-starter-kit
cd ~/.pi-starter-kit && ./install.sh
```

## Included Packages (3 Core Only)

- `pi-cache-optimizer` - Prompt prefix stability & cache telemetry
- `pi-web-access` - Web search, URL/GitHub/PDF fetching
- `@ff-labs/pi-fff` - SIMD fuzzy file & content search (`override` mode)

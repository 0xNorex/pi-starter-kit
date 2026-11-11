#!/usr/bin/env bash
set -e

PI_AGENT_DIR="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> 正在准备目标目录: $PI_AGENT_DIR"
mkdir -p "$PI_AGENT_DIR" "$PI_AGENT_DIR/secrets" "$PI_AGENT_DIR/agents" "$PI_AGENT_DIR/extensions/subagent"

echo "==> 复制核心配置文件..."
cp --remove-destination "$SCRIPT_DIR/settings.json" "$PI_AGENT_DIR/settings.json"
cp --remove-destination "$SCRIPT_DIR/mcp.json" "$PI_AGENT_DIR/mcp.json"
cp --remove-destination "$SCRIPT_DIR/AGENTS.md" "$PI_AGENT_DIR/AGENTS.md"
cp --remove-destination "$SCRIPT_DIR/keybindings.json" "$PI_AGENT_DIR/keybindings.json"
cp --remove-destination "$SCRIPT_DIR/pi-fff.json" "$PI_AGENT_DIR/pi-fff.json"
cp --remove-destination "$SCRIPT_DIR/extensions/subagent/config.json" "$PI_AGENT_DIR/extensions/subagent/config.json"

echo "==> 同步自定义 Subagent 角色定义 (planner)..."
cp --remove-destination "$SCRIPT_DIR/agents/"*.md "$PI_AGENT_DIR/agents/"

if [ ! -f "$PI_AGENT_DIR/web-search.json" ]; then
  echo "==> 初始化 web-search.json..."
  cp "$SCRIPT_DIR/web-search.json" "$PI_AGENT_DIR/web-search.json"
fi

if [ ! -f "$PI_AGENT_DIR/models.json" ]; then
  echo "==> 初始化 models.json (请后续按需配置 API Key)..."
  cp "$SCRIPT_DIR/models.json.example" "$PI_AGENT_DIR/models.json"
else
  echo "==> models.json 已存在，跳过覆盖以保护现有配置。"
fi

echo "==> 触发 pi package 依赖更新与自动拉取..."
if command -v pi &> /dev/null; then
  pi update || true
  echo "==> 安装完成！运行 'pi' 即可开始体验。"
else
  echo "==> 未检测到全局 'pi' 命令，请先运行: npm install -g @earendil-works/pi-coding-agent"
fi

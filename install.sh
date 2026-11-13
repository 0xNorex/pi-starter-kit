#!/usr/bin/env bash
set -e

PI_AGENT_DIR="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AGENTS_MD_URL="${AGENTS_MD_URL:-https://raw.githubusercontent.com/0xNorex/agents-skills/main/AGENTS.md}"

echo "==> 正在准备目标目录: $PI_AGENT_DIR"
mkdir -p "$PI_AGENT_DIR" "$PI_AGENT_DIR/secrets"

echo "==> 复制核心配置文件..."
cp --remove-destination "$SCRIPT_DIR/settings.json" "$PI_AGENT_DIR/settings.json"
cp --remove-destination "$SCRIPT_DIR/mcp.json" "$PI_AGENT_DIR/mcp.json"
cp --remove-destination "$SCRIPT_DIR/keybindings.json" "$PI_AGENT_DIR/keybindings.json"
cp --remove-destination "$SCRIPT_DIR/pi-fff.json" "$PI_AGENT_DIR/pi-fff.json"

echo "==> 安装 AGENTS.md（优先上游 agents-skills，失败回退内置副本）"
if curl -fsSL --max-time 15 "$AGENTS_MD_URL" -o "$PI_AGENT_DIR/AGENTS.md.tmp" 2>/dev/null && [ -s "$PI_AGENT_DIR/AGENTS.md.tmp" ]; then
  mv "$PI_AGENT_DIR/AGENTS.md.tmp" "$PI_AGENT_DIR/AGENTS.md"
  echo "    来源: $AGENTS_MD_URL"
else
  rm -f "$PI_AGENT_DIR/AGENTS.md.tmp"
  cp --remove-destination "$SCRIPT_DIR/AGENTS.md" "$PI_AGENT_DIR/AGENTS.md"
  echo "    上游不可达，使用仓库内置副本"
fi

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

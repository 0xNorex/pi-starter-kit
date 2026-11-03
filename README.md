# 🥧 Pi Coding Agent 最佳实践配置模板 (Production Ready)

这是一套高度调优的 [Pi Coding Agent](https://github.com/earendil-works/pi) 生产力级配置模板。

## ✨ 核心特色

1. **极致 Context 优化与零废话设计**：
   - **`codemode.mode: "only"`**：将所有内置工具与 MCP 接口收敛进 QuickJS 沙箱，大幅削减 System Prompt 中的 JSON Schema 开销，彻底消灭多轮往返。
   - **Billion-Context**：多轮长会话自适应分层折叠与压缩。
   - **Ponytail (Ultra 模式)**：强行压制大模型的过度工程化（Over-engineering），贯彻 KISS / YAGNI 原则，产出最短可用代码。
2. **生产级 MCP 工具集**：
   - 网页语义检索：**TinyFish** + **Exa**
   - 浏览器级端到端测试与爬取：**Playwright** + **Chrome DevTools**
   - 生产力文档处理：**腾讯文档 / SmartSheet / DocEngine**
3. **全局行为法则 (AGENTS.md)**：
   - 格赖斯四准则 + BLUF（结论先行）。
   - 单向门（重大决策/破坏性操作必须主动确认）与双向门（日常改动自主决策）。

---

## 🚀 快速上手 (在新机器上安装)

### 1. 前置依赖
- Node.js >= 22
- 已全局安装 Pi：
  ```bash
  npm install -g @earendil-works/pi-coding-agent
  ```

### 2. 克隆本仓库并一键安装
```bash
git clone <your-repo-url> my-pi-config
cd my-pi-config
chmod +x install.sh
./install.sh
```

### 3. 配置密钥
1. **MCP 环境变量**：在 `~/.bashrc` 或 `~/.zshrc` 中注入：
   ```bash
   export TINYFISH_API_KEY="your_key"
   export EXA_API_KEY="your_key"
   export TENCENT_DOCS_TOKEN="your_token"
   ```
2. **自定义 Provider 密钥**：在 `~/.pi/agent/secrets/custom-provider.key` 写入你的 API Key（或修改 `~/.pi/agent/models.json` 接入你自己的提供商）。

---

## 📦 包含的 Packages

- `billion-context`：长对话上下文智能管理。
- `pi-cache-optimizer`：Prompt Cache 命中率对齐。
- `pi-ask-user`：遇到单向门决策时主动向用户弹窗确认。
- `pi-goal-x`：长期多阶段任务状态机。
- `@pi-agents/loop`：后台周期性任务巡检。
- `@ff-labs/pi-fff`：高频访问感知的快速模糊搜索。
- `ponytail`：极简主义编码规则约束。

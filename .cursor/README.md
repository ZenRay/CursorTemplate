# CursorHarness Engineering

> 通用 Cursor AI 工程化范式模板 | [项目主页占位符]

---

## 概述

CursorHarness 是一套为 Cursor IDE 设计的工程化范式模板，提供：

- **安全门禁** — 6 个 Hooks 拦截危险操作
- **行为规范** — 8 层 Rules 控制 AI 行为
- **任务编排** — 15 个 Commands 标准化工作流
- **专项代理** — 8 个 SubAgents 处理复杂任务
- **技能复用** — 5 个 Skills 封装最佳实践
- **可视化** — Canvas /diagram 生成架构图
- **自动审查** — Bugbot PR 集成
- **云代理** — Cloud/Parallel Agents 支持

---

## 快速开始

### 1. 初始化新项目

```bash
# 在空项目目录中
/paradigm-init
```

### 2. 查看可用命令

在 Cursor 聊天中输入 `/` 查看所有命令：

| 命令 | 用途 |
|------|------|
| `/archive-session` | 归档会话知识 |
| `/update-state` | 更新项目状态看板 |
| `/load-context` | 加载架构文档 |
| `/paradigm-init` | 绿地初始化 |
| `/paradigm-adopt` | 棕地迁移 |
| `/visualize` | 生成架构可视化图 |
| `/diagram` | 快速代码关系图 |
| `/cloud-agent` | 启动云后台代理 |
| `/parallel-agents` | 并行多代理执行 |
| `/memory-manage` | 管理原生记忆 |

### 3. 会话工作流

```
开始 → 读取 STATE.md → 工作 → /update-state → 结束
       ↓                                    ↓
  继续任务 → handoff.md              里程碑 → /archive-session
```

---

## 目录结构

```
.cursor/                    # 配置中心
├── README.md               # 本文件
├── hooks.json              # Hooks 事件配置
├── mcp.json                # MCP 服务器配置
├── agents/                 # SubAgents (7个)
│   ├── explore-enhanced.md
│   ├── verifier.md
│   ├── security-audit.md
│   ├── knowledge-archivist.md
│   ├── doc-generator.md
│   ├── api-reviewer.md
│   └── refactor-advisor.md
├── commands/               # 斜杠命令 (11个)
│   ├── archive-session.md
│   ├── update-state.md
│   ├── load-context.md
│   ├── review-hooks.md
│   ├── paradigm-init.md
│   ├── paradigm-adopt.md
│   ├── paradigm-sync.md
│   ├── performance-check.md
│   ├── deps-check.md
│   ├── test-coverage.md
│   └── git-cleanup.md
├── hooks/                  # 生命周期脚本 (6个)
│   ├── security-gate.sh      # T1: 安全拦截
│   ├── prompt-guard.sh       # T1: 注入防护
│   ├── auto-lint.sh          # T2: 自动 Lint
│   ├── log-failure.sh        # T2: 失败日志
│   ├── notify-done.sh        # T3: 完成通知
│   └── knowledge-trigger.sh  # T4: 归档提示
├── rules/                  # 分层规则 (8个)
│   ├── 00-project-overview.mdc   # Always
│   ├── 01-core-standards.mdc   # Always
│   ├── 02-code-style.mdc       # Auto
│   ├── 03-git-convention.mdc   # Auto
│   ├── 04-comment-style.mdc    # Auto
│   ├── 05-workflow.mdc         # Agent
│   ├── 06-migration-guide.mdc  # Manual
│   └── 07-security-practices.mdc # Manual
├── skills/                 # 技能 (4个)
│   ├── knowledge-extractor/
│   ├── code-review/
│   ├── test-generator/
│   └── pr-review/
├── notes/                  # 会话草稿 (私有)
└── logs/                   # 运行日志 (私有)

docs/
├── context/                # 架构文档
│   ├── architecture.md
│   ├── constraints.md
│   └── adr/
├── standards/              # 工程规范
│   ├── comment-style.md
│   ├── git-convention.md
│   ├── workflow.md
│   └── migration-guide.md
└── private/                # 私有文档 (不提交Git)
    └── state/
        ├── wip.md          # 跨会话工作
        └── handoff.md      # 会话交接

STATE.md                    # 项目状态看板 (≤30行)
AGENTS.md                   # Agent 行为规范
instructions.md             # 快速参考 (已弃用，迁移到本文件)
```

---

## 核心组件

### Hooks 分层体系 (T1-T4)

| Tier | 脚本 | 触发事件 | 功能 |
|------|------|----------|------|
| **T1 安全** | `security-gate.sh` | `beforeShellExecution` | 拦截 `rm -rf`, `sudo`, `DROP` 等 |
| **T1 安全** | `prompt-guard.sh` | `beforeSubmitPrompt` | 检测 Prompt 注入攻击 |
| **T2 质量** | `auto-lint.sh` | `afterFileEdit` | 自动运行语言 Linter |
| **T2 质量** | `log-failure.sh` | `postToolUseFailure` | 记录失败日志 |
| **T3 体验** | `notify-done.sh` | `stop` | 桌面通知 |
| **T4 知识** | `knowledge-trigger.sh` | `preCompact` | 归档提示 |

### Rules 激活模式

| 模式 | `alwaysApply` | `globs` | `description` | 行为 |
|------|---------------|---------|---------------|------|
| **Always** | `true` | - | - | 每会话自动加载 |
| **Auto Attached** | `false` | ✅ | 可选 | 匹配文件时加载 |
| **Agent Requested** | `false` | - | ✅ | AI 按需加载 |
| **Manual** | `false` | - | - | `@` 引用时加载 |

### SubAgents

| Agent | 模式 | 用途 |
|-------|------|------|
| `@explore-enhanced` | `readonly` | 深度代码库分析 |
| `@verifier` | `readonly` | 代码验证、测试 |
| `@security-audit` | `readonly` | 安全漏洞扫描 |
| `@knowledge-archivist` | `background` | 知识归档 |
| `@doc-generator` | `readonly` | 文档生成 |
| `@api-reviewer` | `readonly` | API 设计审查 |
| `@refactor-advisor` | `readonly` | 重构建议 |
| `@bugbot-assistant` | `readonly` | Bugbot 审查协助 |

---

## 使用指南

### 会话生命周期

#### 开始阶段
1. **读取 `STATE.md`** — 获取当前阶段和最近提交
2. **读取 `handoff.md`** — 如有跨会话任务
3. **加载上下文** — `/load-context` 涉及架构时

#### 工作阶段
| 场景 | 模式 | 操作 |
|------|------|------|
| 理解代码 | **Ask** | 只读探索 |
| 规划功能 | **Plan** | 生成计划 → 审核 → 执行 |
| 实现代码 | **Agent** | 多文件编辑、终端命令 |
| 调试问题 | **Debug** | 运行时分析 |

#### 结束阶段
1. **运行 `/update-state`** — 同步状态三件套
2. **归档知识** — `/archive-session` (重要里程碑)
3. **提交代码** — `git commit` (需确认)

### Agent 模式切换

```
Shift + Tab — 循环切换模式 (Ask → Plan → Agent → Debug)
```

### 常用命令

```
/load-context arch      → 加载架构文档
/load-context adr       → 加载所有 ADR
/review-hooks           → 分析 Hooks 配置
/paradigm-sync          → 同步模板更新
```

---

## 上下文三层架构

```
Layer 1 (自动加载)
├── AGENTS.md
├── .cursor/rules/ (Always Apply)
└── STATE.md

Layer 2 (按需加载)
├── docs/context/architecture.md
├── docs/context/constraints.md
└── docs/context/adr/*.md

Layer 3 (外部知识)
└── ~/Documents/PersonalKnowledge/ (通过 MCP)
```

---

## 安全与约束

### 自动拦截
- `rm -rf`, `sudo`, `chmod 777` — 高危命令
- `DROP TABLE`, `TRUNCATE` — 数据库危险操作
- Prompt 注入攻击模式

### 需确认操作
- `git commit`, `git push`
- 编辑 `.cursor/**` 配置文件
- 超出 `./src/**` 范围的编辑

### 永不提交
- `docs/private/**`
- `.cursor/notes/**`
- `.cursor/logs/**`
- `.env*` 密钥文件

---

## 配置说明

### MCP 服务器

默认配置（需设置环境变量）：

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${env:GITHUB_TOKEN}"
      }
    }
  }
}
```

### 本地覆盖

创建 `.cursor/settings.local.json` 和 `.cursor/mcp.local.json` 进行本地私有配置（不提交 Git）。

---

## 故障排除

### Hooks 不生效
```bash
# 检查权限
ls -la .cursor/hooks/*.sh
# 应显示 -rwxr-xr-x (755)

# 检查 jq 安装
which jq
```

### 命令不显示
```bash
# 检查文件位置
ls .cursor/commands/*.md
```

### Rules 不加载
```bash
# 检查 frontmatter 格式
head -5 .cursor/rules/*.mdc
```

---

## 更新与维护

### 同步模板更新

```
/paradigm-sync
```

### 检查 Hooks

```
/review-hooks
```

---

## 参考

- **行为规范**: `AGENTS.md`
- **状态看板**: `STATE.md`
- **迁移指南**: `docs/standards/migration-guide.md`
- **方案文档**: `docs/private/Cursor方案.md` (私有)

---

*CursorHarness Engineering — 结构化 AI 辅助开发范式*
*版本: V0.6 | 最后更新: 2026-05-03*

#!/bin/bash
# .cursor/hooks/knowledge-trigger.sh
# Tier 4 (T4) - 知识积累: preCompact
# 会话压缩前提示执行知识归档
# 退出码: 0 = 始终通过（仅提示，不阻断）

set -euo pipefail

# 读取 stdin
input=$(cat)

# 输出提示到 stderr（会被 Cursor 捕获并显示）
cat >&2 << 'EOF'

╔════════════════════════════════════════════════════════════╗
║  💡 知识归档提示                                            ║
║                                                            ║
║  会话即将被压缩，建议执行知识归档：                          ║
║                                                            ║
║  运行 /archive-session 提炼本次会话内容                      ║
║  或运行 /update-state 更新项目状态看板                       ║
╚════════════════════════════════════════════════════════════╝

EOF

exit 0

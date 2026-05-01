#!/bin/bash
# .cursor/hooks/log-failure.sh
# Tier 2 (T2) - 质量保障: postToolUseFailure
# 记录工具失败日志，用于后续分析
# 退出码: 0 = 始终通过

set -euo pipefail

# 读取 stdin
input=$(cat)

# 提取信息
tool_name=$(echo "$input" | jq -r '.tool_name // "unknown"')
error_message=$(echo "$input" | jq -r '.error_message // "unknown error"')
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# 日志目录
LOG_DIR=".cursor/logs"
LOG_FILE="$LOG_DIR/failure.log"

# 确保日志目录存在
mkdir -p "$LOG_DIR"

# 追加日志
cat >> "$LOG_FILE" << EOF
---
Timestamp: $timestamp
Tool: $tool_name
Error: $error_message
Input: $input

EOF

exit 0

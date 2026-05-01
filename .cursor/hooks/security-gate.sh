#!/bin/bash
# .cursor/hooks/security-gate.sh
# Tier 1 (T1) - 安全防护: PreToolUse / beforeShellExecution
# 拦截高危 Bash 命令，防止不可逆操作
# 退出码: 0 = 通过, 2 = 阻断

set -euo pipefail

# 读取 stdin 输入
input=$(cat)
command=$(echo "$input" | jq -r '.command // empty')

# 无命令时直接通过
if [ -z "$command" ]; then
  echo '{ "permission": "allow" }'
  exit 0
fi

# 高危命令模式匹配
DANGER_PATTERNS=(
  'rm\s+-[rRf]'           # 递归删除
  'rm\s+--recursive'
  'rm\s+-rf\s+/+'         # 删除根目录
  'DROP\s+TABLE'          # 删除数据库表
  'DROP\s+DATABASE'
  'TRUNCATE\s+TABLE'
  '>\s*/dev/sd'           # 直接写入磁盘
  'dd\s+if='
  'mkfs\.'                # 格式化文件系统
  'chmod\s+-R\s+777'       # 危险的权限修改
  'sudo\s+rm'
  ':\(\)\{\s*:\|:\s*\}&'  # fork bomb
  'curl.*\|\s*bash'       # 管道执行远程脚本
  'curl.*\|\s*sh'
  'wget.*\|\s*bash'
  'wget.*\|\s*sh'
)

for pattern in "${DANGER_PATTERNS[@]}"; do
  if echo "$command" | grep -qiE "$pattern"; then
    echo "{"
    echo '  "permission": "deny",'
    echo '  "user_message": "[安全门拦截] 检测到高危命令，已阻断执行。如需执行，请使用受控脚本或联系项目负责人。",'
    echo '  "agent_message": "Security gate blocked dangerous command: '"$command"'"'
    echo "}"
    exit 2
  fi
done

# 低风险命令，允许执行
echo '{ "permission": "allow" }'
exit 0

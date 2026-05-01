#!/bin/bash
# .cursor/hooks/prompt-guard.sh
# Tier 1 (T1) - 安全防护: beforeSubmitPrompt
# 检测 Prompt 注入攻击模式
# 退出码: 0 = 通过, 2 = 阻断

set -euo pipefail

# 读取 stdin 输入
input=$(cat)
prompt=$(echo "$input" | jq -r '.prompt // empty')

# 无 prompt 时直接通过
if [ -z "$prompt" ]; then
  exit 0
fi

# Prompt 注入攻击模式
INJECTION_PATTERNS=(
  'ignore\s+(previous|above|earlier)\s+instructions'
  'disregard\s+(your|all)\s+(rules|instructions)'
  'bypass\s+(security|restrictions|filters)'
  'jailbreak'
  'DAN\s+mode'
  'you\s+are\s+now\s+in\s+developer\s+mode'
  'system\s*:\s*you\s*are'
  '\[system\s*\(admin\)\]'
  'new\s+persona\s*:.*unfiltered'
)

for pattern in "${INJECTION_PATTERNS[@]}"; do
  if echo "$prompt" | grep -qiE "$pattern"; then
    echo "Prompt Guard: 检测到潜在的注入攻击模式" >&2
    exit 2
  fi
done

exit 0

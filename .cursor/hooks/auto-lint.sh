#!/bin/bash
# .cursor/hooks/auto-lint.sh
# Tier 2 (T2) - 质量保障: afterFileEdit
# 文件编辑后自动运行对应语言的 Linter
# 退出码: 0 = 始终通过（不阻断，仅报告）

set -euo pipefail

# 读取 stdin 获取文件路径
input=$(cat)
file_path=$(echo "$input" | jq -r '.file_path // empty')

# 无文件路径时跳过
if [ -z "$file_path" ]; then
  exit 0
fi

# 获取文件扩展名
extension="${file_path##*.}"

# 根据文件类型运行对应的 linter
case "$extension" in
  py)
    if command -v ruff &> /dev/null; then
      ruff check "$file_path" || true
    elif command -v flake8 &> /dev/null; then
      flake8 "$file_path" || true
    fi
    ;;
  
  js|jsx|ts|tsx)
    # 检查项目是否有 ESLint 配置
    if [ -f "eslint.config.js" ] || [ -f ".eslintrc.json" ] || [ -f ".eslintrc.js" ]; then
      if command -v npx &> /dev/null; then
        npx eslint "$file_path" --fix || true
      fi
    fi
    
    # 运行 Prettier（如果配置存在）
    if [ -f ".prettierrc" ] || [ -f ".prettierrc.json" ]; then
      if command -v npx &> /dev/null; then
        npx prettier --write "$file_path" || true
      fi
    fi
    ;;
  
  go)
    if command -v gofmt &> /dev/null; then
      gofmt -w "$file_path" || true
    fi
    if command -v golint &> /dev/null; then
      golint "$file_path" || true
    fi
    ;;
  
  rs)
    if command -v rustfmt &> /dev/null; then
      rustfmt "$file_path" || true
    fi
    ;;
  
  sh|bash)
    if command -v shellcheck &> /dev/null; then
      shellcheck "$file_path" || true
    fi
    ;;
  
  md|markdown)
    if command -v markdownlint &> /dev/null; then
      markdownlint --fix "$file_path" || true
    fi
    ;;
esac

exit 0

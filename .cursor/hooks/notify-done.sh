#!/bin/bash
# .cursor/hooks/notify-done.sh
# Tier 3 (T3) - 体验提升: stop
# 会话结束时发送桌面通知
# 退出码: 0 = 始终通过

set -euo pipefail

# 读取 stdin 获取停止原因
input=$(cat)
stop_reason=$(echo "$input" | jq -r '.stop_reason // "completed"')

# macOS 桌面通知
if command -v osascript &> /dev/null; then
  case "$stop_reason" in
    "completed")
      osascript -e 'display notification "任务已完成" with title "Cursor Agent"'
      ;;
    "error")
      osascript -e 'display notification "任务执行出错" with title "Cursor Agent" sound name "Basso"'
      ;;
    "cancelled")
      osascript -e 'display notification "任务已取消" with title "Cursor Agent"'
      ;;
    *)
      osascript -e "display notification \"Agent stopped: $stop_reason\" with title \"Cursor Agent\""
      ;;
  esac
fi

# Linux (dbus-send)
if command -v dbus-send &> /dev/null; then
  dbus-send --system --type=method_call --dest=org.freedesktop.Notifications \
    /org/freedesktop/Notifications org.freedesktop.Notifications.Notify \
    string:"Cursor Agent" uint32:0 string:"" \
    string:"Cursor Agent" string:"Task $stop_reason" \
    array:string:"" dict:string:string:"" int32:5000 || true
fi

exit 0

#!/bin/bash
echo "📡 正在启动心做科技·本地资源巡检..."

# 1. 运行采集逻辑
./mini_claw.sh

# 2. 检查是否有新变动
if [[ -n $(git status -s index.html) ]]; then
    echo "✨ 检测到资源有更新，正在同步云端..."
    git add index.html
    git commit -m "Update: 资源内容已同步至最新官方状态"
    git push
    echo "✅ 汇报董事长：全线资产已更新并发布！"
else
    echo "🛌 官方暂无变动，无需同步。"
fi

#!/bin/bash
echo "🚀 启动心做科技‘全能版’影子采集器..."

# 定义采集任务清单 [名称|标签|描述|链接]
TASKS=(
    "Steam|平台|全球玩家都在用|https://s.team"
    "MT管理器|工具|安卓最强逆向文件管理工具|https://mt2.cn/"
    "OpenClaw官网|框架|全自动资源采集与发布核心|https://zxcvbnm-uc.github.io/xinzuo/"
    "GitHub|社区|全球最大的开源代码托管平台|https://github.com"
    "PUBG|游戏|最新 Patch Notes 实时监控中|https://www.pubg.com/en/news"
    "战争雷霆|游戏|实时同步最新版战报与更新|https://warthunder.com/en/news"
    "我的世界Java版|游戏|2026 正式版: 26.0 稳定版|https://www.minecraft.net/zh-hans/download"
    "国际基岩版|游戏|跨平台联机, 最新版本同步发布|https://www.minecraft.net/zh-hans/updates"
)

for task in "${TASKS[@]}"; do
    IFS="|" read -r name tag desc link <<< "$task"
    echo "📦 正在同步: $name"
    ./smart_publish.sh <<INPUT
$name
$tag
$desc
$link
INPUT
done

echo "🎊 汇报董事长：全线 8 大资产已正式录入，请求同步云端！"

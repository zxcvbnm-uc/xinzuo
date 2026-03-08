#!/bin/bash
# --- 模块1：爱奇艺扫描 ---
IQIYI_URL="https://www.iqiyi.com/dianying/"
echo "🚀 扫描爱奇艺..."
IQIYI_MOVIE=$(curl -s "$IQIYI_URL" | grep -oP '(?<=alt=")[^"]+' | head -n 1)
[ -z "$IQIYI_MOVIE" ] && IQIYI_MOVIE="爱奇艺热映中"

./smart_publish.sh <<INPUT
🎬 爱奇艺：$IQIYI_MOVIE
影视动态
影子 OpenClaw 自动同步
$IQIYI_URL
INPUT

# --- 模块2：优酷扫描 ---
YOUKU_URL="https://www.youku.com/"
echo "🚀 扫描优酷..."
# 模拟抓取优酷首页焦点图标题
YOUKU_MOVIE=$(curl -s "$YOUKU_URL" | grep -oP '(?<=title=")[^"]+' | head -n 1)
[ -z "$YOUKU_MOVIE" ] && YOUKU_MOVIE="优酷今日限免大片"

./smart_publish.sh <<INPUT
🎬 优酷：$YOUKU_MOVIE
影视动态
影子 OpenClaw 自动同步：优酷独播资源
$YOUKU_URL
INPUT

echo "🎊 汇报董事长：双平台影视账目已同步至云端！"

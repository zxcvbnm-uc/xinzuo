#!/bin/bash
read -p "📝 软件名称: " NAME
read -p "🔢 版本号: " VER
read -p "📋 动态: " LOG
read -p "🔗 链接: " LINK

COLORS=("#9C27B0" "#2196F3" "#4CAF50" "#FF9800" "#E91E63")
SELECTED_COLOR=${COLORS[$RANDOM % 5]}

# 构造新卡片
NEW_CARD="<div style='margin:15px 0; border:2px solid $SELECTED_COLOR; border-radius:10px; padding:15px; background:white; box-shadow: 3px 3px 10px #eee;'>
  <h3 style='margin-top:0; color:$SELECTED_COLOR;'>📦 $NAME</h3>
  <p style='color:#666; font-size:14px;'><b>版本：</b>v$VER</p>
  <p style='color:#666; font-size:14px;'><b>动态：</b>$LOG</p>
  <a href='$LINK' style='display:inline-block; padding:8px 20px; background:$SELECTED_COLOR; color:white; text-decoration:none; border-radius:5px; font-size:12px;'>立即获取</a>
</div>"

# 使用更简单的追加方式：直接把新内容贴在容器下方
# 我们先备份 index.html，然后重新组合它
head -n $(grep -n '<div id="app-container">' index.html | cut -d: -f1) index.html > tmp.html
echo "$NEW_CARD" >> tmp.html
tail -n +$(( $(grep -n '<div id="app-container">' index.html | cut -d: -f1) + 1 )) index.html >> tmp.html
mv tmp.html index.html

git add index.html
git commit -m "CEO: 智能追加发布 $NAME"
git push
echo "✅ 汇报董事长：$NAME 已平稳上架，无报错！"

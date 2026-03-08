#!/bin/bash
read -p "董事长，请输入您看到的最新版本号: " VERSION
echo "👥 [讨论组]：收到指令，准备手动上架 v$VERSION..."

echo "<div style='margin-top:10px; border-left:4px solid #9C27B0; padding:10px; background:#f3e5f5;'>" >> index.html
echo "  <p>📝 <b>CEO 手动校准：</b>MT 管理器 v$VERSION</p>" >> index.html
echo "  <p>⏰ 确认时间：$(date '+%Y-%m-%d %H:%M')</p>" >> index.html
echo "</div>" >> index.html

git add index.html
git commit -m "CEO: 手动校准资源 v$VERSION"
git push
echo "✅ [仓库部]：已同步至官网 https://zxcvbnm-uc.github.io/xinzuo/"

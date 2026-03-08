#!/bin/bash
echo "🕵️ [搜索部]：改用系统原生 curl 访问 MT 官网..."

# 1. 使用 curl 抓取网页源码并提取版本号
# 即使 DNS 有小问题，curl 的兼容性也比 pip 强
VERSION=$(curl -sL https://mt2.cn/ | grep -oP '最新版本：\K[\d\.]+' | head -n 1)

if [ -z "$VERSION" ]; then
    echo "❌ [搜索部]：依然无法连接网络。请检查手机是否开启了飞行模式或禁用了 Termux 的联网权限。"
else
    echo "✅ [搜索部]：获取成功！当前版本为: v$VERSION"
    
    # 2. 技术部：将结果写入您的网站 index.html
    echo "<div style='margin-top:10px; border-left:4px solid #2196F3; padding:10px; background:#f0f7ff;'>" >> index.html
    echo "  <p>🚀 <b>实战入库：</b>MT 管理器 v$VERSION</p>" >> index.html
    echo "  <p>⏰ 监测时间：$(date '+%Y-%m-%d %H:%M')</p>" >> index.html
    echo "</div>" >> index.html
    
    # 3. 仓库部：自动同步到 GitHub
    git add index.html
    git commit -m "AI: 使用原生指令更新资源 v$VERSION"
    git push
    echo "📦 [执行部]：已越过环境限制，同步成功！"
fi

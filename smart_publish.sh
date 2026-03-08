#!/bin/bash
# 心做科技·直达发布引擎 v1.5

# 1. 采集输入信息
read -p "请输入资源名称: " NAME
read -p "请输入标签(如 游戏/工具): " TAG
read -p "请输入简短描述: " DESC
read -p "请输入官方跳转链接: " LINK

# 2. 构造具备直达能力的正式卡片模板
NEW_CARD="
            <div class=\"resource-card\">
                <div class=\"tag tag-soft\">$TAG</div>
                <h3>$NAME</h3>
                <p>$DESC</p>
                <a href=\"$LINK\" target=\"_blank\" class=\"btn-download\">直接访问官网</a>
            </div>"

# 3. 将新卡片精准插入到列表顶端
sed -i "/<main id=\"resource-list\">/a $NEW_CARD" index.html

echo "✅ 汇报董事长：$NAME 已完成‘直达协议’对接，准备同步云端！"

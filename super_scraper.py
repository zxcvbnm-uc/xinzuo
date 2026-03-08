import requests
import re
import os

def get_latest_mt():
    print("🕵️ [搜索部]：正在前往 MT 管理器官网 (mt2.cn) 寻找情报...")
    url = "https://mt2.cn/"
    headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"}
    
    try:
        res = requests.get(url, headers=headers, timeout=10)
        res.encoding = 'utf-8'
        # 使用正则抓取版本号，例如 "最新版本：2.16.2"
        version = re.search(r'最新版本：([\d\.]+)', res.text).group(1)
        print(f"✅ [搜索部]：成功！当前官网最新版本为: v{version}")
        return version
    except Exception as e:
        print(f"❌ [搜索部]：抓取失败，原因: {e}")
        return None

def update_site(version):
    print("👥 [讨论组]：正在对比数据并更新官网...")
    content = f"""
<div style='margin-top:20px; border-left: 5px solid #FF9800; padding: 15px; background: #fff3e0;'>
  <h3 style='color: #ef6c00;'>🚀 实战成果：MT 管理器 v{version}</h3>
  <p><b>状态：</b>由心做 AI 自动化监测上架</p>
  <p><a href='https://mt2.cn/' target='_blank'>[点击前往官网获取]</a></p>
</div>
"""
    with open("index.html", "a", encoding="utf-8") as f:
        f.write(content)
    
    # 仓库部自动推送
    os.system("git add . && git commit -m 'AI: 自动实战上架 MT v" + version + "' && git push")
    print("📦 [执行部]：同步成功，董事长可刷新官网查看。")

if __name__ == "__main__":
    version = get_latest_mt()
    if version:
        update_site(version)

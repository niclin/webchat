## 實作WebChat


### 規格
功能：

* 用户可以注册、登录。需要 id（可以自己决定 email 或者 username）和 password
* 用户登录后，进入联系人列表页面
- 可以看到自己所有的联系人
- 每个联系人需要显示对方 id 以及未读私信数量提醒
- 用户可以通过 id 添加新联系人（可以不需要对方同意）
- 用户可以删除某个联系人，但保留与对方用户的消息等数据。当再次添加新联系人时，消息等数据都还在
* 点击一个联系人会进入聊天界面，同时未读消息置为 0
- 可以看到和某个用户的历史消息
- 能够在这里收发私信（不需要实时，可以刷一下页面才看到新消息）
- 当用户 A 发私信给用户 B 时，如果 A 还不是 B 的联系人，应该自动把 A 添加为 B 的联系人，并能够在 B 的联系人列表正常显示（不需要实时）
- 用户可以删除自己发的消息

加分项：

* 联系人列表页面未读消息数实时更新
* 聊天界面新消息实时接收
* 自动把 A 添加为 B 联系人时，B 实时更新联系人列表
* 部署，可在线演示


### 設計思路

初步的構想先在紙上畫出來，大致上構思如下：

![](https://drops.azureedge.net/drops/files/acc_511160/1kiEq?rscd=inline%3B%20filename%3Dimage%252Fpng&rsct=image%2Fpng&se=2016-09-29T02%3A02%3A03Z&sig=mGO0qLePi5JQgpsflNpw2%2BbBneq1RaLr%2FyiB%2FUixk0A%3D&sp=r&sr=b&st=2016-09-29T01%3A02%3A03Z&sv=2013-08-15)

![](https://drops.azureedge.net/drops/files/acc_511160/16btk?rscd=inline%3B%20filename%3Dimage%252Fpng&rsct=image%2Fpng&se=2016-09-29T02%3A02%3A50Z&sig=oQ0TurtcStDyLEwROP2n6M4GApz3JvETVSoeWoR4B3E%3D&sp=r&sr=b&st=2016-09-29T01%3A02%3A50Z&sv=2013-08-15)

接下來在實作項目我用Redmine進行自我進度管理，目標是兩天內完成。

將基本項目以及加分項目分開管理。

![](https://drops.azureedge.net/drops/files/acc_511160/9JMz?rscd=inline%3B%20filename%3Dimage%252Fpng&rsct=image%2Fpng&se=2016-09-29T02%3A04%3A32Z&sig=YlQw%2F533rYpYHxOgQ4x6eIMNFS6l50D%2BxmHbuUI2amQ%3D&sp=r&sr=b&st=2016-09-29T01%3A04%3A32Z&sv=2013-08-15)

![](https://drops.azureedge.net/drops/files/acc_511160/VRo0?rscd=inline%3B%20filename%3Dimage%252Fpng&rsct=image%2Fpng&se=2016-09-29T02%3A06%3A07Z&sig=vm1BPFiCcTsXtf7RtOb1UlKLJtTGAD5YPVvi7Hx2QhA%3D&sp=r&sr=b&st=2016-09-29T01%3A06%3A07Z&sv=2013-08-15)

### 實作

在初步的規劃完成之後，就是開始動手實作，原先打算用Rails 5的ActionCable來完成實時更新，但因為對這項實作熟練度不高，在評估之下還是使用Rails 4來進行整體的框架。

部屬部分，為了增加其他項目的可用時間，就不打算使用AWS這類的IaaS來進行Deploy，在評估過後選擇使用Heroku來部屬這次的Project。


### 未解決的困難

在基本項目完成後，接著打算使用websocket來實作實時更新，來達到real-time的效果。

這邊使用的是faye gem實作，在Local端運行正常，演示如下：

![](https://drops.azureedge.net/drops/files/acc_511160/120kE?rscd=inline%3B%20filename%3Dimage%252Fgif&rsct=image%2Fgif&se=2016-09-29T02%3A16%3A37Z&sig=4Zy0oiXTWnhTceNe%2BP3OEqAEFwilNLy2JBjmfckAtc0%3D&sp=r&sr=b&st=2016-09-29T01%3A16%3A37Z&sv=2013-08-15)

但到了server端websocket部分失效，搜尋了一下問題，發現在Heroku上面容易遇到socket部屬不易的問題，由於時間有限，在整體評估下打算以Minimum Viable Product進行交付。


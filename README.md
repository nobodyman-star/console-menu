# console-menu

 console-menu  是自定义Shell菜单脚本，放在  /usr/sbin/console-menu ，不是系统自带程序。
 
✅ 核心作用
 
1. 接管系统控制台终端（串口/HDMI本地终端）
通过修改  /etc/inittab ，把默认的OpenWrt ash命令行替换成这个菜单。
- 飞牛虚拟机VNC控制台、物理机HDMI串口：开机停在终端，按Enter进入console-menu菜单
- SSH登录：直接自动进入这个菜单。
  
2. 菜单提供路由器状态可视化 + 一键管理功能
- 实时显示：主机名、CPU使用率、内存、并发连接数、在线客户端数量。
- 自动识别工作模式：NAT Mode / Bypass Mode（旁路模式）。
- 查看网卡IP、进程、在线设备。
  
3.  一键操作：
- 设置LAN静态IP / DHCP
- 开启/关闭LAN的DNSMASQ DHCP服务
- 查看网络接口、路由、进程列表
- 在线客户端监控
- 按需进入原生ash shell（q选项）
  
📌 工作原理

1. 插件编译进固件，脚本部署到  /usr/sbin/console-menu。
2. uci-defaults脚本在固件第一次开机，修改  /etc/inittab。
将 tty1/hvc0/ttyS0 控制台的启动程序，替换为  /usr/sbin/console-menu。
3. inittab的 askfirst 含义：终端就绪后，等待用户按下回车，才启动console-menu。

 
适用场景
 
ImmortalWrt x86（虚拟机/物理机软路由），不需要记住大量uci命令，串口/HDMI控制台可视化一键管理软路由1.设定LAN静态IP或者DHCP；2.开启或者关闭DHCPservice等。
 
补充
退出菜单回到原生shell：菜单按 q ；退出shell返回菜单，输入 exit 回车。

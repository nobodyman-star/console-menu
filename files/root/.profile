# /root/.profile
# SSH交互式直接拉起菜单；非交互式scp/ssh命令不会触发
if [ -t 0 ] && [ -z "$CONSOLE_MENU_ACTIVE" ] && [ -x /usr/sbin/console-menu ]; then
    export CONSOLE_MENU_ACTIVE=1
    /usr/sbin/console-menu
fi

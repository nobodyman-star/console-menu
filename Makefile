include $(TOPDIR)/rules.mk

PKG_NAME:=console-menu
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_MAINTAINER:=Your Name <you@example.com>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/console-menu
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Custom console menu for ImmortalWrt
  DEPENDS:=+libc
endef

define Package/console-menu/description
 Custom console menu:
   - hvc0(VNC),tty1(HDMI),ttyS0: askfirst press enter to launch menu
   - SSH interactive login directly launch menu
   Use uci‑defaults to patch /etc/inittab, DO NOT overwrite inittab statically.
endef

define Build/Compile
# pure shell scripts,no compile
endef

define Package/console-menu/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/root
	$(INSTALL_DIR) $(1)/usr/sbin

	$(INSTALL_BIN) ./files/etc/uci-defaults/99_console_menu_init $(1)/etc/uci-defaults/99_console_menu_init
	$(INSTALL_DATA) ./files/root/.profile $(1)/root/.profile
	$(INSTALL_BIN) ./files/usr/sbin/console-menu $(1)/usr/sbin/console-menu
endef

$(eval $(call BuildPackage,console-menu))

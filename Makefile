# [K] (C)2020
# http://github.com/kongfl888

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-minieap
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_DATE:=20201008

PKG_MAINTAINER:=kongfl888 <kongfl888@outlook.com>
PKG_LICENSE:=GPL-3.0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=LuCI for minieap 802.1X Client
  PKGARCH:=all
  DEPENDS:=+luci
endef

define Package/$(PKG_NAME)/description
	LuCI for minieap 802.1X Client
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/config
	cp ./root/etc/config/minieap $(1)/etc/config/minieap

	$(INSTALL_DIR) $(1)/etc/init.d
	cp ./root/etc/init.d/minieap $(1)/etc/init.d/minieap

	$(INSTALL_DIR) $(1)/usr
	cp -pR ./root/usr/* $(1)/usr/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	cp -pR ./luasrc/* $(1)/usr/lib/lua/luci/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./po/zh-cn/minieap1.po $(1)/usr/lib/lua/luci/i18n/minieap1.zh-cn.lmo
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
    chmod a+x $${IPKG_INSTROOT}/etc/init.d/minieap >/dev/null 2>&1
    chmod a+x $${IPKG_INSTROOT}/usr/sbin/minieap-conver >/dev/null 2>&1
    chmod a+x $${IPKG_INSTROOT}/usr/sbin/minieap-conver >/dev/null 2>&1
    exit 0
endef

define Package/$(PKG_NAME)/postrm
#!/bin/sh
    rm -rf /tmp/luci-modulecache/ >/dev/null 2>&1 || echo ""
    rm -f /tmp/luci-indexcache* >/dev/null 2>&1 || echo ""
    exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))

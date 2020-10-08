# OpenWrt/LEDE LuCI for minieap


**！锐捷服务名为中文时无法使用，请等待自定义配置文件功能启用！**

## 简介

[luci-app-minieap](https://github.com/kongfl888/luci-app-minieap) fork自 [BoringCat](https://github.com/BoringCat/luci-app-miniea)

本软件包是 minieap 的 LuCI界面

## 依赖

 | 可执行文件 | 可选 | 功能            |
 | ---------- | ---- | --------------- |
 | `minieap`  | 否   | 进行802.11x验证 |

可用项目：[kongfl888/openwrt-minieap](https://github.com/kongfl888/openwrt-minieap)

## 配置

软件包的配置文件路径: `/etc/config/minieap`  
执行时会将配置文件转换为minieap能识别的文件并置于 `/etc/minieap.conf.d/minieap.conf.utf8`， 创建软连接到 `/etc/minieap.conf`  
允许用户上传自定义配置文件，当存在多种文件编码的配置文件时，配置文件位于 `/etc/minieap.conf.d/`，根据用户选择的调整软连接

## 帮助

[MiniEAP 帮助](https://github.com/updateing/minieap/blob/master/README.md)

## 编译

```
git clone https://github.com/kongfl888/luci-app-minieap.git

cp -rf luci-app-minieap openwrt/package && cd openwrt
make menuconfig
make package/luci-app-minieap/compile V=s
```

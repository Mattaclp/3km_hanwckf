sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang

git clone https://github.com/xiaorouji/openwrt-passwall.git
cp -r openwrt-passwall/luci-app-passwall package/
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git
cp -r openwrt-passwall-packages package/
git clone https://github.com/Mattaclp/luci-app-openclash.git
cp -r luci-app-openclash package/

git clone https://github.com/fw876/helloworld.git
cp -r helloworld package/

rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/packages/net/chinadns-ng
rm -rf feeds/packages/net/dns2socks
rm -rf feeds/packages/net/dns2tcp
rm -rf feeds/packages/net/dnsproxy
rm -rf feeds/packages/lang/lua-neturl
rm -rf feeds/luci/applications/luci-app-ssr-plus
rm -rf feeds/packages/net/mosdns
rm -rf feeds/packages/net/redsocks2
rm -rf feeds/packages/net/trojan
rm -rf feeds/packages/net/v2ray-core
rm -rf feeds/packages/net/v2raya
rm -rf feeds/packages/net/ipt2socks
rm -rf feeds/packages/net/microsocks
rm -rf feeds/packages/net/naiveproxy
rm -rf feeds/packages/net/hysteria
rm -rf feeds/packages/net/shadowsocks-libev
rm -rf feeds/packages/net/shadowsocks-rust
rm -rf feeds/packages/net/shadowsocksr-libev
rm -rf feeds/packages/net/simple-obfs
rm -rf feeds/packages/net/tcping
rm -rf feeds/packages/net/trojan-plus
rm -rf feeds/packages/net/tuic-client
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/packages/net/v2ray-plugin
rm -rf feeds/packages/net/xray-core
rm -rf feeds/packages/net/xray-plugin

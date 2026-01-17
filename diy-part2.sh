sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang

# replace gn version
rm -rf feeds/packages/devel/gn/Makefile
wget https://github.com/Mattaclp/NewLEDE/raw/refs/heads/main/gn/gnMakefile
mv gnMakefile feeds/packages/devel/gn/Makefile
rm -rf feeds/packages/devel/gn/src/out/last_commit_position.h
wget https://github.com/Mattaclp/NewLEDE/raw/refs/heads/main/gn/src/out/last_commit_position.h
mv last_commit_position.h feeds/packages/devel/gn/src/out/last_commit_position.h
rm -rf feeds/packages/devel/gn/patches

git clone https://github.com/xiaorouji/openwrt-passwall.git
cp -r openwrt-passwall/luci-app-passwall package/
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git
git clone https://github.com/Mattaclp/microsocks.git
rm -rf openwrt-passwall-packages/microsocks
cp -r microsocks openwrt-passwall-packages/
cp -r openwrt-passwall-packages package/

rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/packages/net/chinadns-ng
rm -rf feeds/packages/net/dns2socks
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

function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../
  cd .. && rm -rf $repodir
}

git_sparse_clone dev https://github.com/vernesong/OpenClash luci-app-openclash
cp -rf luci-app-openclash package

mkdir bin
mkdir bin/packages
cp -r package/luci-app-openclash bin/packages/
zip -r luci-app-openclash.zip bin/packages/luci-app-openclash
cp -r luci-app-openclash.zip bin/packages/luci-app-openclash.zip

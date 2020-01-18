# OpenWrt Image Builder config

Pre-configured for OpenWrt 19.07 on TP-LINK TL-WDR3600v1 ath79.

Includes `htop`, `adblock`, `banip`, `bcp38`, `openvpn`, `sqm`, `upnp`, `uhttpd` and `luci-ssl-openssl`.

## Getting started

1. Download the [ath79 Image Builder](https://downloads.openwrt.org/releases/19.07.0/targets/ath79/generic/openwrt-imagebuilder-19.07.0-ath79-generic.Linux-x86_64.tar.xz) and extract it
2. Copy the `/files` directory to the Image Builder directory

### Regular DNS (not recommended)

1. Delete `dhcp-tls`, `dhcp-https`, `https_dns_proxy` and `stubby` from the Image Builder `/files/etc/config` directory if needed
2. Run the following command from the Image Builder directory

```
make image PROFILE=tplink_tl-wdr3600-v1 PACKAGES="htop luci-app-adblock luci-app-banip luci-app-bcp38 luci-app-openvpn luci-app-sqm luci-app-uhttpd luci-app-upnp luci-ssl-openssl openssl-util" FILES=files/
```

### DNS over TLS with [stubby](https://github.com/getdnsapi/stubby)

1. Delete `dhcp-https` & `https_dns_proxy` from the Image Builder `/files/etc/config` directory if needed
2. Rename `dhcp-tls` to `dhcp` in the Image Builder `/files/etc/config` directory
3. Run the following command from the Image Builder directory

```
make image PROFILE=tplink_tl-wdr3600-v1 PACKAGES="dnsmasq-full htop luci-app-adblock luci-app-banip luci-app-bcp38 luci-app-openvpn luci-app-sqm luci-app-uhttpd luci-app-upnp luci-ssl-openssl openssl-util stubby -dnsmasq -odhcpd-ipv6only" FILES=files/
```

### DNS over HTTPS with [https_dns_proxy](https://github.com/aarond10/https_dns_proxy)

1. Delete `dhcp-tls` & `stubby` from the Image Builder `/files/etc/config` directory if needed
2. Rename `dhcp-https` to `dhcp` in the Image Builder `/files/etc/config` directory
3. Run the following command from the Image Builder directory

```
make image PROFILE=tplink_tl-wdr3600-v1 PACKAGES="dnsmasq-full htop luci-app-adblock luci-app-banip luci-app-bcp38 luci-app-https-dns-proxy luci-app-openvpn luci-app-sqm luci-app-uhttpd luci-app-upnp luci-ssl-openssl openssl-util -dnsmasq -odhcpd-ipv6only" FILES=files/
```

### Installing via sysupgrade

Transfer the `***-sysupgrade.bin` file from the Image Builder `/bin/targets/ath79/generic/` directory to the router

- via LuCi
  ```
  https://192.168.1.1/cgi-bin/luci/admin/system/flash
  ```
- via scp
  ```
  scp ***-sysupgrade.bin root@192.168.1.1:/tmp
  ```

## Acknowledgements

- Craig Andrews: [DNS Over TLS on OpenWrt 18.06 and 19.07](https://candrews.integralblue.com/2018/08/dns-over-tls-on-openwrt-18-06/)

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: net: drivers/net: Convert random_ether_addr to eth_random_addr
From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Message-Id: <dc3e8b7272240b2650f5ed55a6e2954a765a96de.camel@intel.com>
Date: Fri, 22 Jun 2018 14:30:43 -0700
To: Joe Perches <joe@perches.com>, Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Bryan Whitehead <bryan.whitehead@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Harish Patil <harish.patil@cavium.com>, Manish Chopra <manish.chopra@cavium.com>, Dept-GELinuxNICDev@cavium.com, Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>, Bert Kenward <bkenward@solarflare.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Wingman Kwok <w-kwok2@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Marek Lindner <mareklindner@neomailbox.ch>, Simon Wunderlich <sw@simonwunderlich.de>, Antonio Quartulli <a@unstable.cc>
Cc: Kalle Valo <kvalo@codeaurora.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, intel-wired-lan@lists.osuosl.org, linux-omap@vger.kernel.org, linux-ntb@googlegroups.com, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCAyMDE4LTA2LTIyIGF0IDEwOjUxIC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBy
YW5kb21fZXRoZXJfYWRkciBpcyBhICNkZWZpbmUgZm9yIGV0aF9yYW5kb21fYWRkciB3aGljaCBp
cwo+IGdlbmVyYWxseSBwcmVmZXJyZWQgaW4ga2VybmVsIGNvZGUgYnkgfjM6MQo+IAo+IENvbnZl
cnQgdGhlIHVzZXMgb2YgcmFuZG9tX2V0aGVyX2FkZHIgdG8gZW5hYmxlIHJlbW92aW5nIHRoZSAj
ZGVmaW5lCj4gCj4gTWlzY2VsbGFuZWE6Cj4gCj4gbyBDb252ZXJ0ICZ2Zm1hY1swXSB0byBlcXVp
dmFsZW50IHZmbWFjIGFuZCBhdm9pZCB1bm5lY2Vzc2FyeSBsaW5lCj4gd3JhcAo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+CgpBY2tlZC1ieTogSmVmZiBL
aXJzaGVyIDxqZWZmcmV5LnQua2lyc2hlckBpbnRlbC5jb20+CgpGb3IgaTQwZSBjaGFuZ2UKCj4g
LS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2Nhdml1bS9saXF1aWRpby9saW9fbWFpbi5jICAg
ICAgICAgIHwgNSArKy0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jb3J0aW5hL2dlbWluaS5j
ICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvaGlzaWxp
Y29uL2hpcDA0X2V0aC5jICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L2ludGVsL2k0MGUvaTQwZV9tYWluLmMgICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJz
L25ldC9ldGhlcm5ldC9taWNyb2NoaXAvbGFuNzQzeF9tYWluLmMgICAgICAgICAgICB8IDIgKy0K
PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcWxvZ2ljL3FsY25pYy9xbGNuaWNfc3Jpb3ZfY29tbW9u
LmMgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3F1YWxjb21tL3JtbmV0L3JtbmV0X3Zu
ZC5jICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zZmMvZWYxMF9zcmlv
di5jICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkv
Y3Bzdy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3RpL25ldGNwX2NvcmUuYyAgICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCj4gIGRy
aXZlcnMvbmV0L250Yl9uZXRkZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MiArLQo+ICBkcml2ZXJzL25ldC91c2IvbGFuNzh4eC5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDlrL2h3LmMgICAg
ICAgICAgICAgICAgICAgICAgfCAyICstCj4gIG5ldC9iYXRtYW4tYWR2L2JyaWRnZV9sb29wX2F2
b2lkYW5jZS5jICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAxNCBmaWxlcyBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkK

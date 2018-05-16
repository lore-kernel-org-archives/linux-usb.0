Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,v2,2/2] drivers: net: Remove device_node checks with of_mdiobus_register()
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-Id: <2a70eb7c-7fc9-8bf6-a06a-87b4901d66ae@synopsys.com>
Date: Wed, 16 May 2018 12:01:21 +0100
To: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Fugang Duan <fugang.duan@nxp.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Tobias Jordan <Tobias.Jordan@elektrobit.com>, Russell King <rmk+kernel@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>, Maxim Uvarov <muvarov@gmail.com>, Sekhar Nori <nsekhar@ti.com>, open list <linux-kernel@vger.kernel.org>, "open list:RENESAS ETHERNET DRIVERS" <linux-renesas-soc@vger.kernel.org>, "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gMTYtMDUtMjAxOCAwMDo1NiwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiBBIG51bWJlciBv
ZiBkcml2ZXJzIGhhdmUgdGhlIGZvbGxvd2luZyBwYXR0ZXJuOgo+Cj4gaWYgKG5wKQo+IAlvZl9t
ZGlvYnVzX3JlZ2lzdGVyKCkKPiBlbHNlCj4gCW1kaW9idXNfcmVnaXN0ZXIoKQo+Cj4gd2hpY2gg
dGhlIGltcGxlbWVudGF0aW9uIG9mIG9mX21kaW9idXNfcmVnaXN0ZXIoKSBub3cgdGFrZXMgY2Fy
ZSBvZi4KPiBSZW1vdmUgdGhhdCBwYXR0ZXJuIGluIGRyaXZlcnMgdGhhdCBzdHJpY3RseSBhZGhl
cmUgdG8gaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxp
QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZHNhL2JjbV9zZjIuYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICA4ICsrLS0tLS0tCj4gIGRyaXZlcnMvbmV0L2RzYS9tdjg4ZTZ4eHgv
Y2hpcC5jICAgICAgICAgICAgICAgICAgfCAgNSArLS0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5l
dC9jYWRlbmNlL21hY2JfbWFpbi5jICAgICAgICAgIHwgMTIgKysrLS0tLS0tLS0tCj4gIGRyaXZl
cnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9mZWNfbWFpbi5jICAgICAgICAgfCAgOCArKy0tLS0t
LQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9tYXJ2ZWxsL212bWRpby5jICAgICAgICAgICAgIHwg
IDUgKy0tLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9zaF9ldGguYyAgICAgICAg
ICAgICB8IDExICsrKy0tLS0tLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tZGlvLmMgfCAgNSArLS0tLQoKRm9yIHN0bW1hYzoKClJldmlld2VkLWJ5OiBK
b3NlIEFicmV1IDxqb2FicmV1QHN5bm9wc3lzLmNvbT4KClRoYW5rcyBhbmQgQmVzdCBSZWdhcmRz
LApKb3NlIE1pZ3VlbCBBYnJldQoKPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvdGkvZGF2aW5jaV9t
ZGlvLmMgICAgICAgICAgICB8ICA4ICsrKy0tLS0tCj4gIGRyaXZlcnMvbmV0L3BoeS9tZGlvLWdw
aW8uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArLS0tLS0KPiAgZHJpdmVycy9uZXQvcGh5
L21kaW8tbXNjYy1taWltLmMgICAgICAgICAgICAgICAgICB8ICA2ICstLS0tLQo+ICBkcml2ZXJz
L25ldC91c2IvbGFuNzh4eC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKystLS0tLQo+
ICAxMSBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA2MSBkZWxldGlvbnMoLSkKPgot
LS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2Ny
aWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2Vy
Lmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9y
Zy9tYWpvcmRvbW8taW5mby5odG1sCg==

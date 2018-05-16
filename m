Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,v2,2/2] drivers: net: Remove device_node checks with of_mdiobus_register()
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-Id: <f965090d-fd1c-9507-77f6-878e08dd2fb6@ti.com>
Date: Tue, 15 May 2018 19:01:28 -0500
To: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Fugang Duan <fugang.duan@nxp.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Tobias Jordan <Tobias.Jordan@elektrobit.com>, Russell King <rmk+kernel@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>, Maxim Uvarov <muvarov@gmail.com>, Sekhar Nori <nsekhar@ti.com>, open list <linux-kernel@vger.kernel.org>, "open list:RENESAS ETHERNET DRIVERS" <linux-renesas-soc@vger.kernel.org>, "open list:TI ETHERNET SWITCH DRIVER \(CPSW\)" <linux-omap@vger.kernel.org>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gMDUvMTUvMjAxOCAwNjo1NiBQTSwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiBBIG51bWJl
ciBvZiBkcml2ZXJzIGhhdmUgdGhlIGZvbGxvd2luZyBwYXR0ZXJuOgo+IAo+IGlmIChucCkKPiAJ
b2ZfbWRpb2J1c19yZWdpc3RlcigpCj4gZWxzZQo+IAltZGlvYnVzX3JlZ2lzdGVyKCkKPiAKPiB3
aGljaCB0aGUgaW1wbGVtZW50YXRpb24gb2Ygb2ZfbWRpb2J1c19yZWdpc3RlcigpIG5vdyB0YWtl
cyBjYXJlIG9mLgo+IFJlbW92ZSB0aGF0IHBhdHRlcm4gaW4gZHJpdmVycyB0aGF0IHN0cmljdGx5
IGFkaGVyZSB0byBpdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZh
aW5lbGxpQGdtYWlsLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbmV0L2RzYS9iY21fc2YyLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgOCArKy0tLS0tLQo+ICAgZHJpdmVycy9uZXQvZHNhL212
ODhlNnh4eC9jaGlwLmMgICAgICAgICAgICAgICAgICB8ICA1ICstLS0tCj4gICBkcml2ZXJzL25l
dC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jICAgICAgICAgIHwgMTIgKysrLS0tLS0tLS0t
Cj4gICBkcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZmVjX21haW4uYyAgICAgICAgIHwg
IDggKystLS0tLS0KPiAgIGRyaXZlcnMvbmV0L2V0aGVybmV0L21hcnZlbGwvbXZtZGlvLmMgICAg
ICAgICAgICAgfCAgNSArLS0tLQo+ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9zaF9l
dGguYyAgICAgICAgICAgICB8IDExICsrKy0tLS0tLS0tCj4gICBkcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWRpby5jIHwgIDUgKy0tLS0KPiAgIGRyaXZlcnMvbmV0
L2V0aGVybmV0L3RpL2RhdmluY2lfbWRpby5jICAgICAgICAgICAgfCAgOCArKystLS0tLQoKZm9y
IGRyaXZlcnMvbmV0L2V0aGVybmV0L3RpL2RhdmluY2lfbWRpby5jOgpSZXZpZXdlZC1ieTogR3J5
Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpLnN0cmFzaGtvQHRpLmNvbT4KCj4gICBkcml2ZXJzL25l
dC9waHkvbWRpby1ncGlvLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0tLS0tCj4gICBk
cml2ZXJzL25ldC9waHkvbWRpby1tc2NjLW1paW0uYyAgICAgICAgICAgICAgICAgIHwgIDYgKy0t
LS0tCj4gICBkcml2ZXJzL25ldC91c2IvbGFuNzh4eC5jICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDcgKystLS0tLQo+ICAgMTEgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNjEg
ZGVsZXRpb25zKC0pCg==

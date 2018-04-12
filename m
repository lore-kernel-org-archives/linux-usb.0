Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/4] lan78xx: Read initial EEE setting from Device Tree
From: Andrew Lunn <andrew@lunn.ch>
Message-Id: <20180412141630.GM28963@lunn.ch>
Date: Thu, 12 Apr 2018 16:16:30 +0200
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMTIsIDIwMTggYXQgMDI6NTU6MzRQTSArMDEwMCwgUGhpbCBFbHdlbGwgd3Jv
dGU6Cj4gQWRkIHR3byBuZXcgRGV2aWNlIFRyZWUgcHJvcGVydGllczoKPiAqIG1pY3JvY2hpcCxl
ZWUtZW5hYmxlZCAgLSBhIGJvb2xlYW4gdG8gZW5hYmxlIEVFRQo+ICogbWljcm9jaGlwLHR4LWxw
aS10aW1lciAtIHRpbWUgaW4gbWljcm9zZWNvbmRzIHRvIHdhaXQgYWZ0ZXIgVFggZ29lcwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGlkbGUgYmVmb3JlIGVudGVyaW5nIHRoZSBsb3cgcG93
ZXIgc3RhdGUKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAoZGVmYXVsdCA2MDApCgpIaSBQ
aGlsCgpUaGlzIGxvb2tzIHdyb25nLgoKV2hhdCBzaG91bGQgaGFwcGVuIGlzIHRoYXQgdGhlIE1B
QyBkcml2ZXIgY2FsbHMgcGh5X2luaXRfZWVlKCkgdG8gZmluZApvdXQgaWYgdGhlIFBIWSBzdXBw
b3J0cyBFRUUuIFRoZXJlIHNob3VsZCBiZSBubyBuZWVkIHRvIGxvb2sgaW4gZGV2aWNlCnRyZWUu
CgoJQW5kcmV3Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGlu
ZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/4] lan78xx: Read MAC address from DT if present
From: Phil Elwell <phil@raspberrypi.org>
Message-Id: <4f95f1bc-412f-6926-0a61-f00e3abe7ecf@raspberrypi.org>
Date: Thu, 12 Apr 2018 15:18:43 +0100
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGkgQW5kcmV3LAoKT24gMTIvMDQvMjAxOCAxNTowNiwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gSGkg
UGhpbAo+IAo+PiAtCQkJcmV0ID0gbGFuNzh4eF93cml0ZV9yZWcoZGV2LCBSWF9BRERSTCwgYWRk
cl9sbyk7Cj4+IC0JCQlyZXQgPSBsYW43OHh4X3dyaXRlX3JlZyhkZXYsIFJYX0FERFJILCBhZGRy
X2hpKTsKPj4gKwkJbWFjX2FkZHIgPSBvZl9nZXRfbWFjX2FkZHJlc3MoZGV2LT51ZGV2LT5kZXYu
b2Zfbm9kZSk7Cj4gCj4gSXQgbWlnaHQgYmUgYmV0dGVyIHRvIHVzZSB0aGUgaGlnaGVyIGxldmVs
IGV0aF9wbGF0Zm9ybV9nZXRfbWFjX2FkZHJlc3MoKS4KCk9LIC0gSSdsbCB0YWtlIHlvdXIgd29y
ZCBmb3IgaXQuCgpQaGlsCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0
aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2Ug
dG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRw
Oi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

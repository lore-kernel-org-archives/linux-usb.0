Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,v2,1/2] of: mdio: Fall back to mdiobus_register() with NULL device_node
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180515235619.27773-2-f.fainelli@gmail.com>
Date: Tue, 15 May 2018 16:56:18 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Fugang Duan <fugang.duan@nxp.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Tobias Jordan <Tobias.Jordan@elektrobit.com>, Russell King <rmk+kernel@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>, Maxim Uvarov <muvarov@gmail.com>, Sekhar Nori <nsekhar@ti.com>, open list <linux-kernel@vger.kernel.org>, "open list:RENESAS ETHERNET DRIVERS" <linux-renesas-soc@vger.kernel.org>, "open list:TI ETHERNET SWITCH DRIVER CPSW" <linux-omap@vger.kernel.org>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE" <devicetree@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

V2hlbiB0aGUgZGV2aWNlX25vZGUgc3BlY2lmaWVkIGlzIE5VTEwsIGZhbGwgYmFjayB0byBtZGlv
YnVzX3JlZ2lzdGVyKCkuCldlIGhhdmUgYSBudW1iZXIgb2YgZHJpdmVycyBoYXZpbmcgYSBzaW1p
bGFyIHBhdHRlcm4gd2hpY2ggaXM6CgppZiAobnApCglvZl9tZGlvYnVzX3JlZ2lzdGVyKCkKZWxz
ZQoJbWRpb2J1c19yZWdpc3RlcigpCgpzbyBpbmNvcnBvcmF0ZSB0aGF0IGJlaGF2aW9yIHdpdGhp
biB0aGUgY29yZSBvZl9tZGlvYnVzX3JlZ2lzdGVyKCkKZnVuY3Rpb24uIFRoaXMgaXMgYWxzbyBj
b25zaXN0ZW50IHdpdGggdGhlIHN0dWIgdmVyc2lvbiB0aGF0IHdlIGRlZmluZWQKd2hlbiBDT05G
SUdfT0Y9bi4KClNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvb2Yvb2ZfbWRpby5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL29mL29mX21kaW8uYyBiL2Ry
aXZlcnMvb2Yvb2ZfbWRpby5jCmluZGV4IDhjMGM5MjcxMmZjOS4uZDk2M2JhZjhlNTNhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL29mL29mX21kaW8uYworKysgYi9kcml2ZXJzL29mL29mX21kaW8uYwpA
QCAtMjA0LDYgKzIwNCw5IEBAIGludCBvZl9tZGlvYnVzX3JlZ2lzdGVyKHN0cnVjdCBtaWlfYnVz
ICptZGlvLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogCWJvb2wgc2NhbnBoeXMgPSBmYWxzZTsK
IAlpbnQgYWRkciwgcmM7CiAKKwlpZiAoIW5wKQorCQlyZXR1cm4gbWRpb2J1c19yZWdpc3Rlciht
ZGlvKTsKKwogCS8qIERvIG5vdCBjb250aW51ZSBpZiB0aGUgbm9kZSBpcyBkaXNhYmxlZCAqLwog
CWlmICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShucCkpCiAJCXJldHVybiAtRU5PREVWOwo=

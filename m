Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,1/2] of: mdio: Fall back to mdiobus_register() with np is NULL
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180515215930.12115-2-f.fainelli@gmail.com>
Date: Tue, 15 May 2018 14:59:29 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, Fugang Duan <fugang.duan@nxp.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Tobias Jordan <Tobias.Jordan@elektrobit.com>, Russell King <rmk+kernel@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>, Maxim Uvarov <muvarov@gmail.com>, Sekhar Nori <nsekhar@ti.com>, open list <linux-kernel@vger.kernel.org>, "open list:RENESAS ETHERNET DRIVERS" <linux-renesas-soc@vger.kernel.org>, "open list:TI ETHERNET SWITCH DRIVER CPSW" <linux-omap@vger.kernel.org>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE" <devicetree@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

V2hlbiB0aGUgRGV2aWNlIFRyZWUgbm9kZSBzcGVjaWZpZWQgaXMgTlVMTCwgZmFsbCBiYWNrIHRv
Cm1kaW9idXNfcmVnaXN0ZXIoKS4gV2UgaGF2ZSBhIG51bWJlciBvZiBkcml2ZXJzIGhhdmluZyBh
IHNpbWlsYXIgcGF0dGVybgp3aGljaCBpczoKCmlmIChucCkKCW9mX21kaW9idXNfcmVnaXN0ZXIo
KQplbHNlCgltZGlvYnVzX3JlZ2lzdGVyKCkKCnNvIGluY29ycG9yYXRlIHRoYXQgYmVoYXZpb3Ig
d2l0aGluIHRoZSBjb3JlIG9mX21kaW9idXNfcmVnaXN0ZXIoKQpmdW5jdGlvbi4gVGhpcyBpcyBh
bHNvIGNvbnNpc3RlbnQgd2l0aCB0aGUgc3R1YiB2ZXJzaW9uIHRoYXQgd2UgZGVmaW5lZAp3aGVu
IENPTkZJR19PRj1uLgoKU2lnbmVkLW9mZi1ieTogRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxs
aUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9vZi9vZl9tZGlvLmMgfCA2ICsrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2Yvb2ZfbWRp
by5jIGIvZHJpdmVycy9vZi9vZl9tZGlvLmMKaW5kZXggOGMwYzkyNzEyZmM5Li4yMzQxZGJmNjc1
YmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvb2Yvb2ZfbWRpby5jCisrKyBiL2RyaXZlcnMvb2Yvb2Zf
bWRpby5jCkBAIC0yMDQsNiArMjA0LDEyIEBAIGludCBvZl9tZGlvYnVzX3JlZ2lzdGVyKHN0cnVj
dCBtaWlfYnVzICptZGlvLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogCWJvb2wgc2NhbnBoeXMg
PSBmYWxzZTsKIAlpbnQgYWRkciwgcmM7CiAKKwkvKiBJZiB0aGUgRGV2aWNlIFRyZWUgbm9kZSBk
b2VzIG5vdCBleGlzdCwgZmFsbCBiYWNrIHRvIHRyYWRpdGlvbmFsCisJICogcmVnaXN0cmF0aW9u
CisJICovCisJaWYgKCFucCkKKwkJcmV0dXJuIG1kaW9idXNfcmVnaXN0ZXIobWRpbyk7CisKIAkv
KiBEbyBub3QgY29udGludWUgaWYgdGhlIG5vZGUgaXMgZGlzYWJsZWQgKi8KIAlpZiAoIW9mX2Rl
dmljZV9pc19hdmFpbGFibGUobnApKQogCQlyZXR1cm4gLUVOT0RFVjsK

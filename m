Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/4,next] net: lan78xx: Drop unnecessary strcpy in lan78xx_probe
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-Id: <1535994759-8938-3-git-send-email-stefan.wahren@i2se.com>
Date: Mon,  3 Sep 2018 19:12:37 +0200
To: Woojung Huh <woojung.huh@microchip.com>
Cc: Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhpcyBzdHJjcHkgYmVjYXVzZSBhbGxvY19ldGhlcmRldigp
IGFscmVhZHkKZG9lcyB0aGlzIGpvYi4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBXYWhyZW4gPHN0
ZWZhbi53YWhyZW5AaTJzZS5jb20+Ci0tLQogZHJpdmVycy9uZXQvdXNiL2xhbjc4eHguYyB8IDEg
LQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC91c2IvbGFuNzh4eC5jIGIvZHJpdmVycy9uZXQvdXNiL2xhbjc4eHguYwppbmRleCAzZjcwYjk0
Li4zZDUwNWMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC91c2IvbGFuNzh4eC5jCisrKyBiL2Ry
aXZlcnMvbmV0L3VzYi9sYW43OHh4LmMKQEAgLTM3NjYsNyArMzc2Niw2IEBAIHN0YXRpYyBpbnQg
bGFuNzh4eF9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAlyZXQgPSBsYW43OHh4
X2JpbmQoZGV2LCBpbnRmKTsKIAlpZiAocmV0IDwgMCkKIAkJZ290byBvdXQyOwotCXN0cmNweShu
ZXRkZXYtPm5hbWUsICJldGglZCIpOwogCiAJaWYgKG5ldGRldi0+bXR1ID4gKGRldi0+aGFyZF9t
dHUgLSBuZXRkZXYtPmhhcmRfaGVhZGVyX2xlbikpCiAJCW5ldGRldi0+bXR1ID0gZGV2LT5oYXJk
X210dSAtIG5ldGRldi0+aGFyZF9oZWFkZXJfbGVuOwo=

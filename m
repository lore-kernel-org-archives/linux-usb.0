Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2,2/4,next] net: lan78xx: Drop unnecessary strcpy in lan78xx_probe
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-Id: <1536082152-3669-3-git-send-email-stefan.wahren@i2se.com>
Date: Tue,  4 Sep 2018 19:29:10 +0200
To: Woojung Huh <woojung.huh@microchip.com>
Cc: Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlcmUgaXMgbm8gbmVlZCBmb3IgdGhpcyBzdHJjcHkgYmVjYXVzZSBhbGxvY19ldGhlcmRldigp
IGFscmVhZHkKZG9lcyB0aGlzIGpvYi4KClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBXYWhyZW4gPHN0
ZWZhbi53YWhyZW5AaTJzZS5jb20+ClJldmlld2VkLWJ5OiBSYWdodXJhbSBDaGFyeSBKYWxsaXBh
bGxpIDxyYWdodXJhbWNoYXJ5LmphbGxpcGFsbGlAbWljcm9jaGlwLmNvbT4KLS0tCiBkcml2ZXJz
L25ldC91c2IvbGFuNzh4eC5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3VzYi9sYW43OHh4LmMgYi9kcml2ZXJzL25ldC91c2Iv
bGFuNzh4eC5jCmluZGV4IDNmNzBiOTQuLjNkNTA1YzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0
L3VzYi9sYW43OHh4LmMKKysrIGIvZHJpdmVycy9uZXQvdXNiL2xhbjc4eHguYwpAQCAtMzc2Niw3
ICszNzY2LDYgQEAgc3RhdGljIGludCBsYW43OHh4X3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNl
ICppbnRmLAogCXJldCA9IGxhbjc4eHhfYmluZChkZXYsIGludGYpOwogCWlmIChyZXQgPCAwKQog
CQlnb3RvIG91dDI7Ci0Jc3RyY3B5KG5ldGRldi0+bmFtZSwgImV0aCVkIik7CiAKIAlpZiAobmV0
ZGV2LT5tdHUgPiAoZGV2LT5oYXJkX210dSAtIG5ldGRldi0+aGFyZF9oZWFkZXJfbGVuKSkKIAkJ
bmV0ZGV2LT5tdHUgPSBkZXYtPmhhcmRfbXR1IC0gbmV0ZGV2LT5oYXJkX2hlYWRlcl9sZW47Cg==

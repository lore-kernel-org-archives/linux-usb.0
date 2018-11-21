Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] usb: renesas_usbhs: Use SIMPLE_DEV_PM_OPS macro
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <1542781735-8548-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Wed, 21 Nov 2018 06:31:23 +0000
To: "balbi@kernel.org" <balbi@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <linux-usb.vger.kernel.org>

VGhpcyBwYXRjaCB1c2VzIFNJTVBMRV9ERVZfUE1fT1BTIG1hY3JvIGluc3RlYWQgb2Ygc3RydWN0
IGRldl9wbV9vcHMKZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8
eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+Ci0tLQogZHJpdmVycy91c2IvcmVuZXNh
c191c2Jocy9jb21tb24uYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhz
L2NvbW1vbi5jIGIvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYwppbmRleCAwZTc2
MGYyLi4wMmMxZDJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1v
bi5jCisrKyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMKQEAgLTg3NCwxMCAr
ODc0LDcgQEAgc3RhdGljIGludCB1c2Joc2NfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAly
ZXR1cm4gMDsKIH0KIAotc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHVzYmhzY19wbV9v
cHMgPSB7Ci0JLnN1c3BlbmQJCT0gdXNiaHNjX3N1c3BlbmQsCi0JLnJlc3VtZQkJCT0gdXNiaHNj
X3Jlc3VtZSwKLX07CitzdGF0aWMgU0lNUExFX0RFVl9QTV9PUFModXNiaHNjX3BtX29wcywgdXNi
aHNjX3N1c3BlbmQsIHVzYmhzY19yZXN1bWUpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciByZW5lc2FzX3VzYmhzX2RyaXZlciA9IHsKIAkuZHJpdmVyCQk9IHsK

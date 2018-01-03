Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/6] usb: mtu3: fix error code for getting extcon device
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Message-Id: <41c6b0f2e959c07eff261060e57fd180a750071a.1514967463.git.chunfeng.yun@mediatek.com>
Date: Wed, 3 Jan 2018 16:53:17 +0800
To: Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

V2hlbiBmYWlsaW5nIHRvIGdldCBleHRjb24gZGV2aWNlLCBleHRjb25fZ2V0X2VkZXZfYnlfcGhh
bmRsZSgpCm1heSByZXR1cm4gZGlmZmVyZW50IGVycm9yIGNvZGVzLCBidXQgbm90IG9ubHkgLUVQ
Uk9CRV9ERUZFUiwKc28gY2FuJ3QgYWx3YXlzIHJldHVybiAtRVBST0JFX0RFRkVSLCBhbmQgZml4
IGl0LgoKU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsu
Y29tPgotLS0KIGRyaXZlcnMvdXNiL210dTMvbXR1M19wbGF0LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9tdHUzL210dTNfcGxhdC5jIGIvZHJpdmVycy91c2IvbXR1My9tdHUzX3BsYXQuYwppbmRl
eCAzNjUwZmQxLi41YjIxMTBiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfcGxh
dC5jCisrKyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M19wbGF0LmMKQEAgLTMwOCw3ICszMDgsNyBA
QCBzdGF0aWMgaW50IGdldF9zc3VzYl9yc2NzKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
IHN0cnVjdCBzc3VzYl9tdGsgKnNzdXNiKQogCQlvdGdfc3gtPmVkZXYgPSBleHRjb25fZ2V0X2Vk
ZXZfYnlfcGhhbmRsZShzc3VzYi0+ZGV2LCAwKTsKIAkJaWYgKElTX0VSUihvdGdfc3gtPmVkZXYp
KSB7CiAJCQlkZXZfZXJyKHNzdXNiLT5kZXYsICJjb3VsZG4ndCBnZXQgZXh0Y29uIGRldmljZVxu
Iik7Ci0JCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKKwkJCXJldHVybiBQVFJfRVJSKG90Z19zeC0+
ZWRldik7CiAJCX0KIAl9CiAK

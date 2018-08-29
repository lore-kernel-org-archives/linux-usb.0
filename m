Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/6] usb: xhci-mtk: fix ISOC error when interval is zero
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Message-Id: <0c4244695d4dd8bf9cb1d2d0291783974c56ff7a.1535510898.git.chunfeng.yun@mediatek.com>
Date: Wed, 29 Aug 2018 10:55:15 +0800
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

SWYgdGhlIGludGVydmFsIGVxdWFsIHplcm8sIG5lZWRuJ3Qgcm91bmQgdXAgdG8gcG93ZXIgb2Yg
dHdvCmZvciB0aGUgbnVtYmVyIG9mIHBhY2tldHMgaW4gZWFjaCBFU0lULCBzbyBmaXggaXQuCgpT
aWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Ci0t
LQogZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay1zY2guYyB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1tdGstc2NoLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLXNjaC5j
CmluZGV4IDQ2ZmUwYTIuLjA1N2Y0NTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhj
aS1tdGstc2NoLmMKKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLW10ay1zY2guYwpAQCAtMTI2
LDcgKzEyNiw5IEBAIHN0YXRpYyB2b2lkIHNldHVwX3NjaF9pbmZvKHN0cnVjdCB1c2JfZGV2aWNl
ICp1ZGV2LAogCQl9CiAKIAkJaWYgKGVwX3R5cGUgPT0gSVNPQ19JTl9FUCB8fCBlcF90eXBlID09
IElTT0NfT1VUX0VQKSB7Ci0JCQlpZiAoZXNpdF9wa3RzIDw9IHNjaF9lcC0+ZXNpdCkKKwkJCWlm
IChzY2hfZXAtPmVzaXQgPT0gMSkKKwkJCQlzY2hfZXAtPnBrdHMgPSBlc2l0X3BrdHM7CisJCQll
bHNlIGlmIChlc2l0X3BrdHMgPD0gc2NoX2VwLT5lc2l0KQogCQkJCXNjaF9lcC0+cGt0cyA9IDE7
CiAJCQllbHNlCiAJCQkJc2NoX2VwLT5wa3RzID0gcm91bmR1cF9wb3dfb2ZfdHdvKGVzaXRfcGt0
cykK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [5/5] usb: chipidea: msm: get optional clock by devm_clk_get_optional()
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <VI1PR04MB53271D981843769FEFDD60E78B500@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date: Thu, 4 Apr 2019 07:28:57 +0000
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
List-ID: <linux-usb.vger.kernel.org>

PiAgZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY19tc20uYyB8IDkgKysrLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfbXNtLmMKPiBiL2RyaXZlcnMvdXNi
L2NoaXBpZGVhL2NpX2hkcmNfbXNtLmMKPiBpbmRleCA4ODAwMDk5ODc0NjAuLmI4YjNjYWFkODg5
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX21zbS5jCj4gKysr
IGIvZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY19tc20uYwo+IEBAIC0yMDUsMTIgKzIwNSw5
IEBAIHN0YXRpYyBpbnQgY2lfaGRyY19tc21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+
ICpwZGV2KQo+ICAJaWYgKElTX0VSUihjbGspKQo+ICAJCXJldHVybiBQVFJfRVJSKGNsayk7Cj4g
Cj4gLQljaS0+ZnNfY2xrID0gY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJmcyIpOwo+
IC0JaWYgKElTX0VSUihjbGspKSB7Cj4gLQkJaWYgKFBUUl9FUlIoY2xrKSA9PSAtRVBST0JFX0RF
RkVSKQo+IC0JCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiAtCQljaS0+ZnNfY2xrID0gTlVMTDsK
PiAtCX0KPiArCWNpLT5mc19jbGsgPSBjbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoJnBkZXYt
PmRldiwgImZzIik7Cj4gKwlpZiAoSVNfRVJSKGNsaykpCj4gKwkJcmV0dXJuIFBUUl9FUlIoY2xr
KTsKPiAKPiAgCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgMSk7Cj4gIAljaS0+YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCBy
ZXMpOwo+IC0tCj4gMi4yMC4xCgpBY2tlZC1ieTogUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAu
Y29tPgo=

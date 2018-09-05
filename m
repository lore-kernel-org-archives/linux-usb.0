Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,4/6] usb: chipidea: Fix otg event handler
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <AM0PR04MB531481DD28B3A924892174CD8B020@AM0PR04MB5314.eurprd04.prod.outlook.com>
Date: Wed, 5 Sep 2018 03:25:11 +0000
To: Loic Poulain <loic.poulain@linaro.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "david.brown@linaro.org" <david.brown@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "andy.gross@linaro.org" <andy.gross@linaro.org>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
List-ID: <linux-usb.vger.kernel.org>

PiAgdjI6IHYzOiBubyBjaGFuZ2UKPiAKPiAgZHJpdmVycy91c2IvY2hpcGlkZWEvb3RnLmMgfCA5
ICsrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9vdGcuYyBiL2RyaXZl
cnMvdXNiL2NoaXBpZGVhL290Zy5jIGluZGV4Cj4gZGI0Y2VmZi4uZjI1ZDQ4MiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL3VzYi9jaGlwaWRlYS9vdGcuYwo+ICsrKyBiL2RyaXZlcnMvdXNiL2NoaXBp
ZGVhL290Zy5jCj4gQEAgLTIwMywxNCArMjAzLDE3IEBAIHN0YXRpYyB2b2lkIGNpX290Z193b3Jr
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgCX0KPiAKPiAgCXBtX3J1bnRpbWVfZ2V0X3N5
bmMoY2ktPmRldik7Cj4gKwo+ICAJaWYgKGNpLT5pZF9ldmVudCkgewo+ICAJCWNpLT5pZF9ldmVu
dCA9IGZhbHNlOwo+ICAJCWNpX2hhbmRsZV9pZF9zd2l0Y2goY2kpOwo+IC0JfSBlbHNlIGlmIChj
aS0+Yl9zZXNzX3ZhbGlkX2V2ZW50KSB7Cj4gKwl9Cj4gKwo+ICsJaWYgKGNpLT5iX3Nlc3NfdmFs
aWRfZXZlbnQpIHsKPiAgCQljaS0+Yl9zZXNzX3ZhbGlkX2V2ZW50ID0gZmFsc2U7Cj4gIAkJY2lf
aGFuZGxlX3ZidXNfY2hhbmdlKGNpKTsKPiAtCX0gZWxzZQo+IC0JCWRldl9lcnIoY2ktPmRldiwg
InVuZXhwZWN0ZWQgZXZlbnQgb2NjdXJzIGF0ICVzXG4iLCBfX2Z1bmNfXyk7Cj4gKwl9Cj4gKwo+
ICAJcG1fcnVudGltZV9wdXRfc3luYyhjaS0+ZGV2KTsKPiAKPiAgCWVuYWJsZV9pcnEoY2ktPmly
cSk7Cj4gLS0KCkZvciBjaGlwaWRlYSBjaGFuZ2VzLCBJIHdpbGwgYXBwbHkgdGhlbS4gVGhhbmtz
LgoKUGV0ZXIK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] usb: gadget: udc: atmel: convert to use GPIO descriptors
From: Linus Walleij <linus.walleij@linaro.org>
Message-Id: <CACRpkdYe-caycymfzosGTgnQUgf2jrLU9vfJEsT+bupqexCAxQ@mail.gmail.com>
Date: Wed, 7 Feb 2018 14:55:35 +0100
To: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: linux-usb@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Felipe Balbi <balbi@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBGZWIgMSwgMjAxOCBhdCAxMDozNCBBTSwgTHVkb3ZpYyBEZXNyb2NoZXMKPGx1ZG92
aWMuZGVzcm9jaGVzQG1pY3JvY2hpcC5jb20+IHdyb3RlOgoKPiBVc2UgR1BJTyBkZXNjcmlwdG9y
cyBpbnN0ZWFkIG9mIHJlbHlpbmcgb24gdGhlIG9sZCBtZXRob2QuCj4gSW5jbHVkZSBpcnEuaCBo
ZWFkZXIgc2luY2UgaXQgaXMgbmVlZGVkIGFuZCB3YXMgaW5kaXJlY3RseQo+IGluY2x1ZGVkIHRo
cm91Z2ggb2ZfZ3Bpby5oLgo+Cj4gU2lnbmVkLW9mZi1ieTogTHVkb3ZpYyBEZXNyb2NoZXMgPGx1
ZG92aWMuZGVzcm9jaGVzQG1pY3JvY2hpcC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhhbmsgeW91IGZvciBkb2luZyBncGlvZCBj
b252ZXJzaW9ucy4gTWFraW5nIHRoZSB3b3JsZAphIGJldHRlciBwbGFjZSEKCllvdXJzLApMaW51
cyBXYWxsZWlqCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGlu
ZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

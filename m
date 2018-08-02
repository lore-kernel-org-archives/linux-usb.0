Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: gadget: ffs: Fix BUG when userland exits with submitted AIO transfers
From: Vincent Pelletier <plr.vincent@gmail.com>
Message-Id: <20180802142351.7001fc63@gmail.com>
Date: Thu, 2 Aug 2018 14:23:51 +0000
To: "He, Bo" <bo.he@intel.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, Roger Quadros <rogerq@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Sam Protsenko <semen.protsenko@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Praneeth Bajjuri <praneeth@ti.com>, "Bai, Jie A" <jie.a.bai@intel.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAyIEF1ZyAyMDE4IDAwOjQ1OjE0ICswMDAwLCAiSGUsIEJvIiA8Ym8uaGVAaW50ZWwu
Y29tPiB3cm90ZToKPiBZb3VyIHBhdGNoIGZpeCB0aGUgaXNzdWUgQlVHOiBzY2hlZHVsaW5nIHdo
aWxlIGF0b21pYzoKClllcywgYWx0aG91Z2ggZnJvbSBteSB1bmRlcnN0YW5kaW5nIG9mIEZlbGlw
ZSdzIGFuc3dlciwgdGhlIGFjdHVhbCBidWcKaXMgdGhlICJzY2hlZHVsaW5nIiBwYXJ0IChzbGVl
cGluZyBpbiBkd2MzIFVEQykgcmF0aGVyIHRoYW4gdGhlCiJhdG9taWMiIHBhcnQuCgpTbyBteSBw
YXRjaCBhZGRyZXNzZXMsIHN0aWxsIGlmIG15IHVuZGVyc3RhbmRpbmcgaXMgY29ycmVjdCwgdGhl
IHdyb25nCmhhbGYgb2YgdGhlIHByb2JsZW0sIGFuZCBldmVuIGludHJvZHVjZWQgdGhlIHJlZ3Jl
c3Npb24geW91IGlkZW50aWZpZWQuCkhlbmNlIG15IHVuY2VydGFpbnR5Li4uCg==

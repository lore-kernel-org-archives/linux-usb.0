Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,2/3] USB: core: Add non-coherent buffer allocation helpers
From: Christoph Hellwig <hch@infradead.org>
Message-Id: <20180831055047.GA9140@infradead.org>
Date: Thu, 30 Aug 2018 22:50:47 -0700
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-media@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomasz Figa <tfiga@chromium.org>, "Matwey V . Kornilov" <matwey@sai.msu.ru>, Alan Stern <stern@rowland.harvard.edu>, kernel@collabora.com, Keiichi Watanabe <keiichiw@chromium.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBdWcgMzAsIDIwMTggYXQgMDc6MTE6MzVQTSAtMDMwMCwgRXplcXVpZWwgR2FyY2lh
IHdyb3RlOgo+IE9uIFRodSwgMjAxOC0wOC0zMCBhdCAxMDo1OCAtMDcwMCwgQ2hyaXN0b3BoIEhl
bGx3aWcgd3JvdGU6Cj4gPiBQbGVhc2UgZG9uJ3QgaW50cm9kdWNlIG5ldyBETUFfQVRUUl9OT05f
Q09OU0lTVEVOVCB1c2VycywgaXQgaXMKPiA+IGEgcmF0aGVyIGhvcnJpYmxlIGludGVyZmFjZSwg
YW5kIEkgcGxhbiB0byBraWxsIGl0IG9mZiByYXRoZXIgc29vbmVyCj4gPiB0aGFuIGxhdGVyLiAg
SSBwbGFuIHRvIHBvc3Qgc29tZSBwYXRjaGVzIGZvciBhIGJldHRlciBpbnRlcmZhY2UKPiA+IHRo
YXQgY2FuIHJldXNlIHRoZSBub3JtYWwgZG1hX3N5bmNfc2luZ2xlXyogaW50ZXJmYWNlcyBmb3Ig
b3duZXJzaGlwCj4gPiB0cmFuc2ZlcnMuICBJIGNhbiBoYXBwaWx5IGluY2x1ZGUgdXNiIGluIHRo
YXQgaW5pdGlhbCBwYXRjaCBzZXQgYmFzZWQKPiA+IG9uIHlvdXIgd29yayBoZXJlIGlmIHRoYXQg
aGVscHMuCj4gCj4gUGxlYXNlIGRvLiBVbnRpbCB3ZSBoYXZlIHByb3BlciBhbGxvY2F0b3JzIHRo
YXQgZ28gdGhydSB0aGUgRE1BIEFQSSwKPiBkcml2ZXJzIHdpbGwgaGF2ZSB0byBrbWFsbG9jIHRo
ZSBVU0IgdHJhbnNmZXIgYnVmZmVycywgYW5kIGhhdmUKPiBzdHJlYW1pbmcgbWFwcGluZ3MuIFdo
aWNoIGluIHR1cm5zIG1lYW4gbm90IHVzaW5nIElPTU1VIG9yIENNQS4KCmRtYV9tYXBfcGFnZSB3
aWxsIG9mIGNvdXJzZSB1c2UgdGhlIGlvbW11Lgo=

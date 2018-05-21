Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: dwc2: gadget: Fix memory leak in dwc2_gadget_init()
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87o9h98pc0.fsf@linux.intel.com>
Date: Mon, 21 May 2018 10:01:19 +0300
To: Grigor Tovmasyan <Grigor.Tovmasyan@synopsys.com>, Marek Szyprowski <m.szyprowski@samsung.com>Grigor Tovmasyan <Grigor.Tovmasyan@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: John Youn <John.Youn@synopsys.com>, Stefan Wahren <stefan.wahren@i2se.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpHcmlnb3IgVG92bWFzeWFuIDxHcmlnb3IuVG92bWFzeWFuQHN5bm9wc3lzLmNvbT4gd3Jp
dGVzOgo+IEhpIEZlbGlwZSwKPgo+IFBsZWFzZSBkcm9wIHRoaXMgcGF0Y2ggZnJvbSB5b3VyIG5l
eHQgYnJhbmNoLgo+IEkgd2lsbCBwcm92aWRlIGFub3RoZXIgZml4IGJhc2VkIG9uIE1hcmVrJ3Mg
c3VnZ2VzdGlvbi4KCnRoaXMgdGltZSBJJ2xsIHJlYmFzZSBteSAnbmV4dCcgYnJhbmNoLiBOZXh0
IHRpbWUsIG1ha2Ugc3VyZSB0aGlzCmRvZXNuJ3QgaGFwcGVuIGFueW1vcmUgYXMgSSBsaWtlIG15
ICduZXh0JyB0byBiZSBpbW11dGFibGUuCg==

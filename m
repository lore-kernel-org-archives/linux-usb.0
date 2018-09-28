Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next] USB: core: remove set but not used variable 'udev'
From: Alan Stern <stern@rowland.harvard.edu>
Message-Id: <Pine.LNX.4.44L0.1809281631550.9883-100000@netrider.rowland.org>
Date: Fri, 28 Sep 2018 16:35:09 -0400 (EDT)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, Daniel Drake <drake@endlessm.com>, Joe Perches <joe@perches.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Martin Liu <liumartin@google.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCAyOCBTZXAgMjAxOCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgoKPiBPbiBTYXQs
IFNlcCAyMiwgMjAxOCBhdCAwNjozMToyNkFNICswMDAwLCBZdWVIYWliaW5nIHdyb3RlOgo+ID4g
Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgo+ID4gCj4gPiBk
cml2ZXJzL3VzYi9jb3JlL2RyaXZlci5jOiBJbiBmdW5jdGlvbiAndXNiX2RyaXZlcl9jbGFpbV9p
bnRlcmZhY2UnOgo+ID4gZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYzo1MTM6MjE6IHdhcm5pbmc6
Cj4gPiAgdmFyaWFibGUgJ3VkZXYnIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdA
aHVhd2VpLmNvbT4KPiA+IEFja2VkLWJ5OiBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZh
cmQuZWR1Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy91c2IvY29yZS9kcml2ZXIuYyB8IDMgLS0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gVGhpcyBwYXRjaCBicmVha3Mg
dGhlIGJ1aWxkLCB3aGljaCBpcyBub3Qgb2sgOigKCkFyZSB5b3Ugc3VyZSB5b3UgYXBwbGllZCBp
dCB0byB0aGUgcmlnaHQgYnJhbmNoPyAgSXQgcmVxdWlyZXMgY29tbWl0IApjMTgzODEzZmNlZTQ0
YTI0ICgiVVNCOiByZW1vdmUgTFBNIG1hbmFnZW1lbnQgZnJvbSAKdXNiX2RyaXZlcl9jbGFpbV9p
bnRlcmZhY2UoKSIpLiAgUHJvYmFibHkgdGhlIHRhZ3Mgc2hvdWxkIG1lbnRpb24gdGhpcy4KCkFs
YW4gU3Rlcm4K

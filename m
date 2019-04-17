Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] usb/hcd: Send a uevent signaling that the host controller had died
From: Alan Stern <stern@rowland.harvard.edu>
Message-Id: <Pine.LNX.4.44L0.1904171635460.1400-100000@iolanthe.rowland.org>
Date: Wed, 17 Apr 2019 16:39:23 -0400 (EDT)
To: Raul Rangel <rrangel@chromium.org>
Cc: linux-usb@vger.kernel.org, groeck@chromium.org, oneukum@suse.com, djkurtz@chromium.org, zwisler@chromium.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dmitry Torokhov <dtor@chromium.org>, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCAxNyBBcHIgMjAxOSwgUmF1bCBSYW5nZWwgd3JvdGU6Cgo+IE9uIFdlZCwgQXByIDE3
LCAyMDE5IGF0IDAzOjE0OjE0UE0gLTA0MDAsIEFsYW4gU3Rlcm4gd3JvdGU6Cj4gPiBPbiBXZWQs
IDE3IEFwciAyMDE5LCBSYXVsIEUgUmFuZ2VsIHdyb3RlOgo+ID4gCj4gPiA+ICsvKiBXb3JrcXVl
dWUgcm91dGluZSBmb3Igd2hlbiB0aGUgcm9vdC1odWIgaGFzIGRpZWQuICovCj4gPiA+ICtzdGF0
aWMgdm9pZCBoY2RfZGllZF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiA+ID4gK3sK
PiA+ID4gKwlzdHJ1Y3QgdXNiX2hjZCAqaGNkID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCB1
c2JfaGNkLCBkaWVkX3dvcmspOwo+ID4gPiArCWNoYXIgKmVudltdID0gewo+ID4gPiArCQkiRVJS
T1I9REVBRCIsCj4gPiA+ICsJCU5VTEwKPiA+ID4gKwl9Owo+ID4gCj4gPiBUaGlzIGNhbiBub3cg
YmUKPiA+IAo+ID4gCXN0YXRpYyBjb25zdCBjaGFyICplbnZbXSA9IC4uLgo+ID4gCj4gPiByaWdo
dD8gIFRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhlIGFycmF5IHRvIGJlIHJlaW5pdGlhbGl6ZWQgZXZl
cnkgdGltZSAKPiA+IHRoZSByb3V0aW5lIHJ1bnMuCj4gSSBvcmlnaW5hbGx5IHRyaWVkIHRvIG1h
a2UgaXQgY29uc3QsIGJ1dCBrb2JqZWN0X3VldmVudF9lbnYgZG9lc24ndAo+IGRlY2xhcmUgdGhl
IHBhcmFtZXRlciBhcyBjb25zdCwgc28gdGhlIGNvbXBpbGVyIHllbGxlZCBhdCBtZS4gSSBjb3Vs
ZAo+IG1ha2UgaXQgc3RhdGljLCBidXQgYSBzdGF0aWMgd2l0aG91dCBhIGNvbnN0IG1ha2VzIG1l
IHdhcnkuIEkgY2FuIGFkZCBpdAo+IGlmIHlvdSB0aGluayBpdCdzIGZpbmUuCgpUaGlzIHNvdW5k
cyBsaWtlIGEgZ29sZGVuIG9wcG9ydHVuaXR5ISAgU3VibWl0IGEgc2VwYXJhdGUgcGF0Y2ggbWFr
aW5nIAp0aGUgcGFyYW1ldGVyIHRvIGtvYmplY3RfdWV2ZW50X2VudiBiZSBjb25zdCAoYWN0dWFs
bHkgY29uc3QgY2hhciAqIApjb25zdCBbXSksIHRoZW4gc3VibWl0IHRoaXMgcGF0Y2ggb24gdG9w
IG9mIHRoYXQgb25lLgoKQWxhbiBTdGVybgo=

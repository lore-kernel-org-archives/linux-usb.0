Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: MUSB interrupt storm on device removal
From: Alan Stern <stern@rowland.harvard.edu>
Message-Id: <Pine.LNX.4.44L0.1901241048001.1229-100000@iolanthe.rowland.org>
Date: Thu, 24 Jan 2019 10:49:30 -0500 (EST)
To: Bin Liu <b-liu@ti.com>
Cc: Johan Hovold <johan@kernel.org>, Greg KH <greg@kroah.com>, =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>, USB list <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAyNCBKYW4gMjAxOSwgQmluIExpdSB3cm90ZToKCj4gPiBQZXJoYXBzIGl0IGhhcyBz
b21ldGhpbmcgdG8gZG8gd2l0aCB0aGUgdGltaW5nIG9mIHRoZSBjb21wbGV0aW9uIAo+ID4gaW50
ZXJydXB0cy4gIEkgZG9uJ3Qga25vdyBhbnl0aGluZyBhYm91dCBob3cgbXVzYiB3b3JrcywgdGhv
dWdoLiAgU29tZSAKPiA+IGxvdy1sZXZlbCB0aW1pbmcgaW5mb3JtYXRpb24gd291bGQgYmUgZ29v
ZCB0byBzZWUuCj4gCj4gVGhlIG11c2IgY29udHJvbGxlciBkcml2ZXIgaXRzZWxmIGRvZXNuJ3Qg
aGF2ZSBhIGlzciBCSCwgc28gd2hlbiBhbiBlcAo+IGludGVycnVwdCBoYXBwZW5lZCwgdGhlIGlz
ciBkaXJlY3RseSBwcm9jZXNzZXMgdGhlIHVyYiBhbmQgY2FsbGVkCj4gZ2l2ZWJhY2suIEkgdHJp
ZWQgdG8gYWRkIEhDRF9CSCB0byB0aGUgbXVzYiBoY2QgLmZsYWcsIHRoZSBpc3N1ZSBzdGlsbAo+
IGhhcHBlbnMuCgpJIHdhcyB0aGlua2luZyB0aGF0IG1heWJlIHNvbWUgY29udHJvbGxlcnMgZGVs
YXkgc29tZSB0eXBlcyBvZgpjb21wbGV0aW9uIGludGVycnVwdCB1bnRpbCBhIGZyYW1lIGJvdW5k
YXJ5LCB3aGlsZSBvdGhlciBjb250cm9sbGVycwpyYWlzZSBhbGwgY29tcGxldGlvbiBpbnRlcnJ1
cHRzIGltbWVkaWF0ZWx5LgoKQWxhbiBTdGVybgo=

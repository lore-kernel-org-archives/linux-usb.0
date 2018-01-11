Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: dwc3: core: Don't try to get PHYs during suspend/resume
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87inc8yf7k.fsf@linux.intel.com>
Date: Thu, 11 Jan 2018 10:25:35 +0200
To: Roger Quadros <rogerq@ti.com>
Cc: vigneshr@ti.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, "linux-stable # = v4 . 13" <stable@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpSb2dlciBRdWFkcm9zIDxyb2dlcnFAdGkuY29tPiB3cml0ZXM6Cj4+Pj4gLQlyZXQgPSBk
d2MzX2NvcmVfc29mdF9yZXNldChkd2MpOwo+Pj4+ICsJcmV0ID0gZHdjM19jb3JlX2dldF9waHko
ZHdjKTsKPj4+Cj4+PiB3ZSBjYW4gZ2V0X3BoeSBpbiBkd2MzX2NvcmVfaW5pdCgpIGFzIGl0IHdp
bGwgZ2V0IGNhbGxlZCBvbiByZXN1bWUoKS4KPj4+IFRoaXMgd2FzIHRoZSAkc3ViamVjdCBvZiB0
aGlzIHBhdGNoLgo+PiAKPj4gaW5kZWVkLiB0aGFua3MgOi0pCj4+IAo+Cj4gb29wcyBzb3JyeS4g
SSBtZWFudCB3ZSBjYW4ndCBjYWxsIGR3YzNfY29yZV9nZXRfcGh5KCkgaW4gZHdjM19jb3JlX2lu
aXQoKS4gOlAKCmJpdCBvZiBhIGNoaWNrZW4tYW5kLWVnZyBwcm9ibGVtLiBXZSBuZWVkIHRvIHNl
dHVwIHRoZSBQSFkgaW50ZXJmYWNlCmJlZm9yZSBnZXR0aW5nIHRoZSBQSFlzLCBidXQgY2FuJ3Qg
Z2V0IFBIWSBkdXJpbmcgcmVzdW1lLiBNYXliZSB0aGUgYmVzdAp3YXkgaGVyZSB3b3VsZCBiZSB0
byBjaGVjayBmb3IgdGhlIHBvaW50ZXJzIGJlaW5nIHZhbGlkLiBTb21ldGhpbmcgbGlrZToKCmlm
ICghcGh5KQoJZ2V0X3BoeSgpOwo=

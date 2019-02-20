Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/4] usb: xhci: fix build warning - missing prototype
From: Jean-Philippe Menil <jpmenil@gmail.com>
Message-Id: <alpine.LNX.2.21.9999.1902202153140.17773@macbook.home>
Date: Wed, 20 Feb 2019 21:54:12 +0100 (CET)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, Jean-Philippe Menil <jpmenil@gmail.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCAyMCBGZWIgMjAxOSwgR3JlZyBLSCB3cm90ZToKCj4gT24gV2VkLCBGZWIgMjAsIDIw
MTkgYXQgMDc6NTA6NTJQTSArMDIwMCwgTWF0aGlhcyBOeW1hbiB3cm90ZToKPiA+IEZyb206IEpl
YW4tUGhpbGlwcGUgTWVuaWwgPGpwbWVuaWxAZ21haWwuY29tPgo+ID4gCj4gPiBGaXggYnVpbGQg
d2FybmluZyB3aGVuIGJ1aWxkaW5nIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tZW0ubyBkdWUgdG8g
bWlzc2luZwo+ID4gcHJvdG90eXBlIGZvciB4aGNpX2ZyZWVfdmlydF9kZXZpY2VzX2RlcHRoX2Zp
cnN0Lgo+IAo+IFRoZXJlIGlzIG5vIG5vcm1hbCAiYnVpbGQgd2FybmluZyIsIHRoaXMgaXMgYSBz
cGFyc2UgZml4dXAsIHJpZ2h0Pwo+IAo+IAoKSGkgR3JlZywKCnRoaXMgaXMgYSBidWlsZCB3YXJu
aW5nLCBhdCBsZWFzdCB3aXRoIFc9MSA6Cgpkcml2ZXJzL3VzYi9ob3N0L3hoY2ktbWVtLmM6OTM2
OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgCuKAmHhoY2lfZnJlZV92aXJ0
X2RldmljZXNfZGVwdGhfZmlyc3TigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogdm9pZCB4aGNp
X2ZyZWVfdmlydF9kZXZpY2VzX2RlcHRoX2ZpcnN0KHN0cnVjdCB4aGNpX2hjZCAqeGhjaSwgaW50
IApzbG90X2lkKQoKUmVnYXJkcywKCkplYW4tUGhpbGlwcGUK

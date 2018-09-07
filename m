Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: xhci: fix interrupt transfer error happened on MTK platforms
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Message-Id: <1536309826.32173.45.camel@mhfsdcap03>
Date: Fri, 7 Sep 2018 16:43:46 +0800
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBGcmksIDIwMTgtMDktMDcgYXQgMDk6NDIgKzAyMDAsIEdyZWcgS3JvYWgtSGFydG1h
biB3cm90ZToKPiBPbiBGcmksIFNlcCAwNywgMjAxOCBhdCAwMzoyOToxMlBNICswODAwLCBDaHVu
ZmVuZyBZdW4gd3JvdGU6Cj4gPiBUaGUgTVRLIHhIQ0kgY29udHJvbGxlciB1c2Ugc29tZSByZXNl
cnZlZCBieXRlcyBpbiBlbmRwb2ludCBjb250ZXh0IGZvcgo+ID4gYmFuZHdpZHRoIHNjaGVkdWxp
bmcsIHNvIG5lZWQga2VlcCB0aGVtIGluIHhoY2lfZW5kcG9pbnRfY29weSgpOwo+IAo+IElmIHRo
ZXkgYXJlICJyZXNlcnZlZCIgc2hvdWxkbid0IHRoZXkgYmUgcHJvcGVybHkgbmFtZWQ/ICBBbmQg
YnkgdXNpbmcKPiByZXNlcnZlZCBieXRlcywgaXNuJ3QgdGhhdCBhIHNwZWMgdmlvbGF0aW9uPwpJ
dCBpbmRlZWQgdmlvbGF0ZXMgdGhlIHNwZWMsICJ0aGV5IHNoYWxsIGJlIHRyZWF0ZWQgYnkgc3lz
dGVtIHNvZnR3YXJlCmFzIFJlc2VydmVkIGFuZCBPcGFxdWUiLCBhbmQgaXQncyBhIHF1aXJrIG9m
IHRoZSBNVEsgeEhDSSBjb250cm9sbGVyLgoKPiAKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgK

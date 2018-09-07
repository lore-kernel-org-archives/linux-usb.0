Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: xhci: fix interrupt transfer error happened on MTK platforms
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180907085645.GA17270@kroah.com>
Date: Fri, 7 Sep 2018 10:56:45 +0200
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDQ6NDM6NDZQTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIEZyaSwgMjAxOC0wOS0wNyBhdCAwOTo0MiArMDIwMCwgR3JlZyBL
cm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gT24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMDM6Mjk6MTJQ
TSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdyb3RlOgo+ID4gPiBUaGUgTVRLIHhIQ0kgY29udHJvbGxl
ciB1c2Ugc29tZSByZXNlcnZlZCBieXRlcyBpbiBlbmRwb2ludCBjb250ZXh0IGZvcgo+ID4gPiBi
YW5kd2lkdGggc2NoZWR1bGluZywgc28gbmVlZCBrZWVwIHRoZW0gaW4geGhjaV9lbmRwb2ludF9j
b3B5KCk7Cj4gPiAKPiA+IElmIHRoZXkgYXJlICJyZXNlcnZlZCIgc2hvdWxkbid0IHRoZXkgYmUg
cHJvcGVybHkgbmFtZWQ/ICBBbmQgYnkgdXNpbmcKPiA+IHJlc2VydmVkIGJ5dGVzLCBpc24ndCB0
aGF0IGEgc3BlYyB2aW9sYXRpb24/Cj4gSXQgaW5kZWVkIHZpb2xhdGVzIHRoZSBzcGVjLCAidGhl
eSBzaGFsbCBiZSB0cmVhdGVkIGJ5IHN5c3RlbSBzb2Z0d2FyZQo+IGFzIFJlc2VydmVkIGFuZCBP
cGFxdWUiLCBhbmQgaXQncyBhIHF1aXJrIG9mIHRoZSBNVEsgeEhDSSBjb250cm9sbGVyLgoKU28g
YXMgdGhlICJzeXN0ZW0gc29mdHdhcmUiIGhlcmUsIHdlIHNob3VsZCBqdXN0IGlnbm9yZSB0aGVt
IG90aGVyd2lzZQp3ZSB2aW9sYXRlIHRoZSBzcGVjPyAgOikKCkFueXdheSwgdGhhdCdzIGZpbmUs
IG5vIG9iamVjdGlvbiBmcm9tIG1lIGZvciB0aGUgcGF0Y2gsIHRoYW5rcy4KCmdyZWcgay1oCg==

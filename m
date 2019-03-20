Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: introduce usb_ep_type_string() function
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Message-Id: <1553044567.10179.148.camel@mhfsdcap03>
Date: Wed, 20 Mar 2019 09:16:07 +0800
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Torokhov <dtor@chromium.org>, Johan Hovold <johan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Ian King <colin.king@canonical.com>, Matteo Croce <mcroce@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

SGkgR3JlZywKCk9uIFR1ZSwgMjAxOS0wMy0xOSBhdCAxMDoyMyArMDEwMCwgR3JlZyBLcm9haC1I
YXJ0bWFuIHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDE5LCAyMDE5IGF0IDAzOjU0OjE5UE0gKzA4MDAs
IENodW5mZW5nIFl1biB3cm90ZToKPiA+IAo+ID4gSGkgRmVsaXBlICYgTWF0aGlhcywKPiA+IAo+
ID4gQ291bGQgeW91IHBsZWFzZSBjb21tZW50IHRoaXMgcGF0Y2gsIGlmIHRoZXJlIGlzIHNvbWUt
ZWZmZWN0IG9uIGR3YzMgYW5kCj4gPiB4aGNpLCBJJ2xsIHJlbW92ZSBpdHMgY2hhbmdlLgp0eXBv
OiBzb21lLWVmZmVjdC9zaWRlLWVmZmVjdAo+IAo+IFRvIGJlIHNwZWNpZmljLCB5b3UgYXJlIGNo
YW5naW5nIHRoZSBzdHJpbmcgdmFsdWVzIGZvciB0aGluZ3MgdGhhdCBtaWdodAo+IGNhcmUgYWJv
dXQgaXQgYW5kIGFyZSBzZWVuIGJ5IHVzZXJzcGFjZS4KPiAKPiBQbGVhc2UgYmUgZXhwbGljaXQg
YWJvdXQgdGhpcywgYXMgaXQgY291bGQgY2F1c2UgcHJvYmxlbXMuClRoYW5rIHlvdSBmb3IgbWFr
aW5nIGl0IG1vcmUgY2xlYXJlcgoKPiAKPiBncmVnIGstaAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: introduce usb_ep_type_string() function
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190319092331.GA21652@kroah.com>
Date: Tue, 19 Mar 2019 10:23:31 +0100
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Torokhov <dtor@chromium.org>, Johan Hovold <johan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Ian King <colin.king@canonical.com>, Matteo Croce <mcroce@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDM6NTQ6MTlQTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdy
b3RlOgo+IAo+IEhpIEZlbGlwZSAmIE1hdGhpYXMsCj4gCj4gQ291bGQgeW91IHBsZWFzZSBjb21t
ZW50IHRoaXMgcGF0Y2gsIGlmIHRoZXJlIGlzIHNvbWUtZWZmZWN0IG9uIGR3YzMgYW5kCj4geGhj
aSwgSSdsbCByZW1vdmUgaXRzIGNoYW5nZS4KClRvIGJlIHNwZWNpZmljLCB5b3UgYXJlIGNoYW5n
aW5nIHRoZSBzdHJpbmcgdmFsdWVzIGZvciB0aGluZ3MgdGhhdCBtaWdodApjYXJlIGFib3V0IGl0
IGFuZCBhcmUgc2VlbiBieSB1c2Vyc3BhY2UuCgpQbGVhc2UgYmUgZXhwbGljaXQgYWJvdXQgdGhp
cywgYXMgaXQgY291bGQgY2F1c2UgcHJvYmxlbXMuCgpncmVnIGstaAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: introduce usb_ep_type_string() function
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87r2b2ujao.fsf@linux.intel.com>
Date: Wed, 20 Mar 2019 08:55:11 +0200
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Torokhov <dtor@chromium.org>, Johan Hovold <johan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Ian King <colin.king@canonical.com>, Matteo Croce <mcroce@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

Q2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiB3cml0ZXM6Cgo+IEhpIEdy
ZWcsCj4KPiBPbiBUdWUsIDIwMTktMDMtMTkgYXQgMTA6MjMgKzAxMDAsIEdyZWcgS3JvYWgtSGFy
dG1hbiB3cm90ZToKPj4gT24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMDM6NTQ6MTlQTSArMDgwMCwg
Q2h1bmZlbmcgWXVuIHdyb3RlOgo+PiA+IAo+PiA+IEhpIEZlbGlwZSAmIE1hdGhpYXMsCj4+ID4g
Cj4+ID4gQ291bGQgeW91IHBsZWFzZSBjb21tZW50IHRoaXMgcGF0Y2gsIGlmIHRoZXJlIGlzIHNv
bWUtZWZmZWN0IG9uIGR3YzMgYW5kCj4+ID4geGhjaSwgSSdsbCByZW1vdmUgaXRzIGNoYW5nZS4K
PiB0eXBvOiBzb21lLWVmZmVjdC9zaWRlLWVmZmVjdAoKd2VsbCwgd2UgZG9uJ3QgcmVhbGx5IGtu
b3cgaWYgdGhlcmUgYXJlIHRvb2xzIHBhcnNpbmcgdGhlIG91dHB1dC4gVGhlCnNpZGUtZWZmZWN0
IF9kb2VzXyBleGlzdCAoaS5lLiB5b3UgY2hhbmdlIHRoZSBzdHJpbmcgOi0pLCB3aGF0IHdlIGRv
bid0Cmtub3cgaXMgaWYgdGhpcyB3aWxsIGNhdXNlIHByb2JsZW1zIHRvIHBvc3NpYmx5IGV4aXN0
aW5nIHRvb2xzLgoKUGVyc29uYWxseSwgSSBkb24ndCBtaW5kIHRoZSBwYXRjaCwgYnV0IGlmIGl0
IGJyZWFrcyBleGlzdGluZyBwYXJzZXJzLAp0aGF0IHdvdWxkIGJlIGEgbGl0dGxlIGFubm95aW5n
Lgo=

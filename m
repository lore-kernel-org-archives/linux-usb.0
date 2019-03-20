Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: introduce usb_ep_type_string() function
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Message-Id: <1553068182.10179.166.camel@mhfsdcap03>
Date: Wed, 20 Mar 2019 15:49:42 +0800
To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Matthias Brugger <matthias.bgg@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, Roger Quadros <rogerq@ti.com>, Alan Stern <stern@rowland.harvard.edu>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Torokhov <dtor@chromium.org>, Johan Hovold <johan@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin Ian King <colin.king@canonical.com>, Matteo Croce <mcroce@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

SGkgRmVsaXBlLAoKT24gV2VkLCAyMDE5LTAzLTIwIGF0IDA4OjU1ICswMjAwLCBGZWxpcGUgQmFs
Ymkgd3JvdGU6Cj4gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiB3cml0
ZXM6Cj4gCj4gPiBIaSBHcmVnLAo+ID4KPiA+IE9uIFR1ZSwgMjAxOS0wMy0xOSBhdCAxMDoyMyAr
MDEwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4+IE9uIFR1ZSwgTWFyIDE5LCAyMDE5
IGF0IDAzOjU0OjE5UE0gKzA4MDAsIENodW5mZW5nIFl1biB3cm90ZToKPiA+PiA+IAo+ID4+ID4g
SGkgRmVsaXBlICYgTWF0aGlhcywKPiA+PiA+IAo+ID4+ID4gQ291bGQgeW91IHBsZWFzZSBjb21t
ZW50IHRoaXMgcGF0Y2gsIGlmIHRoZXJlIGlzIHNvbWUtZWZmZWN0IG9uIGR3YzMgYW5kCj4gPj4g
PiB4aGNpLCBJJ2xsIHJlbW92ZSBpdHMgY2hhbmdlLgo+ID4gdHlwbzogc29tZS1lZmZlY3Qvc2lk
ZS1lZmZlY3QKPiAKPiB3ZWxsLCB3ZSBkb24ndCByZWFsbHkga25vdyBpZiB0aGVyZSBhcmUgdG9v
bHMgcGFyc2luZyB0aGUgb3V0cHV0LiBUaGUKPiBzaWRlLWVmZmVjdCBfZG9lc18gZXhpc3QgKGku
ZS4geW91IGNoYW5nZSB0aGUgc3RyaW5nIDotKSwgd2hhdCB3ZSBkb24ndAo+IGtub3cgaXMgaWYg
dGhpcyB3aWxsIGNhdXNlIHByb2JsZW1zIHRvIHBvc3NpYmx5IGV4aXN0aW5nIHRvb2xzLgo+IAo+
IFBlcnNvbmFsbHksIEkgZG9uJ3QgbWluZCB0aGUgcGF0Y2gsIGJ1dCBpZiBpdCBicmVha3MgZXhp
c3RpbmcgcGFyc2VycywKPiB0aGF0IHdvdWxkIGJlIGEgbGl0dGxlIGFubm95aW5nLgpUaGFuayB5
b3UgZm9yIHRoZSBmZWVkYmFjay4KCkknbGwgYWJhbmRvbiB0aGUgY2hhbmdlcyBhYm91dCBkd2Mz
ICYgeGhjaQo+Cg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,06/10] dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings
From: Miquel Raynal <miquel.raynal@bootlin.com>
Message-Id: <20190122171307.3dc956b6@xps13>
Date: Tue, 22 Jan 2019 17:13:07 +0100
To: Rob Herring <robh@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Mathias Nyman <mathias.nyman@intel.com>, devicetree@vger.kernel.org, Antoine Tenart <antoine.tenart@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux USB List <linux-usb@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Nadav Haklai <nadavh@marvell.com>, Alan Stern <stern@rowland.harvard.edu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-ID: <linux-usb.vger.kernel.org>

SGVsbG8sCgpSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPiB3cm90ZSBvbiBUdWUsIDIyIEph
biAyMDE5IDEwOjA4OjQxIC0wNjAwOgoKPiBPbiBNb24sIEphbiAyMSwgMjAxOSBhdCA5OjQ5IEFN
IEdyZWdvcnkgQ0xFTUVOVAo+IDxncmVnb3J5LmNsZW1lbnRAYm9vdGxpbi5jb20+IHdyb3RlOgo+
ID4KPiA+IEhpIFJvYiwKPiA+Cj4gPiAgT24gbHVuLiwgamFudi4gMjEgMjAxOSwgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiAgCj4gPiA+IE9uIE1vbiwgMjEgSmFuIDIw
MTkgMTI6MjM6MzIgKzAxMDAsIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+ID4+IEFkZCBiaW5k
aW5ncyBmb3IgTWFydmVsbCBBcm1hZGEgMzcwMCBVU0IyIFVUTUkrIFBIWS4KPiA+ID4+Cj4gPiA+
PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pgo+ID4gPj4gLS0tCj4gPiA+PiAgLi4uL2JpbmRpbmdzL3BoeS9waHktbXZlYnUtdXRtaS50eHQg
ICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKwo+ID4gPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspCj4gPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvcGh5LW12ZWJ1LXV0bWkudHh0Cj4gPiA+PiAgCj4g
Pgo+ID4gSSBmb3VuZCAibWFydmVsbCx1c2IyLWhvc3QtbWlzY2VsbGFuZW91cyIgdG9vIGdlbmVy
aWMsIEkgd291bGQgcHJlZmVyCj4gPiB0aGF0IHdlIGNhbGwgaXQgIm1hcnZlbGwsYXJtYWRhLTM3
MDAtdXNiMi1ob3N0LW1pc2NlbGxhbmVvdXMiIGFzIHdlIGRvCj4gPiBmb3IgYWxsIHRoZSBvdGhl
ciBJUC4gIAo+IAo+IEFoIHllcywgeW91IGFyZSByaWdodC4gUGVyaGFwcyBqdXN0ICctbWlzYycg
dG8gc2hvcnRlbiBpdCBhIGxpdHRsZSBiaXQuCj4gCj4gUm9iCgpTdXJlLCBubyBwcm9ibGVtLgoK
SSB3aWxsIHdhaXQgZm9yIG90aGVyIGNvbW1lbnRzIG9uIHRoZSByZXN0IG9mIHRoZSBzZXJpZXMg
YW5kIHRoZW4gSQp3aWxsIHVwZGF0ZSB0aGUgYmluZGluZ3MvRFQgcGF0Y2guIFBlcmhhcHMgaWYg
SSBkb24ndCBnZXQgbW9yZQpmZWVkYmFjayBJIHdpbGwganVzdCByZXNlbmQgdGhlIGNvbmNlcm5l
ZCBwYXRjaGVzICg2LzEwIGFuZCA5LzEwKS4KCgpUaGFua3MsCk1pcXXDqGwK

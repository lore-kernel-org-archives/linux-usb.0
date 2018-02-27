Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,03/12] staging: typec: tcpci: support port config passed via dt
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180227110302.GE25535@kuha.fi.intel.com>
Date: Tue, 27 Feb 2018 13:03:02 +0200
To: Jun Li <jun.li@nxp.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "yueyao@google.com" <yueyao@google.com>, Peter Chen <peter.chen@nxp.com>, "garsilva@embeddedor.com" <garsilva@embeddedor.com>, "o_leveque@orange.fr" <o_leveque@orange.fr>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBNb24sIEZlYiAyNiwgMjAxOCBhdCAwMjozMDo1M1BNICswMDAwLCBKdW4gTGkgd3Jv
dGU6Cj4gPiA+ICsJY2hpbGQgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZSh0Y3BjaS0+ZGV2LT5vZl9u
b2RlLCAiY29ubmVjdG9yIik7Cj4gPiA+ICsJaWYgKCFjaGlsZCkgewo+ID4gPiArCQlkZXZfZXJy
KHRjcGNpLT5kZXYsICJmYWlsZWQgdG8gZ2V0IGNvbm5lY3RvciBub2RlLlxuIik7Cj4gPiA+ICsJ
CXJldHVybiAtRUlOVkFMOwo+ID4gPiArCX0KPiA+IAo+ID4gV2h5IGRvIHlvdSBuZWVkIHNlcGFy
YXRlIGNoaWxkIG5vZGUgZm9yIHRoZSBjb25uZWN0b3I/IFlvdSB3aWxsIGFsd2F5cwo+ID4gaGF2
ZSBvbmx5IG9uZSBjb25uZWN0b3IgcGVyIHRjcGMsIGkuZS4gdGhlIHRjcGNpIGFscmVhZHkgcmVw
cmVzZW50cyB0aGUKPiA+IGNvbm5lY3RvciBhbmQgYWxsIGl0cyBjYXBhYmlsaXRpZXMuCj4gPiAK
PiBUaGlzIGlzIG15IG9yaWdpbmFsIGlkZWEsIG15IHVuZGVyc3RhbmRpbmcgaXMgUm9iIGV4cGVj
dHMgdGhvc2UgcHJvcGVydGllcyBzaG91bGQKPiBhcHBseSBmb3IgYSBjb21tb24gdXNiIGNvbm5l
Y3RvciBub2RlWzFdLCB0aGF0IHdheSBJIG5lZWQgYWRkIGEgY2hpbGQgbm9kZSBmb3IgaXQsCj4g
c29ycnkgSSBkaWRuJ3QgbWFrZSB0aGUgZHQtYmluZGluZyBwYXRjaGVzIGNvbWUgZmlyc3QgaW4g
dGhpcyBzZXJpZXMsIHBsZWFzZSBzZWUKPiBwYXRjaCAxMCwxMS4KPiAKPiBbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDIzMTQ0Ny8KCkJ1dCB3YXMgdGhlIGlkZWEgcmVh
bGx5IHRvIHB1dCBwcm9wZXJ0aWVzIGxpa2UgdGhlIFRDUEMgY2FwYWJpbGl0aWVzCnVuZGVyIHRo
ZSB1c2IgY29ubmVjdG9yIGNoaWxkIG5vZGU/IFRoYXQgd2lsbCBmb3JjZSB1cyB0byBleHRyYWN0
CnRoZSBzYW1lIHByb3BlcnRpZXMgaW4gdHdvIGRpZmZlcmVudCBtZXRob2RzIGluIGV2ZXJ5IFVT
QiBUeXBlLUMKZHJpdmVyLiBPbmUgZXh0cmFjdGluZyB0aGVtIGZyb20gRFQsIGFuZCBhbm90aGVy
IGZyb20gb3RoZXIgRlcKaW50ZXJmYWNlcyBhbmQgYnVpbGQtaW4gcHJvcGVydGllcy4KClRvIGF2
b2lkIHRoYXQsIGxldCdzIGp1c3QgZXhwZWN0IHRvIGdldCB0aGVzZSBwcm9wZXJ0aWVzIGluIHRo
ZSBub2RlCmZvciB0Y3BjLCBub3QgdGhlIHVzYiBjb25uZWN0b3IgY2hpbGQuCgoKVGhhbmtzLAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [04/12] usb: host: ehci-r8a77470: Add EHCI support for Renesas RZ/G1C devices
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190401132832.GA21551@kroah.com>
Date: Mon, 1 Apr 2019 15:28:32 +0200
To: Biju Das <biju.das@bp.renesas.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Dmitry Osipenko <digetx@gmail.com>, Jianguo Sun <sunjianguo1@huawei.com>, Avi Fishman <AviFishman70@gmail.com>, Ofer Heifetz <oferh@marvell.com>, Lubomir Rintel <lkundrak@v3.sk>, Ran Wang <ran.wang_1@nxp.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDE6NTM6NDRQTSArMDEwMCwgQmlqdSBEYXMgd3JvdGU6
Cj4gVGhpcyBwYXRjaCBhZGRzIHRoZSBnbHVlIGNvZGUgcmVxdWlyZWQgdG8gZW5zdXJlIHRoZSBv
bi1jaGlwIEVIQ0kKPiBjb250cm9sbGVyIHdvcmtzIG9uIFJaL0cxQyhhLmsuYSBSOEE3NzQ3MCkg
U29DJ3MgZnJvbSBSZW5lc2FzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
c0BicC5yZW5lc2FzLmNvbT4KPiAtLS0KPiBWMS0tPlYyCj4gICAqIE5ldyBwYXRjaAo+IC0tLQo+
ICBkcml2ZXJzL3VzYi9ob3N0L0tjb25maWcgICAgICAgICB8ICAgOSArKwo+ICBkcml2ZXJzL3Vz
Yi9ob3N0L01ha2VmaWxlICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvdXNiL2hvc3QvZWhjaS1y
OGE3NzQ3MC5jIHwgMzI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDMzNyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktcjhhNzc0NzAuYwo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9ob3N0L0tjb25maWcgYi9kcml2ZXJzL3VzYi9ob3N0L0tjb25maWcKPiBpbmRleCBk
ODA5NjcxLi5hNDc0YWE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZwo+
ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QvS2NvbmZpZwo+IEBAIC0yMzcsNiArMjM3LDE1IEBAIGNv
bmZpZyBVU0JfRUhDSV9IQ0RfU1RJCj4gIAkgIEVuYWJsZSBzdXBwb3J0IGZvciB0aGUgb24tY2hp
cCBFSENJIGNvbnRyb2xsZXIgZm91bmQgb24KPiAgCSAgU1RNaWNyb2VsZWN0cm9uaWNzIGNvbnN1
bWVyIGVsZWN0cm9uaWNzIFNvQydzLgo+ICAKPiArY29uZmlnIFVTQl9FSENJX0hDRF9SOEE3NzQ3
MAo+ICsJdHJpc3RhdGUgIlN1cHBvcnQgZm9yIFJlbmVzYXMgUjhBNzc0NzAgb24tY2hpcCBFSENJ
IFVTQiBjb250cm9sbGVyIgo+ICsJZGVwZW5kcyBvbiBBUkNIX1I4QTc3NDcwICYmIE9GCgpDT01Q
SUxFX1RFU1Qgc28gdGhhdCBvdGhlcnMgY2FuIGFsc28gdGVzdC1idWlsZCB0aGlzIHRvIGVuc3Vy
ZSB0aGF0IHdlCmRvIG5vdCBicmVhayBhbnl0aGluZyBvdmVyIHRpbWU/Cgp0aGFua3MsCgpncmVn
IGstaAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,6/9] usb: roles: Find the muxes by also matching against the device node
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190211104629.GE16987@kuha.fi.intel.com>
Date: Mon, 11 Feb 2019 12:46:29 +0200
To: Jun Li <jun.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chen Yu <chenyu56@huawei.com>, Hans de Goede <hdegoede@redhat.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBGZWIgMTEsIDIwMTkgYXQgMDk6NTg6MDRBTSArMDAwMCwgSnVuIExpIHdyb3RlOgo+
IEhpIEhlaWtraSwKPiAKPiA+IEBAIC04NCw3ICs4NSwxMiBAQCBlbnVtIHVzYl9yb2xlIHVzYl9y
b2xlX3N3aXRjaF9nZXRfcm9sZShzdHJ1Y3QKPiA+IHVzYl9yb2xlX3N3aXRjaCAqc3cpICB9ICBF
WFBPUlRfU1lNQk9MX0dQTCh1c2Jfcm9sZV9zd2l0Y2hfZ2V0X3JvbGUpOwo+ID4gCj4gPiAtc3Rh
dGljIGludCBfX3N3aXRjaF9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHZvaWQgKm5h
bWUpCj4gPiArc3RhdGljIGludCBzd2l0Y2hfZndub2RlX21hdGNoKHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3Qgdm9pZCAqZndub2RlKQo+ID4gK3sKPiA+ICsJcmV0dXJuIGRldl9md25vZGUoZGV2
KSA9PSBmd25vZGU7Cj4gCj4gWW91IG1pc3NlZCB0aGUgY29tbWVudAo+IGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDE5LzEvMjIvNDM3Cj4gCj4gcmV0dXJuIGRldl9md25vZGUoZGV2LT5wYXJlbnQp
ID09IGZ3bm9kZTsKClRoYXQncyBhY3R1YWxseSBub3QgdGhlIGNhc2UuIHN0cnVjdCB1c2Jfcm9s
ZV9zd2l0Y2hfZGVzYyBoYXMgYSBtZW1iZXIKZm9yIGZ3bm9kZSwgYW5kIHRoYXQncyB3aGF0IHdl
IHVzZSB3aXRoIHRoZSBhY3R1YWwgbXV4IGRldmljZS4gQ2hlY2sKdXNiX3JvbGVfc3dpdGNoX3Jl
Z2lzdGVyKCk6CgogICAgICAgIC4uLgogICAgICAgIHN3LT5kZXYuZndub2RlID0gZGVzYy0+Zndu
b2RlOwogICAgICAgIC4uLgoKU29ycnkgZm9yIG5vdCByZWFsaXppbmcgaXQgYmVmb3JlLgoKCnRo
YW5rcywK

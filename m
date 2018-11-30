Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,07/15] usb:cdns3: Adds Device mode support - initialization.
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <VI1PR04MB5327227A807B92DDA62CF9038BD30@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date: Fri, 30 Nov 2018 04:20:41 +0000
To: Felipe Balbi <balbi@kernel.org>, Roger Quadros <rogerq@ti.com>, Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

PiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAdGkuY29tPiB3cml0ZXM6Cj4gPj4gK3N0YXRpYyB2b2lk
IGNkbnMzX2dhZGdldF9jb25maWcoc3RydWN0IGNkbnMzX2RldmljZSAqcHJpdl9kZXYpIHsKPiA+
PiArCXN0cnVjdCBjZG5zM191c2JfcmVncyBfX2lvbWVtICpyZWdzID0gcHJpdl9kZXYtPnJlZ3M7
Cj4gPj4gKwo+ID4+ICsJY2RuczNfZXAwX2NvbmZpZyhwcml2X2Rldik7Cj4gPj4gKwo+ID4+ICsJ
LyogZW5hYmxlIGludGVycnVwdHMgZm9yIGVuZHBvaW50IDAgKGluIGFuZCBvdXQpICovCj4gPj4g
Kwl3cml0ZWwoRVBfSUVOX0VQX09VVDAgfCBFUF9JRU5fRVBfSU4wLCAmcmVncy0+ZXBfaWVuKTsK
PiA+PiArCj4gPj4gKwkvKiBlbmFibGUgZ2VuZXJpYyBpbnRlcnJ1cHQqLwo+ID4+ICsJd3JpdGVs
KFVTQl9JRU5fSU5JVCwgJnJlZ3MtPnVzYl9pZW4pOwo+ID4+ICsJd3JpdGVsKFVTQl9DT05GX0NM
SzJPRkZEUyB8IFVTQl9DT05GX0wxRFMsICZyZWdzLT51c2JfY29uZik7Cj4gPj4gKwl3cml0ZWwo
VVNCX0NPTkZfRE1VTFQsICZyZWdzLT51c2JfY29uZik7Cj4gPj4gKwl3cml0ZWwoVVNCX0NPTkZf
REVWRU4sICZyZWdzLT51c2JfY29uZik7Cj4gPgo+ID4gSWYgeW91IGFyZSBlbmFibGluZyBpbnRl
cnJ1cHRzIGluIHRoaXMgcGF0Y2ggeW91IHNob3VsZCBoYW5kbGUgdGhlbSBpbiB0aGUgSVNSLgo+
IAo+IEZyYW5rbHksIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhpcyBpcyBhIHNlcmllcy4gSXQn
cyBhIHNpbmdsZSBkcml2ZXIgYW5kIHNwbGl0dGluZyBpdCBpbnRvCj4gYSBzZXJpZXMganVzdCBt
YWtlcyBpdCBtb3JlIGRpZmZpY3VsdCB0byByZXZpZXcsIGFjdHVhbGx5Lgo+IAo+IFN1cmUsIGEg
c2luZ2xlIHBhdGNoIHdpbGwgYmUgbGFyZ2UsIGJ1dCB0aGVyZSdzIG5vIHdheSB0byBoYXZlIGEg
ZnVuY3Rpb25hbCBkcml2ZXIgdW50aWwKPiBhbGwgcGF0Y2hlcyBhcmUgYXBwbGllZCwgYW55d2F5
Lgo+IAoKWWVzLCBJIGFncmVlIHdpdGggRmVsaXBlLiBQYXdlbCwgeW91IGNvdWxkIHJlbW92ZSB0
aGUgIlJGQyIgcHJlZml4LCBhbmQgc2VuZCB0aGUgd2hvbGUKb25lIGFzIG9uZSBwYXRjaC4gSSB3
aWxsIHRlc3QgaXQgYXQgbXkgaGFyZHdhcmUuCgpQZXRlcgo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/2] usb:cdns3 Add Cadence USB3 DRD Driver
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <VI1PR04MB53277D6C8BAFD2ABCD76DB9D8BA00@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date: Thu, 13 Dec 2018 01:21:29 +0000
To: Bin Liu <b-liu@ti.com>, Peter Chen <hzpeterchen@gmail.com>
Cc: "pawell@cadence.com" <pawell@cadence.com>, "balbi@kernel.org" <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

PiA+Cj4gPiBGZWxpcGUsIEkgdXNlIER5bmFtaWMgRGVidWcgZm9yIGRlYnVnZ2luZywgYW5kIHNo
b3cgZGVidWcgbWVzc2FnZXMKPiA+IHdpdGggImRtZXNnIiBhZnRlciB0ZXN0aW5nL2RlYnVnZ2lu
Zy4gSSBzZWUgZHdjMyB1c2luZyB0cmFjZSwgIGFueQo+ID4gYmVuZWZpdHMgZm9yIHN3aXRjaGlu
ZyB0byB0cmFjZT8KPiAKPiBUaGUgYmVuZWZpdHMgSSBzZWUgYXJlCj4gCgpUaGFua3MsIGJpbi4K
Cj4gLSAqYnkgZGVmYXVsdCosIHRoZSBkZWJ1ZyBsb2cgZG9lc24ndCBoYXZlIHRvIGdvIHRocm91
Z2ggdWFydCBjb25zb2xlLAo+ICAgd2hpY2ggaXMgc2xvdy4KPiAKPiAgIEkgdHlwaWNhbGx5ICdj
YXQgdHJhY2VfcGlwZScgZnJvbSBhIHRlbG5ldCB3aGljaCBpcyBtdWNoIGZhc3RlciB0aGVuCj4g
ICB1YXJ0LiBCdXQgRHluYW1pYyBEZWJ1ZyBsb2cgYnkgZGVmYXVsdCBnb3QgcHJpbnRlZCBvbiB1
YXJ0LCBJIGhhdmUgdG8KPiAgIHNldCBwcmludGsgbGV2ZWwgdG8gbm90IHByaW50IHRoZW0sIHdo
aWNoIGlzIGFuIGV4dHJhIHN0ZXAuCj4gCgpJdCBkZXBlbmRzIG9uIHRoZSByb290ZnMncyBzZXR0
aW5nLiBCeSBkZWZhdWx0LCB0aGUgZGVidWcgbWVzc2FnZSBsZXZlbCBzaG91bGQgYmUgb2ZmICgK
Y29uc29sZSBsZXZlbCA9IDcpCgo+IC0gdHJhY2Vwb2ludCB1c2VzIG9uZSBwbGFjZSB0byBkZWNv
ZGUgdGhlIG1lc3NhZ2UgdnMgREQgaGFzIHRvIHJlcGVhdAo+ICAgdGhlIHNpbWlsYXIgcHJpbnQg
c3RhdGVtZW50IGluIHRoZSBjb2RlOyBhbmQgdHJhY2Vwb2ludCBkZWNvZGVzIGl0Cj4gICBvZmZs
aW5lIHdoaWNoIHJlZHVjZSB0aGUga2VybmVsIHJ1bnRpbWUgb3ZlcmhlYWQgdG9vLgo+IAoKb2Zm
bGluZT8gWW91IG1lYW4gd2hlbiB5b3UgcnVuICJjYXQgdHJhY2VfcGlwZSI/Cgo+IC0gd2l0aCB0
cmFjZXBvaW50LCBpdCBpcyBlYXNpZXIgdG8gdHVybiBvbiBkZWJ1ZyBmb3IgYSBzcGVjaWZpYyBn
cm91cCBvZgo+ICAgbWVzc2FnZXMuCj4gCgpUaGUgREQgY2FuLCBidXQgd2UgZG9uJ3QgZG8gaXQg
b2Z0ZW4uCgpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9hZG1pbi1ndWlk
ZS9keW5hbWljLWRlYnVnLWhvd3RvLmh0bWw/aGlnaGxpZ2h0PWR5bmFtaWMlMjBkZWJ1ZwoKPiAt
IHlvdSBjYW4gYWRqdXN0IHRoZSBmdHJhY2UgYnVmZmVyIHNpemUgYXQgcnVudGltZS4gY2FuIHdl
IGRvIHRoYXQgZm9yCj4gICBwcmludGs/IEkgZG9uJ3QgcmVtZW1iZXIuCgpJdCBtYXkgY2FuJ3Qu
IFRoZSBsb2cgYnVmIGNhbiBvbmx5IGJlIGNoYW5nZWQgYnkgYm9vdGFyZ3M6IGxvZ19idWZfbGVu
CgpQZXRlcgo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/2] usb:cdns3 Add Cadence USB3 DRD Driver
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <VI1PR04MB5327B1CB6C6BC7D293701F1D8BA70@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date: Wed, 12 Dec 2018 07:38:11 +0000
To: Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "pawell@cadence.com" <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

PiA+PiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVTQl9D
TURfU1RNT0RFIHwKPiA+PiA+PiArCj4gPj4gPj4gKyBVU0JfU1RTX1RNT0RFX1NFTCh0bW9kZSAt
IDEpKTsKPiA+PiA+Cj4gPj4gPkknbSA5MCUgc3VyZSB0aGlzIHdvbid0IHdvcmsuIFRoZXJlJ3Mg
YSByZWFzb24gd2h5IHdlIG9ubHkgZW50ZXIgdGhlCj4gPj4gPnJlcXVlc3RlZCB0ZXN0IG1vZGUg
ZnJvbSBzdGF0dXMgc3RhZ2UuIEhvdyBoYXZlIHlvdSB0ZXN0ZWQgdGhpcz8KPiA+Pgo+ID4KPiA+
IFdoYXQncyB0aGUgcmVhc29uPwo+ID4gSXQgY2FuIHdvcmsgYWx0aG91Z2ggdGhlIGNvZGUgaXMg
YSBsaXR0bGUgZGlmZmVyZW50IHdpdGggYWJvdmUsIEkKPiA+IHRlc3RlZCBpdCB1c2luZyBVU0J4
SFNFVFQgdG9vbCBhdCBXaW5kb3dzLgo+IAo+IHB1dCBhIHNuaWZmZXIuIFN0YXR1cyBzdGFnZSB3
b24ndCBjb21wbGV0ZQo+IAoKT2ssIHlvdSBtZWFuIHNlbmRpbmcgdGVzdCBwYWNrZXQgZHVyaW5n
IHRoZSBzdGF0dXMgY29tcGxldGlvbiBoYW5kbGVyPwpJIHdpbGwgc2VlIHdoZXRoZXIgdGhlIHN0
YXR1cyBzdGFnZSBjYW4gY29tcGxldGUgbmV4dCB0aW1lIHdoZW4gZG9pbmcgdGVzdC4KCj4gPj4g
Pj4gKyAgICBpcnFyZXR1cm5fdCByZXQgPSBJUlFfTk9ORTsKPiA+PiA+PiArICAgIHVuc2lnbmVk
IGxvbmcgZmxhZ3M7Cj4gPj4gPj4gKyAgICB1MzIgcmVnOwo+ID4+ID4+ICsKPiA+PiA+PiArICAg
IHByaXZfZGV2ID0gY2Rucy0+Z2FkZ2V0X2RldjsKPiA+PiA+PiArICAgIHNwaW5fbG9ja19pcnFz
YXZlKCZwcml2X2Rldi0+bG9jaywgZmxhZ3MpOwo+ID4+ID4KPiA+PiA+eW91J3JlIGFscmVhZHkg
cnVubmluZyBpbiBoYXJkaXJxIGNvbnRleHQuIFdoeSBkbyB5b3UgbmVlZCB0aGlzIGxvY2sKPiA+
PiA+YXQgYWxsPyBJIHdvdWxkIGJlIGJldHRlciB0byB1c2UgdGhlIGhhcmRpcnEgaGFuZGxlciB0
byBtYXNrIHlvdXIKPiA+PiA+aW50ZXJydXB0cywgc28gdGhleSBkb24ndCBmaXJlIGFnYWluLCB0
aGVuIHVzZWQgdGhlIHRvcC1oYWxmCj4gPj4gPihzb2Z0aXJxKSBoYW5kbGVyIHRvIGFjdHVhbGx5
IGhhbmRsZSB0aGUgaW50ZXJydXB0cy4KPiA+Pgo+ID4KPiA+IFRoaXMgY29udHJvbGxlciBtYXkg
YmUgcmFuIGF0IFNNUCBlbnZpcm9ubWVudCwgcmVnaXN0ZXIgYW5kIGZsYWcKPiA+IGFjY2VzcyBu
ZWVkcyB0byBiZSBwcm90ZWN0ZWQgYW1vbmcgQ1BVcyBydW5uaW5nLgo+IAo+IGluIGhhcmRpcnEg
Y29udGV4dD8gV2hlbiBpbnRlcnJ1cHRzIGFyZSBhbHJlYWR5IGRpc2FibGVkPwoKSW50ZXJydXB0
IGhhbmRsZXIgKGhhcmRpcnEgY29udGV4dCkgYXQgQ1BVMCwgYW5kIHByb2Nlc3MgYXQgQ1BVMSwg
ZWcgcm9sZSBzd2l0Y2gsIHVubG9hZCBtb2R1bGUsIGV0Yy4KClBldGVyCg==

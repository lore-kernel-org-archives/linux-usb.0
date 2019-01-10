Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,5/5] usb:cdns3 Add Cadence USB3 DRD Driver
From: Pawel Laszczak <pawell@cadence.com>
Message-Id: <BYAPR07MB4709A8E20953E24E67A801EADD840@BYAPR07MB4709.namprd07.prod.outlook.com>
Date: Thu, 10 Jan 2019 07:18:50 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

SGksIAoKPk9uIFRodSwgSmFuIDEwLCAyMDE5IGF0IDA5OjMwOjQxQU0gKzA4MDAsIFBldGVyIENo
ZW4gd3JvdGU6Cj4+IE9uIE1vbiwgRGVjIDI0LCAyMDE4IGF0IDEyOjQ0IEFNIFBhd2VsIExhc3pj
emFrIDxwYXdlbGxAY2FkZW5jZS5jb20+IHdyb3RlOgo+PiAtIGRlYnVnZnMgaXMgbmljZSB0byBo
YXZlIGZlYXR1cmUsIEkgc3VnZ2VzdCByZW1vdmluZyBpdCBhdCB0aGlzCj4+IGluaXRpYWwgdmVy
c2lvbi4gQmVzaWRlcywgcm9sZSBzd2l0Y2gKPj4gdGhyb3VnaCAvc3lzIGlzIG5vcm1hbCBmZWF0
dXJlLCB0aGUgZW5kIHVzZXIgbWF5IHVzZSBpdCBhdCByZWFsCj4+IHByb2R1Y3QsIHNvLCBpdCBp
cyBiZXR0ZXIgYXQgZGV2aWNlJ3MKPj4gL3N5cyBlbnRyeSBpbnN0ZWFkIG9mIGRlYnVnZnMuCj4+
Cj4+IC0gSSBkb24ndCBrbm93IHdoeSB5b3UgYWRkICJkaXNhYmxlIiBhdCBkZWJ1Z2ZzLCBwbGVh
c2UgY29tbWVudC4KPgo+QXMgeW91IGltcGx5IGhlcmUsIG5vIHJlYWwtd29ybGQgZnVuY3Rpb25h
bGl0eSBzaG91bGQgZXZlciBiZSBpbgo+ZGVidWdmcyBhcyBpdCBpcyBhbiBvcHRpb25hbCBzeXN0
ZW0gY29tcG9uZW50IGFuZCBrZXJuZWwgY29kZSBzaG91bGQKPndvcmsganVzdCBmaW5lIHdpdGhv
dXQgaXQgYmVpbmcgZW5hYmxlZCAoYXMgbW9yZSBhbmQgbW9yZSBzeXN0ZW1zIGFyZQo+ZGlzYWJs
aW5nIGl0IGR1ZSB0byB0aGUgb2J2aW91cyBzZWN1cml0eSBwcm9ibGVtcyBpdCBoYXMuKQo+CiJk
aXNhYmxlIiBpdCdzIG5vdCByZXF1aXJlZC4gSXQncyB1c2VkIGZvciB0ZXN0aW5nLiBJdCBhbGxv
d3MgdG8gZW5hYmxlL2Rpc2FibGUgdGhlIGN1cnJlbnQgcm9sZS4KSXQgY2FuIGJlIHVzZWQgZm9y
IHRlc3RpbmcgZWcuIGNvbm5lY3QvZGlzY29ubmVjdCBldmVudC4gCgpJIG1haW5seSB0ZXN0IHRo
ZSBkcml2ZXIgcmVtb3RlbHkgYW5kIEkgY2FuJ3QgZG8gY29ubmVjdC9kaXNjb25uZWN0IGJ5IFVT
QiBjYWJsZS4gCiJkaXNhYmxlIiBhbGxvdyBtZSB0byBnZXQgdHJhY2UgbG9nIGZyb20gaG9zdC9k
ZXZpY2Ugd2l0aG91dCBkaXNjb25uZWN0aW5nIGNhYmxlOgpJJ20gdXNpbmcgdGhlIGZhbGxvd2lu
ZyBzZXF1ZW5jZToKIC0gbG9hZCBjZG5zMy5rbyBtb2R1bGVzIAogLSBlY2hvIDEgPiBkaXNhYmxl
IC0gZGlzYWJsZSBjdXJyZW50IHJvbGUKIC0gZWNobyBjZG5zMzoqIHRyYWNpbmcvc2V0X2V2ZW50
IAogLSBlY2hvIDAgPiBkaXNhYmxlICAtIGVuYWJsZSByb2xlIGFnYWluIAogLSBjYXQgdHJhY2lu
Zy90cmFjZS4gCgpQYXdlbAo=

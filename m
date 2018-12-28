Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,5/5] usb:cdns3 Add Cadence USB3 DRD Driver
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <VI1PR04MB53274270615A700AB36967F78BB70@VI1PR04MB5327.eurprd04.prod.outlook.com>
Date: Fri, 28 Dec 2018 01:31:27 +0000
To: Pawel Laszczak <pawell@cadence.com>, Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

PiA+DQo+ID5AQCAtMjk5LDYgKzMwNiw3IEBAIGludCBjZG5zM19kcmRfaW5pdChzdHJ1Y3QgY2Ru
czMgKmNkbnMpDQo+ID4gICAgICAgICAgICAgICAgY2Rucy0+dmVyc2lvbiAgPSBDRE5TM19DT05U
Uk9MTEVSX1YwOw0KPiA+ICAgICAgICAgICAgICAgIGNkbnMtPm90Z192MV9yZWdzID0gTlVMTDsN
Cj4gPiAgICAgICAgICAgICAgICBjZG5zLT5vdGdfcmVncyA9IHJlZ3M7DQo+ID4rICAgICAgICAg
ICAgICAgd3JpdGVsKDB4MSwgJmNkbnMtPm90Z192MF9yZWdzLT5zaW11bGF0ZSk7DQo+ID4gICAg
ICAgICAgICAgICAgZGV2X2luZm8oY2Rucy0+ZGV2LCAiRFJEIHZlcnNpb24gdjAgKCUwOHgpXG4i
LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJlYWRsKCZjZG5zLT5vdGdfdjBfcmVncy0+
dmVyc2lvbikpOw0KPiA+ICAgICAgICB9IGVsc2Ugew0KPiANCj4gSSBoYXZlIGNvbmZpcm1hdGlv
biBmcm9tIEhXIHRlYW0gdGhhdCB0aW1lIHRoYXQgZHJpdmVyIHNob3VsZCB3YWl0IGFmdGVyIGRl
LQ0KPiBzZWxlY3RpbmcgbW9kZSBpcyAyLTNtcyBmb3Igc2ltdWxhdGUgbW9kZS4gSXQncyB0aW1l
IHdoZW4gRlNNIGlzIGluDQo+IERSRF9IX1dBSVRfVkJVU19GQUlMLg0KPiBEcml2ZXIgY2Fubm90
IHJlLWVuYWJsZSB0aGUgaG9zdC9kZXZpY2UgbW9kZSBiZWZvcmUgdGhpcyB0aW1lIGhhcyBlbGFw
c2VkLg0KPiANCj4gMyBtcyBpcyB0aGUgbWF4aW11bSB0aW1lLiBBZGRpdGlvbmFsbHksIHlvdSBj
YW4gY29uZmlybSB0aGUgY3VycmVudCBGU00gc3RhdGUgYnkNCj4gcmVhZGluZyB0aGUgaG9zdF9v
dGdfc3RhdGUgKGJpdCA1OjMpIG9yIGRldl9vdGdfc3RhdGUgKDI6MCkgIGZyb20gT1RHU1RBVEUN
Cj4gcmVnaXN0ZXIuDQo+IA0KPiBJZiBiaXQgMCBpbiBzaW11bGF0ZSByZWdpc3RlciBpcyBjbGVh
cmVkIHRoZSB0aW1lIGlzIGV4YWN0bHkgMXMuDQo+IA0KDQpUaGFua3MsIFBhd2VsLg0KDQpXb3Vs
ZCB5b3UgcGxlYXNlIGFkZCBiZWxvdyBjaGFuZ2VzIGluIHlvdXIgbmV4dCByZXZpc2lvbj8NCi0g
U2V0IGJpdCAwIGluIHNpbXVsYXRlIHJlZ2lzdGVyDQotIHRpbWVvdXQgbG9naWMgZm9yIHdhaXRp
bmcgaG9zdF9vdGdfc3RhdGUgb3IgZGV2X290Z19zdGF0ZSBhdCBPVEdTVEFURQ0Kd2hlbiBzd2l0
Y2ggdG8gaG9zdCBvciBkZXZpY2UuDQoNClBldGVyCg==

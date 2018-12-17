Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/2] usb:cdns3 Add Cadence USB3 DRD Driver
From: Pawel Laszczak <pawell@cadence.com>
Message-Id: <BYAPR07MB47093D9B4AFA4BFAF11C43AFDDBC0@BYAPR07MB4709.namprd07.prod.outlook.com>
Date: Mon, 17 Dec 2018 05:46:43 +0000
To: Kishon Vijay Abraham I <kishon@ti.com>, Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

SGksDQoNCj4NCj5PbiAxMi8xMi8xOCAxMjoyMiBQTSwgRmVsaXBlIEJhbGJpIHdyb3RlOg0KPj4N
Cj4+IEhpDQo+Pg0KPj4gUGF3ZWwgTGFzemN6YWsgPHBhd2VsbEBjYWRlbmNlLmNvbT4gd3JpdGVz
Og0KPj4+Pj4gKwljZG5zLT5waHkgPSBkZXZtX3BoeV9nZXQoZGV2LCAiY2RuczMsdXNicGh5Iik7
DQo+Pj4+PiArCWlmIChJU19FUlIoY2Rucy0+cGh5KSkgew0KPj4+Pj4gKwkJcmV0ID0gUFRSX0VS
UihjZG5zLT5waHkpOw0KPj4+Pj4gKwkJaWYgKHJldCA9PSAtRU5PU1lTIHx8IHJldCA9PSAtRU5P
REVWKSB7DQo+Pj4+DQo+Pj4+IEFyZSB5b3Ugc3VyZSB5b3UgY2FuIGdldCBFTk9TWVMgaGVyZT8g
SGF2ZSB5b3UgY2hlY2tlZCBvdXRwdXQgb2YNCj4+Pj4gY2hlY2twYXRjaCAtLXN0cmljdD8NCj4+
Pj4gLTo4NTI6IFdBUk5JTkc6IEVOT1NZUyBtZWFucyAnaW52YWxpZCBzeXNjYWxsIG5yJyBhbmQg
bm90aGluZyBlbHNlDQo+Pj4NCj4+PiBZZXMgdGhpcyBlcnJvciBjb2RlIGNhbiBiZSByZXR1cm5l
ZCBieSByZWxhdGVkIHRvIHBoeSBmdW5jdGlvbiBpZg0KPj4+IENPTkZJR19HRU5FUklDX1BIWSBp
cyBkaXNhYmxlZC4NCj4+Pg0KPj4+IEkgaGF2ZSBzZWVuIHRoaXMgd2FybmluZyBpbiBvdXRwdXQg
b2YgY2hlY2twYXRjaCAtLXN0cmljdCAuDQo+Pg0KPj4gS2lzaG9uLCBzZWVtcyBsaWtlIHlvdSBz
aG91bGRuJ3QgYmUgdXNpbmcgdGhhdCBlcnJvciB2YWx1ZS4NCj4NCj5obW0sIHllYWggc2hvdWxk
IGNoYW5nZSB0aGUgcmV0dXJuIHZhbHVlIHRvIC1FTk9ERVYgd2hlbiBHRU5FUklDX1BIWSBpcyBk
aXNhYmxlZC4NCj4NCg0KU28gSSB3aWxsIHJlbW92ZSB0aGlzIEVOT1NZUyBmcm9tIG5leHQgcGF0
Y2guIEkgYXNzdW1lIHRoYXQgaXQgd2lsbCBiZSByZW1vdmVkIGFsc28gZnJvbSBnZW5lcmljIHBo
eSBkcml2ZXIuIA0KDQpUaGFua3MsDQpQYXdlbAo=

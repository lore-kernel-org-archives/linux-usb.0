Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,v2,05/15] usb:cdns3: Added DRD support
From: Pawel Laszczak <pawell@cadence.com>
Message-Id: <BYAPR07MB470901107F1435424D8B0727DDD00@BYAPR07MB4709.namprd07.prod.outlook.com>
Date: Tue, 27 Nov 2018 11:29:45 +0000
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgUm9nZXIKCj4+PiBQYXRjaCBhZGRzIHN1cHBvcnRzIGZvciBkZXRlY3RpbmcgSG9zdC9EZXZp
Y2UgbW9kZS4KPj4+ICsKPj4+ICtzdGF0aWMgaW50IGNkbnMzX290Z19nZXRfaWQoc3RydWN0IGNk
bnMzICpjZG5zKQo+Pj4gK3sKPj4+ICsJaW50IGlkOwo+Pj4gKwo+Pj4gKwlpZCA9IHJlYWRsKCZj
ZG5zLT5vdGdfcmVncy0+c3RzKSAmIE9UR1NUU19JRF9WQUxVRTsKPj4+ICsJZGV2X2RiZyhjZG5z
LT5kZXYsICJPVEcgSUQ6ICVkIiwgaWQpOwo+Pj4gKwlyZXR1cm4gaWQ7Cj4+PiArfQo+Pj4gKwo+
Pj4gK2ludCBjZG5zM19pc19ob3N0KHN0cnVjdCBjZG5zMyAqY2RucykKPj4+ICt7Cj4+PiArCWlm
IChjZG5zLT5jdXJyZW50X2RyX21vZGUgPT0gVVNCX0RSX01PREVfSE9TVCkKPj4+ICsJCXJldHVy
biAxOwo+Pgo+PldoeSBkbyB5b3UgbmVlZCB0aGlzPwo+Cj5JIGFzc3VtZWQgdGhhdCBzb21lIFNv
QyBjb3VsZCBoYXZlIGN1dCBEUkQgL09URyBhbmQgRGV2aWNlIG9yIEhvc3QgcGFydC4KPkluIHN1
Y2ggY2FzZSB0aGUgZHJpdmVyIGNhbm5vdCBiZSBiYXNlZCBvbiBJRCBwaW4uCj5Gb3Igb25seSBI
T1NUIGl0J3Mgbm90IGEgcHJvYmxlbSBiZWNhdXNlCj50aGUgc3RhbmRhcmQgWEhDSSBkcml2ZXIg
d2lsbCBiZSB1c2VkLiAgUHJvYmFibHkgSSB3aWxsIHJlbW92ZSB0aGlzIGZyYWdtZW50LgoKSSd2
ZSByZW1vdmVkIHRoaXMgY29uZGl0aW9uIGJ1dCBpdCBpcyBuZWNlc3NhcnkgYW5kIEkndmUgIHJl
c3RvcmVkIGl0IGFnYWluLiAKV2hlbiBkcml2ZXIgd29ya3MgaW4gb25seSBIT1NUIG1vZGUgdGhl
biBJRCBpcyBhbHdheXMgMC4gCkZvciBjdXJyZW50X2RyX21vZGUgPT0gVVNCX0RSX01PREVfSE9T
VCBkcml2ZXIgaGFzIHRvIGp1c3Qgc2ltcGxlIApyZXR1cm5zIDEuICAKY3VycmVudF9kcl9tb2Rl
ICBjYW4gYmUgY2hhbmdlZCBmcm9tIHVzZXIgc3BhY2UgZGVwZW5kaW5nIG9uIGRyX21vZGUgZmll
bGQuIAoKSSBoYXZlIHRoZSBhZGRpdGlvbmFsIHF1ZXN0aW9uLiBCZWNhdXNlIEkgaGF2ZSBtYW55
IGNoYW5nZXMgaW4gc291cmNlIGNvZGUgaWYgSSBzaG91bGQgCnBvc3QgdGhlIG5leHQgUkZDIFBB
VENIIHYzIG9yIHNob3VsZCBJIHdhaXQgZm9yIGNvbW1lbnRzIGZvciByZXN0IHBhdGNoZXMgPwoK
Pj4KPj4+ICsJZWxzZSBpZiAoY2Rucy0+Y3VycmVudF9kcl9tb2RlID09IFVTQl9EUl9NT0RFX09U
RykKPj4+ICsJCWlmICghY2RuczNfb3RnX2dldF9pZChjZG5zKSkKPj4+ICsJCQlyZXR1cm4gMTsK
Pj4+ICsKPj4+ICsJcmV0dXJuIDA7Cj4+PiArfQo+Pj4gKwpUaGFua3MsCkNoZWVycywKUGF3ZWwK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,01/12] drivers: base: Unified device connection lookup
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75Vc4CF_Vn90FdFKwBf7egPNHvEWa=mja8w4SarKaW2KZRw@mail.gmail.com>
Date: Thu, 1 Mar 2018 11:32:47 +0200
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jun Li <jun.li@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBNYXIgMSwgMjAxOCBhdCA5OjI4IEFNLCBIZWlra2kgS3JvZ2VydXMKPGhlaWtraS5r
cm9nZXJ1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IEhpLAo+Cj4gT24gVGh1LCBNYXIgMDEs
IDIwMTggYXQgMTI6NTY6NTdBTSArMDAwMCwgSnVuIExpIHdyb3RlOgo+PiA+ICtzdHJ1Y3QgZGV2
aWNlICpkZXZpY2VfZmluZF9jb25uZWN0aW9uKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hh
cgo+PiA+ICsqY29uX2lkKSB7Cj4+ID4gKyAgIHJldHVybiBfX2RldmljZV9maW5kX2Nvbm5lY3Rp
b24oZGV2LCBjb25faWQsIGdlbmVyaWNfbWF0Y2gsIE5VTEwpOyB9Cj4+Cj4+IC0gICAgICAgcmV0
dXJuIF9fZGV2aWNlX2ZpbmRfY29ubmVjdGlvbihkZXYsIGNvbl9pZCwgZ2VuZXJpY19tYXRjaCwg
TlVMTCk7Cj4+ICsgICAgICAgcmV0dXJuIF9fZGV2aWNlX2ZpbmRfY29ubmVjdGlvbihkZXYsIGNv
bl9pZCwgTlVMTCwgZ2VuZXJpY19tYXRjaCk7Cj4KPiBHb29kIGNhdGNoIQoKSXQgc2VlbXMgSSBw
cm9wb3NlZCB0byBwdXQgZnVuY3Rpb24gZmlyc3QgcGFyYW1ldGVyIGZvbGxvd2VkIGJ5IG9wYXF1
ZQpkYXRhIHBvaW50ZXIgZm9yIGl0LgpJbiB0aGF0IGNhc2UgaXQgd291bGQgYmUgZXhhY3RseSBs
aWtlIG5vdy4KClRob3VnaCwgSSBkaWRuJ3QgY2hlY2sgaWYgdGhlIHBhcmFtZXRlciBvcmRlcmlu
ZyB3YXMgY2hhbmdlZCBpbiB0aGUgcHJvdG90eXBlLgo=

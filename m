Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,01/12] drivers: base: Unified device connection lookup
From: Hans de Goede <hdegoede@redhat.com>
Message-Id: <bcf738d9-0bcb-42f8-d706-c2e72a150720@redhat.com>
Date: Thu, 1 Mar 2018 10:45:26 +0100
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jun Li <jun.li@nxp.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiAwMS0wMy0xOCAxMDozMiwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9uIFRodSwg
TWFyIDEsIDIwMTggYXQgOToyOCBBTSwgSGVpa2tpIEtyb2dlcnVzCj4gPGhlaWtraS5rcm9nZXJ1
c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gVGh1LCBNYXIgMDEsIDIw
MTggYXQgMTI6NTY6NTdBTSArMDAwMCwgSnVuIExpIHdyb3RlOgo+Pj4+ICtzdHJ1Y3QgZGV2aWNl
ICpkZXZpY2VfZmluZF9jb25uZWN0aW9uKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhcgo+
Pj4+ICsqY29uX2lkKSB7Cj4+Pj4gKyAgIHJldHVybiBfX2RldmljZV9maW5kX2Nvbm5lY3Rpb24o
ZGV2LCBjb25faWQsIGdlbmVyaWNfbWF0Y2gsIE5VTEwpOyB9Cj4+Pgo+Pj4gLSAgICAgICByZXR1
cm4gX19kZXZpY2VfZmluZF9jb25uZWN0aW9uKGRldiwgY29uX2lkLCBnZW5lcmljX21hdGNoLCBO
VUxMKTsKPj4+ICsgICAgICAgcmV0dXJuIF9fZGV2aWNlX2ZpbmRfY29ubmVjdGlvbihkZXYsIGNv
bl9pZCwgTlVMTCwgZ2VuZXJpY19tYXRjaCk7Cj4+Cj4+IEdvb2QgY2F0Y2ghCj4gCj4gSXQgc2Vl
bXMgSSBwcm9wb3NlZCB0byBwdXQgZnVuY3Rpb24gZmlyc3QgcGFyYW1ldGVyIGZvbGxvd2VkIGJ5
IG9wYXF1ZQo+IGRhdGEgcG9pbnRlciBmb3IgaXQuCj4gSW4gdGhhdCBjYXNlIGl0IHdvdWxkIGJl
IGV4YWN0bHkgbGlrZSBub3cuCgpZZXMsIGJ1dCBhcyBtZW50aW9uZWQgSSBkZWNpZGVkIHRvIGtl
ZXAgaXQgYXMgaXMsIHNvIHRoaXMgaXMgcmVhbGx5IGEgYnVnLAp3aWxsIGZpeCBmb3IgdjYuCgpS
ZWdhcmRzLAoKSGFucwotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhl
IGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRv
IG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDov
L3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==

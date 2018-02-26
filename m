Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,01/12] drivers: base: Unified device connection lookup
From: Randy Dunlap <rdunlap@infradead.org>
Message-Id: <3a6850c4-7c54-c889-a7d0-347b8df65d31@infradead.org>
Date: Mon, 26 Feb 2018 11:34:43 -0800
To: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gMDIvMjYvMjAxOCAxMDozOSBBTSwgSGFucyBkZSBHb2VkZSB3cm90ZToKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9jb25uZWN0aW9uLmggYi9pbmNsdWRlL2xpbnV4L2Nvbm5lY3Rpb24u
aAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wYjQ0MzBlYWU1
M2EKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9saW51eC9jb25uZWN0aW9uLmgKPiBA
QCAtMCwwICsxLDMzIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4g
Kwo+ICsjaWZuZGVmIF9MSU5VWF9DT05ORUNUSU9OX0hfCj4gKyNkZWZpbmUgX0xJTlVYX0NPTk5F
Q1RJT05fSF8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9saXN0Lmg+Cj4gKwo+ICtzdHJ1Y3QgZGV2
aWNlOwo+ICsKPiArLyoqCj4gKyAqIHN0cnVjdCBkZXZjb24gLSBEZXZpY2UgQ29ubmVjdGlvbiBE
ZXNjcmlwdG9yCj4gKyAqIEBlbmRwb2ludDogVGhlIG5hbWVzIG9mIHRoZSB0d28gZGV2aWNlcyBj
b25uZWN0ZWQgdG9nZXRoZXIKPiArICogQGlkOiBVbmlxdWUgaWRlbnRpZmllciBmb3IgdGhlIGNv
bm5lY3Rpb24KCkhpLAogKiBAbGlzdDogPGRlc2NyaXB0aW9uPgppcyBtaXNzaW5nIGFib3ZlLgoK
PiArICovCj4gK3N0cnVjdCBkZXZjb24gewo+ICsJY29uc3QgY2hhcgkJKmVuZHBvaW50WzJdOwo+
ICsJY29uc3QgY2hhcgkJKmlkOwo+ICsJc3RydWN0IGxpc3RfaGVhZAlsaXN0Owo+ICt9Owo=

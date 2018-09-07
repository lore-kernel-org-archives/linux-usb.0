Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V6] roles: Fix USB 3.0 OTG issue on Intel platform
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180907083741.GA15556@kroah.com>
Date: Fri, 7 Sep 2018 10:37:41 +0200
To: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: "Gopal, Saranya" <saranya.gopal@intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, "K V, Abhilash" <abhilash.k.v@intel.com>, "Balaji, M" <m.balaji@intel.com>
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBTZXAgMDcsIDIwMTggYXQgMTE6MzM6MjNBTSArMDMwMCwgRmVsaXBlIEJhbGJpIHdy
b3RlOgo+IAo+IEhpIEdyZWcsCj4gCj4gIkdvcGFsLCBTYXJhbnlhIiA8c2FyYW55YS5nb3BhbEBp
bnRlbC5jb20+IHdyaXRlczoKPiA+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9yb2xlcy9p
bnRlbC14aGNpLXVzYi1yb2xlLXN3aXRjaC5jCj4gPj4gYi9kcml2ZXJzL3VzYi9yb2xlcy9pbnRl
bC14aGNpLXVzYi1yb2xlLXN3aXRjaC5jCj4gPj4gPiBpbmRleCBkYWQyZDE5Li4wZDFlYTgyIDEw
MDY0NAo+ID4+ID4gLS0tIGEvZHJpdmVycy91c2Ivcm9sZXMvaW50ZWwteGhjaS11c2Itcm9sZS1z
d2l0Y2guYwo+ID4+ID4gKysrIGIvZHJpdmVycy91c2Ivcm9sZXMvaW50ZWwteGhjaS11c2Itcm9s
ZS1zd2l0Y2guYwo+ID4+ID4gQEAgLTI1LDYgKzI1LDkgQEAKPiA+PiA+ICAjZGVmaW5lIFNXX1ZC
VVNfVkFMSUQJCQlCSVQoMjQpCj4gPj4gPiAgI2RlZmluZSBTV19JRFBJTl9FTgkJCUJJVCgyMSkK
PiA+PiA+ICAjZGVmaW5lIFNXX0lEUElOCQkJQklUKDIwKQo+ID4+ID4gKyNkZWZpbmUgU1dfU1dJ
VENIX0VOX0NGRzAJCUJJVCgxNikKPiA+PiAKPiA+PiBXaHkgaXMgdGhpcyBub3QgaW4gdGhlIGNv
cnJlY3Qgc29ydGVkIG9yZGVyIHdpdGggdGhlIGl0ZW1zIGFib3ZlIGl0Pwo+IAo+IHRoZXkgYXJl
IHNvcnRlZCBpbiBkZXNjZW5kaW5nIG9yZGVyLgo+IAo+IC8qIHJlZ2lzdGVyIGRlZmluaXRpb24g
Ki8KPiAjZGVmaW5lIERVQUxfUk9MRV9DRkcwCQkJMHg2OAo+ICNkZWZpbmUgU1dfVkJVU19WQUxJ
RAkJCUJJVCgyNCkKPiAjZGVmaW5lIFNXX0lEUElOX0VOCQkJQklUKDIxKQo+ICNkZWZpbmUgU1df
SURQSU4JCQlCSVQoMjApCgpVZ2gsIHlvdSBhcmUgcmlnaHQsIHRoYXQncyB3aGF0IEkgZ2V0IGZv
ciB0cnlpbmcgdG8gcmV2aWV3IGNvZGUgYmVmb3JlCm15IGNvZmZlZSBoYXMga2lja2VkIGluLi4u
CgpTb3JyeSBhYm91dCB0aGF0LgoKZ3JlZyBrLWgK

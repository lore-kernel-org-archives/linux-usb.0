Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,6/9] usb: roles: Find the muxes by also matching against the device node
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190212112452.GC32070@kuha.fi.intel.com>
Date: Tue, 12 Feb 2019 13:24:52 +0200
To: Jun Li <jun.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chen Yu <chenyu56@huawei.com>, Hans de Goede <hdegoede@redhat.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBUdWUsIEZlYiAxMiwgMjAxOSBhdCAxMDo0MToyOEFNICswMDAwLCBKdW4gTGkgd3Jv
dGU6Cj4gPiBAQCAtMzIsNiArMzIsNyBAQCB0eXBlZGVmIGVudW0gdXNiX3JvbGUgKCp1c2Jfcm9s
ZV9zd2l0Y2hfZ2V0X3QpKHN0cnVjdAo+ID4gZGV2aWNlICpkZXYpOwo+ID4gICAqIHVzYl9yb2xl
X3N3aXRjaF9yZWdpc3RlcigpIGJlZm9yZSByZWdpc3RlcmluZyB0aGUgc3dpdGNoLgo+ID4gICAq
Lwo+ID4gIHN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2hfZGVzYyB7Cj4gPiArCXN0cnVjdCBmd25vZGVf
aGFuZGxlICpmd25vZGU7Cj4gWW91IG1heSBhZGQgc29tZSBkZXNjcmlwdGlvbiBmb3IgdGhpcyBu
ZXcgbWVtYmVyCj4gLyoqCj4gICogc3RydWN0IHVzYl9yb2xlX3N3aXRjaF9kZXNjIC0gVVNCIFJv
bGUgU3dpdGNoIERlc2NyaXB0b3IKPiAgKiBAIGZ3bm9kZSAKCllvdSBhcmUgY29ycmVjdC4gSSBu
ZWVkIHRvIGZpeCB0aGF0IG9uZS4KCnRoYW5rcywK

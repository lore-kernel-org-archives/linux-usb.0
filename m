Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,10/26] compat_ioctl: use correct compat_ptr() translation in drivers
From: Al Viro <viro@ZenIV.linux.org.uk>
Message-Id: <20190417212111.GX2217@ZenIV.linux.org.uk>
Date: Wed, 17 Apr 2019 22:21:11 +0100
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Frank Haverkamp <haver@linux.ibm.com>, Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Felipe Balbi <balbi@kernel.org>, Jerry Zhang <zhangjerry@google.com>, Vincent Pelletier <plr.vincent@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Shen Jing <jingx.shen@intel.com>, linuxppc-dev@lists.ozlabs.org, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMTA6MTk6NDhQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBBIGhhbmRmdWwgb2YgZHJpdmVycyBhbGwgaGF2ZSBhIHRyaXZpYWwgd3JhcHBlciBh
cm91bmQgdGhlaXIgaW9jdGwKPiBoYW5kbGVyLCBidXQgZG9uJ3QgY2FsbCB0aGUgY29tcGF0X3B0
cigpIGNvbnZlcnNpb24gZnVuY3Rpb24gYXQgdGhlCj4gbW9tZW50LiBJbiBwcmFjdGljZSB0aGlz
IGRvZXMgbm90IG1hdHRlciwgc2luY2Ugbm9uZSBvZiB0aGVtIGFyZSB1c2VkCj4gb24gdGhlIHMz
OTAgYXJjaGl0ZWN0dXJlIGFuZCBmb3IgYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMsIGNvbXBhdF9w
dHIoKQo+IGRvZXMgbm90IGRvIGFueXRoaW5nLCBidXQgdXNpbmcgdGhlIG5ldyBjb21wYXRfcHRy
X2lvY3RsKCkKPiBoZWxwZXIgbWFrZXMgaXQgbW9yZSBjb3JyZWN0IGluIHRoZW9yeSwgYW5kIHNp
bXBsaWZpZXMgdGhlIGNvZGUuCj4gCj4gQWNrZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gQWNrZWQtYnk6IEFuZHJldyBEb25uZWxsYW4gPGFu
ZHJldy5kb25uZWxsYW5AYXUxLmlibS5jb20+Cj4gQWNrZWQtYnk6IEZlbGlwZSBCYWxiaSA8ZmVs
aXBlLmJhbGJpQGxpbnV4LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL21pc2MvY3hsL2ZsYXNoLmMgICAgICAg
ICAgICB8ICA4ICstLS0tLS0tCj4gIGRyaXZlcnMvbWlzYy9nZW53cWUvY2FyZF9kZXYuYyAgICAg
IHwgMjMgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zY3NpL21lZ2FyYWlkL21l
Z2FyYWlkX21tLmMgfCAyOCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMv
dXNiL2dhZGdldC9mdW5jdGlvbi9mX2ZzLmMgIHwgMTIgKy0tLS0tLS0tLS0tCgpBQ0ssIHByb3Zp
ZGVkIHRoYXQgYWxsIHRoZWlyIGlvY3RscyBhcmUgdGFraW5nIHBvaW50ZXJzICh3aGljaCBpcwp3
b3J0aCBtZW50aW9uaW5nIGluIGNvbW1pdCBtZXNzYWdlLCBhc3N1bWluZyBpdCdzIHRydWUpCg==

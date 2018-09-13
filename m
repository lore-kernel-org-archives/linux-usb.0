Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,03/17] compat_ioctl: use correct compat_ptr() translation in drivers
From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Message-Id: <11132252-c6ba-8b53-9314-f91e77574eba@au1.ibm.com>
Date: Thu, 13 Sep 2018 10:48:15 +1000
To: Arnd Bergmann <arnd@arndb.de>, viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Haverkamp <haver@linux.vnet.ibm.com>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Felipe Balbi <balbi@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gMTMvMDkvMTggMDE6MDEsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gQSBoYW5kZnVsIG9mIGRy
aXZlcnMgYWxsIGhhdmUgYSB0cml2aWFsIHdyYXBwZXIgYXJvdW5kIHRoZWlyIGlvY3RsCj4gaGFu
ZGxlciwgYnV0IGRvbid0IGNhbGwgdGhlIGNvbXBhdF9wdHIoKSBjb252ZXJzaW9uIGZ1bmN0aW9u
IGF0IHRoZQo+IG1vbWVudC4gSW4gcHJhY3RpY2UgdGhpcyBkb2VzIG5vdCBtYXR0ZXIsIHNpbmNl
IG5vbmUgb2YgdGhlbSBhcmUgdXNlZAo+IG9uIHRoZSBzMzkwIGFyY2hpdGVjdHVyZSBhbmQgZm9y
IGFsbCBvdGhlciBhcmNoaXRlY3R1cmVzLCBjb21wYXRfcHRyKCkKPiBkb2VzIG5vdCBkbyBhbnl0
aGluZywgYnV0IHVzaW5nIHRoZSBuZXcgZ2VuZXJpY19jb21wYXRfaW9jdGxfcHRyYXJnCj4gaGVs
cGVyIG1ha2VzIGl0IG1vcmUgY29ycmVjdCBpbiB0aGVvcnksIGFuZCBzaW1wbGlmaWVzIHRoZSBj
b2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+CgpG
b3IgY3hsOgoKQWNrZWQtYnk6IEFuZHJldyBEb25uZWxsYW4gPGFuZHJldy5kb25uZWxsYW5AYXUx
LmlibS5jb20+Cg==

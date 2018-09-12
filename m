Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,03/17] compat_ioctl: use correct compat_ptr() translation in drivers
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180912181309.GA15031@kroah.com>
Date: Wed, 12 Sep 2018 20:13:09 +0200
To: Arnd Bergmann <arnd@arndb.de>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Frank Haverkamp <haver@linux.vnet.ibm.com>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Felipe Balbi <balbi@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMDU6MDE6MDRQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBBIGhhbmRmdWwgb2YgZHJpdmVycyBhbGwgaGF2ZSBhIHRyaXZpYWwgd3JhcHBlciBh
cm91bmQgdGhlaXIgaW9jdGwKPiBoYW5kbGVyLCBidXQgZG9uJ3QgY2FsbCB0aGUgY29tcGF0X3B0
cigpIGNvbnZlcnNpb24gZnVuY3Rpb24gYXQgdGhlCj4gbW9tZW50LiBJbiBwcmFjdGljZSB0aGlz
IGRvZXMgbm90IG1hdHRlciwgc2luY2Ugbm9uZSBvZiB0aGVtIGFyZSB1c2VkCj4gb24gdGhlIHMz
OTAgYXJjaGl0ZWN0dXJlIGFuZCBmb3IgYWxsIG90aGVyIGFyY2hpdGVjdHVyZXMsIGNvbXBhdF9w
dHIoKQo+IGRvZXMgbm90IGRvIGFueXRoaW5nLCBidXQgdXNpbmcgdGhlIG5ldyBnZW5lcmljX2Nv
bXBhdF9pb2N0bF9wdHJhcmcKPiBoZWxwZXIgbWFrZXMgaXQgbW9yZSBjb3JyZWN0IGluIHRoZW9y
eSwgYW5kIHNpbXBsaWZpZXMgdGhlIGNvZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJn
bWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgZHJpdmVycy9taXNjL2N4bC9mbGFzaC5jICAg
ICAgICAgICAgfCAgOCArLS0tLS0tLQo+ICBkcml2ZXJzL21pc2MvZ2Vud3FlL2NhcmRfZGV2LmMg
ICAgICB8IDIzICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvc2NzaS9tZWdhcmFp
ZC9tZWdhcmFpZF9tbS5jIHwgMjggKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2
ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9mcy5jICB8IDEyICstLS0tLS0tLS0tLQo+ICA0IGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0pCgpOaWNlIGNsZWFu
dXAgb24gdGhpcyBzZXJpZXMhCgpBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4K

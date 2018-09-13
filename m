Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,03/17] compat_ioctl: use correct compat_ptr() translation in drivers
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <871s9x1wy1.fsf@linux.intel.com>
Date: Thu, 13 Sep 2018 14:03:18 +0300
To: Arnd Bergmann <arnd@arndb.de>, viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Haverkamp <haver@linux.vnet.ibm.com>, "Guilherme G. Piccoli" <gpiccoli@linux.vnet.ibm.com>, Kashyap Desai <kashyap.desai@broadcom.com>, Sumit Saxena <sumit.saxena@broadcom.com>, Shivasharan S <shivasharan.srikanteshwara@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JpdGVzOgoKPiBBIGhhbmRmdWwgb2YgZHJp
dmVycyBhbGwgaGF2ZSBhIHRyaXZpYWwgd3JhcHBlciBhcm91bmQgdGhlaXIgaW9jdGwKPiBoYW5k
bGVyLCBidXQgZG9uJ3QgY2FsbCB0aGUgY29tcGF0X3B0cigpIGNvbnZlcnNpb24gZnVuY3Rpb24g
YXQgdGhlCj4gbW9tZW50LiBJbiBwcmFjdGljZSB0aGlzIGRvZXMgbm90IG1hdHRlciwgc2luY2Ug
bm9uZSBvZiB0aGVtIGFyZSB1c2VkCj4gb24gdGhlIHMzOTAgYXJjaGl0ZWN0dXJlIGFuZCBmb3Ig
YWxsIG90aGVyIGFyY2hpdGVjdHVyZXMsIGNvbXBhdF9wdHIoKQo+IGRvZXMgbm90IGRvIGFueXRo
aW5nLCBidXQgdXNpbmcgdGhlIG5ldyBnZW5lcmljX2NvbXBhdF9pb2N0bF9wdHJhcmcKPiBoZWxw
ZXIgbWFrZXMgaXQgbW9yZSBjb3JyZWN0IGluIHRoZW9yeSwgYW5kIHNpbXBsaWZpZXMgdGhlIGNv
ZGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKQWNr
ZWQtYnk6IEZlbGlwZSBCYWxiaSA8ZmVsaXBlLmJhbGJpQGxpbnV4LmludGVsLmNvbT4K

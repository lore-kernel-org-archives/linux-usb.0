Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [PATCH/RFC,3/6] usb: gadget: Add NO_DMA dummies for DMA mapping API
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87lgfu8k7h.fsf@linux.intel.com>
Date: Thu, 15 Feb 2018 15:18:42 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGksCgpHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cml0ZXM6Cj4g
QWRkIGR1bW1pZXMgZm9yIHVzYl9nYWRnZXRfeyx1bn1tYXBfcmVxdWVzdHssX2J5X2Rldn0oKSwg
dG8gYWxsb3cKPiBjb21waWxlLXRlc3RpbmcgaWYgTk9fRE1BPXkuCj4KPiBUaGlzIHByZXZlbnRz
IHRoZSBmb2xsb3dpbmcgZnJvbSBzaG93aW5nIHVwIGxhdGVyOgo+Cj4gICAgIEVSUk9SOiAidXNi
X2dhZGdldF91bm1hcF9yZXF1ZXN0X2J5X2RldiIgW2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMv
cmVuZXNhc191c2Jocy5rb10gdW5kZWZpbmVkIQo+ICAgICBFUlJPUjogInVzYl9nYWRnZXRfbWFw
X3JlcXVlc3RfYnlfZGV2IiBbZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9yZW5lc2FzX3VzYmhz
LmtvXSB1bmRlZmluZWQhCj4gICAgIEVSUk9SOiAidXNiX2dhZGdldF9tYXBfcmVxdWVzdCIgW2Ry
aXZlcnMvdXNiL210dTMvbXR1My5rb10gdW5kZWZpbmVkIQo+ICAgICBFUlJPUjogInVzYl9nYWRn
ZXRfdW5tYXBfcmVxdWVzdCIgW2RyaXZlcnMvdXNiL210dTMvbXR1My5rb10gdW5kZWZpbmVkIQo+
ICAgICBFUlJPUjogInVzYl9nYWRnZXRfbWFwX3JlcXVlc3QiIFtkcml2ZXJzL3VzYi9nYWRnZXQv
dWRjL3JlbmVzYXNfdXNiMy5rb10gdW5kZWZpbmVkIQo+ICAgICBFUlJPUjogInVzYl9nYWRnZXRf
dW5tYXBfcmVxdWVzdCIgW2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmtvXSB1
bmRlZmluZWQhCj4KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgoKU2hvdWxkIEkgdGFrZSB0aGlzIG9yIGlzIGl0IGdvaW5nIHdpdGggdGhl
IHJlc3Qgb2YgdGhlIHNlcmllcz8gSWYgeW91Cndhbm5hIHRha2UgaXQgdGhyb3VnaCBUcml2aWFs
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQ6CgpBY2tlZC1ieTogRmVsaXBlIEJhbGJpIDxmZWxpcGUu
YmFsYmlAbGludXguaW50ZWwuY29tPgo=

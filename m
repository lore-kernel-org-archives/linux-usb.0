Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [PATCH/RFC,6/6] Treewide: Remove depends on HAS_DMA in case of platform dependency
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87inay8k67.fsf@linux.intel.com>
Date: Thu, 15 Feb 2018 15:19:28 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JpdGVzOgoKPiBSZW1v
dmUgZGVwZW5kZW5jaWVzIG9uIEhBU19ETUEgd2hlcmUgYSBLY29uZmlnIHN5bWJvbCBkZXBlbmRz
IG9uIGFub3RoZXIKPiBzeW1ib2wgdGhhdCBpbXBsaWVzIEhBU19ETUEsIGFuZCwgb3B0aW9uYWxs
eSwgb24gInx8IENPTVBJTEVfVEVTVCIuCj4gSW4gbW9zdCBjYXNlcyB0aGlzIG90aGVyIHN5bWJv
bCBpcyBhbiBhcmNoaXRlY3R1cmUgb3IgcGxhdGZvcm0gc3BlY2lmaWMKPiBzeW1ib2wsIG9yIFBD
SS4KPgo+IEdlbmVyaWMgc3ltYm9scyBhbmQgZHJpdmVycyB3aXRob3V0IHBsYXRmb3JtIGRlcGVu
ZGVuY2llcyBrZWVwIHRoZWlyCj4gZGVwZW5kZW5jaWVzIG9uIEhBU19ETUEsIHRvIHByZXZlbnQg
Y29tcGlsaW5nIHN1YnN5c3RlbXMgb3IgZHJpdmVycyB0aGF0Cj4gY2Fubm90IHdvcmsgYW55d2F5
Lgo+Cj4gVGhpcyBzaW1wbGlmaWVzIHRoZSBkZXBlbmRlbmNpZXMsIGFuZCBhbGxvd3MgdG8gaW1w
cm92ZSBjb21waWxlLXRlc3RpbmcuCj4KPiBOb3RlczoKPiAgIC0gRlNMX0ZNQU4ga2VlcHMgaXRz
IGRlcGVuZGVuY3kgb24gSEFTX0RNQSwgYXMgaXQgY2FsbHMgc2V0X2RtYV9vcHMoKSwKPiAgICAg
d2hpY2ggZG9lcyBub3QgZXhpc3QgaWYgSEFTX0RNQT1uIChEbyB3ZSBuZWVkIGEgZHVtbXk/IFRo
ZSB1c2Ugb2YKPiAgICAgc2V0X2RtYV9vcHMoKSBpbiB0aGlzIGRyaXZlciBpcyBxdWVzdGlvbmFi
bGUpLAo+ICAgLSBTTkRfU09DX0xQQVNTX0lQUTgwNlggYW5kIFNORF9TT0NfTFBBU1NfUExBVEZP
Uk0gbG9vc2UgdGhlaXIKPiAgICAgZGVwZW5kZW5jeSBvbiBIQVNfRE1BLCBhcyB0aGV5IGFyZSBz
ZWxlY3RlZCBmcm9tCj4gICAgIFNORF9TT0NfQVBRODAxNl9TQkMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoKZm9yIGRyaXZlcnMv
dXNiL2dhZGdldC86CgpBY2tlZC1ieTogRmVsaXBlIEJhbGJpIDxmZWxpcGUuYmFsYmlAbGludXgu
aW50ZWwuY29tPgo=

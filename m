Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,10/21] lightnvm: Remove depends on HAS_DMA in case of platform dependency
From: =?utf-8?q?Matias_Bj=C3=B8rling?= <mb@lightnvm.io>
Message-Id: <319a2b17-f08e-7219-cf5d-08e2df81d55c@lightnvm.io>
Date: Sun, 18 Mar 2018 19:46:11 +0100
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Tejun Heo <tj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Alan Tull <atull@kernel.org>, Moritz Fischer <mdf@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Jonathan Cameron <jic23@kernel.org>, Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Kalle Valo <kvalo@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, alsa-devel@alsa-project.org, linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fbdev@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-block@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gMDMvMTYvMjAxOCAwMjo1MSBQTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IFJlbW92
ZSBkZXBlbmRlbmNpZXMgb24gSEFTX0RNQSB3aGVyZSBhIEtjb25maWcgc3ltYm9sIGRlcGVuZHMg
b24gYW5vdGhlcgo+IHN5bWJvbCB0aGF0IGltcGxpZXMgSEFTX0RNQSwgYW5kLCBvcHRpb25hbGx5
LCBvbiAifHwgQ09NUElMRV9URVNUIi4KPiBJbiBtb3N0IGNhc2VzIHRoaXMgb3RoZXIgc3ltYm9s
IGlzIGFuIGFyY2hpdGVjdHVyZSBvciBwbGF0Zm9ybSBzcGVjaWZpYwo+IHN5bWJvbCwgb3IgUENJ
Lgo+IAo+IEdlbmVyaWMgc3ltYm9scyBhbmQgZHJpdmVycyB3aXRob3V0IHBsYXRmb3JtIGRlcGVu
ZGVuY2llcyBrZWVwIHRoZWlyCj4gZGVwZW5kZW5jaWVzIG9uIEhBU19ETUEsIHRvIHByZXZlbnQg
Y29tcGlsaW5nIHN1YnN5c3RlbXMgb3IgZHJpdmVycyB0aGF0Cj4gY2Fubm90IHdvcmsgYW55d2F5
Lgo+IAo+IFRoaXMgc2ltcGxpZmllcyB0aGUgZGVwZW5kZW5jaWVzLCBhbmQgYWxsb3dzIHRvIGlt
cHJvdmUgY29tcGlsZS10ZXN0aW5nLgo+IAo+IE5vdGVzOgo+ICAgIC0gRlNMX0ZNQU4ga2VlcHMg
aXRzIGRlcGVuZGVuY3kgb24gSEFTX0RNQSwgYXMgaXQgY2FsbHMgc2V0X2RtYV9vcHMoKSwKPiAg
ICAgIHdoaWNoIGRvZXMgbm90IGV4aXN0IGlmIEhBU19ETUE9biAoRG8gd2UgbmVlZCBhIGR1bW15
PyBUaGUgdXNlIG9mCj4gICAgICBzZXRfZG1hX29wcygpIGluIHRoaXMgZHJpdmVyIGlzIHF1ZXN0
aW9uYWJsZSksCj4gICAgLSBTTkRfU09DX0xQQVNTX0lQUTgwNlggYW5kIFNORF9TT0NfTFBBU1Nf
UExBVEZPUk0gbG9vc2UgdGhlaXIKPiAgICAgIGRlcGVuZGVuY3kgb24gSEFTX0RNQSwgYXMgdGhl
eSBhcmUgc2VsZWN0ZWQgZnJvbQo+ICAgICAgU05EX1NPQ19BUFE4MDE2X1NCQy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+IFJl
dmlld2VkLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFJv
YmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+Cj4gLS0tCj4gdjI6Cj4gICAgLSBBZGQg
UmV2aWV3ZWQtYnksIEFja2VkLWJ5LAo+ICAgIC0gRHJvcCBSRkMgc3RhdGUsCj4gICAgLSBTcGxp
dCBwZXIgc3Vic3lzdGVtLgo+IC0tLQo+ICAgZHJpdmVycy9saWdodG52bS9LY29uZmlnIHwgMiAr
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGlnaHRudm0vS2NvbmZpZyBiL2RyaXZlcnMvbGlnaHRudm0v
S2NvbmZpZwo+IGluZGV4IDEwYzA4OTgyMTg1YTU3MmYuLjljMDNmMzVkOWRmMTEzYzYgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9saWdodG52bS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9saWdodG52
bS9LY29uZmlnCj4gQEAgLTQsNyArNCw3IEBACj4gICAKPiAgIG1lbnVjb25maWcgTlZNCj4gICAJ
Ym9vbCAiT3Blbi1DaGFubmVsIFNTRCB0YXJnZXQgc3VwcG9ydCIKPiAtCWRlcGVuZHMgb24gQkxP
Q0sgJiYgSEFTX0RNQSAmJiBQQ0kKPiArCWRlcGVuZHMgb24gQkxPQ0sgJiYgUENJCj4gICAJc2Vs
ZWN0IEJMS19ERVZfTlZNRQo+ICAgCWhlbHAKPiAgIAkgIFNheSBZIGhlcmUgdG8gZ2V0IHRvIGVu
YWJsZSBPcGVuLWNoYW5uZWwgU1NEcy4KPiAKCkxvb2tzIGdvb2QuCgpSZXZpZXdlZC1ieTogTWF0
aWFzIEJqw7hybGluZyA8bWJAbGlnaHRudm0uaW8+Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRo
aXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9k
eSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9t
byBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

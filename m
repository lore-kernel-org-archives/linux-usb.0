Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,17/21] scsi: hisi_sas: Remove depends on HAS_DMA in case of platform dependency
From: John Garry <john.garry@huawei.com>
Message-Id: <0786b588-f165-6f71-7ede-7c26a27becbc@huawei.com>
Date: Fri, 16 Mar 2018 14:36:46 +0000
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Tejun Heo <tj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Alan Tull <atull@kernel.org>, Moritz Fischer <mdf@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Jonathan Cameron <jic23@kernel.org>, Joerg Roedel <joro@8bytes.org>, Matias Bjorling <mb@lightnvm.io>, Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Kalle Valo <kvalo@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org, linux-fpga@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux1394-devel@lists.sourceforge.net, devel@driverdev.osuosl.org, linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org, linux-media@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gMTYvMDMvMjAxOCAxMzo1MSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IFJlbW92ZSBk
ZXBlbmRlbmNpZXMgb24gSEFTX0RNQSB3aGVyZSBhIEtjb25maWcgc3ltYm9sIGRlcGVuZHMgb24g
YW5vdGhlcgo+IHN5bWJvbCB0aGF0IGltcGxpZXMgSEFTX0RNQSwgYW5kLCBvcHRpb25hbGx5LCBv
biAifHwgQ09NUElMRV9URVNUIi4KPiBJbiBtb3N0IGNhc2VzIHRoaXMgb3RoZXIgc3ltYm9sIGlz
IGFuIGFyY2hpdGVjdHVyZSBvciBwbGF0Zm9ybSBzcGVjaWZpYwo+IHN5bWJvbCwgb3IgUENJLgo+
Cj4gR2VuZXJpYyBzeW1ib2xzIGFuZCBkcml2ZXJzIHdpdGhvdXQgcGxhdGZvcm0gZGVwZW5kZW5j
aWVzIGtlZXAgdGhlaXIKPiBkZXBlbmRlbmNpZXMgb24gSEFTX0RNQSwgdG8gcHJldmVudCBjb21w
aWxpbmcgc3Vic3lzdGVtcyBvciBkcml2ZXJzIHRoYXQKPiBjYW5ub3Qgd29yayBhbnl3YXkuCj4K
PiBUaGlzIHNpbXBsaWZpZXMgdGhlIGRlcGVuZGVuY2llcywgYW5kIGFsbG93cyB0byBpbXByb3Zl
IGNvbXBpbGUtdGVzdGluZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnRAbGludXgtbTY4ay5vcmc+Cj4gUmV2aWV3ZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVA
a2VybmVsLm9yZz4KPiBBY2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNv
bT4KCkFja2VkLWJ5OiBKb2huIEdhcnJ5IDxqb2huLmdhcnJ5QGh1YXdlaS5jb20+Ci0tLQpUbyB1
bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGlu
dXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVs
Lm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9y
ZG9tby1pbmZvLmh0bWwK

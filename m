Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,09/21] iommu: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1521208314-4783-10-git-send-email-geert@linux-m68k.org>
Date: Fri, 16 Mar 2018 14:51:42 +0100
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Tejun Heo <tj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Alan Tull <atull@kernel.org>, Moritz Fischer <mdf@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Jonathan Cameron <jic23@kernel.org>, Joerg Roedel <joro@8bytes.org>, Matias Bjorling <mb@lightnvm.io>, Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Kalle Valo <kvalo@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, alsa-devel@alsa-project.org, linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fbdev@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-block@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <linux-usb.vger.kernel.org>

UmVtb3ZlIGRlcGVuZGVuY2llcyBvbiBIQVNfRE1BIHdoZXJlIGEgS2NvbmZpZyBzeW1ib2wgZGVw
ZW5kcyBvbiBhbm90aGVyCnN5bWJvbCB0aGF0IGltcGxpZXMgSEFTX0RNQSwgYW5kLCBvcHRpb25h
bGx5LCBvbiAifHwgQ09NUElMRV9URVNUIi4KSW4gbW9zdCBjYXNlcyB0aGlzIG90aGVyIHN5bWJv
bCBpcyBhbiBhcmNoaXRlY3R1cmUgb3IgcGxhdGZvcm0gc3BlY2lmaWMKc3ltYm9sLCBvciBQQ0ku
CgpHZW5lcmljIHN5bWJvbHMgYW5kIGRyaXZlcnMgd2l0aG91dCBwbGF0Zm9ybSBkZXBlbmRlbmNp
ZXMga2VlcCB0aGVpcgpkZXBlbmRlbmNpZXMgb24gSEFTX0RNQSwgdG8gcHJldmVudCBjb21waWxp
bmcgc3Vic3lzdGVtcyBvciBkcml2ZXJzIHRoYXQKY2Fubm90IHdvcmsgYW55d2F5LgoKVGhpcyBz
aW1wbGlmaWVzIHRoZSBkZXBlbmRlbmNpZXMsIGFuZCBhbGxvd3MgdG8gaW1wcm92ZSBjb21waWxl
LXRlc3RpbmcuCgpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4
LW02OGsub3JnPgpSZXZpZXdlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgpB
Y2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KLS0tCnYyOgogIC0g
QWRkIFJldmlld2VkLWJ5LCBBY2tlZC1ieSwKICAtIERyb3AgUkZDIHN0YXRlLAogIC0gU3BsaXQg
cGVyIHN1YnN5c3RlbS4KLS0tCiBkcml2ZXJzL2lvbW11L0tjb25maWcgfCA1ICsrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaW9tbXUvS2NvbmZpZyBiL2RyaXZlcnMvaW9tbXUvS2NvbmZpZwppbmRleCBmM2Ey
MTM0M2U2MzZhOGYyLi4zMmU5MTM5OGMwNTU1MjcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lvbW11
L0tjb25maWcKKysrIGIvZHJpdmVycy9pb21tdS9LY29uZmlnCkBAIC0yMyw3ICsyMyw3IEBAIGNv
bmZpZyBJT01NVV9JT19QR1RBQkxFCiBjb25maWcgSU9NTVVfSU9fUEdUQUJMRV9MUEFFCiAJYm9v
bCAiQVJNdjcvdjggTG9uZyBEZXNjcmlwdG9yIEZvcm1hdCIKIAlzZWxlY3QgSU9NTVVfSU9fUEdU
QUJMRQotCWRlcGVuZHMgb24gSEFTX0RNQSAmJiAoQVJNIHx8IEFSTTY0IHx8IChDT01QSUxFX1RF
U1QgJiYgIUdFTkVSSUNfQVRPTUlDNjQpKQorCWRlcGVuZHMgb24gQVJNIHx8IEFSTTY0IHx8IChD
T01QSUxFX1RFU1QgJiYgIUdFTkVSSUNfQVRPTUlDNjQpCiAJaGVscAogCSAgRW5hYmxlIHN1cHBv
cnQgZm9yIHRoZSBBUk0gbG9uZyBkZXNjcmlwdG9yIHBhZ2V0YWJsZSBmb3JtYXQuCiAJICBUaGlz
IGFsbG9jYXRvciBzdXBwb3J0cyA0Sy8yTS8xRywgMTZLLzMyTSBhbmQgNjRLLzUxMk0gcGFnZQpA
QCAtNDIsNyArNDIsNyBAQCBjb25maWcgSU9NTVVfSU9fUEdUQUJMRV9MUEFFX1NFTEZURVNUCiBj
b25maWcgSU9NTVVfSU9fUEdUQUJMRV9BUk1WN1MKIAlib29sICJBUk12Ny92OCBTaG9ydCBEZXNj
cmlwdG9yIEZvcm1hdCIKIAlzZWxlY3QgSU9NTVVfSU9fUEdUQUJMRQotCWRlcGVuZHMgb24gSEFT
X0RNQSAmJiAoQVJNIHx8IEFSTTY0IHx8IENPTVBJTEVfVEVTVCkKKwlkZXBlbmRzIG9uIEFSTSB8
fCBBUk02NCB8fCBDT01QSUxFX1RFU1QKIAloZWxwCiAJICBFbmFibGUgc3VwcG9ydCBmb3IgdGhl
IEFSTSBTaG9ydC1kZXNjcmlwdG9yIHBhZ2V0YWJsZSBmb3JtYXQuCiAJICBUaGlzIHN1cHBvcnRz
IDMyLWJpdCB2aXJ0dWFsIGFuZCBwaHlzaWNhbCBhZGRyZXNzZXMgbWFwcGVkIHVzaW5nCkBAIC0z
NzQsNyArMzc0LDYgQEAgY29uZmlnIFFDT01fSU9NTVUKIAkjIE5vdGU6IGlvbW11IGRyaXZlcnMg
Y2Fubm90ICh5ZXQ/KSBiZSBidWlsdCBhcyBtb2R1bGVzCiAJYm9vbCAiUXVhbGNvbW0gSU9NTVUg
U3VwcG9ydCIKIAlkZXBlbmRzIG9uIEFSQ0hfUUNPTSB8fCAoQ09NUElMRV9URVNUICYmICFHRU5F
UklDX0FUT01JQzY0KQotCWRlcGVuZHMgb24gSEFTX0RNQQogCXNlbGVjdCBJT01NVV9BUEkKIAlz
ZWxlY3QgSU9NTVVfSU9fUEdUQUJMRV9MUEFFCiAJc2VsZWN0IEFSTV9ETUFfVVNFX0lPTU1VCg==

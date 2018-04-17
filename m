Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,02/20] ata: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1523987360-18760-3-git-send-email-geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 19:49:02 +0200
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Tejun Heo <tj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Alan Tull <atull@kernel.org>, Moritz Fischer <mdf@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Jonathan Cameron <jic23@kernel.org>, Joerg Roedel <joro@8bytes.org>, Matias Bjorling <mb@lightnvm.io>, Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Kalle Valo <kvalo@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>
Cc: iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org, alsa-devel@alsa-project.org, linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org, linux-fbdev@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, linux-block@vger.kernel.org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
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
Y2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KLS0tCnYzOgogIC0g
UmViYXNlIHRvIHY0LjE3LXJjMSwKCnYyOgogIC0gQWRkIFJldmlld2VkLWJ5LCBBY2tlZC1ieSwK
ICAtIERyb3AgUkZDIHN0YXRlLAogIC0gU3BsaXQgcGVyIHN1YnN5c3RlbS4KLS0tCiBkcml2ZXJz
L2F0YS9LY29uZmlnIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9hdGEvS2NvbmZpZyBiL2RyaXZlcnMvYXRhL0tjb25maWcKaW5kZXgg
MmIxNmU3YzhmZmYzNTc2NC4uMzliMTgxZDZiZDBkOGNmMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9h
dGEvS2NvbmZpZworKysgYi9kcml2ZXJzL2F0YS9LY29uZmlnCkBAIC0zOTgsNyArMzk4LDYgQEAg
Y29uZmlnIFNBVEFfRFdDX1ZERUJVRwogCiBjb25maWcgU0FUQV9ISUdIQkFOSwogCXRyaXN0YXRl
ICJDYWx4ZWRhIEhpZ2hiYW5rIFNBVEEgc3VwcG9ydCIKLQlkZXBlbmRzIG9uIEhBU19ETUEKIAlk
ZXBlbmRzIG9uIEFSQ0hfSElHSEJBTksgfHwgQ09NUElMRV9URVNUCiAJaGVscAogCSAgVGhpcyBv
cHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciB0aGUgQ2FseGVkYSBIaWdoYmFuayBTb0MncwpAQCAt
NDA4LDcgKzQwNyw2IEBAIGNvbmZpZyBTQVRBX0hJR0hCQU5LCiAKIGNvbmZpZyBTQVRBX01WCiAJ
dHJpc3RhdGUgIk1hcnZlbGwgU0FUQSBzdXBwb3J0IgotCWRlcGVuZHMgb24gSEFTX0RNQQogCWRl
cGVuZHMgb24gUENJIHx8IEFSQ0hfRE9WRSB8fCBBUkNIX01WNzhYWDAgfHwgXAogCQkgICBBUkNI
X01WRUJVIHx8IEFSQ0hfT1JJT041WCB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgR0VORVJJQ19Q
SFkK

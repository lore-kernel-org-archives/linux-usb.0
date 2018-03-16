Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,18/21] serial: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1521208314-4783-19-git-send-email-geert@linux-m68k.org>
Date: Fri, 16 Mar 2018 14:51:51 +0100
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
cGVyIHN1YnN5c3RlbS4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZyB8IDQgLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkv
c2VyaWFsL0tjb25maWcgYi9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwppbmRleCAzNjgyZmQz
ZTk2MGNiZDY0Li5hMGVhMTQ2YTJlZjVhZjUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJp
YWwvS2NvbmZpZworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvS2NvbmZpZwpAQCAtMTE1LDcgKzEx
NSw2IEBAIGNvbmZpZyBTRVJJQUxfU0IxMjUwX0RVQVJUX0NPTlNPTEUKIAogY29uZmlnIFNFUklB
TF9BVE1FTAogCWJvb2wgIkFUOTEgb24tY2hpcCBzZXJpYWwgcG9ydCBzdXBwb3J0IgotCWRlcGVu
ZHMgb24gSEFTX0RNQQogCWRlcGVuZHMgb24gQVJDSF9BVDkxIHx8IENPTVBJTEVfVEVTVAogCXNl
bGVjdCBTRVJJQUxfQ09SRQogCXNlbGVjdCBTRVJJQUxfTUNUUkxfR1BJTyBpZiBHUElPTElCCkBA
IC01ODYsNyArNTg1LDYgQEAgY29uZmlnIEJGSU5fVUFSVDNfQ1RTUlRTCiAKIGNvbmZpZyBTRVJJ
QUxfSU1YCiAJdHJpc3RhdGUgIklNWCBzZXJpYWwgcG9ydCBzdXBwb3J0IgotCWRlcGVuZHMgb24g
SEFTX0RNQQogCWRlcGVuZHMgb24gQVJDSF9NWEMgfHwgQ09NUElMRV9URVNUCiAJc2VsZWN0IFNF
UklBTF9DT1JFCiAJc2VsZWN0IFJBVElPTkFMCkBAIC0xNDM2LDcgKzE0MzQsNiBAQCBjb25maWcg
U0VSSUFMX1BDSF9VQVJUX0NPTlNPTEUKIAogY29uZmlnIFNFUklBTF9NWFNfQVVBUlQKIAl0cmlz
dGF0ZSAiTVhTIEFVQVJUIHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBIQVNfRE1BCiAJZGVwZW5kcyBv
biBBUkNIX01YUyB8fCBNQUNIX0FTTTkyNjAgfHwgQ09NUElMRV9URVNUCiAJc2VsZWN0IFNFUklB
TF9DT1JFCiAJc2VsZWN0IFNFUklBTF9NQ1RSTF9HUElPIGlmIEdQSU9MSUIKQEAgLTE2NTYsNyAr
MTY1Myw2IEBAIGNvbmZpZyBTRVJJQUxfU1BSRF9DT05TT0xFCiBjb25maWcgU0VSSUFMX1NUTTMy
CiAJdHJpc3RhdGUgIlNUTWljcm9lbGVjdHJvbmljcyBTVE0zMiBzZXJpYWwgcG9ydCBzdXBwb3J0
IgogCXNlbGVjdCBTRVJJQUxfQ09SRQotCWRlcGVuZHMgb24gSEFTX0RNQQogCWRlcGVuZHMgb24g
QVJDSF9TVE0zMiB8fCBDT01QSUxFX1RFU1QKIAloZWxwCiAJICBUaGlzIGRyaXZlciBpcyBmb3Ig
dGhlIG9uLWNoaXAgU2VyaWFsIENvbnRyb2xsZXIgb24K

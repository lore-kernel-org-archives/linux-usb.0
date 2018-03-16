Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,21/21] usb: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1521208314-4783-22-git-send-email-geert@linux-m68k.org>
Date: Fri, 16 Mar 2018 14:51:54 +0100
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
Y2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQWNrZWQtYnk6IEZl
bGlwZSBCYWxiaSA8ZmVsaXBlLmJhbGJpQGxpbnV4LmludGVsLmNvbT4gW2RyaXZlcnMvdXNiL2dh
ZGdldC9dCi0tLQp2MjoKICAtIEFkZCBSZXZpZXdlZC1ieSwgQWNrZWQtYnksCiAgLSBEcm9wIFJG
QyBzdGF0ZSwKICAtIFNwbGl0IHBlciBzdWJzeXN0ZW0uCi0tLQogZHJpdmVycy91c2IvZ2FkZ2V0
L3VkYy9LY29uZmlnIHwgNCArKy0tCiBkcml2ZXJzL3VzYi9tdHUzL0tjb25maWcgICAgICAgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL0tjb25maWcgYi9kcml2ZXJzL3VzYi9n
YWRnZXQvdWRjL0tjb25maWcKaW5kZXggMDg3NWQzODQ3NmVlOTM5NS4uOWMzYjRmODY5NjVlODBj
NyAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9LY29uZmlnCisrKyBiL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvS2NvbmZpZwpAQCAtMTc5LDcgKzE3OSw3IEBAIGNvbmZpZyBVU0Jf
UjhBNjY1OTcKIAogY29uZmlnIFVTQl9SRU5FU0FTX1VTQkhTX1VEQwogCXRyaXN0YXRlICdSZW5l
c2FzIFVTQkhTIGNvbnRyb2xsZXInCi0JZGVwZW5kcyBvbiBVU0JfUkVORVNBU19VU0JIUyAmJiBI
QVNfRE1BCisJZGVwZW5kcyBvbiBVU0JfUkVORVNBU19VU0JIUwogCWhlbHAKIAkgICBSZW5lc2Fz
IFVTQkhTIGlzIGEgZGlzY3JldGUgVVNCIGhvc3QgYW5kIHBlcmlwaGVyYWwgY29udHJvbGxlciBj
aGlwCiAJICAgdGhhdCBzdXBwb3J0cyBib3RoIGZ1bGwgYW5kIGhpZ2ggc3BlZWQgVVNCIDIuMCBk
YXRhIHRyYW5zZmVycy4KQEAgLTE5Miw3ICsxOTIsNyBAQCBjb25maWcgVVNCX1JFTkVTQVNfVVNC
SFNfVURDCiBjb25maWcgVVNCX1JFTkVTQVNfVVNCMwogCXRyaXN0YXRlICdSZW5lc2FzIFVTQjMu
MCBQZXJpcGhlcmFsIGNvbnRyb2xsZXInCiAJZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09N
UElMRV9URVNUCi0JZGVwZW5kcyBvbiBFWFRDT04gJiYgSEFTX0RNQQorCWRlcGVuZHMgb24gRVhU
Q09OCiAJaGVscAogCSAgIFJlbmVzYXMgVVNCMy4wIFBlcmlwaGVyYWwgY29udHJvbGxlciBpcyBh
IFVTQiBwZXJpcGhlcmFsIGNvbnRyb2xsZXIKIAkgICB0aGF0IHN1cHBvcnRzIHN1cGVyLCBoaWdo
LCBhbmQgZnVsbCBzcGVlZCBVU0IgMy4wIGRhdGEgdHJhbnNmZXJzLgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvbXR1My9LY29uZmlnIGIvZHJpdmVycy91c2IvbXR1My9LY29uZmlnCmluZGV4IDI1
Y2Q2MTk0N2JlZWE1MWUuLmMwYzBlYjg4ZTVlYWZjNzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNi
L210dTMvS2NvbmZpZworKysgYi9kcml2ZXJzL3VzYi9tdHUzL0tjb25maWcKQEAgLTIsNyArMiw3
IEBACiAKIGNvbmZpZyBVU0JfTVRVMwogCXRyaXN0YXRlICJNZWRpYVRlayBVU0IzIER1YWwgUm9s
ZSBjb250cm9sbGVyIgotCWRlcGVuZHMgb24gRVhUQ09OICYmIChVU0IgfHwgVVNCX0dBREdFVCkg
JiYgSEFTX0RNQQorCWRlcGVuZHMgb24gRVhUQ09OICYmIChVU0IgfHwgVVNCX0dBREdFVCkKIAlk
ZXBlbmRzIG9uIEFSQ0hfTUVESUFURUsgfHwgQ09NUElMRV9URVNUCiAJc2VsZWN0IFVTQl9YSENJ
X01USyBpZiBVU0JfU1VQUE9SVCAmJiBVU0JfWEhDSV9IQ0QKIAloZWxwCg==

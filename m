Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,04/20] fbdev: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1523987360-18760-5-git-send-email-geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 19:49:04 +0200
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
Y2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQWNrZWQtYnk6IEJh
cnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KLS0tCnYz
OgogIC0gQWRkIEFja2VkLWJ5LAogIC0gUmViYXNlIHRvIHY0LjE3LXJjMSwKCnYyOgogIC0gQWRk
IFJldmlld2VkLWJ5LCBBY2tlZC1ieSwKICAtIERyb3AgUkZDIHN0YXRlLAogIC0gU3BsaXQgcGVy
IHN1YnN5c3RlbS4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgfCAzICsrLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZp
ZwppbmRleCBkOTQyNTQyNjNlYTVjYWE3Li40Zjk4NTNlYzE3MjE5NTBmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29u
ZmlnCkBAIC0yMDc1LDcgKzIwNzUsOCBAQCBjb25maWcgRkJfWElMSU5YCiAKIGNvbmZpZyBGQl9H
T0xERklTSAogCXRyaXN0YXRlICJHb2xkZmlzaCBGcmFtZWJ1ZmZlciIKLQlkZXBlbmRzIG9uIEZC
ICYmIEhBU19ETUEgJiYgKEdPTERGSVNIIHx8IENPTVBJTEVfVEVTVCkKKwlkZXBlbmRzIG9uIEZC
CisJZGVwZW5kcyBvbiBHT0xERklTSCB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgRkJfQ0ZCX0ZJ
TExSRUNUCiAJc2VsZWN0IEZCX0NGQl9DT1BZQVJFQQogCXNlbGVjdCBGQl9DRkJfSU1BR0VCTElU
Cg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,08/20] iio: adc: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1523987360-18760-9-git-send-email-geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 19:49:08 +0200
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
Y2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQWNrZWQtYnk6IEpv
bmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4KLS0tCnYzOgogIC0g
QWRkIEFja2VkLWJ5LAogIC0gUmViYXNlIHRvIHY0LjE3LXJjMSwKCnYyOgogIC0gQWRkIFJldmll
d2VkLWJ5LCBBY2tlZC1ieSwKICAtIERyb3AgUkZDIHN0YXRlLAogIC0gU3BsaXQgcGVyIHN1YnN5
c3RlbS4KLS0tCiBkcml2ZXJzL2lpby9hZGMvS2NvbmZpZyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9LY29uZmlnIGIv
ZHJpdmVycy9paW8vYWRjL0tjb25maWcKaW5kZXggMTU2MDZmMjM3NDgwZGFjYi4uODhiYmNkMGU5
ODYzMjI3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL0tjb25maWcKKysrIGIvZHJpdmVy
cy9paW8vYWRjL0tjb25maWcKQEAgLTE1Nyw3ICsxNTcsNiBAQCBjb25maWcgQVQ5MV9TQU1BNUQy
X0FEQwogCXRyaXN0YXRlICJBdG1lbCBBVDkxIFNBTUE1RDIgQURDIgogCWRlcGVuZHMgb24gQVJD
SF9BVDkxIHx8IENPTVBJTEVfVEVTVAogCWRlcGVuZHMgb24gSEFTX0lPTUVNCi0JZGVwZW5kcyBv
biBIQVNfRE1BCiAJc2VsZWN0IElJT19UUklHR0VSRURfQlVGRkVSCiAJaGVscAogCSAgU2F5IHll
cyBoZXJlIHRvIGJ1aWxkIHN1cHBvcnQgZm9yIEF0bWVsIFNBTUE1RDIgQURDIHdoaWNoIGlzCkBA
IC02NDYsNyArNjQ1LDYgQEAgY29uZmlnIFNEX0FEQ19NT0RVTEFUT1IKIGNvbmZpZyBTVE0zMl9B
RENfQ09SRQogCXRyaXN0YXRlICJTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgYWRjIGNvcmUiCiAJ
ZGVwZW5kcyBvbiBBUkNIX1NUTTMyIHx8IENPTVBJTEVfVEVTVAotCWRlcGVuZHMgb24gSEFTX0RN
QQogCWRlcGVuZHMgb24gT0YKIAlkZXBlbmRzIG9uIFJFR1VMQVRPUgogCXNlbGVjdCBJSU9fQlVG
RkVSCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,09/20] iommu: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1523987360-18760-10-git-send-email-geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 19:49:09 +0200
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
ZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgotLS0KdjM6CiAgLSBBZGQgQWNrZWQtYnksCiAg
LSBSZWJhc2UgdG8gdjQuMTctcmMxLAoKdjI6CiAgLSBBZGQgUmV2aWV3ZWQtYnksIEFja2VkLWJ5
LAogIC0gRHJvcCBSRkMgc3RhdGUsCiAgLSBTcGxpdCBwZXIgc3Vic3lzdGVtLgotLS0KIGRyaXZl
cnMvaW9tbXUvS2NvbmZpZyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9LY29uZmlnIGIv
ZHJpdmVycy9pb21tdS9LY29uZmlnCmluZGV4IGRmMTcxY2I4NTgyMjk2YjkuLmM3NjE1N2U1N2Y2
YmE0YmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW9tbXUvS2NvbmZpZworKysgYi9kcml2ZXJzL2lv
bW11L0tjb25maWcKQEAgLTIzLDcgKzIzLDcgQEAgY29uZmlnIElPTU1VX0lPX1BHVEFCTEUKIGNv
bmZpZyBJT01NVV9JT19QR1RBQkxFX0xQQUUKIAlib29sICJBUk12Ny92OCBMb25nIERlc2NyaXB0
b3IgRm9ybWF0IgogCXNlbGVjdCBJT01NVV9JT19QR1RBQkxFCi0JZGVwZW5kcyBvbiBIQVNfRE1B
ICYmIChBUk0gfHwgQVJNNjQgfHwgKENPTVBJTEVfVEVTVCAmJiAhR0VORVJJQ19BVE9NSUM2NCkp
CisJZGVwZW5kcyBvbiBBUk0gfHwgQVJNNjQgfHwgKENPTVBJTEVfVEVTVCAmJiAhR0VORVJJQ19B
VE9NSUM2NCkKIAloZWxwCiAJICBFbmFibGUgc3VwcG9ydCBmb3IgdGhlIEFSTSBsb25nIGRlc2Ny
aXB0b3IgcGFnZXRhYmxlIGZvcm1hdC4KIAkgIFRoaXMgYWxsb2NhdG9yIHN1cHBvcnRzIDRLLzJN
LzFHLCAxNksvMzJNIGFuZCA2NEsvNTEyTSBwYWdlCkBAIC00Miw3ICs0Miw3IEBAIGNvbmZpZyBJ
T01NVV9JT19QR1RBQkxFX0xQQUVfU0VMRlRFU1QKIGNvbmZpZyBJT01NVV9JT19QR1RBQkxFX0FS
TVY3UwogCWJvb2wgIkFSTXY3L3Y4IFNob3J0IERlc2NyaXB0b3IgRm9ybWF0IgogCXNlbGVjdCBJ
T01NVV9JT19QR1RBQkxFCi0JZGVwZW5kcyBvbiBIQVNfRE1BICYmIChBUk0gfHwgQVJNNjQgfHwg
Q09NUElMRV9URVNUKQorCWRlcGVuZHMgb24gQVJNIHx8IEFSTTY0IHx8IENPTVBJTEVfVEVTVAog
CWhlbHAKIAkgIEVuYWJsZSBzdXBwb3J0IGZvciB0aGUgQVJNIFNob3J0LWRlc2NyaXB0b3IgcGFn
ZXRhYmxlIGZvcm1hdC4KIAkgIFRoaXMgc3VwcG9ydHMgMzItYml0IHZpcnR1YWwgYW5kIHBoeXNp
Y2FsIGFkZHJlc3NlcyBtYXBwZWQgdXNpbmcKQEAgLTM3Niw3ICszNzYsNiBAQCBjb25maWcgUUNP
TV9JT01NVQogCSMgTm90ZTogaW9tbXUgZHJpdmVycyBjYW5ub3QgKHlldD8pIGJlIGJ1aWx0IGFz
IG1vZHVsZXMKIAlib29sICJRdWFsY29tbSBJT01NVSBTdXBwb3J0IgogCWRlcGVuZHMgb24gQVJD
SF9RQ09NIHx8IChDT01QSUxFX1RFU1QgJiYgIUdFTkVSSUNfQVRPTUlDNjQpCi0JZGVwZW5kcyBv
biBIQVNfRE1BCiAJc2VsZWN0IElPTU1VX0FQSQogCXNlbGVjdCBJT01NVV9JT19QR1RBQkxFX0xQ
QUUKIAlzZWxlY3QgQVJNX0RNQV9VU0VfSU9NTVUK

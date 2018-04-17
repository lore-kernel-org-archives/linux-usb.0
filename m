Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,17/20] serial: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1523987360-18760-18-git-send-email-geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 19:49:17 +0200
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
Y2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQWNrZWQtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQp2MzoKICAt
IEFkZCBBY2tlZC1ieSwKICAtIFJlYmFzZSB0byB2NC4xNy1yYzEsCgp2MjoKICAtIEFkZCBSZXZp
ZXdlZC1ieSwgQWNrZWQtYnksCiAgLSBEcm9wIFJGQyBzdGF0ZSwKICAtIFNwbGl0IHBlciBzdWJz
eXN0ZW0uCi0tLQogZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcgfCA0IC0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9L
Y29uZmlnIGIvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKaW5kZXggMGYwNThkZjBiMDcwMWZl
Mi4uMjViOGMwYThhNTAzOTdkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL0tjb25m
aWcKKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL0tjb25maWcKQEAgLTExNSw3ICsxMTUsNiBAQCBj
b25maWcgU0VSSUFMX1NCMTI1MF9EVUFSVF9DT05TT0xFCiAKIGNvbmZpZyBTRVJJQUxfQVRNRUwK
IAlib29sICJBVDkxIG9uLWNoaXAgc2VyaWFsIHBvcnQgc3VwcG9ydCIKLQlkZXBlbmRzIG9uIEhB
U19ETUEKIAlkZXBlbmRzIG9uIEFSQ0hfQVQ5MSB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgU0VS
SUFMX0NPUkUKIAlzZWxlY3QgU0VSSUFMX01DVFJMX0dQSU8gaWYgR1BJT0xJQgpAQCAtNTAwLDcg
KzQ5OSw2IEBAIGNvbmZpZyBTRVJJQUxfU0ExMTAwX0NPTlNPTEUKIAogY29uZmlnIFNFUklBTF9J
TVgKIAl0cmlzdGF0ZSAiSU1YIHNlcmlhbCBwb3J0IHN1cHBvcnQiCi0JZGVwZW5kcyBvbiBIQVNf
RE1BCiAJZGVwZW5kcyBvbiBBUkNIX01YQyB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgU0VSSUFM
X0NPUkUKIAlzZWxlY3QgUkFUSU9OQUwKQEAgLTEyNjIsNyArMTI2MCw2IEBAIGNvbmZpZyBTRVJJ
QUxfUENIX1VBUlRfQ09OU09MRQogCiBjb25maWcgU0VSSUFMX01YU19BVUFSVAogCXRyaXN0YXRl
ICJNWFMgQVVBUlQgc3VwcG9ydCIKLQlkZXBlbmRzIG9uIEhBU19ETUEKIAlkZXBlbmRzIG9uIEFS
Q0hfTVhTIHx8IE1BQ0hfQVNNOTI2MCB8fCBDT01QSUxFX1RFU1QKIAlzZWxlY3QgU0VSSUFMX0NP
UkUKIAlzZWxlY3QgU0VSSUFMX01DVFJMX0dQSU8gaWYgR1BJT0xJQgpAQCAtMTQ3Myw3ICsxNDcw
LDYgQEAgY29uZmlnIFNFUklBTF9TUFJEX0NPTlNPTEUKIGNvbmZpZyBTRVJJQUxfU1RNMzIKIAl0
cmlzdGF0ZSAiU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIHNlcmlhbCBwb3J0IHN1cHBvcnQiCiAJ
c2VsZWN0IFNFUklBTF9DT1JFCi0JZGVwZW5kcyBvbiBIQVNfRE1BCiAJZGVwZW5kcyBvbiBBUkNI
X1NUTTMyIHx8IENPTVBJTEVfVEVTVAogCWhlbHAKIAkgIFRoaXMgZHJpdmVyIGlzIGZvciB0aGUg
b24tY2hpcCBTZXJpYWwgQ29udHJvbGxlciBvbgo=

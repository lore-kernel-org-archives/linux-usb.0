Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,07/20] i2c: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1523987360-18760-8-git-send-email-geert@linux-m68k.org>
Date: Tue, 17 Apr 2018 19:49:07 +0200
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
L2kyYy9idXNzZXMvS2NvbmZpZyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9LY29uZmlnCmluZGV4IGM0ODY1YjA4ZDdmYjllM2IuLjhkMjFiOTgyNWQ3MTc2NGQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnCisrKyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9LY29uZmlnCkBAIC03MDcsNyArNzA3LDYgQEAgY29uZmlnIEkyQ19NUEMKIGNvbmZp
ZyBJMkNfTVQ2NVhYCiAJdHJpc3RhdGUgIk1lZGlhVGVrIEkyQyBhZGFwdGVyIgogCWRlcGVuZHMg
b24gQVJDSF9NRURJQVRFSyB8fCBDT01QSUxFX1RFU1QKLQlkZXBlbmRzIG9uIEhBU19ETUEKIAlo
ZWxwCiAJICBUaGlzIHNlbGVjdHMgdGhlIE1lZGlhVGVrKFIpIEludGVncmF0ZWQgSW50ZXIgQ2ly
Y3VpdCBidXMgZHJpdmVyCiAJICBmb3IgTVQ2NXh4IGFuZCBNVDgxeHguCkBAIC04ODUsNyArODg0
LDYgQEAgY29uZmlnIEkyQ19TSDc3NjAKIAogY29uZmlnIEkyQ19TSF9NT0JJTEUKIAl0cmlzdGF0
ZSAiU3VwZXJIIE1vYmlsZSBJMkMgQ29udHJvbGxlciIKLQlkZXBlbmRzIG9uIEhBU19ETUEKIAlk
ZXBlbmRzIG9uIEFSQ0hfU0hNT0JJTEUgfHwgQVJDSF9SRU5FU0FTIHx8IENPTVBJTEVfVEVTVAog
CWhlbHAKIAkgIElmIHlvdSBzYXkgeWVzIHRvIHRoaXMgb3B0aW9uLCBzdXBwb3J0IHdpbGwgYmUg
aW5jbHVkZWQgZm9yIHRoZQpAQCAtMTA5OCw3ICsxMDk2LDYgQEAgY29uZmlnIEkyQ19YTFA5WFgK
IAogY29uZmlnIEkyQ19SQ0FSCiAJdHJpc3RhdGUgIlJlbmVzYXMgUi1DYXIgSTJDIENvbnRyb2xs
ZXIiCi0JZGVwZW5kcyBvbiBIQVNfRE1BCiAJZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09N
UElMRV9URVNUCiAJc2VsZWN0IEkyQ19TTEFWRQogCWhlbHAK

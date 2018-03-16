Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,11/21] mailbox: Remove depends on HAS_DMA in case of platform dependency
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1521208314-4783-12-git-send-email-geert@linux-m68k.org>
Date: Fri, 16 Mar 2018 14:51:44 +0100
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
LXRlc3RpbmcuCgpOb3RlczoKICAtIEZTTF9GTUFOIGtlZXBzIGl0cyBkZXBlbmRlbmN5IG9uIEhB
U19ETUEsIGFzIGl0IGNhbGxzIHNldF9kbWFfb3BzKCksCiAgICB3aGljaCBkb2VzIG5vdCBleGlz
dCBpZiBIQVNfRE1BPW4gKERvIHdlIG5lZWQgYSBkdW1teT8gVGhlIHVzZSBvZgogICAgc2V0X2Rt
YV9vcHMoKSBpbiB0aGlzIGRyaXZlciBpcyBxdWVzdGlvbmFibGUpLAogIC0gU05EX1NPQ19MUEFT
U19JUFE4MDZYIGFuZCBTTkRfU09DX0xQQVNTX1BMQVRGT1JNIGxvb3NlIHRoZWlyCiAgICBkZXBl
bmRlbmN5IG9uIEhBU19ETUEsIGFzIHRoZXkgYXJlIHNlbGVjdGVkIGZyb20KICAgIFNORF9TT0Nf
QVBRODAxNl9TQkMuCgpTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxp
bnV4LW02OGsub3JnPgpSZXZpZXdlZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3Jn
PgpBY2tlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KLS0tCnYyOgog
IC0gQWRkIFJldmlld2VkLWJ5LCBBY2tlZC1ieSwKICAtIERyb3AgUkZDIHN0YXRlLAogIC0gU3Bs
aXQgcGVyIHN1YnN5c3RlbS4KLS0tCiBkcml2ZXJzL21haWxib3gvS2NvbmZpZyB8IDIgLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJv
eC9LY29uZmlnIGIvZHJpdmVycy9tYWlsYm94L0tjb25maWcKaW5kZXggYmEyZjE1MjVmNGVlZjQ1
NC4uZjNjNjhmZTE1MTgwZDAzNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tYWlsYm94L0tjb25maWcK
KysrIGIvZHJpdmVycy9tYWlsYm94L0tjb25maWcKQEAgLTE1NCw3ICsxNTQsNiBAQCBjb25maWcg
WEdFTkVfU0xJTVBST19NQk9YCiBjb25maWcgQkNNX1BEQ19NQk9YCiAJdHJpc3RhdGUgIkJyb2Fk
Y29tIEZsZXhTcGFyeCBETUEgTWFpbGJveCIKIAlkZXBlbmRzIG9uIEFSQ0hfQkNNX0lQUk9DIHx8
IENPTVBJTEVfVEVTVAotCWRlcGVuZHMgb24gSEFTX0RNQQogCWhlbHAKIAkgIE1haWxib3ggaW1w
bGVtZW50YXRpb24gZm9yIHRoZSBCcm9hZGNvbSBGbGV4U3BhcnggRE1BIHJpbmcgbWFuYWdlciwK
IAkgIHdoaWNoIHByb3ZpZGVzIGFjY2VzcyB0byB2YXJpb3VzIG9mZmxvYWQgZW5naW5lcyBvbiBC
cm9hZGNvbQpAQCAtMTY0LDcgKzE2Myw2IEBAIGNvbmZpZyBCQ01fRkxFWFJNX01CT1gKIAl0cmlz
dGF0ZSAiQnJvYWRjb20gRmxleFJNIE1haWxib3giCiAJZGVwZW5kcyBvbiBBUk02NAogCWRlcGVu
ZHMgb24gQVJDSF9CQ01fSVBST0MgfHwgQ09NUElMRV9URVNUCi0JZGVwZW5kcyBvbiBIQVNfRE1B
CiAJc2VsZWN0IEdFTkVSSUNfTVNJX0lSUV9ET01BSU4KIAlkZWZhdWx0IG0gaWYgQVJDSF9CQ01f
SVBST0MKIAloZWxwCg==

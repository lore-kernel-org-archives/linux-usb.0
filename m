Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [PATCH/RFC,5/6] scsi: Add NO_DMA dummies for SCSI DMA mapping API
From: Geert Uytterhoeven <geert@linux-m68k.org>
Message-Id: <1517912092-15470-6-git-send-email-geert@linux-m68k.org>
Date: Tue,  6 Feb 2018 11:14:51 +0100
To: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
List-ID: <linux-usb.vger.kernel.org>

QWRkIGR1bW1pZXMgZm9yIHNjc2lfZG1hX3ssdW59bWFwKCksIHRvIGFsbG93IGNvbXBpbGUtdGVz
dGluZyBpZgpOT19ETUE9eS4KClRoaXMgcHJldmVudHMgdGhlIGZvbGxvd2luZyBmcm9tIHNob3dp
bmcgdXAgbGF0ZXI6CgogICAgRVJST1I6ICJzY3NpX2RtYV91bm1hcCIgW2RyaXZlcnMvZmlyZXdp
cmUvZmlyZXdpcmUtc2JwMi5rb10gdW5kZWZpbmVkIQogICAgRVJST1I6ICJzY3NpX2RtYV9tYXAi
IFtkcml2ZXJzL2ZpcmV3aXJlL2ZpcmV3aXJlLXNicDIua29dIHVuZGVmaW5lZCEKClNpZ25lZC1v
ZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+Ci0tLQogaW5j
bHVkZS9zY3NpL3Njc2lfY21uZC5oIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2NzaS9zY3NpX2NtbmQuaCBiL2luY2x1ZGUv
c2NzaS9zY3NpX2NtbmQuaAppbmRleCBkOGQ0YTkwMmE4OGRlZGJjLi42YTEyM2QxZGQyZjgwNjI0
IDEwMDY0NAotLS0gYS9pbmNsdWRlL3Njc2kvc2NzaV9jbW5kLmgKKysrIGIvaW5jbHVkZS9zY3Np
L3Njc2lfY21uZC5oCkBAIC0xNzEsOCArMTcxLDEzIEBAIGV4dGVybiB2b2lkIHNjc2lfa3VubWFw
X2F0b21pY19zZyh2b2lkICp2aXJ0KTsKIAogZXh0ZXJuIGludCBzY3NpX2luaXRfaW8oc3RydWN0
IHNjc2lfY21uZCAqY21kKTsKIAorI2lmZGVmIENPTkZJR19TQ1NJX0RNQQogZXh0ZXJuIGludCBz
Y3NpX2RtYV9tYXAoc3RydWN0IHNjc2lfY21uZCAqY21kKTsKIGV4dGVybiB2b2lkIHNjc2lfZG1h
X3VubWFwKHN0cnVjdCBzY3NpX2NtbmQgKmNtZCk7CisjZWxzZSAvKiAhQ09ORklHX1NDU0lfRE1B
ICovCitzdGF0aWMgaW5saW5lIGludCBzY3NpX2RtYV9tYXAoc3RydWN0IHNjc2lfY21uZCAqY21k
KSB7IHJldHVybiAtRU5PU1lTOyB9CitzdGF0aWMgaW5saW5lIHZvaWQgc2NzaV9kbWFfdW5tYXAo
c3RydWN0IHNjc2lfY21uZCAqY21kKSB7IH0KKyNlbmRpZiAvKiAhQ09ORklHX1NDU0lfRE1BICov
CiAKIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgc2NzaV9zZ19jb3VudChzdHJ1Y3Qgc2NzaV9jbW5k
ICpjbWQpCiB7Cg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v6,42/99] shmem: Convert shmem_confirm_swap to XArray
From: Matthew Wilcox <willy@infradead.org>
Message-Id: <20180117202203.19756-43-willy@infradead.org>
Date: Wed, 17 Jan 2018 12:21:06 -0800
To: linux-kernel@vger.kernel.org
Cc: Matthew Wilcox <mawilcox@microsoft.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, cgroups@vger.kernel.org, linux-sh@vger.kernel.org, David Howells <dhowells@redhat.com>
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294QG1pY3Jvc29mdC5jb20+Cgp4YV9sb2FkIGhh
cyBpdHMgb3duIFJDVSBsb2NraW5nLCBzbyB3ZSBjYW4gZWxpbWluYXRlIGl0IGhlcmUuCgpTaWdu
ZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCA8bWF3aWxjb3hAbWljcm9zb2Z0LmNvbT4KLS0tCiBt
bS9zaG1lbS5jIHwgNyArLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vc2htZW0uYyBiL21tL3NobWVtLmMKaW5kZXgg
ZmFkNmM5ZTc0MDJlLi42NTRmMzY3YWNhOTAgMTAwNjQ0Ci0tLSBhL21tL3NobWVtLmMKKysrIGIv
bW0vc2htZW0uYwpAQCAtMzQ4LDEyICszNDgsNyBAQCBzdGF0aWMgaW50IHNobWVtX3hhX3JlcGxh
Y2Uoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCiBzdGF0aWMgYm9vbCBzaG1lbV9jb25m
aXJtX3N3YXAoc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCiAJCQkgICAgICAgcGdvZmZf
dCBpbmRleCwgc3dwX2VudHJ5X3Qgc3dhcCkKIHsKLQl2b2lkICppdGVtOwotCi0JcmN1X3JlYWRf
bG9jaygpOwotCWl0ZW0gPSByYWRpeF90cmVlX2xvb2t1cCgmbWFwcGluZy0+cGFnZXMsIGluZGV4
KTsKLQlyY3VfcmVhZF91bmxvY2soKTsKLQlyZXR1cm4gaXRlbSA9PSBzd3BfdG9fcmFkaXhfZW50
cnkoc3dhcCk7CisJcmV0dXJuIHhhX2xvYWQoJm1hcHBpbmctPnBhZ2VzLCBpbmRleCkgPT0gc3dw
X3RvX3JhZGl4X2VudHJ5KHN3YXApOwogfQogCiAvKgo=

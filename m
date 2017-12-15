Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,43/78] shmem: Convert shmem_confirm_swap to XArray
From: Matthew Wilcox <willy@infradead.org>
Message-Id: <20171215220450.7899-44-willy@infradead.org>
Date: Fri, 15 Dec 2017 14:04:15 -0800
To: linux-kernel@vger.kernel.org
Cc: Matthew Wilcox <mawilcox@microsoft.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, David Howells <dhowells@redhat.com>, Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>, Rehas Sachdeva <aquannie@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, linux-raid@vger.kernel.org
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

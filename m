Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,66/78] dax: Fix sparse warning
From: Matthew Wilcox <willy@infradead.org>
Message-Id: <20171215220450.7899-67-willy@infradead.org>
Date: Fri, 15 Dec 2017 14:04:38 -0800
To: linux-kernel@vger.kernel.org
Cc: Matthew Wilcox <mawilcox@microsoft.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, David Howells <dhowells@redhat.com>, Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>, Rehas Sachdeva <aquannie@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, linux-raid@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294QG1pY3Jvc29mdC5jb20+CgpzcGFyc2UgZG9l
c24ndCBrbm93IHRoYXQgZm9sbG93X3B0ZV9wbWQgY29uZGl0aW9uYWxseSBhY3F1aXJlcyB0aGUg
cHRsLApzbyBhZGQgYW4gYW5ub3RhdGlvbiB0byBsZXQgaXQga25vdyB3aGF0J3MgZ29pbmcgb24u
CgpTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCA8bWF3aWxjb3hAbWljcm9zb2Z0LmNvbT4K
LS0tCiBmcy9kYXguYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZnMvZGF4LmMgYi9mcy9kYXguYwppbmRleCBmNTkxYWI1YmU1OTAuLjZlZjcyN2Fm
MzBmMCAxMDA2NDQKLS0tIGEvZnMvZGF4LmMKKysrIGIvZnMvZGF4LmMKQEAgLTUzMSw2ICs1MzEs
NyBAQCBzdGF0aWMgdm9pZCBkYXhfbWFwcGluZ19lbnRyeV9ta2NsZWFuKHN0cnVjdCBhZGRyZXNz
X3NwYWNlICptYXBwaW5nLAogCQkgKi8KIAkJaWYgKGZvbGxvd19wdGVfcG1kKHZtYS0+dm1fbW0s
IGFkZHJlc3MsICZzdGFydCwgJmVuZCwgJnB0ZXAsICZwbWRwLCAmcHRsKSkKIAkJCWNvbnRpbnVl
OworCQlfX2FjcXVpcmUocHRsKTsgLyogQ29uZGl0aW9uYWxseSBhY3F1aXJlZCBhYm92ZSAqLwog
CiAJCS8qCiAJCSAqIE5vIG5lZWQgdG8gY2FsbCBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5n
ZSgpIGFzIHdlIGFyZQo=

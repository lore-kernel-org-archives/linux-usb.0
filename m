Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v6,35/99] mm: Convert __do_page_cache_readahead to XArray
From: Matthew Wilcox <willy@infradead.org>
Message-Id: <20180117202203.19756-36-willy@infradead.org>
Date: Wed, 17 Jan 2018 12:20:59 -0800
To: linux-kernel@vger.kernel.org
Cc: Matthew Wilcox <mawilcox@microsoft.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, intel-gfx@lists.freedesktop.org, cgroups@vger.kernel.org, linux-sh@vger.kernel.org, David Howells <dhowells@redhat.com>
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294QG1pY3Jvc29mdC5jb20+CgpUaGlzIG9uZSBp
cyB0cml2aWFsLgoKU2lnbmVkLW9mZi1ieTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294QG1pY3Jv
c29mdC5jb20+Ci0tLQogbW0vcmVhZGFoZWFkLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9yZWFkYWhlYWQu
YyBiL21tL3JlYWRhaGVhZC5jCmluZGV4IGY2NGIzMWIzYTg0YS4uNjZiY2FmZmQ0N2YwIDEwMDY0
NAotLS0gYS9tbS9yZWFkYWhlYWQuYworKysgYi9tbS9yZWFkYWhlYWQuYwpAQCAtMTc0LDkgKzE3
NCw3IEBAIGludCBfX2RvX3BhZ2VfY2FjaGVfcmVhZGFoZWFkKHN0cnVjdCBhZGRyZXNzX3NwYWNl
ICptYXBwaW5nLCBzdHJ1Y3QgZmlsZSAqZmlscCwKIAkJaWYgKHBhZ2Vfb2Zmc2V0ID4gZW5kX2lu
ZGV4KQogCQkJYnJlYWs7CiAKLQkJcmN1X3JlYWRfbG9jaygpOwotCQlwYWdlID0gcmFkaXhfdHJl
ZV9sb29rdXAoJm1hcHBpbmctPnBhZ2VzLCBwYWdlX29mZnNldCk7Ci0JCXJjdV9yZWFkX3VubG9j
aygpOworCQlwYWdlID0geGFfbG9hZCgmbWFwcGluZy0+cGFnZXMsIHBhZ2Vfb2Zmc2V0KTsKIAkJ
aWYgKHBhZ2UgJiYgIXhhX2lzX3ZhbHVlKHBhZ2UpKQogCQkJY29udGludWU7CiAK

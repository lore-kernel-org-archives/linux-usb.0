Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,36/78] mm: Convert __do_page_cache_readahead to XArray
From: Matthew Wilcox <willy@infradead.org>
Message-Id: <20171215220450.7899-37-willy@infradead.org>
Date: Fri, 15 Dec 2017 14:04:08 -0800
To: linux-kernel@vger.kernel.org
Cc: Matthew Wilcox <mawilcox@microsoft.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, David Howells <dhowells@redhat.com>, Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>, Rehas Sachdeva <aquannie@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, linux-raid@vger.kernel.org
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

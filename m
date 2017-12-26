Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,04/78] page cache: Use xa_lock
From: "Kirill A. Shutemov" <kirill@shutemov.name>
Message-Id: <20171226165624.vdarbqqx5czgeqxc@node.shutemov.name>
Date: Tue, 26 Dec 2017 19:56:24 +0300
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <mawilcox@microsoft.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, David Howells <dhowells@redhat.com>, Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>, Rehas Sachdeva <aquannie@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, linux-raid@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBEZWMgMTUsIDIwMTcgYXQgMDI6MDM6MzZQTSAtMDgwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gRnJvbTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294QG1pY3Jvc29mdC5jb20+Cj4g
Cj4gUmVtb3ZlIHRoZSBhZGRyZXNzX3NwYWNlIC0+dHJlZV9sb2NrIGFuZCB1c2UgdGhlIHhhX2xv
Y2sgbmV3bHkgYWRkZWQgdG8KPiB0aGUgcmFkaXhfdHJlZV9yb290LiAgUmVuYW1lIHRoZSBhZGRy
ZXNzX3NwYWNlIC0+cGFnZV90cmVlIHRvIC0+cGFnZXMsCj4gc2luY2Ugd2UgZG9uJ3QgcmVhbGx5
IGNhcmUgdGhhdCBpdCdzIGEgdHJlZS4gIFRha2UgdGhlIG9wcG9ydHVuaXR5IHRvCj4gcmVhcnJh
bmdlIHRoZSBlbGVtZW50cyBvZiBhZGRyZXNzX3NwYWNlIHRvIHBhY2sgdGhlbSBiZXR0ZXIgb24g
NjQtYml0LAo+IGFuZCBtYWtlIHRoZSBjb21tZW50cyBtb3JlIHVzZWZ1bC4KClRoZSBkZXNjcmlw
dGlvbiBzb3VuZHMgYSBsb3QgbGlrZSB0aHJlZSBjb21taXRzIDspCg==

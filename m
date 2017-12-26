Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,03/78] xarray: Add the xa_lock to the radix_tree_root
From: "Kirill A. Shutemov" <kirill@shutemov.name>
Message-Id: <20171226165440.tv6inwa2fgk3bfy6@node.shutemov.name>
Date: Tue, 26 Dec 2017 19:54:40 +0300
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <mawilcox@microsoft.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, David Howells <dhowells@redhat.com>, Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>, Rehas Sachdeva <aquannie@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nilfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, linux-usb@vger.kernel.org, linux-raid@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBEZWMgMTUsIDIwMTcgYXQgMDI6MDM6MzVQTSAtMDgwMCwgTWF0dGhldyBXaWxjb3gg
d3JvdGU6Cj4gRnJvbTogTWF0dGhldyBXaWxjb3ggPG1hd2lsY294QG1pY3Jvc29mdC5jb20+Cj4g
Cj4gVGhpcyByZXN1bHRzIGluIG5vIGNoYW5nZSBpbiBzdHJ1Y3R1cmUgc2l6ZSBvbiA2NC1iaXQg
eDg2IGFzIGl0IGZpdHMgaW4KPiB0aGUgcGFkZGluZyBiZXR3ZWVuIHRoZSBnZnBfdCBhbmQgdGhl
IHZvaWQgKi4KClRoZSBwYXRjaCBkb2VzIG1vcmUgdGhhbiBkZXNjcmliZWQgaW4gdGhlIHN1Ympl
Y3QgYW5kIGNvbW1pdCBtZXNzYWdlLiBBdCBmaXJzdApJIHdhcyBjb25mdXNlZCB3aHkgZG8geW91
IG5lZWQgdG8gdG91Y2ggaWRyIGhlcmUuIEl0IHRvb2sgZmV3IG1pbnV0ZXMgdG8gZmlndXJlCml0
IG91dC4KCkNvdWxkIHlvdSBwbGVhc2UgYWRkIG1vcmUgaW50byBjb21taXQgbWVzc2FnZSBhYm91
dCBsb2NrbmFtZSBhbmQgeGFfIGxvY2tpbmcKaW50ZXJmYWNlIHNpbmNlIHlvdSBpbnRyb2R1Y2Ug
aXQgaGVyZT8K

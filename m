Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: kernel BUG at ./include/linux/mm.h:LINE! (3)
From: Pete Zaitcev <zaitcev@redhat.com>
Message-Id: <20180103184213.711b6704@lembas.zaitcev.lan>
Date: Wed, 3 Jan 2018 18:42:13 -0600
To: Matthew Wilcox <willy@infradead.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mm@kvack.org, linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCAzIEphbiAyMDE4IDEzOjA4OjEyIC0wODAwCk1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKCj4gPiArCW11dGV4X2xvY2soJnJwLT5mZXRjaF9sb2NrKTsK
PiA+ICAJb2Zmc2V0ID0gdm1mLT5wZ29mZiA8PCBQQUdFX1NISUZUOwo+ID4gIAlpZiAob2Zmc2V0
ID49IHJwLT5iX3NpemUpCj4gPiArCQltdXRleF91bmxvY2soJnJwLT5mZXRjaF9sb2NrKTsKPiA+
ICAJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7Cj4gPiAgCWNodW5rX2lkeCA9IG9mZnNldCAvIENI
VU5LX1NJWkU7ICAKPiAKPiBtaXNzaW5nIGJyYWNlcyAuLi4gbWF5YmUgeW91J2QgcmF0aGVyIGEg
J2dvdG8gc2lnYnVzJyBhcHByb2FjaD8KClRoYW5rcy4gV2hhdCBhIHdheSB0byByZXR1cm4gdG8g
a2VybmVsIHByb2dyYW1taW5nIGZvciBtZS4gSSdtIGdvaW5nCnRvIHRlc3QgaXQgYW55d2F5LCBh
bHJlYWR5IHN0YXJ0ZWQgdG8gdW5wYWNraW5nIGEgUEMsIGJ1dCB5ZWFoLi4uCgotLSBQZXRlCi0t
LQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3Jp
YmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIu
a2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3Jn
L21ham9yZG9tby1pbmZvLmh0bWwK

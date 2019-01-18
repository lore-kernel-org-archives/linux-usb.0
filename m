Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [19/21] treewide: add checks for the return value of memblock_alloc*()
From: Heiko Carstens <heiko.carstens@de.ibm.com>
Message-Id: <20190118084302.GA4160@osiris>
Date: Fri, 18 Jan 2019 09:43:02 +0100
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDM6NDQ6MTlQTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBBZGQgY2hlY2sgZm9yIHRoZSByZXR1cm4gdmFsdWUgb2YgbWVtYmxvY2tfYWxsb2Mq
KCkgZnVuY3Rpb25zIGFuZCBjYWxsCj4gcGFuaWMoKSBpbiBjYXNlIG9mIGVycm9yLgo+IFRoZSBw
YW5pYyBtZXNzYWdlIHJlcGVhdHMgdGhlIG9uZSB1c2VkIGJ5IHBhbmljaW5nIG1lbWJsb2NrIGFs
bG9jYXRvcnMgd2l0aAo+IGFkanVzdG1lbnQgb2YgcGFyYW1ldGVycyB0byBpbmNsdWRlIG9ubHkg
cmVsZXZhbnQgb25lcy4KPiAKPiBUaGUgcmVwbGFjZW1lbnQgd2FzIG1vc3RseSBhdXRvbWF0ZWQg
d2l0aCBzZW1hbnRpYyBwYXRjaGVzIGxpa2UgdGhlIG9uZQo+IGJlbG93IHdpdGggbWFudWFsIG1h
c3NhZ2luZyBvZiBmb3JtYXQgc3RyaW5ncy4KPiAKPiBAQAo+IGV4cHJlc3Npb24gcHRyLCBzaXpl
LCBhbGlnbjsKPiBAQAo+IHB0ciA9IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFsaWduKTsKPiArIGlm
ICghcHRyKQo+ICsgCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVsdSBieXRlcyBhbGln
bj0weCVseFxuIiwgX19mdW5jX18sCj4gc2l6ZSwgYWxpZ24pOwo+IAo+IFNpZ25lZC1vZmYtYnk6
IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KLi4uCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvczM5MC9udW1hL3RvcHRyZWUuYyBiL2FyY2gvczM5MC9udW1hL3RvcHRyZWUuYwo+IGluZGV4
IDcxYTYwOGMuLjAxMThjNzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL251bWEvdG9wdHJlZS5j
Cj4gKysrIGIvYXJjaC9zMzkwL251bWEvdG9wdHJlZS5jCj4gQEAgLTMxLDEwICszMSwxNCBAQCBz
dHJ1Y3QgdG9wdHJlZSBfX3JlZiAqdG9wdHJlZV9hbGxvYyhpbnQgbGV2ZWwsIGludCBpZCkKPiAg
ewo+ICAJc3RydWN0IHRvcHRyZWUgKnJlczsKPiAKPiAtCWlmIChzbGFiX2lzX2F2YWlsYWJsZSgp
KQo+ICsJaWYgKHNsYWJfaXNfYXZhaWxhYmxlKCkpIHsKPiAgCQlyZXMgPSBremFsbG9jKHNpemVv
ZigqcmVzKSwgR0ZQX0tFUk5FTCk7Cj4gLQllbHNlCj4gKwl9IGVsc2Ugewo+ICAJCXJlcyA9IG1l
bWJsb2NrX2FsbG9jKHNpemVvZigqcmVzKSwgOCk7Cj4gKwkJaWYgKCFyZXMpCj4gKwkJCXBhbmlj
KCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlcyBhbGlnbj0weCV4XG4iLAo+ICsJCQkg
ICAgICBfX2Z1bmNfXywgc2l6ZW9mKCpyZXMpLCA4KTsKPiArCX0KPiAgCWlmICghcmVzKQo+ICAJ
CXJldHVybiByZXM7CgpQbGVhc2UgcmVtb3ZlIHRoaXMgaHVuaywgc2luY2UgdGhlIGNvZGUgX3No
b3VsZF8gYmUgYWJsZSB0byBoYW5kbGUKYWxsb2NhdGlvbiBmYWlsdXJlcyBhbnl3YXkgKHNlZSBl
bmQgb2YgcXVvdGVkIGNvZGUpLgoKT3RoZXJ3aXNlIGZvciB0aGUgczM5MCBiaXRzOgpBY2tlZC1i
eTogSGVpa28gQ2Fyc3RlbnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+Cg==

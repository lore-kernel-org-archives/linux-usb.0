Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [19/21] treewide: add checks for the return value of memblock_alloc*()
From: Guo Ren <guoren@kernel.org>
Message-Id: <20190117070602.GA31839@guoren-Inspiron-7460>
Date: Thu, 17 Jan 2019 15:06:03 +0800
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDM6NDQ6MTlQTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiAgYXJjaC9jc2t5L21tL2hpZ2htZW0uYyAgICAgICAgICAgICAgICAgICAgfCAgNSAr
KysrKwouLi4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9jc2t5L21tL2hpZ2htZW0uYyBiL2FyY2gvY3Nr
eS9tbS9oaWdobWVtLmMKPiBpbmRleCA1M2IxYmZhLi4zMzE3Yjc3NCAxMDA2NDQKPiAtLS0gYS9h
cmNoL2Nza3kvbW0vaGlnaG1lbS5jCj4gKysrIGIvYXJjaC9jc2t5L21tL2hpZ2htZW0uYwo+IEBA
IC0xNDEsNiArMTQxLDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBmaXhyYW5nZV9pbml0KHVuc2ln
bmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAo+ICAJCQlmb3IgKDsgKGsgPCBQVFJT
X1BFUl9QTUQpICYmICh2YWRkciAhPSBlbmQpOyBwbWQrKywgaysrKSB7Cj4gIAkJCQlpZiAocG1k
X25vbmUoKnBtZCkpIHsKPiAgCQkJCQlwdGUgPSAocHRlX3QgKikgbWVtYmxvY2tfYWxsb2NfbG93
KFBBR0VfU0laRSwgUEFHRV9TSVpFKTsKPiArCQkJCQlpZiAoIXB0ZSkKPiArCQkJCQkJcGFuaWMo
IiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJWx1IGJ5dGVzIGFsaWduPSVseFxuIiwKPiArCQkJCQkJ
ICAgICAgX19mdW5jX18sIFBBR0VfU0laRSwKPiArCQkJCQkJICAgICAgUEFHRV9TSVpFKTsKPiAr
Cj4gIAkJCQkJc2V0X3BtZChwbWQsIF9fcG1kKF9fcGEocHRlKSkpOwo+ICAJCQkJCUJVR19PTihw
dGUgIT0gcHRlX29mZnNldF9rZXJuZWwocG1kLCAwKSk7Cj4gIAkJCQl9CgpMb29rcyBnb29kIGZv
ciBtZSBhbmQgcGFuaWMgaXMgb2suCgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8cmVuX2d1b0BjLXNr
eS5jb20+Cg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,06/21] memblock: memblock_phys_alloc_try_nid(): don't panic
From: Michael Ellerman <mpe@ellerman.id.au>
Message-Id: <87y373rdll.fsf@concordia.ellerman.id.au>
Date: Tue, 29 Jan 2019 20:56:54 +1100
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cml0ZXM6Cgo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L21tL251bWEuYyBiL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4gaW5kZXggYWUz
NGUzYS4uMmM2MWVhNCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L21tL251bWEuYwo+ICsrKyBi
L2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4gQEAgLTIzNyw2ICsyMzcsMTAgQEAgc3RhdGljIHZvaWQg
X19pbml0IHNldHVwX25vZGVfZGF0YShpbnQgbmlkLCB1NjQgc3RhcnRfcGZuLCB1NjQgZW5kX3Bm
bikKPiAgCQlwcl9pbmZvKCJJbml0bWVtIHNldHVwIG5vZGUgJWQgWzxtZW1vcnktbGVzcyBub2Rl
Pl1cbiIsIG5pZCk7Cj4gIAo+ICAJbmRfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQo
bmRfc2l6ZSwgU01QX0NBQ0hFX0JZVEVTLCBuaWQpOwo+ICsJaWYgKCFuZF9wYSkKPiArCQlwYW5p
YygiQ2Fubm90IGFsbG9jYXRlICV6dSBieXRlcyBmb3Igbm9kZSAlZCBkYXRhXG4iLAo+ICsJCSAg
ICAgIG5kX3NpemUsIG5pZCk7Cj4gKwo+ICAJbmQgPSBfX3ZhKG5kX3BhKTsKCkFja2VkLWJ5OiBN
aWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQoKY2hlZXJzCg==

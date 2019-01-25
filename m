Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,06/21] memblock: memblock_phys_alloc_try_nid(): don't panic
From: Mike Rapoport <rppt@linux.ibm.com>
Message-Id: <20190125193252.GH31519@rapoport-lnx>
Date: Fri, 25 Jan 2019 21:32:52 +0200
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMDU6NDU6MDJQTSArMDAwMCwgQ2F0YWxpbiBNYXJpbmFz
IHdyb3RlOgo+IE9uIE1vbiwgSmFuIDIxLCAyMDE5IGF0IDEwOjAzOjUzQU0gKzAyMDAsIE1pa2Ug
UmFwb3BvcnQgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1hLmMgYi9h
cmNoL2FybTY0L21tL251bWEuYwo+ID4gaW5kZXggYWUzNGUzYS4uMmM2MWVhNCAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4gPiArKysgYi9hcmNoL2FybTY0L21tL251bWEu
Ywo+ID4gQEAgLTIzNyw2ICsyMzcsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX25vZGVf
ZGF0YShpbnQgbmlkLCB1NjQgc3RhcnRfcGZuLCB1NjQgZW5kX3BmbikKPiA+ICAJCXByX2luZm8o
IkluaXRtZW0gc2V0dXAgbm9kZSAlZCBbPG1lbW9yeS1sZXNzIG5vZGU+XVxuIiwgbmlkKTsKPiA+
ICAKPiA+ICAJbmRfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQobmRfc2l6ZSwgU01Q
X0NBQ0hFX0JZVEVTLCBuaWQpOwo+ID4gKwlpZiAoIW5kX3BhKQo+ID4gKwkJcGFuaWMoIkNhbm5v
dCBhbGxvY2F0ZSAlenUgYnl0ZXMgZm9yIG5vZGUgJWQgZGF0YVxuIiwKPiA+ICsJCSAgICAgIG5k
X3NpemUsIG5pZCk7Cj4gPiArCj4gPiAgCW5kID0gX192YShuZF9wYSk7Cj4gPiAgCj4gPiAgCS8q
IHJlcG9ydCBhbmQgaW5pdGlhbGl6ZSAqLwo+IAo+IERvZXMgaXQgbWVhbiB0aGF0IG1lbWJsb2Nr
X3BoeXNfYWxsb2NfdHJ5X25pZCgpIG5ldmVyIHJldHVybnMgdmFsaWQKPiBwaHlzaWNhbCBtZW1v
cnkgc3RhcnRpbmcgYXQgMD8KClllcywgaXQgZG9lcy4KbWVtYmxvY2tfZmluZF9pbl9yYW5nZV9u
b2RlKCkgdGhhdCBpcyB1c2VkIGJ5IGFsbCBhbGxvY2F0aW9uIG1ldGhvZHMKc2tpcHMgdGhlIGZp
cnN0IHBhZ2UgWzFdLgogClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9tbS9tZW1ibG9jay5jI24yNTcKCj4g
LS0gCj4gQ2F0YWxpbgo+Cg==

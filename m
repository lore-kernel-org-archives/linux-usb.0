Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [21/21] memblock: drop memblock_alloc_*_nopanic() variants
From: Petr Mladek <pmladek@suse.com>
Message-Id: <20190117092842.wnvsc6em5mxga3rn@pathway.suse.cz>
Date: Thu, 17 Jan 2019 10:28:42 +0100
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkIDIwMTktMDEtMTYgMTU6NDQ6MjEsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gQXMgYWxs
IHRoZSBtZW1ibG9jayBhbGxvY2F0aW9uIGZ1bmN0aW9ucyByZXR1cm4gTlVMTCBpbiBjYXNlIG9m
IGVycm9yCj4gcmF0aGVyIHRoYW4gcGFuaWMoKSwgdGhlIGR1cGxpY2F0ZXMgd2l0aCBfbm9wYW5p
YyBzdWZmaXggY2FuIGJlIHJlbW92ZWQuCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEva2VybmVsL3By
aW50ay9wcmludGsuYyBiL2tlcm5lbC9wcmludGsvcHJpbnRrLmMKPiBpbmRleCBjNGYwYTQxLi5h
ZTY1MjIxIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9wcmludGsvcHJpbnRrLmMKPiArKysgYi9rZXJu
ZWwvcHJpbnRrL3ByaW50ay5jCj4gQEAgLTExNDcsMTcgKzExNDcsMTQgQEAgdm9pZCBfX2luaXQg
c2V0dXBfbG9nX2J1ZihpbnQgZWFybHkpCj4gIAlpZiAoIW5ld19sb2dfYnVmX2xlbikKPiAgCQly
ZXR1cm47Cj4gIAo+IC0JaWYgKGVhcmx5KSB7Cj4gLQkJbmV3X2xvZ19idWYgPQo+IC0JCQltZW1i
bG9ja19hbGxvYyhuZXdfbG9nX2J1Zl9sZW4sIExPR19BTElHTik7Cj4gLQl9IGVsc2Ugewo+IC0J
CW5ld19sb2dfYnVmID0gbWVtYmxvY2tfYWxsb2Nfbm9wYW5pYyhuZXdfbG9nX2J1Zl9sZW4sCj4g
LQkJCQkJCQkgIExPR19BTElHTik7Cj4gLQl9Cj4gLQo+ICsJbmV3X2xvZ19idWYgPSBtZW1ibG9j
a19hbGxvYyhuZXdfbG9nX2J1Zl9sZW4sIExPR19BTElHTik7CgpUaGUgYWJvdmUgY2hhbmdlIGlz
IGVub3VnaC4KCj4gIAlpZiAodW5saWtlbHkoIW5ld19sb2dfYnVmKSkgewo+IC0JCXByX2Vycigi
bG9nX2J1Zl9sZW46ICVsdSBieXRlcyBub3QgYXZhaWxhYmxlXG4iLAo+IC0JCQluZXdfbG9nX2J1
Zl9sZW4pOwo+ICsJCWlmIChlYXJseSkKPiArCQkJcGFuaWMoImxvZ19idWZfbGVuOiAlbHUgYnl0
ZXMgbm90IGF2YWlsYWJsZVxuIiwKPiArCQkJCW5ld19sb2dfYnVmX2xlbik7CgpwYW5pYygpIGlz
IG5vdCBuZWVkZWQgaGVyZS4gcHJpbnRrKCkgd2lsbCBqdXN0IGNvbnRpbnVlIHVzaW5nCnRoZSAo
c21hbGxlcikgc3RhdGljIGJ1ZmZlci4KCj4gKwkJZWxzZQo+ICsJCQlwcl9lcnIoImxvZ19idWZf
bGVuOiAlbHUgYnl0ZXMgbm90IGF2YWlsYWJsZVxuIiwKPiArCQkJICAgICAgIG5ld19sb2dfYnVm
X2xlbik7Cj4gIAkJcmV0dXJuOwo+ICAJfQoKQmVzdCBSZWdhcmRzLApQZXRyCg==

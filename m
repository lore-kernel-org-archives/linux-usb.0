Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,19/21] treewide: add checks for the return value of memblock_alloc*()
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-Id: <b7c12014-14ae-2a38-900c-41fd145307bc@c-s.fr>
Date: Thu, 31 Jan 2019 07:07:46 +0100
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>, Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org, Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-ID: <linux-usb.vger.kernel.org>

TGUgMjEvMDEvMjAxOSDDoCAwOTowNCwgTWlrZSBSYXBvcG9ydCBhIMOpY3JpdMKgOgo+IEFkZCBj
aGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBtZW1ibG9ja19hbGxvYyooKSBmdW5jdGlvbnMg
YW5kIGNhbGwKPiBwYW5pYygpIGluIGNhc2Ugb2YgZXJyb3IuCj4gVGhlIHBhbmljIG1lc3NhZ2Ug
cmVwZWF0cyB0aGUgb25lIHVzZWQgYnkgcGFuaWNpbmcgbWVtYmxvY2sgYWxsb2NhdG9ycyB3aXRo
Cj4gYWRqdXN0bWVudCBvZiBwYXJhbWV0ZXJzIHRvIGluY2x1ZGUgb25seSByZWxldmFudCBvbmVz
Lgo+IAo+IFRoZSByZXBsYWNlbWVudCB3YXMgbW9zdGx5IGF1dG9tYXRlZCB3aXRoIHNlbWFudGlj
IHBhdGNoZXMgbGlrZSB0aGUgb25lCj4gYmVsb3cgd2l0aCBtYW51YWwgbWFzc2FnaW5nIG9mIGZv
cm1hdCBzdHJpbmdzLgo+IAo+IEBACj4gZXhwcmVzc2lvbiBwdHIsIHNpemUsIGFsaWduOwo+IEBA
Cj4gcHRyID0gbWVtYmxvY2tfYWxsb2Moc2l6ZSwgYWxpZ24pOwo+ICsgaWYgKCFwdHIpCj4gKyAJ
cGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJWx1IGJ5dGVzIGFsaWduPTB4JWx4XG4iLCBf
X2Z1bmNfXywKPiBzaXplLCBhbGlnbik7Cj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9y
dCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxyZW5fZ3VvQGMt
c2t5LmNvbT4gICAgICAgICAgICAgIyBjLXNreQo+IEFja2VkLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1
bC5idXJ0b25AbWlwcy5jb20+CSAgICAgIyBNSVBTCj4gQWNrZWQtYnk6IEhlaWtvIENhcnN0ZW5z
IDxoZWlrby5jYXJzdGVuc0BkZS5pYm0uY29tPiAjIHMzOTAKPiBSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiAgICAgICAgICMgWGVuCj4gLS0tCgpbLi4uXQoKPiBk
aWZmIC0tZ2l0IGEvbW0vc3BhcnNlLmMgYi9tbS9zcGFyc2UuYwo+IGluZGV4IDdlYTVkYzYuLmFk
OTQyNDIgMTAwNjQ0Cj4gLS0tIGEvbW0vc3BhcnNlLmMKPiArKysgYi9tbS9zcGFyc2UuYwoKWy4u
Ll0KCj4gQEAgLTQyNSw2ICs0MzYsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IHNwYXJzZV9idWZm
ZXJfaW5pdCh1bnNpZ25lZCBsb25nIHNpemUsIGludCBuaWQpCj4gICAJCW1lbWJsb2NrX2FsbG9j
X3RyeV9uaWRfcmF3KHNpemUsIFBBR0VfU0laRSwKPiAgIAkJCQkJCV9fcGEoTUFYX0RNQV9BRERS
RVNTKSwKPiAgIAkJCQkJCU1FTUJMT0NLX0FMTE9DX0FDQ0VTU0lCTEUsIG5pZCk7Cj4gKwlpZiAo
IXNwYXJzZW1hcF9idWYpCj4gKwkJcGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2NhdGUgJWx1IGJ5
dGVzIGFsaWduPTB4JWx4IG5pZD0lZCBmcm9tPSVseFxuIiwKPiArCQkgICAgICBfX2Z1bmNfXywg
c2l6ZSwgUEFHRV9TSVpFLCBuaWQsIF9fcGEoTUFYX0RNQV9BRERSRVNTKSk7Cj4gKwoKbWVtYmxv
Y2tfYWxsb2NfdHJ5X25pZF9yYXcoKSBkb2VzIG5vdCBwYW5pYyAoaGVscCBleHBsaWNpdGx5IHNh
eXM6IERvZXMgCm5vdCB6ZXJvIGFsbG9jYXRlZCBtZW1vcnksIGRvZXMgbm90IHBhbmljIGlmIHJl
cXVlc3QgY2Fubm90IGJlIHNhdGlzZmllZC4pLgoKU3RlcGhlbiBSb3Rod2VsbCByZXBvcnRzIGEg
Ym9vdCBmYWlsdXJlIGR1ZSB0byB0aGlzIGNoYW5nZS4KCkNocmlzdG9waGUKCj4gICAJc3BhcnNl
bWFwX2J1Zl9lbmQgPSBzcGFyc2VtYXBfYnVmICsgc2l6ZTsKPiAgIH0KPiAgIAo+Cg==

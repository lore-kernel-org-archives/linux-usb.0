Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,19/21] treewide: add checks for the return value of memblock_alloc*()
From: Mike Rapoport <rppt@linux.ibm.com>
Message-Id: <20190131064139.GB28876@rapoport-lnx>
Date: Thu, 31 Jan 2019 08:41:39 +0200
To: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: linux-mm@kvack.org, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>, Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org, Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDc6MDc6NDZBTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJv
eSB3cm90ZToKPiAKPiAKPiBMZSAyMS8wMS8yMDE5IMOgIDA5OjA0LCBNaWtlIFJhcG9wb3J0IGEg
w6ljcml0wqA6Cj4gPkFkZCBjaGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBtZW1ibG9ja19h
bGxvYyooKSBmdW5jdGlvbnMgYW5kIGNhbGwKPiA+cGFuaWMoKSBpbiBjYXNlIG9mIGVycm9yLgo+
ID5UaGUgcGFuaWMgbWVzc2FnZSByZXBlYXRzIHRoZSBvbmUgdXNlZCBieSBwYW5pY2luZyBtZW1i
bG9jayBhbGxvY2F0b3JzIHdpdGgKPiA+YWRqdXN0bWVudCBvZiBwYXJhbWV0ZXJzIHRvIGluY2x1
ZGUgb25seSByZWxldmFudCBvbmVzLgo+ID4KPiA+VGhlIHJlcGxhY2VtZW50IHdhcyBtb3N0bHkg
YXV0b21hdGVkIHdpdGggc2VtYW50aWMgcGF0Y2hlcyBsaWtlIHRoZSBvbmUKPiA+YmVsb3cgd2l0
aCBtYW51YWwgbWFzc2FnaW5nIG9mIGZvcm1hdCBzdHJpbmdzLgo+ID4KPiA+QEAKPiA+ZXhwcmVz
c2lvbiBwdHIsIHNpemUsIGFsaWduOwo+ID5AQAo+ID5wdHIgPSBtZW1ibG9ja19hbGxvYyhzaXpl
LCBhbGlnbik7Cj4gPisgaWYgKCFwdHIpCj4gPisgCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9j
YXRlICVsdSBieXRlcyBhbGlnbj0weCVseFxuIiwgX19mdW5jX18sCj4gPnNpemUsIGFsaWduKTsK
PiA+Cj4gPlNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
PiA+UmV2aWV3ZWQtYnk6IEd1byBSZW4gPHJlbl9ndW9AYy1za3kuY29tPiAgICAgICAgICAgICAj
IGMtc2t5Cj4gPkFja2VkLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25AbWlwcy5jb20+CSAg
ICAgIyBNSVBTCj4gPkFja2VkLWJ5OiBIZWlrbyBDYXJzdGVucyA8aGVpa28uY2Fyc3RlbnNAZGUu
aWJtLmNvbT4gIyBzMzkwCj4gPlJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+ICAgICAgICAgIyBYZW4KPiA+LS0tCj4gCj4gWy4uLl0KPiAKPiA+ZGlmZiAtLWdpdCBh
L21tL3NwYXJzZS5jIGIvbW0vc3BhcnNlLmMKPiA+aW5kZXggN2VhNWRjNi4uYWQ5NDI0MiAxMDA2
NDQKPiA+LS0tIGEvbW0vc3BhcnNlLmMKPiA+KysrIGIvbW0vc3BhcnNlLmMKPiAKPiBbLi4uXQo+
IAo+ID5AQCAtNDI1LDYgKzQzNiwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc3BhcnNlX2J1ZmZl
cl9pbml0KHVuc2lnbmVkIGxvbmcgc2l6ZSwgaW50IG5pZCkKPiA+ICAJCW1lbWJsb2NrX2FsbG9j
X3RyeV9uaWRfcmF3KHNpemUsIFBBR0VfU0laRSwKPiA+ICAJCQkJCQlfX3BhKE1BWF9ETUFfQURE
UkVTUyksCj4gPiAgCQkJCQkJTUVNQkxPQ0tfQUxMT0NfQUNDRVNTSUJMRSwgbmlkKTsKPiA+Kwlp
ZiAoIXNwYXJzZW1hcF9idWYpCj4gPisJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVs
dSBieXRlcyBhbGlnbj0weCVseCBuaWQ9JWQgZnJvbT0lbHhcbiIsCj4gPisJCSAgICAgIF9fZnVu
Y19fLCBzaXplLCBQQUdFX1NJWkUsIG5pZCwgX19wYShNQVhfRE1BX0FERFJFU1MpKTsKPiA+Kwo+
IAo+IG1lbWJsb2NrX2FsbG9jX3RyeV9uaWRfcmF3KCkgZG9lcyBub3QgcGFuaWMgKGhlbHAgZXhw
bGljaXRseSBzYXlzOiBEb2VzIG5vdAo+IHplcm8gYWxsb2NhdGVkIG1lbW9yeSwgZG9lcyBub3Qg
cGFuaWMgaWYgcmVxdWVzdCBjYW5ub3QgYmUgc2F0aXNmaWVkLikuCgoiRG9lcyBub3QgcGFuaWMi
IGRvZXMgbm90IG1lYW4gaXQgYWx3YXlzIHN1Y2NlZWRzLgogCj4gU3RlcGhlbiBSb3Rod2VsbCBy
ZXBvcnRzIGEgYm9vdCBmYWlsdXJlIGR1ZSB0byB0aGlzIGNoYW5nZS4KClBsZWFzZSBzZWUgbXkg
cmVwbHkgb24gdGhhdCB0aHJlYWQuCgo+IENocmlzdG9waGUKPiAKPiA+ICAJc3BhcnNlbWFwX2J1
Zl9lbmQgPSBzcGFyc2VtYXBfYnVmICsgc2l6ZTsKPiA+ICB9Cj4gPgo+Cg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,19/21] treewide: add checks for the return value of memblock_alloc*()
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-Id: <8838f7ab-998b-6d78-02a8-a53f8a3619d9@c-s.fr>
Date: Thu, 31 Jan 2019 07:44:14 +0100
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>, Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org, Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-ID: <linux-usb.vger.kernel.org>

TGUgMzEvMDEvMjAxOSDDoCAwNzo0MSwgTWlrZSBSYXBvcG9ydCBhIMOpY3JpdMKgOgo+IE9uIFRo
dSwgSmFuIDMxLCAyMDE5IGF0IDA3OjA3OjQ2QU0gKzAxMDAsIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6Cj4+Cj4+Cj4+IExlIDIxLzAxLzIwMTkgw6AgMDk6MDQsIE1pa2UgUmFwb3BvcnQgYSDDqWNy
aXTCoDoKPj4+IEFkZCBjaGVjayBmb3IgdGhlIHJldHVybiB2YWx1ZSBvZiBtZW1ibG9ja19hbGxv
YyooKSBmdW5jdGlvbnMgYW5kIGNhbGwKPj4+IHBhbmljKCkgaW4gY2FzZSBvZiBlcnJvci4KPj4+
IFRoZSBwYW5pYyBtZXNzYWdlIHJlcGVhdHMgdGhlIG9uZSB1c2VkIGJ5IHBhbmljaW5nIG1lbWJs
b2NrIGFsbG9jYXRvcnMgd2l0aAo+Pj4gYWRqdXN0bWVudCBvZiBwYXJhbWV0ZXJzIHRvIGluY2x1
ZGUgb25seSByZWxldmFudCBvbmVzLgo+Pj4KPj4+IFRoZSByZXBsYWNlbWVudCB3YXMgbW9zdGx5
IGF1dG9tYXRlZCB3aXRoIHNlbWFudGljIHBhdGNoZXMgbGlrZSB0aGUgb25lCj4+PiBiZWxvdyB3
aXRoIG1hbnVhbCBtYXNzYWdpbmcgb2YgZm9ybWF0IHN0cmluZ3MuCj4+Pgo+Pj4gQEAKPj4+IGV4
cHJlc3Npb24gcHRyLCBzaXplLCBhbGlnbjsKPj4+IEBACj4+PiBwdHIgPSBtZW1ibG9ja19hbGxv
YyhzaXplLCBhbGlnbik7Cj4+PiArIGlmICghcHRyKQo+Pj4gKyAJcGFuaWMoIiVzOiBGYWlsZWQg
dG8gYWxsb2NhdGUgJWx1IGJ5dGVzIGFsaWduPTB4JWx4XG4iLCBfX2Z1bmNfXywKPj4+IHNpemUs
IGFsaWduKTsKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+Cj4+PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8cmVuX2d1b0BjLXNreS5jb20+ICAg
ICAgICAgICAgICMgYy1za3kKPj4+IEFja2VkLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1bC5idXJ0b25A
bWlwcy5jb20+CSAgICAgIyBNSVBTCj4+PiBBY2tlZC1ieTogSGVpa28gQ2Fyc3RlbnMgPGhlaWtv
LmNhcnN0ZW5zQGRlLmlibS5jb20+ICMgczM5MAo+Pj4gUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4gICAgICAgICAjIFhlbgo+Pj4gLS0tCj4+Cj4+IFsuLi5dCj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvbW0vc3BhcnNlLmMgYi9tbS9zcGFyc2UuYwo+Pj4gaW5kZXggN2Vh
NWRjNi4uYWQ5NDI0MiAxMDA2NDQKPj4+IC0tLSBhL21tL3NwYXJzZS5jCj4+PiArKysgYi9tbS9z
cGFyc2UuYwo+Pgo+PiBbLi4uXQo+Pgo+Pj4gQEAgLTQyNSw2ICs0MzYsMTAgQEAgc3RhdGljIHZv
aWQgX19pbml0IHNwYXJzZV9idWZmZXJfaW5pdCh1bnNpZ25lZCBsb25nIHNpemUsIGludCBuaWQp
Cj4+PiAgIAkJbWVtYmxvY2tfYWxsb2NfdHJ5X25pZF9yYXcoc2l6ZSwgUEFHRV9TSVpFLAo+Pj4g
ICAJCQkJCQlfX3BhKE1BWF9ETUFfQUREUkVTUyksCj4+PiAgIAkJCQkJCU1FTUJMT0NLX0FMTE9D
X0FDQ0VTU0lCTEUsIG5pZCk7Cj4+PiArCWlmICghc3BhcnNlbWFwX2J1ZikKPj4+ICsJCXBhbmlj
KCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICVsdSBieXRlcyBhbGlnbj0weCVseCBuaWQ9JWQgZnJv
bT0lbHhcbiIsCj4+PiArCQkgICAgICBfX2Z1bmNfXywgc2l6ZSwgUEFHRV9TSVpFLCBuaWQsIF9f
cGEoTUFYX0RNQV9BRERSRVNTKSk7Cj4+PiArCj4+Cj4+IG1lbWJsb2NrX2FsbG9jX3RyeV9uaWRf
cmF3KCkgZG9lcyBub3QgcGFuaWMgKGhlbHAgZXhwbGljaXRseSBzYXlzOiBEb2VzIG5vdAo+PiB6
ZXJvIGFsbG9jYXRlZCBtZW1vcnksIGRvZXMgbm90IHBhbmljIGlmIHJlcXVlc3QgY2Fubm90IGJl
IHNhdGlzZmllZC4pLgo+IAo+ICJEb2VzIG5vdCBwYW5pYyIgZG9lcyBub3QgbWVhbiBpdCBhbHdh
eXMgc3VjY2VlZHMuCgpJIGFncmVlLCBidXQgYXQgbGVhc3QgaGVyZSB5b3UgYXJlIGNoYW5naW5n
IHRoZSBiZWhhdmlvdXIgYnkgbWFraW5nIGl0IApwYW5pYyBleHBsaWNpdGx5LiBBcmUgd2Ugc3Vy
ZSB0aGVyZSBhcmUgbm90IGNhc2VzIHdoZXJlIHRoZSBzeXN0ZW0gY291bGQgCmp1c3QgY29udGlu
dWUgZnVuY3Rpb25uaW5nID8gTWF5YmUgYSBXQVJOX09OKCkgd291bGQgYmUgZW5vdWdoIHRoZXJl
ID8KCkNocmlzdG9waGUKCj4gICAKPj4gU3RlcGhlbiBSb3Rod2VsbCByZXBvcnRzIGEgYm9vdCBm
YWlsdXJlIGR1ZSB0byB0aGlzIGNoYW5nZS4KPiAKPiBQbGVhc2Ugc2VlIG15IHJlcGx5IG9uIHRo
YXQgdGhyZWFkLgo+IAo+PiBDaHJpc3RvcGhlCj4+Cj4+PiAgIAlzcGFyc2VtYXBfYnVmX2VuZCA9
IHNwYXJzZW1hcF9idWYgKyBzaXplOwo+Pj4gICB9Cj4+Pgo+Pgo+Cg==

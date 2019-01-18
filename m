Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [21/21] memblock: drop memblock_alloc_*_nopanic() variants
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190118084230.GA8855@kroah.com>
Date: Fri, 18 Jan 2019 09:42:30 +0100
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMDM6NDQ6MjFQTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBBcyBhbGwgdGhlIG1lbWJsb2NrIGFsbG9jYXRpb24gZnVuY3Rpb25zIHJldHVybiBO
VUxMIGluIGNhc2Ugb2YgZXJyb3IKPiByYXRoZXIgdGhhbiBwYW5pYygpLCB0aGUgZHVwbGljYXRl
cyB3aXRoIF9ub3BhbmljIHN1ZmZpeCBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gvYXJjL2tl
cm5lbC91bndpbmQuYyAgICAgICB8ICAzICstLQo+ICBhcmNoL3NoL21tL2luaXQuYyAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBhcmNoL3g4Ni9rZXJuZWwvc2V0dXBfcGVyY3B1LmMgfCAxMCArKysr
Ky0tLS0tCj4gIGFyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYyAgICB8IDE0ICsrKysrKysrLS0t
LS0tCj4gIGRyaXZlcnMvZmlybXdhcmUvbWVtbWFwLmMgICAgICB8ICAyICstCj4gIGRyaXZlcnMv
dXNiL2Vhcmx5L3hoY2ktZGJjLmMgICB8ICAyICstCj4gIGluY2x1ZGUvbGludXgvbWVtYmxvY2su
aCAgICAgICB8IDM1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGtlcm5l
bC9kbWEvc3dpb3RsYi5jICAgICAgICAgICB8ICAyICstCj4gIGtlcm5lbC9wcmludGsvcHJpbnRr
LmMgICAgICAgICB8IDE3ICsrKysrKystLS0tLS0tLS0tCj4gIG1tL21lbWJsb2NrLmMgICAgICAg
ICAgICAgICAgICB8IDM1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIG1t
L3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgbW0vcGFnZV9l
eHQuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgbW0vcGVyY3B1LmMgICAgICAgICAgICAg
ICAgICAgIHwgMTEgKysrKy0tLS0tLS0KPiAgbW0vc3BhcnNlLmMgICAgICAgICAgICAgICAgICAg
IHwgIDYgKystLS0tCj4gIDE0IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDExNCBk
ZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPgo=

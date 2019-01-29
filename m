Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,02/21] powerpc: use memblock functions returning virtual address
From: Michael Ellerman <mpe@ellerman.id.au>
Message-Id: <871s4vssdq.fsf@concordia.ellerman.id.au>
Date: Tue, 29 Jan 2019 20:52:17 +1100
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org, Christophe Leroy <christophe.leroy@c-s.fr>
List-ID: <linux-usb.vger.kernel.org>

TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cml0ZXM6Cgo+IEZyb206IENocmlz
dG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPgo+Cj4gU2luY2Ugb25seSB0aGUg
dmlydHVhbCBhZGRyZXNzIG9mIGFsbG9jYXRlZCBibG9ja3MgaXMgdXNlZCwKPiBsZXRzIHVzZSBm
dW5jdGlvbnMgcmV0dXJuaW5nIGRpcmVjdGx5IHZpcnR1YWwgYWRkcmVzcy4KPgo+IFRob3NlIGZ1
bmN0aW9ucyBoYXZlIHRoZSBhZHZhbnRhZ2Ugb2YgYWxzbyB6ZXJvaW5nIHRoZSBibG9jay4KPgo+
IFsgTVI6Cj4gIC0gdXBkYXRlZCBlcnJvciBtZXNzYWdlIGluIGFsbG9jX3N0YWNrKCkgdG8gYmUg
bW9yZSB2ZXJib3NlCj4gIC0gY29udmVyZXRlZCBzZXZlcmFsIGFkZGl0aW9uYWwgY2FsbCBzaXRl
cyBdCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGMtcy5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5j
b20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJwYy9rZXJuZWwvZHRfY3B1X2Z0cnMuYyB8ICAzICstLQo+
ICBhcmNoL3Bvd2VycGMva2VybmVsL2lycS5jICAgICAgICAgfCAgNSAtLS0tLQo+ICBhcmNoL3Bv
d2VycGMva2VybmVsL3BhY2EuYyAgICAgICAgfCAgNiArKysrKy0KPiAgYXJjaC9wb3dlcnBjL2tl
cm5lbC9wcm9tLmMgICAgICAgIHwgIDUgKysrKy0KPiAgYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1
cF8zMi5jICAgIHwgMjYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPiAgNSBmaWxlcyBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCkxHVE0uCgpBY2tlZC1ieTog
TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PgoKY2hlZXJzCg==

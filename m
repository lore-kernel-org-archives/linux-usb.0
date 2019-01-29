Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,09/21] memblock: drop memblock_alloc_base()
From: Michael Ellerman <mpe@ellerman.id.au>
Message-Id: <87sgxbrc3k.fsf@concordia.ellerman.id.au>
Date: Tue, 29 Jan 2019 21:29:19 +1100
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPiB3cml0ZXM6Cgo+IFRoZSBtZW1ibG9j
a19hbGxvY19iYXNlKCkgZnVuY3Rpb24gdHJpZXMgdG8gYWxsb2NhdGUgYSBtZW1vcnkgdXAgdG8g
dGhlCj4gbGltaXQgc3BlY2lmaWVkIGJ5IGl0cyBtYXhfYWRkciBwYXJhbWV0ZXIgYW5kIHBhbmlj
cyBpZiB0aGUgYWxsb2NhdGlvbgo+IGZhaWxzLiBSZXBsYWNlIGl0cyB1c2FnZSB3aXRoIG1lbWJs
b2NrX3BoeXNfYWxsb2NfcmFuZ2UoKSBhbmQgbWFrZSB0aGUKPiBjYWxsZXJzIGNoZWNrIHRoZSBy
ZXR1cm4gdmFsdWUgYW5kIHBhbmljIGluIGNhc2Ugb2YgZXJyb3IuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvcnRhcy5jICAgICAgfCAgNiArKysrKy0KPiAgYXJjaC9wb3dlcnBjL21tL2hhc2hf
dXRpbHNfNjQuYyB8ICA4ICsrKysrKy0tCj4gIGFyY2gvczM5MC9rZXJuZWwvc21wLmMgICAgICAg
ICAgfCAgNiArKysrKy0KPiAgZHJpdmVycy9tYWNpbnRvc2gvc211LmMgICAgICAgICB8ICAyICst
Cj4gIGluY2x1ZGUvbGludXgvbWVtYmxvY2suaCAgICAgICAgfCAgMiAtLQo+ICBtbS9tZW1ibG9j
ay5jICAgICAgICAgICAgICAgICAgIHwgMTQgLS0tLS0tLS0tLS0tLS0KPiAgNiBmaWxlcyBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkKCkFja2VkLWJ5OiBNaWNoYWVs
IEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+IChwb3dlcnBjKQoKY2hlZXJzCg==

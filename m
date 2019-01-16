Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [15/21] sparc: add checks for the return value of memblock_alloc*()
From: David Miller <davem@davemloft.net>
Message-Id: <20190116.092147.2222967221278304230.davem@davemloft.net>
Date: Wed, 16 Jan 2019 09:21:47 -0800 (PST)
To: rppt@linux.ibm.com
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, catalin.marinas@arm.com, hch@lst.de, dennis@kernel.org, geert@linux-m68k.org, green.hu@gmail.com, gregkh@linuxfoundation.org, gxt@pku.edu.cn, guoren@kernel.org, heiko.carstens@de.ibm.com, msalter@redhat.com, mattst88@gmail.com, jcmvbkbc@gmail.com, mpe@ellerman.id.au, monstr@monstr.eu, paul.burton@mips.com, pmladek@suse.com, dalias@libc.org, richard@nod.at, robh+dt@kernel.org, linux@armlinux.org.uk, shorne@gmail.com, tony.luck@intel.com, vgupta@synopsys.com, ysato@users.sourceforge.jp, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgpEYXRlOiBXZWQsIDE2IEph
biAyMDE5IDE1OjQ0OjE1ICswMjAwCgo+IEFkZCBwYW5pYygpIGNhbGxzIGlmIG1lbWJsb2NrX2Fs
bG9jKigpIHJldHVybnMgTlVMTC4KPiAKPiBNb3N0IG9mIHRoZSBjaGFuZ2VzIGFyZSBzaW1wbHkg
YWRkaXRpb24gb2YKPiAKPiAgICAgICAgIGlmKCFwdHIpCj4gICAgICAgICAgICAgICAgIHBhbmlj
KCk7Cj4gCj4gc3RhdGVtZW50cyBhZnRlciB0aGUgY2FsbHMgdG8gbWVtYmxvY2tfYWxsb2MqKCkg
dmFyaWFudHMuCj4gCj4gRXhjZXB0aW9ucyBhcmUgcGNwdV9wb3B1bGF0ZV9wdGUoKSBhbmQga2Vy
bmVsX21hcF9yYW5nZSgpIHRoYXQgd2VyZQo+IHNsaWdodGx5IHJlZmFjdG9yZWQgdG8gYWNjb21t
b2RhdGUgdGhlIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0
QGxpbnV4LmlibS5jb20+CgpBY2tlZC1ieTogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxv
ZnQubmV0Pgo=

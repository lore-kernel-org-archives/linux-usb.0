Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,01/21] openrisc: prefer memblock APIs returning virtual address
From: Stafford Horne <shorne@gmail.com>
Message-Id: <20190127030708.GU3235@lianli.shorne-pla.net>
Date: Sun, 27 Jan 2019 12:07:08 +0900
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMTA6MDM6NDhBTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBUaGUgYWxsb2NhdGlvbiBvZiB0aGUgcGFnZSB0YWJsZXMgbWVtb3J5IGluIG9wZW5y
aWNzIHVzZXMKPiBtZW1ibG9ja19waHlzX2FsbG9jKCkgYW5kIHRoZW4gY29udmVydHMgdGhlIHJl
dHVybmVkIHBoeXNpY2FsIGFkZHJlc3MgdG8KPiB2aXJ0dWFsIG9uZS4gVXNlIG1lbWJsb2NrX2Fs
bG9jX3JhdygpIGFuZCBhZGQgYSBwYW5pYygpIGlmIHRoZSBhbGxvY2F0aW9uCj4gZmFpbHMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IC0t
LQo+ICBhcmNoL29wZW5yaXNjL21tL2luaXQuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL29w
ZW5yaXNjL21tL2luaXQuYyBiL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCj4gaW5kZXggZDE1NzMx
MC4uY2FlYjQxOCAxMDA2NDQKPiAtLS0gYS9hcmNoL29wZW5yaXNjL21tL2luaXQuYwo+ICsrKyBi
L2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jCj4gQEAgLTEwNSw3ICsxMDUsMTAgQEAgc3RhdGljIHZv
aWQgX19pbml0IG1hcF9yYW0odm9pZCkKPiAgCQkJfQo+ICAKPiAgCQkJLyogQWxsb2Mgb25lIHBh
Z2UgZm9yIGhvbGRpbmcgUFRFJ3MuLi4gKi8KPiAtCQkJcHRlID0gKHB0ZV90ICopIF9fdmEobWVt
YmxvY2tfcGh5c19hbGxvYyhQQUdFX1NJWkUsIFBBR0VfU0laRSkpOwo+ICsJCQlwdGUgPSBtZW1i
bG9ja19hbGxvY19yYXcoUEFHRV9TSVpFLCBQQUdFX1NJWkUpOwo+ICsJCQlpZiAoIXB0ZSkKPiAr
CQkJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlIHBhZ2UgZm9yIFBURXNcbiIsCj4gKwkJ
CQkgICAgICBfX2Z1bmNfXyk7Cj4gIAkJCXNldF9wbWQocG1lLCBfX3BtZChfS0VSTlBHX1RBQkxF
ICsgX19wYShwdGUpKSk7Cj4gIAo+ICAJCQkvKiBGaWxsIHRoZSBuZXdseSBhbGxvY2F0ZWQgcGFn
ZSB3aXRoIFBURSdTICovCgpUaGlzIHNlZW1zIHJlYXNvbmFibGUgdG8gbWUuCgpBY2tlZC1ieTog
U3RhZmZvcmQgSG9ybmUgPHNob3JuZUBnbWFpbC5jb20+Cg==

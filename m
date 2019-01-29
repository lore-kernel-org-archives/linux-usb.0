Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,06/21] memblock: memblock_phys_alloc_try_nid(): don't panic
From: Michael Ellerman <mpe@ellerman.id.au>
Message-Id: <87va27rdje.fsf@concordia.ellerman.id.au>
Date: Tue, 29 Jan 2019 20:58:13 +1100
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1PiB3cml0ZXM6Cgo+IE1pa2UgUmFw
b3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4gd3JpdGVzOgo+Cj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L21tL251bWEuYyBiL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4+IGluZGV4IGFlMzRlM2Eu
LjJjNjFlYTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvbW0vbnVtYS5jCj4+ICsrKyBiL2Fy
Y2gvYXJtNjQvbW0vbnVtYS5jCj4+IEBAIC0yMzcsNiArMjM3LDEwIEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCBzZXR1cF9ub2RlX2RhdGEoaW50IG5pZCwgdTY0IHN0YXJ0X3BmbiwgdTY0IGVuZF9wZm4p
Cj4+ICAJCXByX2luZm8oIkluaXRtZW0gc2V0dXAgbm9kZSAlZCBbPG1lbW9yeS1sZXNzIG5vZGU+
XVxuIiwgbmlkKTsKPj4gIAo+PiAgCW5kX3BhID0gbWVtYmxvY2tfcGh5c19hbGxvY190cnlfbmlk
KG5kX3NpemUsIFNNUF9DQUNIRV9CWVRFUywgbmlkKTsKPj4gKwlpZiAoIW5kX3BhKQo+PiArCQlw
YW5pYygiQ2Fubm90IGFsbG9jYXRlICV6dSBieXRlcyBmb3Igbm9kZSAlZCBkYXRhXG4iLAo+PiAr
CQkgICAgICBuZF9zaXplLCBuaWQpOwo+PiArCj4+ICAJbmQgPSBfX3ZhKG5kX3BhKTsKCldyb25n
IGh1bmssIE9fbwoKPiBBY2tlZC1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlk
LmF1PiAocG93ZXJwYykKCllvdSBrbm93IHdoYXQgSSBtZWFuIHRob3VnaCA6KQoKY2hlZXJzCg==

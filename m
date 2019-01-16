Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [20/21] memblock: memblock_alloc_try_nid: don't panic
From: Mike Rapoport <rppt@linux.ibm.com>
Message-Id: <1547646261-32535-21-git-send-email-rppt@linux.ibm.com>
Date: Wed, 16 Jan 2019 15:44:20 +0200
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
List-ID: <linux-usb.vger.kernel.org>

QXMgYWxsIHRoZSBtZW1ibG9ja19hbGxvYyooKSB1c2VycyBhcmUgbm93IGNoZWNraW5nIHRoZSBy
ZXR1cm4gdmFsdWUgYW5kCnBhbmljKCkgaW4gY2FzZSBvZiBlcnJvciwgdGhlIHBhbmljKCkgY2Fs
bCBjYW4gYmUgcmVtb3ZlZCBmcm9tIHRoZSBjb3JlCm1lbWJsb2NrIGFsbG9jYXRvciwgbmFtZWx5
IG1lbWJsb2NrX2FsbG9jX3RyeV9uaWQoKS4KClNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQg
PHJwcHRAbGludXguaWJtLmNvbT4KLS0tCiBtbS9tZW1ibG9jay5jIHwgMTUgKysrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCAwM2IzOTI5Li43
MTY0Mjc1IDEwMDY0NAotLS0gYS9tbS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAg
LTE1MjYsNyArMTUyNiw3IEBAIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2NfdHJ5X25pZF9u
b3BhbmljKAogfQogCiAvKioKLSAqIG1lbWJsb2NrX2FsbG9jX3RyeV9uaWQgLSBhbGxvY2F0ZSBi
b290IG1lbW9yeSBibG9jayB3aXRoIHBhbmlja2luZworICogbWVtYmxvY2tfYWxsb2NfdHJ5X25p
ZCAtIGFsbG9jYXRlIGJvb3QgbWVtb3J5IGJsb2NrCiAgKiBAc2l6ZTogc2l6ZSBvZiBtZW1vcnkg
YmxvY2sgdG8gYmUgYWxsb2NhdGVkIGluIGJ5dGVzCiAgKiBAYWxpZ246IGFsaWdubWVudCBvZiB0
aGUgcmVnaW9uIGFuZCBibG9jaydzIHNpemUKICAqIEBtaW5fYWRkcjogdGhlIGxvd2VyIGJvdW5k
IG9mIHRoZSBtZW1vcnkgcmVnaW9uIGZyb20gd2hlcmUgdGhlIGFsbG9jYXRpb24KQEAgLTE1MzYs
OSArMTUzNiw4IEBAIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2NfdHJ5X25pZF9ub3Bhbmlj
KAogICoJICAgICAgYWxsb2NhdGUgb25seSBmcm9tIG1lbW9yeSBsaW1pdGVkIGJ5IG1lbWJsb2Nr
LmN1cnJlbnRfbGltaXQgdmFsdWUKICAqIEBuaWQ6IG5pZCBvZiB0aGUgZnJlZSBhcmVhIHRvIGZp
bmQsICVOVU1BX05PX05PREUgZm9yIGFueSBub2RlCiAgKgotICogUHVibGljIHBhbmlja2luZyB2
ZXJzaW9uIG9mIG1lbWJsb2NrX2FsbG9jX3RyeV9uaWRfbm9wYW5pYygpCi0gKiB3aGljaCBwcm92
aWRlcyBkZWJ1ZyBpbmZvcm1hdGlvbiAoaW5jbHVkaW5nIGNhbGxlciBpbmZvKSwgaWYgZW5hYmxl
ZCwKLSAqIGFuZCBwYW5pY3MgaWYgdGhlIHJlcXVlc3QgY2FuIG5vdCBiZSBzYXRpc2ZpZWQuCisg
KiBQdWJsaWMgZnVuY3Rpb24sIHByb3ZpZGVzIGFkZGl0aW9uYWwgZGVidWcgaW5mb3JtYXRpb24g
KGluY2x1ZGluZyBjYWxsZXIKKyAqIGluZm8pLCBpZiBlbmFibGVkLiBUaGlzIGZ1bmN0aW9uIHpl
cm9lcyB0aGUgYWxsb2NhdGVkIG1lbW9yeS4KICAqCiAgKiBSZXR1cm46CiAgKiBWaXJ0dWFsIGFk
ZHJlc3Mgb2YgYWxsb2NhdGVkIG1lbW9yeSBibG9jayBvbiBzdWNjZXNzLCBOVUxMIG9uIGZhaWx1
cmUuCkBAIC0xNTU1LDE0ICsxNTU0LDEwIEBAIHZvaWQgKiBfX2luaXQgbWVtYmxvY2tfYWxsb2Nf
dHJ5X25pZCgKIAkJICAgICAmbWF4X2FkZHIsICh2b2lkICopX1JFVF9JUF8pOwogCXB0ciA9IG1l
bWJsb2NrX2FsbG9jX2ludGVybmFsKHNpemUsIGFsaWduLAogCQkJCQkgICBtaW5fYWRkciwgbWF4
X2FkZHIsIG5pZCk7Ci0JaWYgKHB0cikgeworCWlmIChwdHIpCiAJCW1lbXNldChwdHIsIDAsIHNp
emUpOwotCQlyZXR1cm4gcHRyOwotCX0KIAotCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRl
ICVsbHUgYnl0ZXMgYWxpZ249MHglbGx4IG5pZD0lZCBmcm9tPSVwYSBtYXhfYWRkcj0lcGFcbiIs
Ci0JICAgICAgX19mdW5jX18sICh1NjQpc2l6ZSwgKHU2NClhbGlnbiwgbmlkLCAmbWluX2FkZHIs
ICZtYXhfYWRkcik7Ci0JcmV0dXJuIE5VTEw7CisJcmV0dXJuIHB0cjsKIH0KIAogLyoqCg==

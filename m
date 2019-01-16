Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [18/21] swiotlb: add checks for the return value of memblock_alloc*()
From: Mike Rapoport <rppt@linux.ibm.com>
Message-Id: <1547646261-32535-19-git-send-email-rppt@linux.ibm.com>
Date: Wed, 16 Jan 2019 15:44:18 +0200
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
List-ID: <linux-usb.vger.kernel.org>

QWRkIHBhbmljKCkgY2FsbHMgaWYgbWVtYmxvY2tfYWxsb2MoKSByZXR1cm5zIE5VTEwuCgpUaGUg
cGFuaWMoKSBmb3JtYXQgZHVwbGljYXRlcyB0aGUgb25lIHVzZWQgYnkgbWVtYmxvY2sgaXRzZWxm
IGFuZCBpbiBvcmRlcgp0byBhdm9pZCBleHBsb3Npb24gd2l0aCBsb25nIHBhcmFtZXRlcnMgbGlz
dCByZXBsYWNlIG9wZW4gY29kZWQgYWxsb2NhdGlvbgpzaXplIGNhbGN1bGF0aW9ucyB3aXRoIGEg
bG9jYWwgdmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+Ci0tLQoga2VybmVsL2RtYS9zd2lvdGxiLmMgfCAxOSArKysrKysrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9rZXJuZWwvZG1hL3N3aW90bGIuYyBiL2tlcm5lbC9kbWEvc3dpb3RsYi5jCmlu
ZGV4IGQ2MzYxNzcuLmU3ODgzNWM4IDEwMDY0NAotLS0gYS9rZXJuZWwvZG1hL3N3aW90bGIuYwor
KysgYi9rZXJuZWwvZG1hL3N3aW90bGIuYwpAQCAtMTkxLDYgKzE5MSw3IEBAIHZvaWQgX19pbml0
IHN3aW90bGJfdXBkYXRlX21lbV9hdHRyaWJ1dGVzKHZvaWQpCiBpbnQgX19pbml0IHN3aW90bGJf
aW5pdF93aXRoX3RibChjaGFyICp0bGIsIHVuc2lnbmVkIGxvbmcgbnNsYWJzLCBpbnQgdmVyYm9z
ZSkKIHsKIAl1bnNpZ25lZCBsb25nIGksIGJ5dGVzOworCXNpemVfdCBhbGxvY19zaXplOwogCiAJ
Ynl0ZXMgPSBuc2xhYnMgPDwgSU9fVExCX1NISUZUOwogCkBAIC0yMDMsMTIgKzIwNCwxOCBAQCBp
bnQgX19pbml0IHN3aW90bGJfaW5pdF93aXRoX3RibChjaGFyICp0bGIsIHVuc2lnbmVkIGxvbmcg
bnNsYWJzLCBpbnQgdmVyYm9zZSkKIAkgKiB0byBmaW5kIGNvbnRpZ3VvdXMgZnJlZSBtZW1vcnkg
cmVnaW9ucyBvZiBzaXplIHVwIHRvIElPX1RMQl9TRUdTSVpFCiAJICogYmV0d2VlbiBpb190bGJf
c3RhcnQgYW5kIGlvX3RsYl9lbmQuCiAJICovCi0JaW9fdGxiX2xpc3QgPSBtZW1ibG9ja19hbGxv
YygKLQkJCQlQQUdFX0FMSUdOKGlvX3RsYl9uc2xhYnMgKiBzaXplb2YoaW50KSksCi0JCQkJUEFH
RV9TSVpFKTsKLQlpb190bGJfb3JpZ19hZGRyID0gbWVtYmxvY2tfYWxsb2MoCi0JCQkJUEFHRV9B
TElHTihpb190bGJfbnNsYWJzICogc2l6ZW9mKHBoeXNfYWRkcl90KSksCi0JCQkJUEFHRV9TSVpF
KTsKKwlhbGxvY19zaXplID0gUEFHRV9BTElHTihpb190bGJfbnNsYWJzICogc2l6ZW9mKGludCkp
OworCWlvX3RsYl9saXN0ID0gbWVtYmxvY2tfYWxsb2MoYWxsb2Nfc2l6ZSwgUEFHRV9TSVpFKTsK
KwlpZiAoIWlvX3RsYl9saXN0KQorCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbHUg
Ynl0ZXMgYWxpZ249MHglbHhcbiIsCisJCSAgICAgIF9fZnVuY19fLCBhbGxvY19zaXplLCBQQUdF
X1NJWkUpOworCisJYWxsb2Nfc2l6ZSA9IFBBR0VfQUxJR04oaW9fdGxiX25zbGFicyAqIHNpemVv
ZihwaHlzX2FkZHJfdCkpOworCWlvX3RsYl9vcmlnX2FkZHIgPSBtZW1ibG9ja19hbGxvYyhhbGxv
Y19zaXplLCBQQUdFX1NJWkUpOworCWlmICghaW9fdGxiX29yaWdfYWRkcikKKwkJcGFuaWMoIiVz
OiBGYWlsZWQgdG8gYWxsb2NhdGUgJWx1IGJ5dGVzIGFsaWduPTB4JWx4XG4iLAorCQkgICAgICBf
X2Z1bmNfXywgYWxsb2Nfc2l6ZSwgUEFHRV9TSVpFKTsKKwogCWZvciAoaSA9IDA7IGkgPCBpb190
bGJfbnNsYWJzOyBpKyspIHsKIAkJaW9fdGxiX2xpc3RbaV0gPSBJT19UTEJfU0VHU0laRSAtIE9G
RlNFVChpLCBJT19UTEJfU0VHU0laRSk7CiAJCWlvX3RsYl9vcmlnX2FkZHJbaV0gPSBJTlZBTElE
X1BIWVNfQUREUjsK

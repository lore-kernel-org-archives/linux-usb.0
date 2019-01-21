Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,01/21] openrisc: prefer memblock APIs returning virtual address
From: Mike Rapoport <rppt@linux.ibm.com>
Message-Id: <1548057848-15136-2-git-send-email-rppt@linux.ibm.com>
Date: Mon, 21 Jan 2019 10:03:48 +0200
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGFsbG9jYXRpb24gb2YgdGhlIHBhZ2UgdGFibGVzIG1lbW9yeSBpbiBvcGVucmljcyB1c2Vz
Cm1lbWJsb2NrX3BoeXNfYWxsb2MoKSBhbmQgdGhlbiBjb252ZXJ0cyB0aGUgcmV0dXJuZWQgcGh5
c2ljYWwgYWRkcmVzcyB0bwp2aXJ0dWFsIG9uZS4gVXNlIG1lbWJsb2NrX2FsbG9jX3JhdygpIGFu
ZCBhZGQgYSBwYW5pYygpIGlmIHRoZSBhbGxvY2F0aW9uCmZhaWxzLgoKU2lnbmVkLW9mZi1ieTog
TWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgotLS0KIGFyY2gvb3BlbnJpc2MvbW0v
aW5pdC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvb3BlbnJpc2MvbW0vaW5pdC5jIGIvYXJjaC9vcGVu
cmlzYy9tbS9pbml0LmMKaW5kZXggZDE1NzMxMC4uY2FlYjQxOCAxMDA2NDQKLS0tIGEvYXJjaC9v
cGVucmlzYy9tbS9pbml0LmMKKysrIGIvYXJjaC9vcGVucmlzYy9tbS9pbml0LmMKQEAgLTEwNSw3
ICsxMDUsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IG1hcF9yYW0odm9pZCkKIAkJCX0KIAogCQkJ
LyogQWxsb2Mgb25lIHBhZ2UgZm9yIGhvbGRpbmcgUFRFJ3MuLi4gKi8KLQkJCXB0ZSA9IChwdGVf
dCAqKSBfX3ZhKG1lbWJsb2NrX3BoeXNfYWxsb2MoUEFHRV9TSVpFLCBQQUdFX1NJWkUpKTsKKwkJ
CXB0ZSA9IG1lbWJsb2NrX2FsbG9jX3JhdyhQQUdFX1NJWkUsIFBBR0VfU0laRSk7CisJCQlpZiAo
IXB0ZSkKKwkJCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSBwYWdlIGZvciBQVEVzXG4i
LAorCQkJCSAgICAgIF9fZnVuY19fKTsKIAkJCXNldF9wbWQocG1lLCBfX3BtZChfS0VSTlBHX1RB
QkxFICsgX19wYShwdGUpKSk7CiAKIAkJCS8qIEZpbGwgdGhlIG5ld2x5IGFsbG9jYXRlZCBwYWdl
IHdpdGggUFRFJ1MgKi8K

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,17/21] init/main: add checks for the return value of memblock_alloc*()
From: Mike Rapoport <rppt@linux.ibm.com>
Message-Id: <1548057848-15136-18-git-send-email-rppt@linux.ibm.com>
Date: Mon, 21 Jan 2019 10:04:04 +0200
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
List-ID: <linux-usb.vger.kernel.org>

QWRkIHBhbmljKCkgY2FsbHMgaWYgbWVtYmxvY2tfYWxsb2MoKSByZXR1cm5zIE5VTEwuCgpUaGUg
cGFuaWMoKSBmb3JtYXQgZHVwbGljYXRlcyB0aGUgb25lIHVzZWQgYnkgbWVtYmxvY2sgaXRzZWxm
IGFuZCBpbiBvcmRlcgp0byBhdm9pZCBleHBsb3Npb24gd2l0aCBsb25nIHBhcmFtZXRlcnMgbGlz
dCByZXBsYWNlIG9wZW4gY29kZWQgYWxsb2NhdGlvbgpzaXplIGNhbGN1bGF0aW9ucyB3aXRoIGEg
bG9jYWwgdmFyaWFibGUuCgpTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4
LmlibS5jb20+Ci0tLQogaW5pdC9tYWluLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaW5pdC9tYWluLmMgYi9pbml0L21haW4uYwppbmRleCBhNTZmNjVhLi5kNThhMzY1
IDEwMDY0NAotLS0gYS9pbml0L21haW4uYworKysgYi9pbml0L21haW4uYwpAQCAtMzczLDEyICsz
NzMsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIHNtcF9wcmVwYXJlX2NwdXModW5zaWduZWQgaW50
IG1heGNwdXMpIHsgfQogICovCiBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfY29tbWFuZF9saW5l
KGNoYXIgKmNvbW1hbmRfbGluZSkKIHsKLQlzYXZlZF9jb21tYW5kX2xpbmUgPQotCQltZW1ibG9j
a19hbGxvYyhzdHJsZW4oYm9vdF9jb21tYW5kX2xpbmUpICsgMSwgU01QX0NBQ0hFX0JZVEVTKTsK
LQlpbml0Y2FsbF9jb21tYW5kX2xpbmUgPQotCQltZW1ibG9ja19hbGxvYyhzdHJsZW4oYm9vdF9j
b21tYW5kX2xpbmUpICsgMSwgU01QX0NBQ0hFX0JZVEVTKTsKLQlzdGF0aWNfY29tbWFuZF9saW5l
ID0gbWVtYmxvY2tfYWxsb2Moc3RybGVuKGNvbW1hbmRfbGluZSkgKyAxLAotCQkJCQkgICAgIFNN
UF9DQUNIRV9CWVRFUyk7CisJc2l6ZV90IGxlbiA9IHN0cmxlbihib290X2NvbW1hbmRfbGluZSkg
KyAxOworCisJc2F2ZWRfY29tbWFuZF9saW5lID0gbWVtYmxvY2tfYWxsb2MobGVuLCBTTVBfQ0FD
SEVfQllURVMpOworCWlmICghc2F2ZWRfY29tbWFuZF9saW5lKQorCQlwYW5pYygiJXM6IEZhaWxl
ZCB0byBhbGxvY2F0ZSAlenUgYnl0ZXNcbiIsIF9fZnVuY19fLCBsZW4pOworCisJaW5pdGNhbGxf
Y29tbWFuZF9saW5lID0JbWVtYmxvY2tfYWxsb2MobGVuLCBTTVBfQ0FDSEVfQllURVMpOworCWlm
ICghaW5pdGNhbGxfY29tbWFuZF9saW5lKQorCQlwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0
ZSAlenUgYnl0ZXNcbiIsIF9fZnVuY19fLCBsZW4pOworCisJc3RhdGljX2NvbW1hbmRfbGluZSA9
IG1lbWJsb2NrX2FsbG9jKGxlbiwgU01QX0NBQ0hFX0JZVEVTKTsKKwlpZiAoIXN0YXRpY19jb21t
YW5kX2xpbmUpCisJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwg
X19mdW5jX18sIGxlbik7CisKIAlzdHJjcHkoc2F2ZWRfY29tbWFuZF9saW5lLCBib290X2NvbW1h
bmRfbGluZSk7CiAJc3RyY3B5KHN0YXRpY19jb21tYW5kX2xpbmUsIGNvbW1hbmRfbGluZSk7CiB9
CkBAIC03NzMsOCArNzgxLDE0IEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRjYWxsX2JsYWNrbGlz
dChjaGFyICpzdHIpCiAJCQlwcl9kZWJ1ZygiYmxhY2tsaXN0aW5nIGluaXRjYWxsICVzXG4iLCBz
dHJfZW50cnkpOwogCQkJZW50cnkgPSBtZW1ibG9ja19hbGxvYyhzaXplb2YoKmVudHJ5KSwKIAkJ
CQkJICAgICAgIFNNUF9DQUNIRV9CWVRFUyk7CisJCQlpZiAoIWVudHJ5KQorCQkJCXBhbmljKCIl
czogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwKKwkJCQkgICAgICBfX2Z1bmNfXywg
c2l6ZW9mKCplbnRyeSkpOwogCQkJZW50cnktPmJ1ZiA9IG1lbWJsb2NrX2FsbG9jKHN0cmxlbihz
dHJfZW50cnkpICsgMSwKIAkJCQkJCSAgICBTTVBfQ0FDSEVfQllURVMpOworCQkJaWYgKCFlbnRy
eS0+YnVmKQorCQkJCXBhbmljKCIlczogRmFpbGVkIHRvIGFsbG9jYXRlICV6dSBieXRlc1xuIiwK
KwkJCQkgICAgICBfX2Z1bmNfXywgc3RybGVuKHN0cl9lbnRyeSkgKyAxKTsKIAkJCXN0cmNweShl
bnRyeS0+YnVmLCBzdHJfZW50cnkpOwogCQkJbGlzdF9hZGQoJmVudHJ5LT5uZXh0LCAmYmxhY2ts
aXN0ZWRfaW5pdGNhbGxzKTsKIAkJfQo=

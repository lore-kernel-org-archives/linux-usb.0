Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,06/21] memblock: memblock_phys_alloc_try_nid(): don't panic
From: Mike Rapoport <rppt@linux.ibm.com>
Message-Id: <1548057848-15136-7-git-send-email-rppt@linux.ibm.com>
Date: Mon, 21 Jan 2019 10:03:53 +0200
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIG1lbWJsb2NrX3BoeXNfYWxsb2NfdHJ5X25pZCgpIGZ1bmN0aW9uIHRyaWVzIHRvIGFsbG9j
YXRlIG1lbW9yeSBmcm9tCnRoZSByZXF1ZXN0ZWQgbm9kZSBhbmQgdGhlbiBmYWxscyBiYWNrIHRv
IGFsbG9jYXRpb24gZnJvbSBhbnkgbm9kZSBpbiB0aGUKc3lzdGVtLiBUaGUgbWVtYmxvY2tfYWxs
b2NfYmFzZSgpIGZhbGxiYWNrIHVzZWQgYnkgdGhpcyBmdW5jdGlvbiBwYW5pY3MgaWYKdGhlIGFs
bG9jYXRpb24gZmFpbHMuCgpSZXBsYWNlIHRoZSBtZW1ibG9ja19hbGxvY19iYXNlKCkgZmFsbGJh
Y2sgd2l0aCB0aGUgZGlyZWN0IGNhbGwgdG8KbWVtYmxvY2tfYWxsb2NfcmFuZ2VfbmlkKCkgYW5k
IHVwZGF0ZSB0aGUgbWVtYmxvY2tfcGh5c19hbGxvY190cnlfbmlkKCkKY2FsbGVycyB0byBjaGVj
ayB0aGUgcmV0dXJuZWQgdmFsdWUgYW5kIHBhbmljIGluIGNhc2Ugb2YgZXJyb3IuCgpTaWduZWQt
b2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5jb20+Ci0tLQogYXJjaC9hcm02
NC9tbS9udW1hLmMgICB8IDQgKysrKwogYXJjaC9wb3dlcnBjL21tL251bWEuYyB8IDQgKysrKwog
bW0vbWVtYmxvY2suYyAgICAgICAgICB8IDQgKysrLQogMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1h
LmMgYi9hcmNoL2FybTY0L21tL251bWEuYwppbmRleCBhZTM0ZTNhLi4yYzYxZWE0IDEwMDY0NAot
LS0gYS9hcmNoL2FybTY0L21tL251bWEuYworKysgYi9hcmNoL2FybTY0L21tL251bWEuYwpAQCAt
MjM3LDYgKzIzNywxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbm9kZV9kYXRhKGludCBu
aWQsIHU2NCBzdGFydF9wZm4sIHU2NCBlbmRfcGZuKQogCQlwcl9pbmZvKCJJbml0bWVtIHNldHVw
IG5vZGUgJWQgWzxtZW1vcnktbGVzcyBub2RlPl1cbiIsIG5pZCk7CiAKIAluZF9wYSA9IG1lbWJs
b2NrX3BoeXNfYWxsb2NfdHJ5X25pZChuZF9zaXplLCBTTVBfQ0FDSEVfQllURVMsIG5pZCk7CisJ
aWYgKCFuZF9wYSkKKwkJcGFuaWMoIkNhbm5vdCBhbGxvY2F0ZSAlenUgYnl0ZXMgZm9yIG5vZGUg
JWQgZGF0YVxuIiwKKwkJICAgICAgbmRfc2l6ZSwgbmlkKTsKKwogCW5kID0gX192YShuZF9wYSk7
CiAKIAkvKiByZXBvcnQgYW5kIGluaXRpYWxpemUgKi8KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJw
Yy9tbS9udW1hLmMgYi9hcmNoL3Bvd2VycGMvbW0vbnVtYS5jCmluZGV4IDI3MGNlZmIuLjhmMmJi
ZTEgMTAwNjQ0Ci0tLSBhL2FyY2gvcG93ZXJwYy9tbS9udW1hLmMKKysrIGIvYXJjaC9wb3dlcnBj
L21tL251bWEuYwpAQCAtNzg4LDYgKzc4OCwxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBf
bm9kZV9kYXRhKGludCBuaWQsIHU2NCBzdGFydF9wZm4sIHU2NCBlbmRfcGZuKQogCWludCB0bmlk
OwogCiAJbmRfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQobmRfc2l6ZSwgU01QX0NB
Q0hFX0JZVEVTLCBuaWQpOworCWlmICghbmRfcGEpCisJCXBhbmljKCJDYW5ub3QgYWxsb2NhdGUg
JXp1IGJ5dGVzIGZvciBub2RlICVkIGRhdGFcbiIsCisJCSAgICAgIG5kX3NpemUsIG5pZCk7CisK
IAluZCA9IF9fdmEobmRfcGEpOwogCiAJLyogcmVwb3J0IGFuZCBpbml0aWFsaXplICovCmRpZmYg
LS1naXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2suYwppbmRleCBmMDE5YWVlLi44YWFi
YjFiIDEwMDY0NAotLS0gYS9tbS9tZW1ibG9jay5jCisrKyBiL21tL21lbWJsb2NrLmMKQEAgLTEz
OTMsNyArMTM5Myw5IEBAIHBoeXNfYWRkcl90IF9faW5pdCBtZW1ibG9ja19waHlzX2FsbG9jX3Ry
eV9uaWQocGh5c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxpCiAKIAlpZiAocmVzKQogCQly
ZXR1cm4gcmVzOwotCXJldHVybiBtZW1ibG9ja19hbGxvY19iYXNlKHNpemUsIGFsaWduLCBNRU1C
TE9DS19BTExPQ19BQ0NFU1NJQkxFKTsKKwlyZXR1cm4gbWVtYmxvY2tfYWxsb2NfcmFuZ2Vfbmlk
KHNpemUsIGFsaWduLCAwLAorCQkJCQlNRU1CTE9DS19BTExPQ19BQ0NFU1NJQkxFLAorCQkJCQlO
VU1BX05PX05PREUsIE1FTUJMT0NLX05PTkUpOwogfQogCiAvKioK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,06/21] memblock: memblock_phys_alloc_try_nid(): don't panic
From: Catalin Marinas <catalin.marinas@arm.com>
Message-Id: <20190125174502.GL25901@arrakis.emea.arm.com>
Date: Fri, 25 Jan 2019 17:45:02 +0000
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMTA6MDM6NTNBTSArMDIwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9udW1hLmMgYi9hcmNoL2FybTY0L21t
L251bWEuYwo+IGluZGV4IGFlMzRlM2EuLjJjNjFlYTQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02
NC9tbS9udW1hLmMKPiArKysgYi9hcmNoL2FybTY0L21tL251bWEuYwo+IEBAIC0yMzcsNiArMjM3
LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ub2RlX2RhdGEoaW50IG5pZCwgdTY0IHN0
YXJ0X3BmbiwgdTY0IGVuZF9wZm4pCj4gIAkJcHJfaW5mbygiSW5pdG1lbSBzZXR1cCBub2RlICVk
IFs8bWVtb3J5LWxlc3Mgbm9kZT5dXG4iLCBuaWQpOwo+ICAKPiAgCW5kX3BhID0gbWVtYmxvY2tf
cGh5c19hbGxvY190cnlfbmlkKG5kX3NpemUsIFNNUF9DQUNIRV9CWVRFUywgbmlkKTsKPiArCWlm
ICghbmRfcGEpCj4gKwkJcGFuaWMoIkNhbm5vdCBhbGxvY2F0ZSAlenUgYnl0ZXMgZm9yIG5vZGUg
JWQgZGF0YVxuIiwKPiArCQkgICAgICBuZF9zaXplLCBuaWQpOwo+ICsKPiAgCW5kID0gX192YShu
ZF9wYSk7Cj4gIAo+ICAJLyogcmVwb3J0IGFuZCBpbml0aWFsaXplICovCgpEb2VzIGl0IG1lYW4g
dGhhdCBtZW1ibG9ja19waHlzX2FsbG9jX3RyeV9uaWQoKSBuZXZlciByZXR1cm5zIHZhbGlkCnBo
eXNpY2FsIG1lbW9yeSBzdGFydGluZyBhdCAwPwo=

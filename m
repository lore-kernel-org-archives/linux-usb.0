Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [19/21] treewide: add checks for the return value of memblock_alloc*()
From: Juergen Gross <jgross@suse.com>
Message-Id: <1c04fc81-7e7c-9b4a-cab2-c9b023e1a3b1@suse.com>
Date: Wed, 16 Jan 2019 15:32:03 +0100
To: Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp, Petr Mladek <pmladek@suse.com>, linux-xtensa@linux-xtensa.org, linux-alpha@vger.kernel.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Rob Herring <robh+dt@kernel.org>, Greentime Hu <green.hu@gmail.com>, xen-devel@lists.xenproject.org, Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>, Michael Ellerman <mpe@ellerman.id.au>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, openrisc@lists.librecores.org
List-ID: <linux-usb.vger.kernel.org>

T24gMTYvMDEvMjAxOSAxNDo0NCwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPiBBZGQgY2hlY2sgZm9y
IHRoZSByZXR1cm4gdmFsdWUgb2YgbWVtYmxvY2tfYWxsb2MqKCkgZnVuY3Rpb25zIGFuZCBjYWxs
Cj4gcGFuaWMoKSBpbiBjYXNlIG9mIGVycm9yLgo+IFRoZSBwYW5pYyBtZXNzYWdlIHJlcGVhdHMg
dGhlIG9uZSB1c2VkIGJ5IHBhbmljaW5nIG1lbWJsb2NrIGFsbG9jYXRvcnMgd2l0aAo+IGFkanVz
dG1lbnQgb2YgcGFyYW1ldGVycyB0byBpbmNsdWRlIG9ubHkgcmVsZXZhbnQgb25lcy4KPiAKPiBU
aGUgcmVwbGFjZW1lbnQgd2FzIG1vc3RseSBhdXRvbWF0ZWQgd2l0aCBzZW1hbnRpYyBwYXRjaGVz
IGxpa2UgdGhlIG9uZQo+IGJlbG93IHdpdGggbWFudWFsIG1hc3NhZ2luZyBvZiBmb3JtYXQgc3Ry
aW5ncy4KPiAKPiBAQAo+IGV4cHJlc3Npb24gcHRyLCBzaXplLCBhbGlnbjsKPiBAQAo+IHB0ciA9
IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFsaWduKTsKPiArIGlmICghcHRyKQo+ICsgCXBhbmljKCIl
czogRmFpbGVkIHRvIGFsbG9jYXRlICVsdSBieXRlcyBhbGlnbj0weCVseFxuIiwgX19mdW5jX18s
Cj4gc2l6ZSwgYWxpZ24pOwo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRA
bGludXguaWJtLmNvbT4KCkZvciB0aGUgWGVuIHBhcnQ6CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4K

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,21/21] memblock: drop memblock_alloc_*_nopanic() variants
From: Petr Mladek <pmladek@suse.com>
Message-Id: <20190130133845.nps4itatl4fm6dcl@pathway.suse.cz>
Date: Wed, 30 Jan 2019 14:38:45 +0100
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Dennis Zhou <dennis@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guan Xuetao <gxt@pku.edu.cn>, Guo Ren <guoren@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, Paul Burton <paul.burton@mips.com>, Rich Felker <dalias@libc.org>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, devicetree@vger.kernel.org, kasan-dev@googlegroups.com, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-c6x-dev@linux-c6x.org, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, linux-usb@vger.kernel.org, linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org, sparclinux@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, x86@kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uIDIwMTktMDEtMjEgMTA6MDQ6MDgsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gQXMgYWxs
IHRoZSBtZW1ibG9jayBhbGxvY2F0aW9uIGZ1bmN0aW9ucyByZXR1cm4gTlVMTCBpbiBjYXNlIG9m
IGVycm9yCj4gcmF0aGVyIHRoYW4gcGFuaWMoKSwgdGhlIGR1cGxpY2F0ZXMgd2l0aCBfbm9wYW5p
YyBzdWZmaXggY2FuIGJlIHJlbW92ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlrZSBSYXBvcG9y
dCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IEFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IC0tLQo+ICBhcmNoL2FyYy9rZXJuZWwvdW53aW5k
LmMgICAgICAgfCAgMyArLS0KPiAgYXJjaC9zaC9tbS9pbml0LmMgICAgICAgICAgICAgIHwgIDIg
Ky0KPiAgYXJjaC94ODYva2VybmVsL3NldHVwX3BlcmNwdS5jIHwgMTAgKysrKystLS0tLQo+ICBh
cmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMgICAgfCAxNCArKysrKysrKy0tLS0tLQo+ICBkcml2
ZXJzL2Zpcm13YXJlL21lbW1hcC5jICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3VzYi9lYXJseS94
aGNpLWRiYy5jICAgfCAgMiArLQo+ICBpbmNsdWRlL2xpbnV4L21lbWJsb2NrLmggICAgICAgfCAz
NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBrZXJuZWwvZG1hL3N3aW90
bGIuYyAgICAgICAgICAgfCAgMiArLQo+ICBrZXJuZWwvcHJpbnRrL3ByaW50ay5jICAgICAgICAg
fCAgOSArLS0tLS0tLS0KCkZvciBwcmludGs6ClJldmlld2VkLWJ5OiBQZXRyIE1sYWRlayA8cG1s
YWRla0BzdXNlLmNvbT4KQWNrZWQtYnk6IFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1c2UuY29tPgoK
QmVzdCBSZWdhcmRzLApQZXRyCgo+ICBtbS9tZW1ibG9jay5jICAgICAgICAgICAgICAgICAgfCAz
NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBtbS9wYWdlX2FsbG9jLmMg
ICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIG1tL3BhZ2VfZXh0LmMgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIG1tL3BlcmNwdS5jICAgICAgICAgICAgICAgICAgICB8IDExICsr
KystLS0tLS0tCj4gIG1tL3NwYXJzZS5jICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQo+
ICAxNCBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxMTIgZGVsZXRpb25zKC0pCj4K

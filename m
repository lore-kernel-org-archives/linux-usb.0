Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: rfc: remove print_vma_addr ? (was Re: [PATCH 00/16] remove eight obsolete architectures)
From: Joe Perches <joe@perches.com>
Message-Id: <1521134022.22221.38.camel@perches.com>
Date: Thu, 15 Mar 2018 10:13:42 -0700
To: Matthew Wilcox <willy@infradead.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, David Howells <dhowells@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Linux-Arch <linux-arch@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, linux-block@vger.kernel.org, linux-ide@vger.kernel.org, linux-input@vger.kernel.org, netdev <netdev@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Linux PWM List <linux-pwm@vger.kernel.org>, linux-rtc@vger.kernel.org, linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, DRI Development <dri-devel@lists.freedesktop.org>, Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAyMDE4LTAzLTE1IGF0IDEwOjA4IC0wNzAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToK
PiBPbiBUaHUsIE1hciAxNSwgMjAxOCBhdCAwOTo1Njo0NkFNIC0wNzAwLCBKb2UgUGVyY2hlcyB3
cm90ZToKPiA+IEkgaGF2ZSBhIHBhdGNoc2V0IHRoYXQgY3JlYXRlcyBhIHZzcHJpbnRmIGV4dGVu
c2lvbiBmb3IKPiA+IHByaW50X3ZtYV9hZGRyIGFuZCByZW1vdmVzIGFsbCB0aGUgdXNlcyBzaW1p
bGFyIHRvIHRoZQo+ID4gcHJpbnRfc3ltYm9sKCkgcmVtb3ZhbC4KPiA+IAo+ID4gVGhpcyBub3cg
YXZvaWRzIGFueSBwb3NzaWJsZSBwcmludGsgaW50ZXJsZWF2aW5nLgo+ID4gCj4gPiBVbmZvcnR1
bmF0ZWx5LCB3aXRob3V0IHNvbWUgI2lmZGVmIGluIHZzcHJpbnRmLCB3aGljaAo+ID4gSSB3b3Vs
ZCBsaWtlIHRvIGF2b2lkLCBpdCBpbmNyZWFzZXMgdGhlIG5vbW11IGtlcm5lbAo+ID4gc2l6ZSBi
eSB+NTAwIGJ5dGVzLgo+ID4gCj4gPiBBbnlvbmUgdGhpbmsgdGhpcyBpcyBhY2NlcHRhYmxlPwpb
XQo+IFRoaXMgZG9lc24ndCBmZWVsIGxpa2UgYSBodWdlIHdpbiBzaW5jZSBpdCdzIG9ubHkgY2Fs
bGVkIH5vbmNlIHBlcgo+IGFyY2hpdGVjdHVyZS4gIEknZCBiZSBtb3JlIGV4Y2l0ZWQgaWYgaXQg
bWFkZSB0aGUgcHJpbnRpbmcgb2YgdGhlIHdob2xlCj4gdGhpbmcgc3RhbmRhcmRpc2VkOyBlZyB3
ZSBoYXZlIGEgcHJpbnRfZmF1bHQoKSBmdW5jdGlvbiBpbiBtbS9tZW1vcnkuYwo+IHdoaWNoIHRh
a2VzIGEgc3VpdGFibGUgc2V0IG9mIGFyZ3VtZW50cy4KClN1cmUgYnV0IHBlcmhhcHMgdGhhdCdz
IG5vdCBmZWFzaWJsZSBhcyB0aGUgc3Vycm91bmRpbmcgb3V0cHV0CmlzIHBlci1hcmNoIHNwZWNp
ZmljLgoKV2hhdCBjb3VsZCBiZSBhIHN0YW5kYXJkaXplZCBmYXVsdCBtZXNzYWdlIGhlcmU/Ci0t
LQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3Jp
YmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIu
a2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3Jn
L21ham9yZG9tby1pbmZvLmh0bWwK

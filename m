Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next,2/4] treewide: Use DEVICE_ATTR_RW
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-Id: <41847882-9ad9-aeb1-009b-2f9b2fdb656e@ti.com>
Date: Wed, 10 Jan 2018 16:43:02 +0200
To: Jarkko Nikula <jarkko.nikula@bitmer.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Airlie <airlied@linux.ie>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jiri Slaby <jslaby@suse.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gMjAxNy0xMi0yMCAxMjo1NCwgSmFya2tvIE5pa3VsYSB3cm90ZToKPiBPbiBXZWQsIERlYyAy
MCwgMjAxNyBhdCAxMDozMjoxMUFNICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4+
IE9uIFdlZCwgRGVjIDIwLCAyMDE3IGF0IDAxOjI0OjQ0QU0gLTA4MDAsIEpvZSBQZXJjaGVzIHdy
b3RlOgo+Pj4gT24gV2VkLCAyMDE3LTEyLTIwIGF0IDEwOjM0ICswMjAwLCBKYXJra28gTmlrdWxh
IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgRGVjIDE5LCAyMDE3IGF0IDEwOjE1OjA3QU0gLTA4MDAsIEpv
ZSBQZXJjaGVzIHdyb3RlOgo+Pj4+PiBDb252ZXJ0IERFVklDRV9BVFRSIHVzZXMgdG8gREVWSUNF
X0FUVFJfUlcgd2hlcmUgcG9zc2libGUuCj4+PiBbXSAKPj4+Pj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9vbWFwL21jYnNwLmMgYi9zb3VuZC9zb2Mvb21hcC9tY2JzcC5jCj4+PiBbXQo+Pj4+PiBA
QCAtODU0LDcgKzg1NCw3IEBAIHN0YXRpYyBzc2l6ZV90IGRtYV9vcF9tb2RlX3N0b3JlKHN0cnVj
dCBkZXZpY2UgKmRldiwKPj4+Pj4gIAlyZXR1cm4gc2l6ZTsKPj4+Pj4gIH0KPj4+Pj4gIAo+Pj4+
PiAtc3RhdGljIERFVklDRV9BVFRSKGRtYV9vcF9tb2RlLCAwNjQ0LCBkbWFfb3BfbW9kZV9zaG93
LCBkbWFfb3BfbW9kZV9zdG9yZSk7Cj4+Pj4+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcoZG1hX29w
X21vZGUpOwo+Pj4+PiAgCj4+Pj4KPj4+PiBXaGlsZSBJIGNhbiBhY2sgdGhpcyBwYXJ0IGhlcmUg
aWYgaXQgaGVscHMgZ2VuZXJpYyBjbGVhbnVwIGVmZm9ydCBJCj4+Pj4gZG9uJ3QgdW5kZXJzdGFy
dCB3b3VsZCBpdCBpbXByb3ZlIGNvZGUgcmVhZGFiaWxpdHkgaW4gZ2VuZXJhbD8gTW9kZSA2NDQK
Pj4+PiBpcyBjbGVhciBhbmQgZG9uJ3QgbmVlZCBhbnkgZ3JlcHBpbmcgYnV0IGZvciBERVZJQ0Vf
QVRUUl9SVygpIEkgaGFkIHRvIGdvCj4+Pj4gdGhyb3VnaCBhbGwgb2YgdGhlc2UgZmlsZXMgaW4g
b3JkZXIgdG8gc2VlIHdoYXQgZG9lcyBpdCBtZWFuOgo+Pgo+PiBZZWFoLCA2NDQgaXMgImNsZWFy
IiwgYnV0IF9SVygpIGlzIGV2ZW4gbW9yZSBjbGVhci4gIElkZWFsbHkgSSB3YW50IHRvCj4+IGdl
dCByaWQgb2YgYWxsIG9mIHRoZSAibm9uLXN0YW5kYXJkIiB1c2VycyB0aGF0IHNldCByYW5kb20g
bW9kZXMgb2YKPj4gc3lzZnMgZmlsZXMsIGFzIHdlIGdldCBpdCB3cm9uZyB0b28gbWFueSB0aW1l
cy4gIFVzaW5nIHRoZSAiZGVmYXVsdHMiIGlzCj4+IG11Y2ggYmV0dGVyLgo+Pgo+IEZhaXIgZW5v
dWdoLiBGb3IgdGhlIHNvdW5kL3NvYy9vbWFwLyAoQWNrZWQtYnkgd2FzIG1pc3NpbmcgZnJvbSBt
eQo+IHByZXZpb3VzIHJlcGx5KToKPiAKPiBBY2tlZC1ieTogSmFya2tvIE5pa3VsYSA8amFya2tv
Lm5pa3VsYUBiaXRtZXIuY29tPgoKQW5kIGZyb20gbWUgdG8gdGhlIHNhbWUgZmlsZSAoc291bmQv
c29jL29tYXAvbWNic3AuYyk6CgpBY2tlZC1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFs
dXNpQHRpLmNvbT4KCgotIFDDqXRlcgoKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9y
a2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1
NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCi0tLQpUbyB1bnN1YnNjcmliZSBm
cm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0
aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1h
am9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0
bWwK

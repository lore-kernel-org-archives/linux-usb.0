Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next,2/4] treewide: Use DEVICE_ATTR_RW
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-Id: <20171220105404.GA29856@bitmer.com>
Date: Wed, 20 Dec 2017 12:54:04 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Airlie <airlied@linux.ie>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jiri Slaby <jslaby@suse.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBEZWMgMjAsIDIwMTcgYXQgMTA6MzI6MTFBTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFdlZCwgRGVjIDIwLCAyMDE3IGF0IDAxOjI0OjQ0QU0gLTA4MDAsIEpv
ZSBQZXJjaGVzIHdyb3RlOgo+ID4gT24gV2VkLCAyMDE3LTEyLTIwIGF0IDEwOjM0ICswMjAwLCBK
YXJra28gTmlrdWxhIHdyb3RlOgo+ID4gPiBPbiBUdWUsIERlYyAxOSwgMjAxNyBhdCAxMDoxNTow
N0FNIC0wODAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiA+ID4gPiBDb252ZXJ0IERFVklDRV9BVFRS
IHVzZXMgdG8gREVWSUNFX0FUVFJfUlcgd2hlcmUgcG9zc2libGUuCj4gPiBbXSAKPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvc291bmQvc29jL29tYXAvbWNic3AuYyBiL3NvdW5kL3NvYy9vbWFwL21jYnNw
LmMKPiA+IFtdCj4gPiA+ID4gQEAgLTg1NCw3ICs4NTQsNyBAQCBzdGF0aWMgc3NpemVfdCBkbWFf
b3BfbW9kZV9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiA+ID4gIAlyZXR1cm4gc2l6ZTsK
PiA+ID4gPiAgfQo+ID4gPiA+ICAKPiA+ID4gPiAtc3RhdGljIERFVklDRV9BVFRSKGRtYV9vcF9t
b2RlLCAwNjQ0LCBkbWFfb3BfbW9kZV9zaG93LCBkbWFfb3BfbW9kZV9zdG9yZSk7Cj4gPiA+ID4g
K3N0YXRpYyBERVZJQ0VfQVRUUl9SVyhkbWFfb3BfbW9kZSk7Cj4gPiA+ID4gIAo+ID4gPiAKPiA+
ID4gV2hpbGUgSSBjYW4gYWNrIHRoaXMgcGFydCBoZXJlIGlmIGl0IGhlbHBzIGdlbmVyaWMgY2xl
YW51cCBlZmZvcnQgSQo+ID4gPiBkb24ndCB1bmRlcnN0YXJ0IHdvdWxkIGl0IGltcHJvdmUgY29k
ZSByZWFkYWJpbGl0eSBpbiBnZW5lcmFsPyBNb2RlIDY0NAo+ID4gPiBpcyBjbGVhciBhbmQgZG9u
J3QgbmVlZCBhbnkgZ3JlcHBpbmcgYnV0IGZvciBERVZJQ0VfQVRUUl9SVygpIEkgaGFkIHRvIGdv
Cj4gPiA+IHRocm91Z2ggYWxsIG9mIHRoZXNlIGZpbGVzIGluIG9yZGVyIHRvIHNlZSB3aGF0IGRv
ZXMgaXQgbWVhbjoKPiAKPiBZZWFoLCA2NDQgaXMgImNsZWFyIiwgYnV0IF9SVygpIGlzIGV2ZW4g
bW9yZSBjbGVhci4gIElkZWFsbHkgSSB3YW50IHRvCj4gZ2V0IHJpZCBvZiBhbGwgb2YgdGhlICJu
b24tc3RhbmRhcmQiIHVzZXJzIHRoYXQgc2V0IHJhbmRvbSBtb2RlcyBvZgo+IHN5c2ZzIGZpbGVz
LCBhcyB3ZSBnZXQgaXQgd3JvbmcgdG9vIG1hbnkgdGltZXMuICBVc2luZyB0aGUgImRlZmF1bHRz
IiBpcwo+IG11Y2ggYmV0dGVyLgo+IApGYWlyIGVub3VnaC4gRm9yIHRoZSBzb3VuZC9zb2Mvb21h
cC8gKEFja2VkLWJ5IHdhcyBtaXNzaW5nIGZyb20gbXkKcHJldmlvdXMgcmVwbHkpOgoKQWNrZWQt
Ynk6IEphcmtrbyBOaWt1bGEgPGphcmtrby5uaWt1bGFAYml0bWVyLmNvbT4KLS0tClRvIHVuc3Vi
c2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11
c2IiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3Jn
Ck1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21v
LWluZm8uaHRtbAo=

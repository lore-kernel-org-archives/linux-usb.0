Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next,2/4] treewide: Use DEVICE_ATTR_RW
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20171220093211.GA16177@kroah.com>
Date: Wed, 20 Dec 2017 10:32:11 +0100
To: Joe Perches <joe@perches.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Airlie <airlied@linux.ie>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jiri Slaby <jslaby@suse.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBEZWMgMjAsIDIwMTcgYXQgMDE6MjQ6NDRBTSAtMDgwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gT24gV2VkLCAyMDE3LTEyLTIwIGF0IDEwOjM0ICswMjAwLCBKYXJra28gTmlrdWxhIHdy
b3RlOgo+ID4gT24gVHVlLCBEZWMgMTksIDIwMTcgYXQgMTA6MTU6MDdBTSAtMDgwMCwgSm9lIFBl
cmNoZXMgd3JvdGU6Cj4gPiA+IENvbnZlcnQgREVWSUNFX0FUVFIgdXNlcyB0byBERVZJQ0VfQVRU
Ul9SVyB3aGVyZSBwb3NzaWJsZS4KPiBbXSAKPiA+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9v
bWFwL21jYnNwLmMgYi9zb3VuZC9zb2Mvb21hcC9tY2JzcC5jCj4gW10KPiA+ID4gQEAgLTg1NCw3
ICs4NTQsNyBAQCBzdGF0aWMgc3NpemVfdCBkbWFfb3BfbW9kZV9zdG9yZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gPiA+ICAJcmV0dXJuIHNpemU7Cj4gPiA+ICB9Cj4gPiA+ICAKPiA+ID4gLXN0YXRp
YyBERVZJQ0VfQVRUUihkbWFfb3BfbW9kZSwgMDY0NCwgZG1hX29wX21vZGVfc2hvdywgZG1hX29w
X21vZGVfc3RvcmUpOwo+ID4gPiArc3RhdGljIERFVklDRV9BVFRSX1JXKGRtYV9vcF9tb2RlKTsK
PiA+ID4gIAo+ID4gCj4gPiBXaGlsZSBJIGNhbiBhY2sgdGhpcyBwYXJ0IGhlcmUgaWYgaXQgaGVs
cHMgZ2VuZXJpYyBjbGVhbnVwIGVmZm9ydCBJCj4gPiBkb24ndCB1bmRlcnN0YXJ0IHdvdWxkIGl0
IGltcHJvdmUgY29kZSByZWFkYWJpbGl0eSBpbiBnZW5lcmFsPyBNb2RlIDY0NAo+ID4gaXMgY2xl
YXIgYW5kIGRvbid0IG5lZWQgYW55IGdyZXBwaW5nIGJ1dCBmb3IgREVWSUNFX0FUVFJfUlcoKSBJ
IGhhZCB0byBnbwo+ID4gdGhyb3VnaCBhbGwgb2YgdGhlc2UgZmlsZXMgaW4gb3JkZXIgdG8gc2Vl
IHdoYXQgZG9lcyBpdCBtZWFuOgoKWWVhaCwgNjQ0IGlzICJjbGVhciIsIGJ1dCBfUlcoKSBpcyBl
dmVuIG1vcmUgY2xlYXIuICBJZGVhbGx5IEkgd2FudCB0bwpnZXQgcmlkIG9mIGFsbCBvZiB0aGUg
Im5vbi1zdGFuZGFyZCIgdXNlcnMgdGhhdCBzZXQgcmFuZG9tIG1vZGVzIG9mCnN5c2ZzIGZpbGVz
LCBhcyB3ZSBnZXQgaXQgd3JvbmcgdG9vIG1hbnkgdGltZXMuICBVc2luZyB0aGUgImRlZmF1bHRz
IiBpcwptdWNoIGJldHRlci4KCj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRoYXQgZGV2aWNlLmggKGFz
IHRoYXQgaXMgd2hlcmUKPiBERVZJQ0VfQVRUUiBhbmQgdGhlIG90aGVyIERFVklDRV9BVFRSXzxG
T08+IHZhcmlhbnRzCj4gYXJlICNkZWZpbmVkKSBzaG91bGQgaGF2ZSBiZXR0ZXIgY29tbWVudHMg
Zm9yIHRoZQo+IF88Rk9PPiB2YXJpYW50cz8KPiAKPiA+IERFVklDRV9BVFRSX1JXOiBpbmNsdWRl
L2xpbnV4L2RldmljZS5oCj4gPiBfX0FUVFJfUlc6IGluY2x1ZGUvbGludXgvc3lzZnMuaAo+ID4g
U19JV1VTUjogaW5jbHVkZS91YXBpL2xpbnV4L3N0YXQuaAo+ID4gU19JUlVHTzogaW5jbHVkZS9s
aW51eC9zdGF0LmgKPiAKPiBidHc6IHBhdGNoIDEvNCBvZiB0aGUgc2VyaWVzIGRvZXMgcmVtb3Zl
IHRoZSB1c2VzIG9mCj4gU188UEVSTVM+IGZyb20gdGhlc2UgbWFjcm9zIGluIHN5c2ZzLmggYW5k
IGNvbnZlcnRzCj4gdGhlbSB0byBzaW1wbGUgb2N0YWwgaW5zdGVhZC4KCldoeSB5b3UgZGlkbid0
IHNlbmQgdGhhdCBwYXRjaCB0byB0aGUgc3lzZnMgbWFpbnRhaW5lciBpcyBhIGJpdCBvZGQuLi4g
IDopCgpJIHNob3VsZCBiZSB0YWtpbmcgdGhpcyB3aG9sZSBzZXJpZXMgdGhyb3VnaCBteSB0cmVl
LiAgSm9lLCB0aGFua3MgZm9yCmRvaW5nIHRoaXMgaW4gYW4gYXV0b21hdGVkIHdheSwgSSd2ZSBi
ZWVuIHdhbnRpbmcgdG8gc2VlIHRoaXMgZG9uZSBmb3IgYQpsb25nIHRpbWUuCgp0aGFua3MsCgpn
cmVnIGstaAotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUg
InVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9y
ZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIu
a2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==

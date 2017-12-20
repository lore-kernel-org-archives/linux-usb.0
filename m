Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next,2/4] treewide: Use DEVICE_ATTR_RW
From: Joe Perches <joe@perches.com>
Message-Id: <1513761884.1234.83.camel@perches.com>
Date: Wed, 20 Dec 2017 01:24:44 -0800
To: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Airlie <airlied@linux.ie>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jiri Slaby <jslaby@suse.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCAyMDE3LTEyLTIwIGF0IDEwOjM0ICswMjAwLCBKYXJra28gTmlrdWxhIHdyb3RlOgo+
IE9uIFR1ZSwgRGVjIDE5LCAyMDE3IGF0IDEwOjE1OjA3QU0gLTA4MDAsIEpvZSBQZXJjaGVzIHdy
b3RlOgo+ID4gQ29udmVydCBERVZJQ0VfQVRUUiB1c2VzIHRvIERFVklDRV9BVFRSX1JXIHdoZXJl
IHBvc3NpYmxlLgpbXSAKPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvb21hcC9tY2JzcC5jIGIv
c291bmQvc29jL29tYXAvbWNic3AuYwpbXQo+ID4gQEAgLTg1NCw3ICs4NTQsNyBAQCBzdGF0aWMg
c3NpemVfdCBkbWFfb3BfbW9kZV9zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiAgCXJldHVy
biBzaXplOwo+ID4gIH0KPiA+ICAKPiA+IC1zdGF0aWMgREVWSUNFX0FUVFIoZG1hX29wX21vZGUs
IDA2NDQsIGRtYV9vcF9tb2RlX3Nob3csIGRtYV9vcF9tb2RlX3N0b3JlKTsKPiA+ICtzdGF0aWMg
REVWSUNFX0FUVFJfUlcoZG1hX29wX21vZGUpOwo+ID4gIAo+IAo+IFdoaWxlIEkgY2FuIGFjayB0
aGlzIHBhcnQgaGVyZSBpZiBpdCBoZWxwcyBnZW5lcmljIGNsZWFudXAgZWZmb3J0IEkKPiBkb24n
dCB1bmRlcnN0YXJ0IHdvdWxkIGl0IGltcHJvdmUgY29kZSByZWFkYWJpbGl0eSBpbiBnZW5lcmFs
PyBNb2RlIDY0NAo+IGlzIGNsZWFyIGFuZCBkb24ndCBuZWVkIGFueSBncmVwcGluZyBidXQgZm9y
IERFVklDRV9BVFRSX1JXKCkgSSBoYWQgdG8gZ28KPiB0aHJvdWdoIGFsbCBvZiB0aGVzZSBmaWxl
cyBpbiBvcmRlciB0byBzZWUgd2hhdCBkb2VzIGl0IG1lYW46CgpBcmUgeW91IHN1Z2dlc3Rpbmcg
dGhhdCBkZXZpY2UuaCAoYXMgdGhhdCBpcyB3aGVyZQpERVZJQ0VfQVRUUiBhbmQgdGhlIG90aGVy
IERFVklDRV9BVFRSXzxGT08+IHZhcmlhbnRzCmFyZSAjZGVmaW5lZCkgc2hvdWxkIGhhdmUgYmV0
dGVyIGNvbW1lbnRzIGZvciB0aGUKXzxGT08+IHZhcmlhbnRzPwoKPiBERVZJQ0VfQVRUUl9SVzog
aW5jbHVkZS9saW51eC9kZXZpY2UuaAo+IF9fQVRUUl9SVzogaW5jbHVkZS9saW51eC9zeXNmcy5o
Cj4gU19JV1VTUjogaW5jbHVkZS91YXBpL2xpbnV4L3N0YXQuaAo+IFNfSVJVR086IGluY2x1ZGUv
bGludXgvc3RhdC5oCgpidHc6IHBhdGNoIDEvNCBvZiB0aGUgc2VyaWVzIGRvZXMgcmVtb3ZlIHRo
ZSB1c2VzIG9mClNfPFBFUk1TPiBmcm9tIHRoZXNlIG1hY3JvcyBpbiBzeXNmcy5oIGFuZCBjb252
ZXJ0cwp0aGVtIHRvIHNpbXBsZSBvY3RhbCBpbnN0ZWFkLgotLS0KVG8gdW5zdWJzY3JpYmUgZnJv
bSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhl
IGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpv
cmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1s
Cg==

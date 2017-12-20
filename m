Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next,2/4] treewide: Use DEVICE_ATTR_RW
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-Id: <20171220083403.GA27231@bitmer.com>
Date: Wed, 20 Dec 2017 10:34:03 +0200
To: Joe Perches <joe@perches.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Airlie <airlied@linux.ie>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jiri Slaby <jslaby@suse.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBEZWMgMTksIDIwMTcgYXQgMTA6MTU6MDdBTSAtMDgwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gQ29udmVydCBERVZJQ0VfQVRUUiB1c2VzIHRvIERFVklDRV9BVFRSX1JXIHdoZXJlIHBv
c3NpYmxlLgo+IAouLi4KICAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL29tYXAvbWNic3AuYyBi
L3NvdW5kL3NvYy9vbWFwL21jYnNwLmMKPiBpbmRleCA3YTU0ZTMwODMyMDMuLjc5ZDRkYzc4NWU1
YyAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2Mvb21hcC9tY2JzcC5jCj4gKysrIGIvc291bmQvc29j
L29tYXAvbWNic3AuYwo+IEBAIC04NTQsNyArODU0LDcgQEAgc3RhdGljIHNzaXplX3QgZG1hX29w
X21vZGVfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LAo+ICAJcmV0dXJuIHNpemU7Cj4gIH0KPiAg
Cj4gLXN0YXRpYyBERVZJQ0VfQVRUUihkbWFfb3BfbW9kZSwgMDY0NCwgZG1hX29wX21vZGVfc2hv
dywgZG1hX29wX21vZGVfc3RvcmUpOwo+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcoZG1hX29wX21v
ZGUpOwo+ICAKV2hpbGUgSSBjYW4gYWNrIHRoaXMgcGFydCBoZXJlIGlmIGl0IGhlbHBzIGdlbmVy
aWMgY2xlYW51cCBlZmZvcnQgSQpkb24ndCB1bmRlcnN0YXJ0IHdvdWxkIGl0IGltcHJvdmUgY29k
ZSByZWFkYWJpbGl0eSBpbiBnZW5lcmFsPyBNb2RlIDY0NAppcyBjbGVhciBhbmQgZG9uJ3QgbmVl
ZCBhbnkgZ3JlcHBpbmcgYnV0IGZvciBERVZJQ0VfQVRUUl9SVygpIEkgaGFkIHRvIGdvCnRocm91
Z2ggYWxsIG9mIHRoZXNlIGZpbGVzIGluIG9yZGVyIHRvIHNlZSB3aGF0IGRvZXMgaXQgbWVhbjoK
CkRFVklDRV9BVFRSX1JXOiBpbmNsdWRlL2xpbnV4L2RldmljZS5oCl9fQVRUUl9SVzogaW5jbHVk
ZS9saW51eC9zeXNmcy5oClNfSVdVU1I6IGluY2x1ZGUvdWFwaS9saW51eC9zdGF0LmgKU19JUlVH
TzogaW5jbHVkZS9saW51eC9zdGF0LmgKCkphcmtrbyBOaWt1bGEgPGphcmtrby5uaWt1bGFAYml0
bWVyLmNvbT4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5l
ICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpv
cmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2Vy
Lmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

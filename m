Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next,2/4] treewide: Use DEVICE_ATTR_RW
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75VfyvA3kAtGiwJ63BOx43RuVSz-XgdK79WApytoaehOOgQ@mail.gmail.com>
Date: Tue, 19 Dec 2017 20:41:57 +0200
To: Joe Perches <joe@perches.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Airlie <airlied@linux.ie>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jiri Slaby <jslaby@suse.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-s390@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, linux-fbdev@vger.kernel.org, ALSA Development Mailing List <alsa-devel@alsa-project.org>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBEZWMgMTksIDIwMTcgYXQgODoxNSBQTSwgSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVz
LmNvbT4gd3JvdGU6Cj4gQ29udmVydCBERVZJQ0VfQVRUUiB1c2VzIHRvIERFVklDRV9BVFRSX1JX
IHdoZXJlIHBvc3NpYmxlLgo+Cj4gRG9uZSB3aXRoIHBlcmwgc2NyaXB0Ogo+Cj4gJCBnaXQgZ3Jl
cCAtdyAtLW5hbWUtb25seSBERVZJQ0VfQVRUUiB8IFwKPiAgIHhhcmdzIHBlcmwgLWkgLWUgJ2xv
Y2FsICQvOyB3aGlsZSAoPD4pIHsgcy9cYkRFVklDRV9BVFRSXHMqXChccyooXHcrKVxzKixccypc
KD8oXHMqU19JUlVHT1xzKlx8XHMqU19JV1VTUnxccypTX0lXVVNSXHMqXHxccypTX0lSVUdPXHMq
fFxzKjA2NDRccyopXCk/XHMqLFxzKlwxX3Nob3dccyosXHMqXDFfc3RvcmVccypcKS9ERVZJQ0Vf
QVRUUl9SVyhcMSkvZzsgcHJpbnQ7fScKCj4gIGRyaXZlcnMvcGxhdGZvcm0veDg2L2NvbXBhbC1s
YXB0b3AuYyB8IDE4ICsrKysrLS0tLS0tLS0tLQoKPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9jb21wYWwtbGFwdG9wLmMKPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9jb21wYWwtbGFw
dG9wLmMKPiBAQCAtNjc5LDE4ICs2NzksMTIgQEAgc3RhdGljIGludCBiYXRfd3JpdGVhYmxlX3By
b3BlcnR5KHN0cnVjdCBwb3dlcl9zdXBwbHkgKnBzeSwKPiAgLyogPT09PT09PT09PT09PT0gKi8K
PiAgLyogRHJpdmVyIEdsb2JhbHMgKi8KPiAgLyogPT09PT09PT09PT09PT0gKi8KPiAtc3RhdGlj
IERFVklDRV9BVFRSKHdha2VfdXBfcG1lLAo+IC0gICAgICAgICAgICAgICAwNjQ0LCB3YWtlX3Vw
X3BtZV9zaG93LCAgICAgICAgIHdha2VfdXBfcG1lX3N0b3JlKTsKPiAtc3RhdGljIERFVklDRV9B
VFRSKHdha2VfdXBfbW9kZW0sCj4gLSAgICAgICAgICAgICAgIDA2NDQsIHdha2VfdXBfbW9kZW1f
c2hvdywgICAgICAgd2FrZV91cF9tb2RlbV9zdG9yZSk7Cj4gLXN0YXRpYyBERVZJQ0VfQVRUUih3
YWtlX3VwX2xhbiwKPiAtICAgICAgICAgICAgICAgMDY0NCwgd2FrZV91cF9sYW5fc2hvdywgd2Fr
ZV91cF9sYW5fc3RvcmUpOwo+IC1zdGF0aWMgREVWSUNFX0FUVFIod2FrZV91cF93bGFuLAo+IC0g
ICAgICAgICAgICAgICAwNjQ0LCB3YWtlX3VwX3dsYW5fc2hvdywgICAgICAgIHdha2VfdXBfd2xh
bl9zdG9yZSk7Cj4gLXN0YXRpYyBERVZJQ0VfQVRUUih3YWtlX3VwX2tleSwKPiAtICAgICAgICAg
ICAgICAgMDY0NCwgd2FrZV91cF9rZXlfc2hvdywgd2FrZV91cF9rZXlfc3RvcmUpOwo+IC1zdGF0
aWMgREVWSUNFX0FUVFIod2FrZV91cF9tb3VzZSwKPiAtICAgICAgICAgICAgICAgMDY0NCwgd2Fr
ZV91cF9tb3VzZV9zaG93LCAgICAgICB3YWtlX3VwX21vdXNlX3N0b3JlKTsKPiArc3RhdGljIERF
VklDRV9BVFRSX1JXKHdha2VfdXBfcG1lKTsKPiArc3RhdGljIERFVklDRV9BVFRSX1JXKHdha2Vf
dXBfbW9kZW0pOwo+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcod2FrZV91cF9sYW4pOwo+ICtzdGF0
aWMgREVWSUNFX0FUVFJfUlcod2FrZV91cF93bGFuKTsKPiArc3RhdGljIERFVklDRV9BVFRSX1JX
KHdha2VfdXBfa2V5KTsKPiArc3RhdGljIERFVklDRV9BVFRSX1JXKHdha2VfdXBfbW91c2UpOwoK
QWNrZWQtYnk6IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4KCmZv
ciBQRHg4NiBiaXRzLgoKSGF2ZSB0byBzYXkgdGhhdCB3aGlsZSBpdCBkb2Vzbid0IGNoYW5nZSB0
aGUgYXR0cmlidXRlcyBoZXJlLCBpdCBtaWdodApyZXF1aXJlIHN0aWxsIHRvIGJlIHJldmlzaXRl
ZCBieSBzZWN1cml0eSBwZW9wbGUsIGlmIHRoZXkgd2lzaC4K

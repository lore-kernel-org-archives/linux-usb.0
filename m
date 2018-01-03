Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [-next,2/4] treewide: Use DEVICE_ATTR_RW
From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-Id: <4624388.pPJCIclP0U@amdc3058>
Date: Wed, 03 Jan 2018 16:16:08 +0100
To: Joe Perches <joe@perches.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Sebastian Ott <sebott@linux.vnet.ibm.com>, Peter Oberparleiter <oberpar@linux.vnet.ibm.com>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, "Luis R. Rodriguez" <mcgrof@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, David Airlie <airlied@linux.ie>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jiri Slaby <jslaby@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, linux-pm@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlc2RheSwgRGVjZW1iZXIgMTksIDIwMTcgMTA6MTU6MDcgQU0gSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gQ29udmVydCBERVZJQ0VfQVRUUiB1c2VzIHRvIERFVklDRV9BVFRSX1JXIHdoZXJlIHBv
c3NpYmxlLgo+IAo+IERvbmUgd2l0aCBwZXJsIHNjcmlwdDoKPiAKPiAkIGdpdCBncmVwIC13IC0t
bmFtZS1vbmx5IERFVklDRV9BVFRSIHwgXAo+ICAgeGFyZ3MgcGVybCAtaSAtZSAnbG9jYWwgJC87
IHdoaWxlICg8PikgeyBzL1xiREVWSUNFX0FUVFJccypcKFxzKihcdyspXHMqLFxzKlwoPyhccypT
X0lSVUdPXHMqXHxccypTX0lXVVNSfFxzKlNfSVdVU1JccypcfFxzKlNfSVJVR09ccyp8XHMqMDY0
NFxzKilcKT9ccyosXHMqXDFfc2hvd1xzKixccypcMV9zdG9yZVxzKlwpL0RFVklDRV9BVFRSX1JX
KFwxKS9nOyBwcmludDt9Jwo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVy
Y2hlcy5jb20+Cj4gLS0tCj4gIGFyY2gvczM5MC9rZXJuZWwvdG9wb2xvZ3kuYyAgICAgICAgICB8
ICAzICstLQo+ICBhcmNoL3RpbGUva2VybmVsL3N5c2ZzLmMgICAgICAgICAgICAgfCAgMiArLQo+
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N5c2ZzLmMgICAgfCAgNiArKy0tLQo+ICBkcml2
ZXJzL3BsYXRmb3JtL3g4Ni9jb21wYWwtbGFwdG9wLmMgfCAxOCArKysrKy0tLS0tLS0tLS0KPiAg
ZHJpdmVycy9zMzkwL2Npby9kZXZpY2UuYyAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9z
Y3NpL2xwZmMvbHBmY19hdHRyLmMgICAgICAgIHwgNDMgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMvdGhlcm1hbC90aGVybWFsX3N5c2ZzLmMgICAgICB8ICA5
ICsrKystLS0tCj4gIGRyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYyAgICAgICAgICB8ICAyICst
Cj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1kYmdjYXAuYyAgICAgICB8ICAyICstCj4gIGRyaXZl
cnMvdXNiL3BoeS9waHktdGFodm8uYyAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvYXVvX2sxOTB4LmMgICAgICB8ICA0ICsrLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi93
MTAwZmIuYyAgICAgICAgIHwgIDQgKystLQo+ICBsaWIvdGVzdF9maXJtd2FyZS5jICAgICAgICAg
ICAgICAgICAgfCAxNCArKysrKy0tLS0tLS0KPiAgbGliL3Rlc3Rfa21vZC5jICAgICAgICAgICAg
ICAgICAgICAgIHwgMTQgKysrKystLS0tLS0tCj4gIHNvdW5kL3NvYy9vbWFwL21jYnNwLmMgICAg
ICAgICAgICAgICB8ICA0ICsrLS0KPiAgMTUgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygr
KSwgODAgZGVsZXRpb25zKC0pCgpGb3IgZmJkZXYgY2hhbmdlczoKCkFja2VkLWJ5OiBCYXJ0bG9t
aWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CgpCZXN0IHJlZ2Fy
ZHMsCi0tLQpCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6ClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQ
b2xhbmQKU2Ftc3VuZyBFbGVjdHJvbmljcwoKLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxp
c3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2Yg
YSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5m
byBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==

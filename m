Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/4] drivers/net: Use octal not symbolic permissions
From: Wei Liu <wei.liu2@citrix.com>
Message-Id: <20180326140727.4aripztdc2ar6g45@citrix.com>
Date: Mon, 26 Mar 2018 15:07:27 +0100
To: Joe Perches <joe@perches.com>
Cc: Jay Vosburgh <j.vosburgh@gmail.com>, Veaceslav Falico <vfalico@gmail.com>, Andy Gospodarek <andy@greyhouse.net>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean-Paul Roubelat <jpr@f6fbb.org>, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@osg.samsung.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Paul Mackerras <paulus@samba.org>, Michal Ostrowski <mostrows@earthlink.net>, Oliver Neukum <oliver@neukum.org>, Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-hams@vger.kernel.org, devel@linuxdriverproject.org, linux-wpan@vger.kernel.org, linux-ppp@vger.kernel.org, linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBNYXIgMjMsIDIwMTggYXQgMDM6NTQ6MzlQTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3Jv
dGU6Cj4gUHJlZmVyIHRoZSBkaXJlY3QgdXNlIG9mIG9jdGFsIGZvciBwZXJtaXNzaW9ucy4KPiAK
PiBEb25lIHdpdGggY2hlY2twYXRjaCAtZiAtLXR5cGVzPVNZTUJPTElDX1BFUk1TIC0tZml4LWlu
cGxhY2UKPiBhbmQgc29tZSB0eXBpbmcuCj4gCj4gTWlzY2VsbGFuZWE6Cj4gCj4gbyBXaGl0ZXNw
YWNlIG5lYXRlbmluZyBhcm91bmQgdGhlc2UgY29udmVyc2lvbnMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQveGVu
LW5ldGJhY2sveGVuYnVzLmMgICAgICAgfCAgNCArLQo+ICBkcml2ZXJzL25ldC94ZW4tbmV0ZnJv
bnQuYyAgICAgICAgICAgICB8ICA2ICstLQoKUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUy
QGNpdHJpeC5jb20+Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUg
bGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8g
bWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8v
dmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

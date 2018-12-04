Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/3] usb: chipidea: imx: Warn if oc polarity isn't specified
From: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-Id: <20181204082047.ciht5czh6dfvedrk@pengutronix.de>
Date: Tue, 4 Dec 2018 09:20:47 +0100
To: PETER CHEN <peter.chen@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "mstarr@hedonline.com" <mstarr@hedonline.com>
List-ID: <linux-usb.vger.kernel.org>

SGVsbG8gUGV0ZXIsCgpPbiBUdWUsIERlYyAwNCwgMjAxOCBhdCAwNjoxOToxMUFNICswMDAwLCBQ
RVRFUiBDSEVOIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2Np
X2hkcmNfaW14LmMgYi9kcml2ZXJzL3VzYi9jaGlwaWRlYS9jaV9oZHJjX2lteC5jCj4gPiBpbmRl
eCA4MGI0ZTRlZjliNjguLjNkY2ZkMGQ5N2Y5NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdXNi
L2NoaXBpZGVhL2NpX2hkcmNfaW14LmMKPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2Np
X2hkcmNfaW14LmMKPiA+IEBAIC0xNDEsNiArMTQxLDggQEAgc3RhdGljIHN0cnVjdCBpbXhfdXNi
bWlzY19kYXRhCj4gPiAqdXNibWlzY19nZXRfaW5pdF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRldikK
PiA+ICAJfSBlbHNlIGlmIChvZl9maW5kX3Byb3BlcnR5KG5wLCAib3Zlci1jdXJyZW50LWFjdGl2
ZS1sb3ciLCBOVUxMKSkgewo+ID4gIAkJZGF0YS0+b2NfcG9sX2FjdGl2ZV9sb3cgPSAxOwo+ID4g
IAkJZGF0YS0+b2NfcG9sX2NvbmZpZ3VyZWQgPSAxOwo+ID4gKwl9IGVsc2Ugewo+ID4gKwkJZGV2
X3dhcm4oZGV2LCAiTm8gb3ZlciBjdXJyZW50IHBvbGFyaXR5IGRlZmluZWRcbiIpOwo+ID4gIAl9
Cj4gCj4gSWYgdGhlIHBsYXRmb3JtIGRvZXNuJ3Qgc3VwcG9ydCBPQywgdGhlIHBvbGFyaXR5IHNl
dHRpbmcgaXMgbm90IG5lZWRlZC4gWW91IGNvdWxkIGNvbnNpZGVyCj4gZ2V0dGluZyBwb2xhcml0
eSBwcm9wZXJ0eSBvbmx5ICJkaXNhYmxlLW92ZXItY3VycmVudCIgaXMgbm90IGZvdW5kIGF0IHBh
dGNoIDEuCgpSaWdodCwganVzdCBmaXhlZCB0aGF0IHVwIGFuZCB3aWxsIHNlbmQgb3V0IHYzIGlu
IGEgbW9tZW50LgoKQmVzdCByZWdhcmRzClV3ZQo=

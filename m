Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/3] usb: chipidea: imx: Warn if oc polarity isn't specified
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <AM0PR04MB53148CE406ED8DBFABA5A79B8BAF0@AM0PR04MB5314.eurprd04.prod.outlook.com>
Date: Tue, 4 Dec 2018 06:19:11 +0000
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "mstarr@hedonline.com" <mstarr@hedonline.com>
List-ID: <linux-usb.vger.kernel.org>

PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14LmMg
fCAyICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY19pbXguYyBiL2RyaXZlcnMvdXNiL2No
aXBpZGVhL2NpX2hkcmNfaW14LmMNCj4gaW5kZXggODBiNGU0ZWY5YjY4Li4zZGNmZDBkOTdmOTQg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfaW14LmMNCj4gKysr
IGIvZHJpdmVycy91c2IvY2hpcGlkZWEvY2lfaGRyY19pbXguYw0KPiBAQCAtMTQxLDYgKzE0MSw4
IEBAIHN0YXRpYyBzdHJ1Y3QgaW14X3VzYm1pc2NfZGF0YQ0KPiAqdXNibWlzY19nZXRfaW5pdF9k
YXRhKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gIAl9IGVsc2UgaWYgKG9mX2ZpbmRfcHJvcGVydHko
bnAsICJvdmVyLWN1cnJlbnQtYWN0aXZlLWxvdyIsIE5VTEwpKSB7DQo+ICAJCWRhdGEtPm9jX3Bv
bF9hY3RpdmVfbG93ID0gMTsNCj4gIAkJZGF0YS0+b2NfcG9sX2NvbmZpZ3VyZWQgPSAxOw0KPiAr
CX0gZWxzZSB7DQo+ICsJCWRldl93YXJuKGRldiwgIk5vIG92ZXIgY3VycmVudCBwb2xhcml0eSBk
ZWZpbmVkXG4iKTsNCj4gIAl9DQoNCklmIHRoZSBwbGF0Zm9ybSBkb2Vzbid0IHN1cHBvcnQgT0Ms
IHRoZSBwb2xhcml0eSBzZXR0aW5nIGlzIG5vdCBuZWVkZWQuIFlvdSBjb3VsZCBjb25zaWRlcg0K
Z2V0dGluZyBwb2xhcml0eSBwcm9wZXJ0eSBvbmx5ICJkaXNhYmxlLW92ZXItY3VycmVudCIgaXMg
bm90IGZvdW5kIGF0IHBhdGNoIDEuDQoNClBldGVyCg==

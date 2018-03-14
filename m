Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,03/12] usb: typec: add fwnode to tcpc
From: Jun Li <jun.li@nxp.com>
Message-Id: <VI1PR0402MB3917ACFCCE0B2F4EE4F4E53689D10@VI1PR0402MB3917.eurprd04.prod.outlook.com>
Date: Wed, 14 Mar 2018 01:27:15 +0000
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "yueyao@google.com" <yueyao@google.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "o_leveque@orange.fr" <o_leveque@orange.fr>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <linux-usb.vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBIZWlra2kgS3JvZ2VydXMgW21h
aWx0bzpoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tXQ0KPiBTZW50OiAyMDE45bm0M+ac
iDEz5pelIDE5OjE4DQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPg0KPiBDYzogcm9iaCtk
dEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gZ3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc7IGEuaGFqZGFAc2Ftc3VuZy5jb207IGxpbnV4QHJvZWNrLXVzLm5ldDsNCj4geXVl
eWFvQGdvb2dsZS5jb207IHNodWZhbl9sZWVAcmljaHRlay5jb207IG9fbGV2ZXF1ZUBvcmFuZ2Uu
ZnI7DQo+IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14
QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDMvMTJdIHVzYjogdHlwZWM6IGFk
ZCBmd25vZGUgdG8gdGNwYw0KPiANCj4gSGkgSnVuIExpLA0KPiANCj4gT24gVHVlLCBNYXIgMTMs
IDIwMTggYXQgMDU6MzQ6MjlQTSArMDgwMCwgTGkgSnVuIHdyb3RlOg0KPiA+IEFkZCBmd25vZGUg
aGFuZGxlIHRvIGdldCB0aGUgZndub2RlIHNvIHdlIGNhbiBnZXQgdHlwZWMgY29uZmlncyBpdA0K
PiA+IGNvbnRhaW5zLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSGVpa2tpIEtyb2dlcnVzIDxo
ZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPg0KPiANCj4gWW91IHNob3VsZCBub3Qgc2ln
bi1vZmYgcGF0Y2hlcyBmb3Igb3RoZXIgcGVvcGxlLiBJZiB5b3UgY2hlY2sgc2VjdGlvbg0KPiAx
MyBmcm9tIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0IHlvdSds
bCBmaW5kIGRlZmluaXRpb24NCj4gZm9yICJTdWdnZXN0ZWQtYnkiIHRhZy4gSSBiZWxpZXZlIHRo
YXQgaXMgdGhlIGFwcHJvcHJpYXRlIHRhZyB0aGF0IHlvdSBzaG91bGQNCj4gdXNpbmcgaW4gdGhp
cyBjYXNlLg0KDQpZb3UgYXJlIHJpZ2h0LCBteSBjb3B5IHBhc3RlIG1pc3Rha2UsIEkgd2lsbCBj
b3JyZWN0IHRoaXMuDQoNClRoYW5rcw0KSnVuDQo+IA0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0N
Cj4gaGVpa2tpCg==

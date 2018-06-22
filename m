Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: chipidea: Fix ULPI on imx51
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <HE1PR04MB1450D1881C07BEAEF4A8283B8B750@HE1PR04MB1450.eurprd04.prod.outlook.com>
Date: Fri, 22 Jun 2018 00:49:43 +0000
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-ID: <linux-usb.vger.kernel.org>

PiA+Pj4+DQo+ID4+DQo+ID4+IEkgbmV2ZXIgYXNzdW1lZCBpdCB3YXMgYSByZWdyZXNzaW9uIGFu
ZCB0aGF0IFVTQiB3b3JrZWQgb24gUkRVMSBib2FyZA0KPiA+PiBiZWZvcmUsIHNvIEkgbmV2ZXIg
dHJpZWQgdG8gc2VlIGlmIHRoaXMgd2FzIGEgcmVncmVzc2lvbi4gSSBjYW4gb25seQ0KPiA+PiB0
ZWxsIHlvdSB0aGF0IGl0IGhhbmdzIGFzIHNvb24gYXMgYW55IFBPUlRTQyByZWdpc3RlcnMgYXJl
IGFjY2Vzc2VkLg0KPiA+DQo+ID4gSGFuZyBhdCByZWdpc3RlciBhY2Nlc3MgdXN1YWxseSBtZWFu
cyB0aGF0IG1vZHVsZSB0aGF0IG93bnMgdGhlDQo+ID4gcmVnaXN0ZXIgaXMgbm90IGNsb2NrZWQu
DQo+IA0KPiBPbiBSRFUxLCBjYWxsIHRvIHVzYl9waHlfaW5pdCgpIGFjdHVhbGx5IGNhbGxzIHVz
Yl9nZW5fcGh5X2luaXQoKSB0aGF0IGRvZXMNCj4gcmVndWxhdG9yX2VuYWJsZSgpIGZvciAmdnVz
Yl9yZWcgYW5kIGNsa19wcmVwYXJlX2VuYWJsZSgpIGZvciAmY2xrXzI2TV91c2IuICBJDQo+IHRo
aW5nIHNvbWUgb2YgdGhlc2UgdHdvIGlzIGFjdHVhbGx5IG5lZWRlZCB0byBhdm9pZCBoYW5nIG9u
IHJlZ2lzdGVyIGFjY2Vzcy4NCg0KRmFiaW8sIHdvdWxkIHlvdSBwbGVhc2UgY2hlY2sgYm90aCBy
ZWd1bGF0b3IgYW5kIGNsb2NrIGZvciBVTFBJIFBIWSBhcmUgb24gYXQgaW14NTFiYmc/DQoNClBl
dGVyCg==

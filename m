Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] USB: chipidea: Do not hang when CONFIG_USB_CHIPIDEA_ULPI is not selected
From: Fabio Estevam <festevam@gmail.com>
Message-Id: <CAOMZO5AnrF9e4yJ7-ZOoCEVmG1PZbieV4fcTprNngiT-bq=1+A@mail.gmail.com>
Date: Mon, 2 Jul 2018 23:00:06 -0300
To: Shawn Guo <shawnguo@kernel.org>
Cc: Peter Chen <peter.chen@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKdWwgMiwgMjAxOCBhdCAxMDo0OCBQTSwgU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJu
ZWwub3JnPiB3cm90ZToKCj4gSSB3aWxsIG1ha2Ugc3VyZSBib3RoIGRlZmNvbmZpZyBwYXRjaGVz
IGdvIGludG8gNC4xOC1yYy4KClRoYW5rcywgU2hhd24hCgpQZXRlciwKCkNvdWxkIHlvdSBwbGVh
c2UgdGhlbiBxdWV1ZSB0aGlzIGNoaXBpZGVhIHBhdGNoIGZvciA0LjE4LXJjPwoKVGhhbmtzCi0t
LQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3Jp
YmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIu
a2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3Jn
L21ham9yZG9tby1pbmZvLmh0bWwK

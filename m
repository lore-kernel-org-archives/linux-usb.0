Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] USB: chipidea: Do not hang when CONFIG_USB_CHIPIDEA_ULPI is not selected
From: Fabio Estevam <festevam@gmail.com>
Message-Id: <CAOMZO5CkAc6-GwztMeocu8sWyfzb=okzHDeKYEY58Wze6GDLdA@mail.gmail.com>
Date: Mon, 2 Jul 2018 08:52:34 -0300
To: Peter Chen <peter.chen@nxp.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Lucas Stach <l.stach@pengutronix.de>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Shawn Guo <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgUGV0ZXIsCgpPbiBNb24sIEp1bCAyLCAyMDE4IGF0IDEyOjA4IEFNLCBQZXRlciBDaGVuIDxw
ZXRlci5jaGVuQG54cC5jb20+IHdyb3RlOgoKPiBGYWJpbywgc2luY2UgdGhpcyBmdW5jdGlvbiBo
YXMgZGVwZW5kZW5jeSB3aXRoIGRlZmNvbmZpZywgaXMgdGhlIGRlZmNvbmZpZyBjaGFuZ2UgYSBm
aXggZm9yIHY0LjE4LXJjCj4gb3IgZm9yIHY0LjE5LXJjMT8KCkkgaGF2ZSBzZW50IHRoZSBkZWZj
b25maWcgY2hhbmdlcyBmb3IgaW14X3Y2X3Y3X2RlZmNvbmZpZyBhbmQKaW14X3Y0X3Y1X2RlZmNv
bmZpZyBhbmQgaG9wZSB0aGF0IHRoZXkgY291bGQgYmUgYXBwbGllZCBmb3IgNC4xOC1yYy4KCk1h
eWJlIHRoZXkgY291bGQgZ28gdG8gdGhlIHNhbWUgdHJlZT8KLS0tClRvIHVuc3Vic2NyaWJlIGZy
b20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRo
ZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFq
b3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRt
bAo=

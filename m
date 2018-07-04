Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] USB: chipidea: Do not hang when CONFIG_USB_CHIPIDEA_ULPI is not selected
From: Fabio Estevam <festevam@gmail.com>
Message-Id: <CAOMZO5CNiVrFtS2NKvgMjZGCzXuev+efpYuNy0KRZ=vV56q5-Q@mail.gmail.com>
Date: Wed, 4 Jul 2018 10:11:35 -0300
To: Peter Chen <peter.chen@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, USB list <linux-usb@vger.kernel.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, dl-linux-imx <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgUGV0ZXIsCgpPbiBXZWQsIEp1bCA0LCAyMDE4IGF0IDU6MjQgQU0sIFBldGVyIENoZW4gPHBl
dGVyLmNoZW5AbnhwLmNvbT4gd3JvdGU6Cgo+IEl0IHNlZW1zIHRoZXJlIGlzIG5vIGhhcm0gaWYg
d2UgYWx3YXlzIGluY2x1ZGUgZHJpdmVycy91c2IvY2hpcGlkZWEvdWxwaS5jIGV4Y2VwdCBpbmNy
ZWFzaW5nCj4gYSBsaXR0bGUgY29kZSBzaXplLCBob3cgYWJvdXQgYWx3YXlzIGJ1aWxkIHVscGku
YyBmb3IgdGhlIHdob2xlIGNoaXBpZGVhIGF0IE1ha2VmaWxlLCBkZWxldGUKPiBDT05GSUdfVVNC
X0NISVBJREVBX1VMUEkgYXMgd2VsbCwgbWVhbndoaWxlLCB3ZSBuZWVkIHRvIHNlbGVjdCBVU0Jf
VUxQSV9CVVMKPiBhdCBLY29uZmlnPwo+Cj4gQmVzaWRlcywgYXQgZnVuY3Rpb24gY2lfdWxwaV9y
ZXN1bWUgZm9yIHVscGkuYywgd2UgbmVlZCB0byBhZGQgY29uZGl0aW9uIHRvIHF1aXQgZm9yIG5v
bi11bHBpIGludGVyZmFjZS4KClllcywgSSBzZW50IGEgdjIgbGV0dGluZyB1bHBpLmMgdG8gYmUg
YWx3YXlzIGJ1aWx0LWluLgotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQg
dGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdl
IHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0
cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==

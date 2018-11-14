Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/5] extcon: Return -EPROBE_DEFER when extcon device is not found
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75VduXH0OKcD2AyR03eNrWW8bKGL-ijfQocfQ+MDCAq0yag@mail.gmail.com>
Date: Wed, 14 Nov 2018 16:04:26 +0200
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, USB <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Guenter Roeck <linux@roeck-us.net>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, rogerq@ti.com, Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMToxNyBQTSBBbmR5IFNoZXZjaGVua28KPGFuZHkuc2hl
dmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFdlZCwgTm92IDE0LCAyMDE4IGF0IDE6MDUg
UE0gQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ftc3VuZy5jb20+IHdyb3RlOgoKPiA+ID4gQ2hh
bmdpbmcgTlVMTCB0byAtRU5PREVWIGlzIGEgdHJhZGluZyBiYWQgdG8gd29yc2UuCgo+IFAuUy4g
SSBzdGlsbCBkaXNhZ3JlZSB3aXRoIHlvdXIgYXJndW1lbnRzIGluIHJlbGF0aW9uIHRvIGRlIGZh
Y3RvIHVzZSBvZiBhbiBBUEkuCgpJIHNwb2tlIHRvIGNvbGxlYWd1ZXMgb2YgbWluZSBhbmQgdGhl
eSBhcmUgYWdyZWUgdGhhdCBzZW1hbnRpY2FsbHkKLUVQUk9CRV9ERUZFUiBpcyBhIHdyb25nIGVy
cm9yIGNvZGUgZnJvbSBBUEkgdGhhdCBtYXRjaGVzIGFnYWluc3Qgc29tZQpsaXN0LgpPbiB0aGUg
b3RoZXIgaGFuZCwgdGhleSBhZ3JlZSB3aXRoIG1lIHRoYXQgY2hhbmdpbmcgTlVMTCB0byAtRU5P
REVWIGlzCmEgdHJhZGluZyBiYWQgdG8gd29yc2UuCgpTbywgSSB3aXRoZHJhdyBtaW5lIGNvbXBs
YWludHMgYWdhaW5zdCBBUEkuCg==

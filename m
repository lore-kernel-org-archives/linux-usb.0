Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/5] extcon: Return -EPROBE_DEFER when extcon device is not found
From: Chanwoo Choi <cw00.choi@samsung.com>
Message-Id: <5BECC905.4060802@samsung.com>
Date: Thu, 15 Nov 2018 10:16:53 +0900
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, USB <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Guenter Roeck <linux@roeck-us.net>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, rogerq@ti.com, Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMjAxOOuFhCAxMeyblCAxNOydvCAyMzowNCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+IE9u
IFdlZCwgTm92IDE0LCAyMDE4IGF0IDE6MTcgUE0gQW5keSBTaGV2Y2hlbmtvCj4gPGFuZHkuc2hl
dmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+PiBPbiBXZWQsIE5vdiAxNCwgMjAxOCBhdCAxOjA1
IFBNIENoYW53b28gQ2hvaSA8Y3cwMC5jaG9pQHNhbXN1bmcuY29tPiB3cm90ZToKPiAKPj4+PiBD
aGFuZ2luZyBOVUxMIHRvIC1FTk9ERVYgaXMgYSB0cmFkaW5nIGJhZCB0byB3b3JzZS4KPiAKPj4g
UC5TLiBJIHN0aWxsIGRpc2FncmVlIHdpdGggeW91ciBhcmd1bWVudHMgaW4gcmVsYXRpb24gdG8g
ZGUgZmFjdG8gdXNlIG9mIGFuIEFQSS4KPiAKPiBJIHNwb2tlIHRvIGNvbGxlYWd1ZXMgb2YgbWlu
ZSBhbmQgdGhleSBhcmUgYWdyZWUgdGhhdCBzZW1hbnRpY2FsbHkKPiAtRVBST0JFX0RFRkVSIGlz
IGEgd3JvbmcgZXJyb3IgY29kZSBmcm9tIEFQSSB0aGF0IG1hdGNoZXMgYWdhaW5zdCBzb21lCj4g
bGlzdC4KPiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhleSBhZ3JlZSB3aXRoIG1lIHRoYXQgY2hhbmdp
bmcgTlVMTCB0byAtRU5PREVWIGlzCj4gYSB0cmFkaW5nIGJhZCB0byB3b3JzZS4KPiAKPiBTbywg
SSB3aXRoZHJhdyBtaW5lIGNvbXBsYWludHMgYWdhaW5zdCBBUEkuCj4gCgpPSy4gVGhhbmtzLgo=

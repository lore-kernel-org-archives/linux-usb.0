Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/3] usb: gadget: ccid: add support for USB CCID Gadget Device
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87woti1d5h.fsf@linux.intel.com>
Date: Thu, 26 Jul 2018 13:53:30 +0300
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, davem@davemloft.net, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

TWFyY3VzIEZvbGtlc3NvbiA8bWFyY3VzLmZvbGtlc3NvbkBnbWFpbC5jb20+IHdyaXRlczoKCj4g
Q2hpcCBDYXJkIEludGVyZmFjZSBEZXZpY2UgKENDSUQpIHByb3RvY29sIGlzIGEgVVNCIHByb3Rv
Y29sIHRoYXQKPiBhbGxvd3MgYSBzbWFydGNhcmQgZGV2aWNlIHRvIGJlIGNvbm5lY3RlZCB0byBh
IGNvbXB1dGVyIHZpYSBhIGNhcmQKPiByZWFkZXIgdXNpbmcgYSBzdGFuZGFyZCBVU0IgaW50ZXJm
YWNlLCB3aXRob3V0IHRoZSBuZWVkIGZvciBlYWNoIG1hbnVmYWN0dXJlcgo+IG9mIHNtYXJ0Y2Fy
ZHMgdG8gcHJvdmlkZSBpdHMgb3duIHJlYWRlciBvciBwcm90b2NvbC4KPgo+IFRoaXMgZ2FkZ2V0
IGRyaXZlciBtYWtlcyBMaW51eCBzaG93IHVwIGFzIGEgQ0NJRCBkZXZpY2UgdG8gdGhlIGhvc3Qg
YW5kIGxldCBhCj4gdXNlcnNwYWNlIGRhZW1vbiBhY3QgYXMgdGhlIHNtYXJ0Y2FyZC4KPgo+IFRo
aXMgaXMgdXNlZnVsIHdoZW4gdGhlIExpbnV4IGdhZGdldCBpdHNlbGYgc2hvdWxkIGFjdCBhcyBh
IGNyeXB0b2dyYXBoaWMKPiBkZXZpY2Ugb3IgZm9yd2FyZCBBUERVcyB0byBhbiBlbWJlZGRlZCBz
bWFydGNhcmQgZGV2aWNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWFyY3VzIEZvbGtlc3NvbiA8bWFy
Y3VzLmZvbGtlc3NvbkBnbWFpbC5jb20+CgpJIHN0aWxsIGRvbid0IHNlZSB0aGUgYmVuZWZpdCBv
ZiBoYXZpbmcgdGhpcyBpbiB0aGUga2VybmVsIHdoZW4KZnVuY3Rpb25mcyB3b3VsZCBkbyBqdXN0
IGZpbmUuCg==

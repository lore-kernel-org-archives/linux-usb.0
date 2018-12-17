Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: gadget: u_serial: process RX in workqueue instead of tasklet
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87o99kzli9.fsf@linux.intel.com>
Date: Mon, 17 Dec 2018 08:59:42 +0200
To: =?utf-8?Q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+IHdyaXRlczoK
PiBTd2l0Y2ggUlggcHJvY2Vzc2luZyBmcm9tIHRhc2tsZXQgdG8gKGRlbGF5ZWQpIHdvcmsgcXVl
dWUuIFRoaXMgYWxsb3dzCj4gcmVjZWl2ZXIgbW9yZSByb29tIHRvIHByb2Nlc3MgaW5jb21pbmcg
ZGF0YSBhbmQgcHJldmVudHMgZmxvb2Qgb2YKPiAidHR5R1MwOiBSWCBub3Qgc2NoZWR1bGVkPyIg
bWVzc2FnZXMgb24gSFMgcmVjZWl2ZSBvbiBzbG93IENQVS4KPgo+IEEgc2lkZSBlZmZlY3QgaXMg
Mi40TUIvcyB6bW9kZW0gdHJhbnNmZXIgc3BlZWQgKHVwIGZyb20gMS44TUIvcykKPiBvbiBteSB0
ZXN0IGJvYXJkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGlu
dXhAcmVyZS5xbXFtLnBsPgoKaG93IGhhdmUgeW91IHRlc3RlZCB0aGlzPyBTcGVjaWFsbHksIGhv
dyBoYXZlIHlvdSBtZWFzdXJlZCB0aHJvdWdocHV0PyBJCndhbnQgdG8gdHJ5IGFuZCByZXByb2R1
Y2UgaXQgaGVyZS4K

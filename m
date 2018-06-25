Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: HID: usbhid: use irqsave() in USB's complete callback
From: Jiri Kosina <jikos@kernel.org>
Message-Id: <nycvar.YFH.7.76.1806251525220.6203@cbobk.fhfr.pm>
Date: Mon, 25 Jun 2018 15:25:42 +0200 (CEST)
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-input@vger.kernel.org, linux-usb@vger.kernel.org, tglx@linutronix.de, Benjamin Tissoires <benjamin.tissoires@redhat.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCAxOSBKdW4gMjAxOCwgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvciB3cm90ZToKCj4g
VGhlIFVTQiBjb21wbGV0aW9uIGNhbGxiYWNrIGRvZXMgbm90IGRpc2FibGUgaW50ZXJydXB0cyB3
aGlsZSBhY3F1aXJpbmcKPiB0aGUgLT5sb2NrLiBXZSB3YW50IHRvIHJlbW92ZSB0aGUgbG9jYWxf
aXJxX2Rpc2FibGUoKSBpbnZvY2F0aW9uIGZyb20KPiBfX3VzYl9oY2RfZ2l2ZWJhY2tfdXJiKCkg
YW5kIHRoZXJlZm9yZSBpdCBpcyByZXF1aXJlZCBmb3IgdGhlIGNhbGxiYWNrCj4gaGFuZGxlciB0
byBkaXNhYmxlIHRoZSBpbnRlcnJ1cHRzIHdoaWxlIGFjcXVpcmluZyB0aGUgbG9jay4KPiBUaGUg
Y2FsbGJhY2sgbWF5IGJlIGludm9rZWQgZWl0aGVyIGluIElSUSBvciBCSCBjb250ZXh0IGRlcGVu
ZGluZyBvbiB0aGUKPiBVU0IgaG9zdCBjb250cm9sbGVyLgo+IFVzZSB0aGUgX2lycXNhdmUoKSB2
YXJpYW50IG9mIHRoZSBsb2NraW5nIHByaW1pdGl2ZXMuCgpBcHBsaWVkLCB0aGFua3MuCg==

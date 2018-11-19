Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: hub: add I/O error retry & reset routine
From: Oliver Neukum <oneukum@suse.com>
Message-Id: <1542619239.2630.6.camel@suse.com>
Date: Mon, 19 Nov 2018 10:20:39 +0100
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, nsaaenzjulienne@suse.de, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRG8sIDIwMTgtMTEtMTUgYXQgMTg6MTQgKzAxMDAsIE5pY29sYXMgU2FlbnogSnVsaWVubmUg
d3JvdGU6CgpIaSwKCndoYXQgQWxhbiBzYWlkLCBpbiBhZGRpdGlvbiB5b3UgbmVlZCB0byBzdG9w
IHRoZSBlcnJvciBoYW5kbGluZwp3aGVuIHRoZSBkZXZpY2UgaXMgc3VzcGVuZGVkIG9yIHJlc2V0
LgogCj4gQEAgLTcxMyw4ICs3NTEsMTAgQEAgc3RhdGljIHZvaWQgaHViX2lycShzdHJ1Y3QgdXJi
ICp1cmIpCj4gIAkJcmV0dXJuOwo+ICAKPiAgCXN0YXR1cyA9IHVzYl9zdWJtaXRfdXJiKGh1Yi0+
dXJiLCBHRlBfQVRPTUlDKTsKPiAtCWlmIChzdGF0dXMgIT0gMCAmJiBzdGF0dXMgIT0gLUVOT0RF
ViAmJiBzdGF0dXMgIT0gLUVQRVJNKQo+ICsJaWYgKHN0YXR1cyAhPSAwICYmIHN0YXR1cyAhPSAt
RU5PREVWICYmIHN0YXR1cyAhPSAtRVBFUk0pIHsKClRoaXMgYWxzbyBuZWVkcyB0byBjaGVjayBm
b3IgLUVTSFVURE9XTgoKCVJlZ2FyZHMKCQlPbGl2ZXIK

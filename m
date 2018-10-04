Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] cdc-acm: do not reset notification buffer index upon urb unlinking
From: Oliver Neukum <oneukum@suse.com>
Message-Id: <1538659994.1254.3.camel@suse.com>
Date: Thu, 04 Oct 2018 15:33:14 +0200
To: Tobias Herzog <t-herzog@gmx.de>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gU2EsIDIwMTgtMDktMjIgYXQgMjI6MTEgKzAyMDAsIFRvYmlhcyBIZXJ6b2cgd3JvdGU6Cj4g
UmVzZXR0aW5nIHRoZSB3cml0ZSBpbmRleCBvZiB0aGUgbm90aWZpY2F0aW9uIGJ1ZmZlciBvbiB1
cmIgdW5saW5rIChlLmcuCj4gY2xvc2luZyBhIGNkYy1hY20gZGV2aWNlIGZyb20gdXNlcnNwYWNl
KSBtYXkgbGVhZCB0byB3cm9uZyBpbnRlcnByZXRhdGlvbgo+IG9mIGZ1cnRoZXIgcmVjZWl2ZWQg
bm90aWZpY2F0aW9ucywgaW4gY2FzZSB0aGUgaW5kZXggaXMgbm90IDAgd2hlbiB1cmIKPiB1bmxp
bmsgaGFwcGVucyAoaS5lLiB3aGVuIHBhcnRzIG9mIGEgbm90aWZpY2F0aW9uIGFscmVhZHkgaGF2
ZSBiZWVuCj4gdHJhbnNmZXJyZWQpLiBPbiB0aGUgZGV2aWNlIHNpZGUgdGhlcmUgaXMgbm8gInJl
c2V0IiBvZiB0aGUgbm90aWZpY2F0aW9uCj4gdHJhbnNpbWlzc2lvbiBhbmQgdGh1cyB3ZSB3b3Vs
ZCBnZXQgb3V0IG9mIHN5bmMgd2l0aCB0aGUgZGV2aWNlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRv
YmlhcyBIZXJ6b2cgPHQtaGVyem9nQGdteC5kZT4KQWNrZWQtYnk6IE9saXZlciBOZXVrdW0gPG9u
ZXVrdW1Ac3VzZS5jb20+Cg==

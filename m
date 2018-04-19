Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/2] usb: host: xhci-plat: Remove useless test before clk_disable_unprepare
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Message-Id: <20180419133053.11894-2-gregory.clement@bootlin.com>
Date: Thu, 19 Apr 2018 15:30:52 +0200
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Antoine Tenart <antoine.tenart@bootlin.com>, =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Shadi Ammouri <shadi@marvell.com>, Omri Itach <omrii@marvell.com>, Hanna Hawa <hannah@marvell.com>, Igal Liberman <igall@marvell.com>, Marcin Wojtas <mw@semihalf.com>
List-ID: <linux-usb.vger.kernel.org>

Y2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgYWxyZWFkeSBjaGVja3MgdGhhdCB0aGUgY2xvY2sgcG9p
bnRlciBpcyB2YWxpZC4KTm8gbmVlZCB0byB0ZXN0IGl0IGJlZm9yZSBjYWxsaW5nIGl0LgoKU2ln
bmVkLW9mZi1ieTogR3JlZ29yeSBDTEVNRU5UIDxncmVnb3J5LmNsZW1lbnRAYm9vdGxpbi5jb20+
Ci0tLQogZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jCmlu
ZGV4IGRmMzI3ZGNjMmJhYy4uZjAyMzFmZWE1MjRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcGxhdC5jCisrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMKQEAgLTMy
MCw4ICszMjAsNyBAQCBzdGF0aWMgaW50IHhoY2lfcGxhdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCXVzYl9wdXRfaGNkKHhoY2ktPnNoYXJlZF9oY2QpOwogCiBkaXNhYmxl
X2NsazoKLQlpZiAoIUlTX0VSUihjbGspKQotCQljbGtfZGlzYWJsZV91bnByZXBhcmUoY2xrKTsK
KwljbGtfZGlzYWJsZV91bnByZXBhcmUoY2xrKTsKIAogcHV0X2hjZDoKIAl1c2JfcHV0X2hjZCho
Y2QpOwpAQCAtMzQ3LDggKzM0Niw3IEBAIHN0YXRpYyBpbnQgeGhjaV9wbGF0X3JlbW92ZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCiAJdXNiX3JlbW92ZV9oY2QoaGNkKTsKIAl1c2JfcHV0
X2hjZCh4aGNpLT5zaGFyZWRfaGNkKTsKIAotCWlmICghSVNfRVJSKGNsaykpCi0JCWNsa19kaXNh
YmxlX3VucHJlcGFyZShjbGspOworCWNsa19kaXNhYmxlX3VucHJlcGFyZShjbGspOwogCXVzYl9w
dXRfaGNkKGhjZCk7CiAKIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoJmRldi0+ZGV2KTsK

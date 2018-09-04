Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [13/25] usb: xhci: dbc: Change return type to void
From: Jaejoong Kim <climbbb.kim@gmail.com>
Message-Id: <1536029091-4426-14-git-send-email-climbbb.kim@gmail.com>
Date: Tue,  4 Sep 2018 11:44:39 +0900
To: linux-um@lists.infradead.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, linux-s390@vger.kernel.org, devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, sparclinux@vger.kernel.org, linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
List-ID: <linux-usb.vger.kernel.org>

U2luY2UgdHR5X3BvcnRfaW5zdGFsbCgpIGFsd2F5cyByZXR1cm5zIDAsIHRoZSByZXR1cm4gdHlw
ZSBoYXMgY2hhbmdlZAp0byB2b2lkLiBOb3cgYXBwbHkgdGhpcyBhbmQgcmVtb3ZlIHRoZSBvYnNv
bGV0ZSBlcnJvciBjaGVjay4KClNpZ25lZC1vZmYtYnk6IEphZWpvb25nIEtpbSA8Y2xpbWJiYi5r
aW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1kYmd0dHkuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWRiZ3R0eS5jIGIvZHJpdmVycy91c2IvaG9zdC94
aGNpLWRiZ3R0eS5jCmluZGV4IGFmZjc5ZmYuLjE4ZDY2MWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1kYmd0dHkuYworKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGJndHR5
LmMKQEAgLTE3NCw4ICsxNzQsOSBAQCBzdGF0aWMgaW50IGRiY190dHlfaW5zdGFsbChzdHJ1Y3Qg
dHR5X2RyaXZlciAqZHJpdmVyLCBzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5KQogCXN0cnVjdCBkYmNf
cG9ydAkJKnBvcnQgPSBkcml2ZXItPmRyaXZlcl9zdGF0ZTsKIAogCXR0eS0+ZHJpdmVyX2RhdGEg
PSBwb3J0OworCXR0eV9wb3J0X2luc3RhbGwoJnBvcnQtPnBvcnQsIGRyaXZlciwgdHR5KTsKIAot
CXJldHVybiB0dHlfcG9ydF9pbnN0YWxsKCZwb3J0LT5wb3J0LCBkcml2ZXIsIHR0eSk7CisJcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgZGJjX3R0eV9vcGVuKHN0cnVjdCB0dHlfc3RydWN0ICp0
dHksIHN0cnVjdCBmaWxlICpmaWxlKQo=

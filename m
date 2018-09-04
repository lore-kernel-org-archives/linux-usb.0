Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [11/25] tty: synclinkmp: Change return type to void
From: Jaejoong Kim <climbbb.kim@gmail.com>
Message-Id: <1536029091-4426-12-git-send-email-climbbb.kim@gmail.com>
Date: Tue,  4 Sep 2018 11:44:37 +0900
To: linux-um@lists.infradead.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, linux-s390@vger.kernel.org, devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, sparclinux@vger.kernel.org, linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
List-ID: <linux-usb.vger.kernel.org>

U2luY2UgdHR5X3BvcnRfaW5zdGFsbCgpIGFsd2F5cyByZXR1cm5zIDAsIHRoZSByZXR1cm4gdHlw
ZSBoYXMgY2hhbmdlZAp0byB2b2lkLiBOb3cgYXBwbHkgdGhpcyBhbmQgcmVtb3ZlIHRoZSBvYnNv
bGV0ZSBlcnJvciBjaGVjay4KClNpZ25lZC1vZmYtYnk6IEphZWpvb25nIEtpbSA8Y2xpbWJiYi5r
aW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdHR5L3N5bmNsaW5rbXAuYyB8IDMgKystCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90dHkvc3luY2xpbmttcC5jIGIvZHJpdmVycy90dHkvc3luY2xpbmttcC5jCmluZGV4
IDFlNGQ1YjkuLjJkOTlhNWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3N5bmNsaW5rbXAuYwor
KysgYi9kcml2ZXJzL3R0eS9zeW5jbGlua21wLmMKQEAgLTczNCw4ICs3MzQsOSBAQCBzdGF0aWMg
aW50IGluc3RhbGwoc3RydWN0IHR0eV9kcml2ZXIgKmRyaXZlciwgc3RydWN0IHR0eV9zdHJ1Y3Qg
KnR0eSkKIAl9CiAKIAl0dHktPmRyaXZlcl9kYXRhID0gaW5mbzsKKwl0dHlfcG9ydF9pbnN0YWxs
KCZpbmZvLT5wb3J0LCBkcml2ZXIsIHR0eSk7CiAKLQlyZXR1cm4gdHR5X3BvcnRfaW5zdGFsbCgm
aW5mby0+cG9ydCwgZHJpdmVyLCB0dHkpOworCXJldHVybiAwOwogfQogCiAvKiBDYWxsZWQgd2hl
biBhIHBvcnQgaXMgb3BlbmVkLiAgSW5pdCBhbmQgZW5hYmxlIHBvcnQuCg==

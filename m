Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [10/25] tty: synclink: Change return type to void
From: Jaejoong Kim <climbbb.kim@gmail.com>
Message-Id: <1536029091-4426-11-git-send-email-climbbb.kim@gmail.com>
Date: Tue,  4 Sep 2018 11:44:36 +0900
To: linux-um@lists.infradead.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, linux-s390@vger.kernel.org, devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, sparclinux@vger.kernel.org, linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
List-ID: <linux-usb.vger.kernel.org>

U2luY2UgdHR5X3BvcnRfaW5zdGFsbCgpIGFsd2F5cyByZXR1cm5zIDAsIHRoZSByZXR1cm4gdHlw
ZSBoYXMgY2hhbmdlZAp0byB2b2lkLiBOb3cgYXBwbHkgdGhpcyBhbmQgcmVtb3ZlIHRoZSBvYnNv
bGV0ZSBlcnJvciBjaGVjay4KClNpZ25lZC1vZmYtYnk6IEphZWpvb25nIEtpbSA8Y2xpbWJiYi5r
aW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvdHR5L3N5bmNsaW5rLmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdHR5L3N5bmNsaW5rLmMgYi9kcml2ZXJzL3R0eS9zeW5jbGluay5jCmluZGV4IGZiZGY0
ZDAuLjZlN2U0ZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3N5bmNsaW5rLmMKKysrIGIvZHJp
dmVycy90dHkvc3luY2xpbmsuYwpAQCAtMzM1NSw4ICszMzU1LDkgQEAgc3RhdGljIGludCBtZ3Ns
X2luc3RhbGwoc3RydWN0IHR0eV9kcml2ZXIgKmRyaXZlciwgc3RydWN0IHR0eV9zdHJ1Y3QgKnR0
eSkKIAlpZiAobWdzbF9wYXJhbm9pYV9jaGVjayhpbmZvLCB0dHktPm5hbWUsICJtZ3NsX29wZW4i
KSkKIAkJcmV0dXJuIC1FTk9ERVY7CiAJdHR5LT5kcml2ZXJfZGF0YSA9IGluZm87CisJdHR5X3Bv
cnRfaW5zdGFsbCgmaW5mby0+cG9ydCwgZHJpdmVyLCB0dHkpOwogCi0JcmV0dXJuIHR0eV9wb3J0
X2luc3RhbGwoJmluZm8tPnBvcnQsIGRyaXZlciwgdHR5KTsKKwlyZXR1cm4gMDsKIH0KIAogLyog
bWdzbF9vcGVuKCkK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [04/25] s390: char: tty3270: Change return type to void
From: Jaejoong Kim <climbbb.kim@gmail.com>
Message-Id: <1536029091-4426-5-git-send-email-climbbb.kim@gmail.com>
Date: Tue,  4 Sep 2018 11:44:30 +0900
To: linux-um@lists.infradead.org, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, linux-s390@vger.kernel.org, devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, sparclinux@vger.kernel.org, linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
List-ID: <linux-usb.vger.kernel.org>

U2luY2UgdHR5X3BvcnRfaW5zdGFsbCgpIGFsd2F5cyByZXR1cm5zIDAsIHRoZSByZXR1cm4gdHlw
ZSBoYXMgY2hhbmdlZAp0byB2b2lkLiBOb3cgYXBwbHkgdGhpcyBhbmQgcmVtb3ZlIHRoZSBvYnNv
bGV0ZSBlcnJvciBjaGVjay4KClNpZ25lZC1vZmYtYnk6IEphZWpvb25nIEtpbSA8Y2xpbWJiYi5r
aW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvczM5MC9jaGFyL3R0eTMyNzAuYyB8IDcgKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvczM5MC9jaGFyL3R0eTMyNzAuYyBiL2RyaXZlcnMvczM5MC9jaGFyL3R0
eTMyNzAuYwppbmRleCA1YjhhZjI3Li4yOTE1Zjk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3MzOTAv
Y2hhci90dHkzMjcwLmMKKysrIGIvZHJpdmVycy9zMzkwL2NoYXIvdHR5MzI3MC5jCkBAIC0xMDE3
LDEyICsxMDE3LDcgQEAgc3RhdGljIGludCB0dHkzMjcwX2luc3RhbGwoc3RydWN0IHR0eV9kcml2
ZXIgKmRyaXZlciwgc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSkKIAlyYXczMjcwX2FjdGl2YXRlX3Zp
ZXcoJnRwLT52aWV3KTsKIAogcG9ydF9pbnN0YWxsOgotCXJjID0gdHR5X3BvcnRfaW5zdGFsbCgm
dHAtPnBvcnQsIGRyaXZlciwgdHR5KTsKLQlpZiAocmMpIHsKLQkJcmF3MzI3MF9wdXRfdmlldygm
dHAtPnZpZXcpOwotCQlyZXR1cm4gcmM7Ci0JfQotCisJdHR5X3BvcnRfaW5zdGFsbCgmdHAtPnBv
cnQsIGRyaXZlciwgdHR5KTsKIAl0dHktPmRyaXZlcl9kYXRhID0gdHA7CiAKIAlyZXR1cm4gMDsK

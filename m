Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/4] usb: Remove stack VLA usage
From: "Tobin C. Harding" <me@tobin.cc>
Message-Id: <1520574935-7457-1-git-send-email-me@tobin.cc>
Date: Fri,  9 Mar 2018 16:55:35 +1100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Tobin C. Harding" <me@tobin.cc>, kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>, Kees Cook <keescook@chromium.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>
List-ID: <linux-usb.vger.kernel.org>

U2lnbmVkLW9mZi1ieTogVG9iaW4gQy4gSGFyZGluZyA8bWVAdG9iaW4uY2M+Ci0tLQogZHJpdmVy
cy91c2IvbWlzYy91c2J0ZXN0LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbWlzYy91c2J0
ZXN0LmMgYi9kcml2ZXJzL3VzYi9taXNjL3VzYnRlc3QuYwppbmRleCA5MDAyOGVmNTQxZTMuLjll
MTE0MmI4YjkxYiAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvbWlzYy91c2J0ZXN0LmMKKysrIGIv
ZHJpdmVycy91c2IvbWlzYy91c2J0ZXN0LmMKQEAgLTIwMjgsMTEgKzIwMjgsMTQgQEAgdGVzdF9x
dWV1ZShzdHJ1Y3QgdXNidGVzdF9kZXYgKmRldiwgc3RydWN0IHVzYnRlc3RfcGFyYW1fMzIgKnBh
cmFtLAogCXVuc2lnbmVkCQlpOwogCXVuc2lnbmVkIGxvbmcJCXBhY2tldHMgPSAwOwogCWludAkJ
CXN0YXR1cyA9IDA7Ci0Jc3RydWN0IHVyYgkJKnVyYnNbcGFyYW0tPnNnbGVuXTsKKwlzdHJ1Y3Qg
dXJiCQkqdXJic1tNQVhfU0dMRU5dOwogCiAJaWYgKCFwYXJhbS0+c2dsZW4gfHwgcGFyYW0tPml0
ZXJhdGlvbnMgPiBVSU5UX01BWCAvIHBhcmFtLT5zZ2xlbikKIAkJcmV0dXJuIC1FSU5WQUw7CiAK
KwlpZiAocGFyYW0tPnNnbGVuID4gTUFYX1NHTEVOKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCW1l
bXNldCgmY29udGV4dCwgMCwgc2l6ZW9mKGNvbnRleHQpKTsKIAljb250ZXh0LmNvdW50ID0gcGFy
YW0tPml0ZXJhdGlvbnMgKiBwYXJhbS0+c2dsZW47CiAJY29udGV4dC5kZXYgPSBkZXY7Cg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-Id: <659939f3-da51-0cfd-2eb2-8a726cb1a42f@users.sourceforge.net>
Date: Wed, 6 Dec 2017 17:13:25 +0100
To: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBXZWQsIDYgRGVjIDIwMTcgMTc6MDA6MTggKzAxMDAKCk9taXQgYW4gZXh0cmEgbWVzc2FnZSBm
b3IgYSBtZW1vcnkgYWxsb2NhdGlvbiBmYWlsdXJlIGluIHRoaXMgZnVuY3Rpb24uCgpUaGlzIGlz
c3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBzb2Z0d2FyZS4KClNpZ25l
ZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4K
LS0tCiBkcml2ZXJzL3VzYi9jb3JlL2h1Yi5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMgYi9kcml2ZXJzL3Vz
Yi9jb3JlL2h1Yi5jCmluZGV4IDdjY2RkM2Q0ZGI4NC4uOWZiYjkwOGU5NTUyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3VzYi9jb3JlL2h1Yi5jCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMKQEAg
LTgyOSw3ICs4MjksNiBAQCBpbnQgdXNiX2h1Yl9jbGVhcl90dF9idWZmZXIoc3RydWN0IHVyYiAq
dXJiKQogCSAqLwogCWNsZWFyID0ga21hbGxvYyhzaXplb2YgKmNsZWFyLCBHRlBfQVRPTUlDKTsK
IAlpZiAoY2xlYXIgPT0gTlVMTCkgewotCQlkZXZfZXJyKCZ1ZGV2LT5kZXYsICJjYW4ndCBzYXZl
IENMRUFSX1RUX0JVRkZFUiBzdGF0ZVxuIik7CiAJCS8qIEZJWE1FIHJlY292ZXIgc29tZWhvdyAu
Li4gUkVTRVRfVFQ/ICovCiAJCXJldHVybiAtRU5PTUVNOwogCX0K

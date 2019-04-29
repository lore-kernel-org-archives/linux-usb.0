Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/5] USB: serial: fix unthrottle races
From: Oliver Neukum <oneukum@suse.com>
Message-Id: <1556531458.20085.8.camel@suse.com>
Date: Mon, 29 Apr 2019 11:50:58 +0200
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRG8sIDIwMTktMDQtMjUgYXQgMTg6MDUgKzAyMDAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPiBA
QCAtNDg0LDYgKzUwMywxMiBAQCB2b2lkIHVzYl9zZXJpYWxfZ2VuZXJpY191bnRocm90dGxlKHN0
cnVjdCB0dHlfc3RydWN0ICp0dHkpCj4gICAgICAgICBwb3J0LT50aHJvdHRsZWQgPSBwb3J0LT50
aHJvdHRsZV9yZXEgPSAwOwo+ICAgICAgICAgc3Bpbl91bmxvY2tfaXJxKCZwb3J0LT5sb2NrKTsK
PiAgCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogTWF0Y2hlcyB0aGUgc21wX21iX19hZnRlcl9h
dG9taWMoKSBpbgo+ICsgICAgICAgICogdXNiX3NlcmlhbF9nZW5lcmljX3JlYWRfYnVsa19jYWxs
YmFjaygpLgo+ICsgICAgICAgICovCj4gKyAgICAgICBzbXBfbWIoKTsKPiArCj4gICAgICAgICBp
ZiAod2FzX3Rocm90dGxlZCkKPiAgICAgICAgICAgICAgICAgdXNiX3NlcmlhbF9nZW5lcmljX3N1
Ym1pdF9yZWFkX3VyYnMocG9ydCwgR0ZQX0tFUk5FTCk7CgoKRG9lc24ndCB0aGUgc3Bpbl91bmxv
Y2tfaXJxKCkgaW1wbHkgc21wX21iKCk/Ck90aGVyd2lzZSBpdCBsb29rcyBjb3JyZWN0IHRvIG1l
LgoKCVJlZ2FyZHMKCQlPbGl2ZXIK

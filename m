Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] usb: gadget: r8a66597: Fix two possible sleep-in-atomic-context bugs in init_controller()
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87bmbtetdk.fsf@linux.intel.com>
Date: Fri, 29 Jun 2018 14:15:19 +0300
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, gregkh@linuxfoundation.org, nicolas.ferre@microchip.com, keescook@chromium.org, allen.lkml@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGksCgpSb2JlcnQgSmFyem1payA8cm9iZXJ0LmphcnptaWtAZnJlZS5mcj4gd3JpdGVzOgo+Pj4g
QW5kIGFzIGJvbnVzIHF1ZXN0aW9uLCB3aHkgaXMgaXQgYmV0dGVyIHRvIGhhdmUgbWRlbGF5KCkg
Y2FsbHMgaW4gdGhlIGRyaXZlciA/Cj4+Cj4+IEFzIGEgYnVnZml4LCBpdCdzIHRoZSBzbWFsbGVz
dCBmaXggcG9zc2libGUsIHJpZ2h0PyBJZGVhbGx5LCB3ZSB3b3VsZG4ndAo+PiBuZWVkIGVpdGhl
ciBvZiB0aGVtLiBQZXJoYXBzIHRoZXJlJ3MgYSBiaXQgd2hpY2ggY2FuIGJlIHBvbGxlZCBpbnN0
ZWFkPwo+IElkZWFsbHkgeWVzLiBEbyB5b3UgcmVtZW1iZXIgaWYgYSAidGhyZWFkZWQgaW50ZXJy
dXB0IiBtaWdodCB1c2UgbXNsZWVwKCkgPyBJCj4gc2VlbSB0byByZW1lbWJlciB0aGF0IHRoZXkg
Y2FuLCBzbyB3b24ndCB0aGF0IGJlIGFub3RoZXIgYWx0ZXJuYXRpdmUgPwoKeWVhaCwgdW5sZXNz
LCBvZiBjb3Vyc2UsIHlvdSBoYXZlIGEgc3BpbmxvY2sgaGVsZC4gOy0pCg==

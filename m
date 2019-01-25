Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: musb: Fix potential NULL dereference
From: Bin Liu <b-liu@ti.com>
Message-Id: <20190125164412.GJ18982@uda0271908>
Date: Fri, 25 Jan 2019 10:44:12 -0600
To: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMDk6NDc6MDJQTSArMDMwMCwgTWF0d2V5IFYuIEtvcm5p
bG92IHdyb3RlOgo+IEJ5IHRoZSB3YXksIHdoeSBkbyB3ZSBuZWVkIHRvIHN0b3JlIHRoZSBxaCBp
biB1cmItPmhjcHJpdj8KPiBxaCBjYW4gYWx3YXlzIGJlIGFjY2Vzc2libGUgdGhyb3VnaCB1cmIt
PmVwLT5oY3ByaXYKPiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gZHJvcCBlbnRpcmUgdXJiLT5o
Y3ByaXYgdXNhZ2U/CgpJIGFtIG5vdCBzdXJlIHdoeS4gVGhlIGNvZGUgaXMgdGhlcmUgc2luY2Ug
dGhlIGZpcnN0IGNvbW1pdCBpbiBhIGRlY2FkZQphZ28uIEJ1dCBJIHRlbmQgdG8gYWdyZWUgd2l0
aCB5b3UuCgpJbiBhIHF1aWNrIHNlYXJjaCBmb3IgdXJiLT5oY3ByaXYgYW5kIHVyYi0+ZXAtPmhj
cHJpdiwgYmFzZWQgb24gdGhlCnVzYWdlIGluIGNvcmUvaGNkLmMsIGl0IHNlZW1zIHRvIG1lIHRo
YXQgdXJiLT5oY3ByaXYgc2hvdWxkIG5vdCBiZQpjaGFuZ2VkIGluIGVhY2ggY29udHJvbGxlciBk
cml2ZXIsIGJ1dCBJIHNlZSBib3RoIGhhdmUgYmVlbiB1c2VkIGluIG1vc3QKY29udHJvbGxlciBk
cml2ZXJzLiBJIHdpbGwgbGVhdmUgdGhpcyB0byBvdGhlcnMgdG8gZWR1Y2F0ZSBtZS4KClJlZ2Fy
ZHMsCi1CaW4uCg==

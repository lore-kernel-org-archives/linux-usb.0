Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4.9] usbip: prevent vhci_hcd driver from leaking a socket pointer address
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180124090343.GC30613@kroah.com>
Date: Wed, 24 Jan 2018 10:03:43 +0100
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMDc6MzA6MDZQTSAtMDcwMCwgU2h1YWggS2hhbiB3cm90
ZToKPiBjb21taXQgMmYyZDAwODhlYjkzICgidXNiaXA6IHByZXZlbnQgdmhjaV9oY2QgZHJpdmVy
IGZyb20gbGVha2luZyBhCj4gc29ja2V0IHBvaW50ZXIgYWRkcmVzcyIpCgpOb3cgcXVldWVkIHVw
IGZvciA0LjQgYW5kIDQuOSwgdGhhbmtzLgoKZ3JlZyBrLWgKLS0tClRvIHVuc3Vic2NyaWJlIGZy
b20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRo
ZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFq
b3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRt
bAo=

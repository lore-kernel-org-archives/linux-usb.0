Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v6] USB: serial: ftdi_sio: implement GPIO support for FT-X devices
From: Johan Hovold <johan@kernel.org>
Message-Id: <20180925120825.GF3332@localhost>
Date: Tue, 25 Sep 2018 14:08:25 +0200
To: Karoly Pados <pados@pados.hu>
Cc: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBTZXAgMjUsIDIwMTggYXQgMTE6MTE6MDNBTSArMDAwMCwgS2Fyb2x5IFBhZG9zIHdy
b3RlOgo+ID4+ICsgaWYgKHByaXYtPmdwaW9fb3V0cHV0ICYgQklUKGdwaW8pKQo+ID4+ICsgcmV0
dXJuIDA7Cj4gPj4gKyBlbHNlCj4gPj4gKyByZXR1cm4gMTsKPiA+PiAKPiA+PiBUaGlzIGNvdWxk
IGp1c3Qgc2ltcGxpZmllZCB1c2luZyBuZWdhdGlvbiAoISksIGJ1dCBwZXJoYXBzIHRoaXMgaXMK
PiA+PiBlYXNpZXIgdG8gcGFyc2UgYXMgaXQgc3RhbmRzLgo+ID4+IAo+ID4+IFNvcnJ5LCBpdCBp
cyBub3QgY2xlYXIgd2hhdCB5b3VyIHByZWZlcnJlZCBhY3Rpb24gaGVyZSBpcy4KPiA+PiBTbyBz
aG91bGQgSSBsZWF2ZSBpdCBhcyBpcyB0aGVuIG9yIG5vdD8KPiA+IAo+ID4gSnVzdCBkbwo+ID4g
Cj4gPiByZXMgPSAhKHByaXYtPmdwaW9fb3V0cHV0ICYgQklUKGdwaW8pKTsKPiA+IAo+IAo+IExv
Y2tpbmcgaGVyZT8gcHJpdi0+Z3Bpb19vdXRwdXQgaXMgYSB1OCwgdGhlcmUgaXMgbm8gd2F5IGl0
IGNhbiBiZSBwYXJ0aWFsbHkKPiB3cml0dGVuLiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nIGVs
c2U/CgpObywgeW91J3JlIHJpZ2h0LCBubyBsb2NraW5nIGlzIG5lZWRlZC4KCkpvaGFuCg==

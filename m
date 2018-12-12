Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/2] usb:cdns3 Add Cadence USB3 DRD Driver
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <871s6nm9db.fsf@linux.intel.com>
Date: Wed, 12 Dec 2018 10:34:24 +0200
To: Peter Chen <peter.chen@nxp.com>, Peter Chen <hzpeterchen@gmail.com>, "pawell@cadence.com" <pawell@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, lkml <linux-kernel@vger.kernel.org>, "adouglas@cadence.com" <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, "sureshp@cadence.com" <sureshp@cadence.com>, "pjez@cadence.com" <pjez@cadence.com>, "kurahul@cadence.com" <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

UGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAuY29tPiB3cml0ZXM6Cj4+ID4+ID4+ICsgICAgaXJx
cmV0dXJuX3QgcmV0ID0gSVJRX05PTkU7Cj4+ID4+ID4+ICsgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsKPj4gPj4gPj4gKyAgICB1MzIgcmVnOwo+PiA+PiA+PiArCj4+ID4+ID4+ICsgICAgcHJpdl9k
ZXYgPSBjZG5zLT5nYWRnZXRfZGV2Owo+PiA+PiA+PiArICAgIHNwaW5fbG9ja19pcnFzYXZlKCZw
cml2X2Rldi0+bG9jaywgZmxhZ3MpOwo+PiA+PiA+Cj4+ID4+ID55b3UncmUgYWxyZWFkeSBydW5u
aW5nIGluIGhhcmRpcnEgY29udGV4dC4gV2h5IGRvIHlvdSBuZWVkIHRoaXMgbG9jawo+PiA+PiA+
YXQgYWxsPyBJIHdvdWxkIGJlIGJldHRlciB0byB1c2UgdGhlIGhhcmRpcnEgaGFuZGxlciB0byBt
YXNrIHlvdXIKPj4gPj4gPmludGVycnVwdHMsIHNvIHRoZXkgZG9uJ3QgZmlyZSBhZ2FpbiwgdGhl
biB1c2VkIHRoZSB0b3AtaGFsZgo+PiA+PiA+KHNvZnRpcnEpIGhhbmRsZXIgdG8gYWN0dWFsbHkg
aGFuZGxlIHRoZSBpbnRlcnJ1cHRzLgo+PiA+Pgo+PiA+Cj4+ID4gVGhpcyBjb250cm9sbGVyIG1h
eSBiZSByYW4gYXQgU01QIGVudmlyb25tZW50LCByZWdpc3RlciBhbmQgZmxhZwo+PiA+IGFjY2Vz
cyBuZWVkcyB0byBiZSBwcm90ZWN0ZWQgYW1vbmcgQ1BVcyBydW5uaW5nLgo+PiAKPj4gaW4gaGFy
ZGlycSBjb250ZXh0PyBXaGVuIGludGVycnVwdHMgYXJlIGFscmVhZHkgZGlzYWJsZWQ/Cj4KPiBJ
bnRlcnJ1cHQgaGFuZGxlciAoaGFyZGlycSBjb250ZXh0KSBhdCBDUFUwLCBhbmQgcHJvY2VzcyBh
dCBDUFUxLCBlZwo+IHJvbGUgc3dpdGNoLCB1bmxvYWQgbW9kdWxlLCBldGMuCgp0aGUgcHJvY2Vz
cyBhdCBDUFUxIHdvdWxkIG5lZWQgdG8gZGlzYWJsZSBpbnRlcnJ1cHRzIChzcGluX2xvY2tfaXJx
KCkgb3IKc3Bpbl9sb2NrX2lycXNhdmUoKSksIG5vdCB0aGUgaGFyZGlycSBvbiBDUFUwIGFzIHRo
YXQgYWxyZWFkeSBydW5zIHdpdGgKaW50ZXJycnVwdHMgZGlzYWJsZWQuCgpodHRwczovL3d3dy5r
ZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9rZXJuZWwtaGFja2luZy9sb2NraW5nLmh0bWwjdGFi
bGUtb2YtbWluaW11bS1yZXF1aXJlbWVudHMK

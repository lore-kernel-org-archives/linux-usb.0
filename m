Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5] usb: gadget: udc: renesas_usb3: Add register of usb role switch
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <TY2PR01MB2297E86466DEA9A16246D752D86D0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
Date: Tue, 29 May 2018 02:52:27 +0000
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgSGVpa2tpLAoKPiBGcm9tOiBIZWlra2kgS3JvZ2VydXMsIFNlbnQ6IE1vbmRheSwgTWF5IDI4
LCAyMDE4IDEwOjA1IFBNCj4gCj4gT24gRnJpLCBNYXkgMjUsIDIwMTggYXQgMDQ6MTI6NTZQTSAr
MDkwMCwgWW9zaGloaXJvIFNoaW1vZGEgd3JvdGU6Cj4gPiBAQCAtMjU3Myw2ICsyNjM1LDEyIEBA
IHN0YXRpYyB2b2lkIHJlbmVzYXNfdXNiM19pbml0X3JhbShzdHJ1Y3QgcmVuZXNhc191c2IzICp1
c2IzLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiAgCUVYVENPTl9OT05FLAo+ID4gIH07Cj4gPgo+
ID4gK3N0YXRpYyBzdHJ1Y3QgdXNiX3JvbGVfc3dpdGNoX2Rlc2MgcmVuZXNhc191c2IzX3JvbGVf
c3dpdGNoX2Rlc2MgPSB7Cj4gCj4gWW91IGNhbiBjb25zdGlmeSB0aGF0LgoKVGhhbmsgeW91IGZv
ciB0aGUgcmV2aWV3ISBJJ2xsIG1vZGlmeSB0aGlzIGluIHY2IHBhdGNoLgoKQmVzdCByZWdhcmRz
LApZb3NoaWhpcm8gU2hpbW9kYQoKPiA+ICsJLnNldCA9IHJlbmVzYXNfdXNiM19yb2xlX3N3aXRj
aF9zZXQsCj4gPiArCS5nZXQgPSByZW5lc2FzX3VzYjNfcm9sZV9zd2l0Y2hfZ2V0LAo+ID4gKwku
YWxsb3dfdXNlcnNwYWNlX2NvbnRyb2wgPSB0cnVlLAo+ID4gK307Cj4gPiArCj4gPiAgc3RhdGlj
IGludCByZW5lc2FzX3VzYjNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+
ICB7Cj4gPiAgCXN0cnVjdCByZW5lc2FzX3VzYjMgKnVzYjM7Cj4gCj4gVGhhbmtzLAo+IAo+IC0t
Cj4gaGVpa2tpCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGlu
ZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFq
b3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdl
ci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

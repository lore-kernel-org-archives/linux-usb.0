Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,3/3] usb: dwc2: Make dwc2_readl/writel functions endianness-agnostic.
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <878t5xytta.fsf@linux.intel.com>
Date: Fri, 27 Jul 2018 11:19:29 +0300
To: Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>, Andy Shevchenko <andy.shevchenko@gmail.com>Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, USB <linux-usb@vger.kernel.org>, John Youn <John.Youn@synopsys.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpHZXZvcmcgU2FoYWt5YW4gPEdldm9yZy5TYWhha3lhbkBzeW5vcHN5cy5jb20+IHdyaXRl
czoKPiBAQCAtMTE2NCwxMiArMTE2NiwyMSBAQCBzdHJ1Y3QgZHdjMl9oc290ZyB7Cj4gIC8qIE5v
cm1hbCBhcmNoaXRlY3R1cmVzIGp1c3QgdXNlIHJlYWRsL3dyaXRlICovCj4gIHN0YXRpYyBpbmxp
bmUgdTMyIGR3YzJfcmVhZGwoc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnLCB1MzIgb2Zmc2V0KQo+
ICB7Cj4gLSAgICAgICByZXR1cm4gcmVhZGwoaHNvdGctPnJlZ3MgKyBvZmZzZXQpOwo+ICsgICAg
ICAgdTMyIHZhbDsKPiArCj4gKyAgICAgICB2YWwgPSByZWFkbChoc290Zy0+cmVncyArIG9mZnNl
dCk7Cj4gKyAgICAgICBpZiAoaHNvdGctPm5lZWRzX2J5dGVfc3dhcCkKPiArICAgICAgICAgICAg
ICAgcmV0dXJuIHN3YWIzMih2YWwpOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gdmFsOwo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSB2b2lkIGR3YzJfd3JpdGVsKHN0cnVj
dCBkd2MyX2hzb3RnICpoc290ZywgdTMyIHZhbHVlLCB1MzIKPiBvZmZzZXQpCgpwYXRjaCBpcyBt
YW5nbGVkIDooCg==

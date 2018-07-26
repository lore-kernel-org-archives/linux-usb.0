Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,3/3] usb: dwc2: Make dwc2_readl/writel functions endianness-agnostic.
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75VduFBBnD6uL6H=MqzM3yc4tP5sHBNGE0Ps8qHaSc35cpA@mail.gmail.com>
Date: Thu, 26 Jul 2018 18:29:47 +0300
To: Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, USB <linux-usb@vger.kernel.org>, John Youn <John.Youn@synopsys.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBKdWwgMjYsIDIwMTggYXQgNTowMSBQTSwgR2V2b3JnIFNhaGFreWFuCjxHZXZvcmcu
U2FoYWt5YW5Ac3lub3BzeXMuY29tPiB3cm90ZToKPiBEZWNsYXJlZCBkd2MyX2NoZWNrX2NvcmVf
ZW5kaWFubmVzcygpIGZ1bmN0aW9uIGZvciBkeW5hbWljbHkgY2hlY2sKPiBjb3JlIGVuZGlhbm5l
c3MuCj4gQWRkZWQgbmVlZHNfYnl0ZV9zd2FwIGZsYWcgdG8gaHNvdGcgc3RydWN0dXJlLCBhbmQg
ZGVwZW5kaW5nIG9uCj4gZmxhZyBzd2FwIHZhbHVlIGluc2lkZSBkd2MyX3JlYWRsL3dyaXRlbCBm
dW5jdGlvbnMuCgo+ICsjZGVmaW5lIHN3YXAzMih4KSAoXAo+ICsgICAgICAge3R5cGVvZih4KSB4
XyA9ICh4KTsgXAo+ICsgICAgICAgKCgodTMyKSh4XykgPDwgMjQpICYgKHUzMikweEZGMDAwMDAw
KSB8IFwKPiArICAgICAgICgoKHUzMikoeF8pIDw8ICA4KSAmICh1MzIpMHgwMEZGMDAwMCkgfCBc
Cj4gKyAgICAgICAoKCh1MzIpKHhfKSA+PiAgOCkgJiAodTMyKTB4MDAwMEZGMDApIHwgXAo+ICsg
ICAgICAgKCgodTMyKSh4XykgPj4gMjQpICYgKHUzMikweDAwMDAwMEZGKTsgfSkKCldoYXQncyB3
cm9uZyB3aXRoIHN3YWIzMigpID8K

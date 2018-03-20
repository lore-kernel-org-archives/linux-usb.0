Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v8,01/12] drivers: base: Unified device connection lookup
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180320125240.GA25137@kuha.fi.intel.com>
Date: Tue, 20 Mar 2018 14:52:40 +0200
To: Hans de Goede <hdegoede@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDE6MjE6NTdQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBPbiAyMC0wMy0xOCAxMTozMiwgSGVpa2tpIEtyb2dlcnVzIHdyb3RlOgo+ID4gT24g
VHVlLCBNYXIgMjAsIDIwMTggYXQgMTI6MDQ6MTJQTSArMDIwMCwgSGVpa2tpIEtyb2dlcnVzIHdy
b3RlOgo+ID4gPiA+ID4gK3ZvaWQgZGV2aWNlX2Nvbm5lY3Rpb25fcmVtb3ZlKHN0cnVjdCBkZXZp
Y2VfY29ubmVjdGlvbiAqY29uKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsJbXV0ZXhfbG9jaygm
ZGV2Y29uX2xvY2spOwo+ID4gPiA+ID4gKwlsaXN0X2RlbF9yY3UoJmNvbi0+bGlzdCk7Cj4gPiA+
ID4gCj4gPiA+ID4gU2VlLCByY3U/Cj4gPiA+IAo+ID4gPiBUcnVlLiBJJ2xsIHNlbmQgb25lIG1v
cmUgdmVyc2lvbi4KPiA+IAo+ID4gQmVmb3JlIEkgZG8gdGhhdCwgSGFucywgY2FuIHlvdSBxdWlj
a2x5IGNoZWNrIHRoaXMgYW5kIHNlZSB0aGF0IEkKPiA+IGhhdmUgbm90IG1hZGUgYW55IG1vcmUg
bWlzdGFrZXM/IEkgZG9uJ3QgdHJ1c3QgbXlzZWxmIGFueW1vcmUgd2l0aAo+ID4gdGhlc2UuCj4g
Cj4gVGhpcyBsb29rcyBnb29kIHRvIG1lIChub3RlIEkgZGlkIG5vdCB0ZXN0IG9ubHkgcmV2aWV3
ZWQpLgoKVGhhbmtzLiBJJ2xsIHNlbmQgdjkuCgpCciwK

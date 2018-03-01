Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,08/12] xhci: Add Intel extended cap / otg phy mux handling
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180301072343.GB5335@kuha.fi.intel.com>
Date: Thu, 1 Mar 2018 09:23:43 +0200
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDQ6NDI6MzJQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiAyOC0wMi0xOCAxNjoxNSwgSGVpa2tpIEtyb2dlcnVzIHdyb3Rl
Ogo+ID4gT24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDQ6MDc6NDVQTSArMDEwMCwgSGFucyBkZSBH
b2VkZSB3cm90ZToKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oIGIv
ZHJpdmVycy91c2IvaG9zdC94aGNpLmgKPiA+ID4gaW5kZXggOTYwOTlhMjQ1YzY5Li41OTE3ZTMw
OTVlMmEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oCj4gPiA+ICsr
KyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oCj4gPiA+IEBAIC0xODI1LDYgKzE4MjUsNyBAQCBz
dHJ1Y3QgeGhjaV9oY2Qgewo+ID4gPiAgIC8qIFJlc2VydmVkLiBJdCB3YXMgWEhDSV9VMl9ESVNB
QkxFX1dBS0UgKi8KPiA+ID4gICAjZGVmaW5lIFhIQ0lfQVNNRURJQV9NT0RJRllfRkxPV0NPTlRS
T0wJKDEgPDwgMjgpCj4gPiA+ICAgI2RlZmluZSBYSENJX0hXX0xQTV9ESVNBQkxFCSgxIDw8IDI5
KQo+ID4gPiArI2RlZmluZSBYSENJX0lOVEVMX1VTQl9ST0xFX1NXCSgxIDw8IDMwKQo+ID4gCj4g
PiBEaWQgeW91IHJlYmFzZWQgdGhlc2Ugb24gdG9wZSBvZiB0aGUgbGF0ZXN0IHVzYi1uZXh0Pwo+
IAo+IE5vIEkgZGlkIG5vdCBleHBlY3QgdGhhdCB0byBiZSBuZWNlc3NhcnksIGJ1dCBJIHNlZSBu
b3cgdGhhdCBpdCBpcy4KPiBJJ3ZlIGp1c3QgZG9uZSBhIHJlYmFzZSBsb2NhbGx5LCBhbnkgb3Ro
ZXIgcmVtYXJrcyBiZWZvcmUgSSBzZW5kCj4gb3V0IGEgdjY/CgpOb3RoaW5nIGZyb20gbWUuCgoK
VGhhbmtzLAo=

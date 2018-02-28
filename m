Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,08/12] xhci: Add Intel extended cap / otg phy mux handling
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180228151552.GA5335@kuha.fi.intel.com>
Date: Wed, 28 Feb 2018 17:15:52 +0200
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDQ6MDc6NDVQTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmggYi9kcml2ZXJzL3Vz
Yi9ob3N0L3hoY2kuaAo+IGluZGV4IDk2MDk5YTI0NWM2OS4uNTkxN2UzMDk1ZTJhIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oCj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94
aGNpLmgKPiBAQCAtMTgyNSw2ICsxODI1LDcgQEAgc3RydWN0IHhoY2lfaGNkIHsKPiAgLyogUmVz
ZXJ2ZWQuIEl0IHdhcyBYSENJX1UyX0RJU0FCTEVfV0FLRSAqLwo+ICAjZGVmaW5lIFhIQ0lfQVNN
RURJQV9NT0RJRllfRkxPV0NPTlRST0wJKDEgPDwgMjgpCj4gICNkZWZpbmUgWEhDSV9IV19MUE1f
RElTQUJMRQkoMSA8PCAyOSkKPiArI2RlZmluZSBYSENJX0lOVEVMX1VTQl9ST0xFX1NXCSgxIDw8
IDMwKQoKRGlkIHlvdSByZWJhc2VkIHRoZXNlIG9uIHRvcGUgb2YgdGhlIGxhdGVzdCB1c2ItbmV4
dD8gVGhpcyBkb2VzIG5vdAphcHBseSBjbGVhbmx5IG9uIHRvcCBvZiBsaW51eC1uZXh0LgoKClRo
YW5rcywK

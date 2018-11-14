Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,1/5] drivercore: Revert "deferral race condition fix"
From: Mark Brown <broonie@kernel.org>
Message-Id: <20181114003345.GV2089@sirena.org.uk>
Date: Tue, 13 Nov 2018 16:33:45 -0800
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Roger Quadros <rogerq@ti.com>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDY6MTE6MjZQTSArMDIwMCwgUGV0ZXIgVWpmYWx1c2kg
d3JvdGU6Cgo+IGlmIHdlIHJldmVydCB0aGUgY29tbWl0IHRoZW4gdGhlIG9yaWdpbmFsIGlzc3Vl
IHdpbGwgcmUtc3VyZmFjZXMuIGFmYWlrCj4gaXQgd2FzIG5vdCBvbmx5IGF1ZGlvIHdoaWNoIGhp
dCB0aGUgJ2xhc3QgZHJpdmVyIHRvIGJlIHByb2JlZCBmcm9tIHRoZQo+IGRlZmVycmVkIGxpc3Qg
d291bGQgbmV2ZXIgcHJvYmUsIHVubGVzcyB3ZSBwcm92b2tlIHRoZSBrZXJuZWwgdG8gbG9hZAo+
IGFkZGl0aW9uYWwgbW9kdWxlLCBvciByZW1vdmUvcmVsb2FkIHRoZSBtb2R1bGUnIGlzc3VlLgoK
UmlnaHQsIGFyZW4ndCB3ZSBqdXN0IGdvaW5nIHRvIGJlIHN3YXBwaW5nIG9uZSBidWcgZm9yIGFu
b3RoZXI/Cgo+IERvIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHkgdGhhdCBpbiB5b3VyIGNhc2UgeW91
IGhhdmUgdHdvIG1vZHVsZXMKPiAoZHdjMy1wY2kgYW5kIGV4dGNvbi1pbnRlbC1tcmZsZCkgaW4g
YSBkZWZlcnJlZCBwcm9iZSBsb29wLCBpb3cgYm90aCBvZgo+IHRoZSBkcml2ZXJzIHJldHVybnMg
LUVQUk9CRV9ERUZFUiBhbmQgdGhleSBqdXN0IHNwaW4/Cgo+IElmIGJvdGggaXMgZGVmZXJyaW5n
LCBob3cgdGhpcyBzdXBwb3NlZCB0byB3b3JrPwoKSSdtIHN0cnVnZ2xpbmcgdG8gZm9sbG93IHRo
ZSBvcmlnaW5hbCBleHBsYW5hdGlvbiB0b28gOigK

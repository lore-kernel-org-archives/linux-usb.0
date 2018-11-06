Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V3,6/6] usb: host: Add ability to build new Broadcom STB USB drivers
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a2Xuq77sXKy4QX1YhStOEhm+oAM_AErEGuwqB115pHB_w@mail.gmail.com>
Date: Tue, 6 Nov 2018 19:22:44 +0100
To: Alan Cooper <alcooperx@gmail.com>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, chunfeng yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMTEvNi8xOCwgQWxhbiBDb29wZXIgPGFsY29vcGVyeEBnbWFpbC5jb20+IHdyb3RlOgo+IE9u
IFR1ZSwgTm92IDYsIDIwMTggYXQgNjowOSBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
PiB3cm90ZToKPj4KPj4gT24gMTEvNS8xOCwgQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21haWwuY29t
PiB3cm90ZToKPj4KPj4gPiArCj4+ID4gK2NvbmZpZyBVU0JfQlJDTQo+PiA+ICsgICAgIHRyaXN0
YXRlICJCcm9hZGNvbSBTVEIgVVNCIHN1cHBvcnQiCj4+ID4gKyAgICAgZGVwZW5kcyBvbiBBUkNI
X0JSQ01TVEIKPj4gPiArICAgICBzZWxlY3QgVVNCX09IQ0lfSENEX1BMQVRGT1JNIGlmIFVTQl9P
SENJX0hDRAo+PiA+ICsgICAgIHNlbGVjdCBVU0JfRUhDSV9CUkNNIGlmIFVTQl9FSENJX0hDRAo+
PiA+ICsgICAgIHNlbGVjdCBVU0JfWEhDSV9CUkNNIGlmIFVTQl9YSENJX0hDRAo+PiA+ICsgICAg
IHNlbGVjdCBVU0JfWEhDSV9QTEFURk9STSBpZiBVU0JfWEhDSV9IQ0QKPj4gPiArICAgICBzZWxl
Y3QgQlJDTV9VU0JfUEhZIGlmIFVTQl9PSENJX0hDRCB8fCBVU0JfRUhDSV9IQ0QgfHwKPj4gPiBV
U0JfWEhDSV9IQ0QKPj4gPiArICAgICBzZWxlY3QgR0VORVJJQ19QSFkgaWYgQlJDTV9VU0JfUEhZ
Cj4+ID4gKyAgICAgZGVmYXVsdCBBUkNIX0JSQ01TVEIKPj4KPj4gSXMgdGhlcmUgYSBidWlsZCB0
aW1lIGRlcGVuZGVuY3kgb24gdGhlIFBIWSBsYXllcj8gSWYgbm90LCBJIHdvdWxkCj4+IHN1Z2dl
c3QKPj4gZHJvcHBpbmcgdGhlIGxhc3QgdHdvICdzZWxlY3QnIHN0YXRlbWVudHMuIEkgd291bGQg
YWxzbyBzdWdnZXN0Cj4+IG1ha2luZyB0aGUgZGVwZW5kZW5jeSAnZGVwZW5kcyBvbiBBUkNIX0JS
Q01TVEIgfHwgQ09NUElMRV9URVNUJwo+PiB0byBhbGxvdyBidWlsZGluZyBpdCBvbiBvdGhlciBh
cmNoaXRlY3R1cmUgZm9yIGJldHRlciBidWlsZCB0ZXN0aW5nLCBhbmQKPj4gZHJvcHBpbmcgdGhl
ICdkZWZhdWx0JyBsaW5lLiBKdXN0IGFkZCB0aGlzIHRvIHRoZSBkZWZjb25maWcgbGlrZSB0aGUK
Pj4gb3RoZXIKPj4gZHJpdmVycyB5b3UgaGF2ZS4KPgo+IEkgYWRkZWQgQ09NUElMRV9URVNUIGFu
ZCBkcm9wcGVkIHRoZSBsYXN0IDIgc2VsZWN0IGxpbmVzLgo+IE1vc3Qgb2Ygb3VyIG90aGVyIGRy
aXZlcnMgZGVmYXVsdCB0byAieSIgZm9yICJBUkNIX0JSQ01TVEIiLCB3b3VsZCBpdAo+IGJlIGJl
dHRlciBpZiBJIGNoYW5nZWQgaXQgdG8gImRlZmF1bHQgeSI/CgpObywgImRlZmF1bHQgQVJDSF9C
UkNNU1RCIiBpcyBiZXR0ZXIgdGhhbiAiZGVmYXVsdCB5IiwgYnV0IEknZCByZWNvbW1lbmQKdG8g
anVzdCBub3QgaGF2ZSBub24tZXNzZW50aWFsIGRyaXZlcnMgZGVmYXVsdC1vbi4KCiAgICAgIEFy
bmQK

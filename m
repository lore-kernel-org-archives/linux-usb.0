Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V3,6/6] usb: host: Add ability to build new Broadcom STB USB drivers
From: Alan Cooper <alcooperx@gmail.com>
Message-Id: <CAOGqxeX1FckLz7XEm-doh_AHUjvRtn00yZfir6dRNMYNOMY5_g@mail.gmail.com>
Date: Tue, 6 Nov 2018 10:55:31 -0500
To: Arnd Bergmann <arnd@arndb.de>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, chunfeng yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBOb3YgNiwgMjAxOCBhdCA2OjA5IEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gT24gMTEvNS8xOCwgQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21haWwuY29t
PiB3cm90ZToKPgo+ID4gKwo+ID4gK2NvbmZpZyBVU0JfQlJDTQo+ID4gKyAgICAgdHJpc3RhdGUg
IkJyb2FkY29tIFNUQiBVU0Igc3VwcG9ydCIKPiA+ICsgICAgIGRlcGVuZHMgb24gQVJDSF9CUkNN
U1RCCj4gPiArICAgICBzZWxlY3QgVVNCX09IQ0lfSENEX1BMQVRGT1JNIGlmIFVTQl9PSENJX0hD
RAo+ID4gKyAgICAgc2VsZWN0IFVTQl9FSENJX0JSQ00gaWYgVVNCX0VIQ0lfSENECj4gPiArICAg
ICBzZWxlY3QgVVNCX1hIQ0lfQlJDTSBpZiBVU0JfWEhDSV9IQ0QKPiA+ICsgICAgIHNlbGVjdCBV
U0JfWEhDSV9QTEFURk9STSBpZiBVU0JfWEhDSV9IQ0QKPiA+ICsgICAgIHNlbGVjdCBCUkNNX1VT
Ql9QSFkgaWYgVVNCX09IQ0lfSENEIHx8IFVTQl9FSENJX0hDRCB8fCBVU0JfWEhDSV9IQ0QKPiA+
ICsgICAgIHNlbGVjdCBHRU5FUklDX1BIWSBpZiBCUkNNX1VTQl9QSFkKPiA+ICsgICAgIGRlZmF1
bHQgQVJDSF9CUkNNU1RCCj4KPiBJcyB0aGVyZSBhIGJ1aWxkIHRpbWUgZGVwZW5kZW5jeSBvbiB0
aGUgUEhZIGxheWVyPyBJZiBub3QsIEkgd291bGQgc3VnZ2VzdAo+IGRyb3BwaW5nIHRoZSBsYXN0
IHR3byAnc2VsZWN0JyBzdGF0ZW1lbnRzLiBJIHdvdWxkIGFsc28gc3VnZ2VzdAo+IG1ha2luZyB0
aGUgZGVwZW5kZW5jeSAnZGVwZW5kcyBvbiBBUkNIX0JSQ01TVEIgfHwgQ09NUElMRV9URVNUJwo+
IHRvIGFsbG93IGJ1aWxkaW5nIGl0IG9uIG90aGVyIGFyY2hpdGVjdHVyZSBmb3IgYmV0dGVyIGJ1
aWxkIHRlc3RpbmcsIGFuZAo+IGRyb3BwaW5nIHRoZSAnZGVmYXVsdCcgbGluZS4gSnVzdCBhZGQg
dGhpcyB0byB0aGUgZGVmY29uZmlnIGxpa2UgdGhlIG90aGVyCj4gZHJpdmVycyB5b3UgaGF2ZS4K
CkkgYWRkZWQgQ09NUElMRV9URVNUIGFuZCBkcm9wcGVkIHRoZSBsYXN0IDIgc2VsZWN0IGxpbmVz
LgpNb3N0IG9mIG91ciBvdGhlciBkcml2ZXJzIGRlZmF1bHQgdG8gInkiIGZvciAiQVJDSF9CUkNN
U1RCIiwgd291bGQgaXQKYmUgYmV0dGVyIGlmIEkgY2hhbmdlZCBpdCB0byAiZGVmYXVsdCB5Ij8K
ClRoYW5rcwpBbAoKPgo+ICAgICAgIEFybmQK

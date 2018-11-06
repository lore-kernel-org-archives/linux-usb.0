Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V3,6/6] usb: host: Add ability to build new Broadcom STB USB drivers
From: Alan Cooper <alcooperx@gmail.com>
Message-Id: <CAOGqxeVC0atR0neerxLNDbHWgpuXYCVUW0YLhHxvQzDO0CHWZw@mail.gmail.com>
Date: Tue, 6 Nov 2018 14:33:04 -0500
To: Arnd Bergmann <arnd@arndb.de>
Cc: ": Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, chunfeng yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBOb3YgNiwgMjAxOCBhdCAxOjIyIFBNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+IHdyb3RlOgo+Cj4gT24gMTEvNi8xOCwgQWxhbiBDb29wZXIgPGFsY29vcGVyeEBnbWFpbC5j
b20+IHdyb3RlOgo+ID4gT24gVHVlLCBOb3YgNiwgMjAxOCBhdCA2OjA5IEFNIEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTEvNS8xOCwgQWwgQ29vcGVy
IDxhbGNvb3BlcnhAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+ID4gKwo+ID4+ID4gK2NvbmZp
ZyBVU0JfQlJDTQo+ID4+ID4gKyAgICAgdHJpc3RhdGUgIkJyb2FkY29tIFNUQiBVU0Igc3VwcG9y
dCIKPiA+PiA+ICsgICAgIGRlcGVuZHMgb24gQVJDSF9CUkNNU1RCCj4gPj4gPiArICAgICBzZWxl
Y3QgVVNCX09IQ0lfSENEX1BMQVRGT1JNIGlmIFVTQl9PSENJX0hDRAo+ID4+ID4gKyAgICAgc2Vs
ZWN0IFVTQl9FSENJX0JSQ00gaWYgVVNCX0VIQ0lfSENECj4gPj4gPiArICAgICBzZWxlY3QgVVNC
X1hIQ0lfQlJDTSBpZiBVU0JfWEhDSV9IQ0QKPiA+PiA+ICsgICAgIHNlbGVjdCBVU0JfWEhDSV9Q
TEFURk9STSBpZiBVU0JfWEhDSV9IQ0QKPiA+PiA+ICsgICAgIHNlbGVjdCBCUkNNX1VTQl9QSFkg
aWYgVVNCX09IQ0lfSENEIHx8IFVTQl9FSENJX0hDRCB8fAo+ID4+ID4gVVNCX1hIQ0lfSENECj4g
Pj4gPiArICAgICBzZWxlY3QgR0VORVJJQ19QSFkgaWYgQlJDTV9VU0JfUEhZCj4gPj4gPiArICAg
ICBkZWZhdWx0IEFSQ0hfQlJDTVNUQgo+ID4+Cj4gPj4gSXMgdGhlcmUgYSBidWlsZCB0aW1lIGRl
cGVuZGVuY3kgb24gdGhlIFBIWSBsYXllcj8gSWYgbm90LCBJIHdvdWxkCj4gPj4gc3VnZ2VzdAo+
ID4+IGRyb3BwaW5nIHRoZSBsYXN0IHR3byAnc2VsZWN0JyBzdGF0ZW1lbnRzLiBJIHdvdWxkIGFs
c28gc3VnZ2VzdAo+ID4+IG1ha2luZyB0aGUgZGVwZW5kZW5jeSAnZGVwZW5kcyBvbiBBUkNIX0JS
Q01TVEIgfHwgQ09NUElMRV9URVNUJwo+ID4+IHRvIGFsbG93IGJ1aWxkaW5nIGl0IG9uIG90aGVy
IGFyY2hpdGVjdHVyZSBmb3IgYmV0dGVyIGJ1aWxkIHRlc3RpbmcsIGFuZAo+ID4+IGRyb3BwaW5n
IHRoZSAnZGVmYXVsdCcgbGluZS4gSnVzdCBhZGQgdGhpcyB0byB0aGUgZGVmY29uZmlnIGxpa2Ug
dGhlCj4gPj4gb3RoZXIKPiA+PiBkcml2ZXJzIHlvdSBoYXZlLgo+ID4KPiA+IEkgYWRkZWQgQ09N
UElMRV9URVNUIGFuZCBkcm9wcGVkIHRoZSBsYXN0IDIgc2VsZWN0IGxpbmVzLgo+ID4gTW9zdCBv
ZiBvdXIgb3RoZXIgZHJpdmVycyBkZWZhdWx0IHRvICJ5IiBmb3IgIkFSQ0hfQlJDTVNUQiIsIHdv
dWxkIGl0Cj4gPiBiZSBiZXR0ZXIgaWYgSSBjaGFuZ2VkIGl0IHRvICJkZWZhdWx0IHkiPwo+Cj4g
Tm8sICJkZWZhdWx0IEFSQ0hfQlJDTVNUQiIgaXMgYmV0dGVyIHRoYW4gImRlZmF1bHQgeSIsIGJ1
dCBJJ2QgcmVjb21tZW5kCj4gdG8ganVzdCBub3QgaGF2ZSBub24tZXNzZW50aWFsIGRyaXZlcnMg
ZGVmYXVsdC1vbi4KPgo+ICAgICAgIEFybmQKCk9rYXkuCgpUaGFua3MKQWwK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V3,6/6] usb: host: Add ability to build new Broadcom STB USB drivers
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a0AoHuaiPsMTqhWm3a4X95NpPTPUHkt9vS9Z2ow8NobhA@mail.gmail.com>
Date: Tue, 6 Nov 2018 12:09:47 +0100
To: Al Cooper <alcooperx@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMTEvNS8xOCwgQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21haWwuY29tPiB3cm90ZToKCj4gKwo+
ICtjb25maWcgVVNCX0JSQ00KPiArCXRyaXN0YXRlICJCcm9hZGNvbSBTVEIgVVNCIHN1cHBvcnQi
Cj4gKwlkZXBlbmRzIG9uIEFSQ0hfQlJDTVNUQgo+ICsJc2VsZWN0IFVTQl9PSENJX0hDRF9QTEFU
Rk9STSBpZiBVU0JfT0hDSV9IQ0QKPiArCXNlbGVjdCBVU0JfRUhDSV9CUkNNIGlmIFVTQl9FSENJ
X0hDRAo+ICsJc2VsZWN0IFVTQl9YSENJX0JSQ00gaWYgVVNCX1hIQ0lfSENECj4gKwlzZWxlY3Qg
VVNCX1hIQ0lfUExBVEZPUk0gaWYgVVNCX1hIQ0lfSENECj4gKwlzZWxlY3QgQlJDTV9VU0JfUEhZ
IGlmIFVTQl9PSENJX0hDRCB8fCBVU0JfRUhDSV9IQ0QgfHwgVVNCX1hIQ0lfSENECj4gKwlzZWxl
Y3QgR0VORVJJQ19QSFkgaWYgQlJDTV9VU0JfUEhZCj4gKwlkZWZhdWx0IEFSQ0hfQlJDTVNUQgoK
SXMgdGhlcmUgYSBidWlsZCB0aW1lIGRlcGVuZGVuY3kgb24gdGhlIFBIWSBsYXllcj8gSWYgbm90
LCBJIHdvdWxkIHN1Z2dlc3QKZHJvcHBpbmcgdGhlIGxhc3QgdHdvICdzZWxlY3QnIHN0YXRlbWVu
dHMuIEkgd291bGQgYWxzbyBzdWdnZXN0Cm1ha2luZyB0aGUgZGVwZW5kZW5jeSAnZGVwZW5kcyBv
biBBUkNIX0JSQ01TVEIgfHwgQ09NUElMRV9URVNUJwp0byBhbGxvdyBidWlsZGluZyBpdCBvbiBv
dGhlciBhcmNoaXRlY3R1cmUgZm9yIGJldHRlciBidWlsZCB0ZXN0aW5nLCBhbmQKZHJvcHBpbmcg
dGhlICdkZWZhdWx0JyBsaW5lLiBKdXN0IGFkZCB0aGlzIHRvIHRoZSBkZWZjb25maWcgbGlrZSB0
aGUgb3RoZXIKZHJpdmVycyB5b3UgaGF2ZS4KCiAgICAgIEFybmQK

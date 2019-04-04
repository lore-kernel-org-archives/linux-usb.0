Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,5/6] usb: roles: add USB Type-B GPIO connector driver
From: Linus Walleij <linus.walleij@linaro.org>
Message-Id: <CACRpkdatNdzZ+97pZNBudyPNVtQDLKU_o31MSe=T7kJzWtaWUg@mail.gmail.com>
Date: Thu, 4 Apr 2019 23:35:27 +0700
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, Alan Stern <stern@rowland.harvard.edu>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBBcHIgMywgMjAxOSBhdCA5OjA5IEFNIENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVu
QG1lZGlhdGVrLmNvbT4gd3JvdGU6Cgo+IER1ZSB0byB0aGUgcmVxdWlyZW1lbnQgb2YgdXNiLWNv
bm5lY3Rvci50eHQgYmluZGluZywgdGhlIG9sZCB3YXkKPiB1c2luZyBleHRjb24gdG8gc3VwcG9y
dCBVU0IgRHVhbC1Sb2xlIHN3aXRjaCBpcyBub3cgZGVwcmVjYXRlZAo+IHdoZW4gdXNlIFR5cGUt
QiBjb25uZWN0b3IuCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgZHJpdmVyIG9mIFR5cGUtQiBj
b25uZWN0b3Igd2hpY2ggdHlwaWNhbGx5Cj4gdXNlcyBhbiBpbnB1dCBHUElPIHRvIGRldGVjdCBV
U0IgSUQgcGluLCBhbmQgdHJ5IHRvIHJlcGxhY2UgdGhlCj4gZnVuY3Rpb24gcHJvdmlkZWQgYnkg
ZXh0Y29uLXVzYi1ncGlvIGRyaXZlcgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxj
aHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgooLi4uKQo+ICsjaW5jbHVkZSA8bGludXgvZ3Bpby5o
PgoKSWYgeW91IG5lZWQgdGhpcyBpbmNsdWRlIGluIGEgY29uc3VtZXIsIHNvbWV0aGluZyBpcyB3
cm9uZy4gSnVzdCBkZWxldGUgaXQsCgo+ICsgICAgICAgaW5mby0+aWRfZ3Bpb2QgPSBkZXZtX2dw
aW9kX2dldF9mcm9tX29mX25vZGUoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
ZXYsIGNoaWxkLCAiaWQtZ3Bpb3MiLCAwLCBHUElPRF9JTiwgImlkcGluIik7CgpUaGlzIGlzIE9L
IGlmIHRoZSBjaGlsZCBkb2VzIG5vdCBoYXZlIGFueSBMaW51eCBkZXZpY2UgKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UKZXRjKSBjcmVhdGVkIGZyb20gaXQuIElzIHRoaXMgdGhlIGNhc2U/CgpZb3Vy
cywKTGludXMgV2FsbGVpago=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/5] usb: host: Add XHCI driver for Broadcom STB SoCs
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Message-Id: <87a7o3scsq.fsf@linux.intel.com>
Date: Thu, 27 Sep 2018 08:57:09 +0300
To: Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jianguo Sun <sunjianguo1@huawei.com>, James Hogan <jhogan@kernel.org>, Alban Bedel <albeu@free.fr>, Lu Baolu <baolu.lu@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Alex Elder <elder@linaro.org>, Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-ID: <linux-usb.vger.kernel.org>

SGksCgpBbCBDb29wZXIgPGFsY29vcGVyeEBnbWFpbC5jb20+IHdyaXRlczoKCj4gVGhpcyBkcml2
ZXIgZW5hYmxlcyBVU0IgWEhDSSBvbiBCcm9hZGNvbSBBUk0gU1RCIFNvQ3MuCj4gVGhlIGRyaXZl
cnMgZGVwZW5kIG9uIGEgbWF0Y2hpbmcgImJyY20sYnJjbXN0Yi11c2ItcGh5Igo+IEJyb2FkY29t
IFNUQiBVU0IgUGh5IGRyaXZlci4KPgo+IFRoZSBzdGFuZGFyZCBwbGF0Zm9ybSBkcml2ZXIgY2Fu
J3QgYmUgdXNlZCBiZWNhdXNlIG9mIGRpZmZlcmVuY2VzCj4gaW4gUEhZIGFuZCBDbG9jayBoYW5k
bGluZy4gVGhlIHN0YW5kYXJkIFBIWSBoYW5kbGluZyBpbiBoY2QuYyB3aWxsCj4gZG8gYSBwaHlf
ZXhpdC9waHlfaW5pdCBvbiBzdXNwZW5kL3Jlc3VtZSBhbmQgdGhpcyB3aWxsIGVuZCB1cAo+IHNo
dXR0aW5nIGRvd24gdGhlIFBIWXMgdG8gdGhlIHBvaW50IHRoYXQgdGhlIGhvc3QgY29udHJvbGxl
cgo+IHJlZ2lzdGVycyBhcmUgbm8gbG9uZ2VyIGFjY2Vzc2libGUgYW5kIHdpbGwgY2F1c2Ugc3Vz
cGVuZCB0byBjcmFzaC4KPiBUaGUgY2xvY2tzIHNwZWNpZmllZCBpbiBkZXZpY2UgdHJlZSBmb3Ig
dGhlc2UgZHJpdmVycyBhcmUgbm90Cj4gYXZhaWxhYmxlIGluIG1haW5saW5lIHNvIGluc3RlYWQg
b2YgcmV0dXJuaW5nIEVQUk9CRV9ERUZFUiB3aGVuCj4gdGhlIHNwZWNpZmllZCBjbG9jayBpcyBu
b3QgZm91bmQgYW5kIGV2ZW50dWFsbHkgZmFpbGluZyBwcm9iZSwKPiB0aGUgY2xvY2sgcG9pbnRl
ciBpcyBzZXQgdG8gTlVMTCB3aGljaCBkaXNhYmxlcyBhbGwgY2xvY2sgaGFuZGxpbmcuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBBbCBDb29wZXIgPGFsY29vcGVyeEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvdXNiL2hvc3QveGhjaS1icmNtLmMgfCAyOTQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwoKdGhpcyBsb29rcyBhIGxvdCBsaWtlIHhoY2ktcGxhdC5jLCB3
aHkgZG9uJ3QgeW91IHVzZSB0aGF0IGluc3RlYWQ/CgotIApiYWxiaQo=

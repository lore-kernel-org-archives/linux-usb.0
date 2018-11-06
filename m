Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V3,4/6] usb: ohci-platform: Add support for Broadcom STB SoC's
From: Alan Stern <stern@rowland.harvard.edu>
Message-Id: <Pine.LNX.4.44L0.1811061105120.1450-100000@iolanthe.rowland.org>
Date: Tue, 6 Nov 2018 11:08:52 -0500 (EST)
To: Al Cooper <alcooperx@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCA1IE5vdiAyMDE4LCBBbCBDb29wZXIgd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciBC
cm9hZGNvbSBTVEIgU29DJ3MgdG8gdGhlIG9oY2kgcGxhdGZvcm0gZHJpdmVyLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFsIENvb3BlciA8YWxjb29wZXJ4QGdtYWlsLmNvbT4KPiAtLS0KCj4gQEAgLTE3
Nyw2ICsxODksOCBAQCBzdGF0aWMgaW50IG9oY2lfcGxhdGZvcm1fcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqZGV2KQo+ICAJCW9oY2ktPmZsYWdzIHw9IE9IQ0lfUVVJUktfRlJBTUVfTk87
Cj4gIAlpZiAocGRhdGEtPm51bV9wb3J0cykKPiAgCQlvaGNpLT5udW1fcG9ydHMgPSBwZGF0YS0+
bnVtX3BvcnRzOwo+ICsJaWYgKHBkYXRhLT5zdXNwZW5kX3dpdGhvdXRfcGh5X2V4aXQpCj4gKwkJ
aGNkLT5zdXNwZW5kX3dpdGhvdXRfcGh5X2V4aXQgPSAxOwoKU29ycnkgaWYgSSBtaXNzZWQgdGhp
cyBpbiB0aGUgZWFybGllciBkaXNjdXNzaW9ucy4uLiAgSXMgdGhlcmUgYW55IApwb3NzaWJpbGl0
eSBvZiBhZGRpbmcgYSBEVCBiaW5kaW5nIHRoYXQgY291bGQgZXhwcmVzcyB0aGlzIHJlcXVpcmVt
ZW50LCAKaW5zdGVhZCBvZiBwdXR0aW5nIGl0IGluIHRoZSBwbGF0Zm9ybSBkYXRhPwoKQWxhbiBT
dGVybgo=

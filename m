Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2,5/6] usb: ehci: Add new EHCI driver for Broadcom STB SoC's
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a2v_6T5pkAUR0erFgCN6C4S2zUqq4EEa5nNo+gYdJ+0qw@mail.gmail.com>
Date: Wed, 24 Oct 2018 08:14:40 +0100
To: Al Cooper <alcooperx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, David Miller <davem@davemloft.net>, DTML <devicetree@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>, gregkh <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, sunjianguo1@huawei.com, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, USB list <linux-usb@vger.kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, rishabhb@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBPY3QgMTcsIDIwMTggYXQgMTE6MzAgUE0gQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21h
aWwuY29tPiB3cm90ZToKCj4gKwo+ICtzdGF0aWMgaW50IGVoY2lfYnJjbV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgdXNiX2hjZCAqaGNk
Owo+ICsgICAgICAgc3RydWN0IHJlc291cmNlICpyZXNfbWVtOwo+ICsgICAgICAgc3RydWN0IGJy
Y21fcHJpdiAqcHJpdjsKPiArICAgICAgIGludCBpcnE7Cj4gKyAgICAgICBpbnQgZXJyOwo+ICsK
PiArICAgICAgIGlmICh1c2JfZGlzYWJsZWQoKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7Cj4gKwo+ICsgICAgICAgZXJyID0gZG1hX2NvZXJjZV9tYXNrX2FuZF9jb2hlcmVudCgm
cGRldi0+ZGV2LCBETUFfQklUX01BU0soMzIpKTsKPiArICAgICAgIGlmIChlcnIpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBlcnI7CgpZb3Ugc2hvdWxkIG5ldmVyIHVzZSAiZG1hX2NvZXJjZV9t
YXNrX2FuZF9jb2hlcmVudCIgaW4gbmV3IGNvZGUuIE1ha2Ugc3VyZSB0aGF0CnRoZSBEVCBpcyBj
b3JyZWN0IGFuZCBjYWxsIGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoKSBpbnN0ZWFkLgoKPiAr
I2lmZGVmIENPTkZJR19PRgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBicmNt
X2VoY2lfb2ZfbWF0Y2hbXSA9IHsKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAiYnJjbSxiY203
NDQ1LWVoY2kiLCB9LAo+ICsgICAgICAge30KPiArfTsKPiArCj4gK01PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIGJyY21fZWhjaV9vZl9tYXRjaCk7Cj4gKyNlbmRpZiAvKiBDT05GSUdfT0YgKi8KPiAr
Cj4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGVoY2lfYnJjbV9kcml2ZXIgPSB7Cj4g
KyAgICAgICAucHJvYmUgICAgICAgICAgPSBlaGNpX2JyY21fcHJvYmUsCj4gKyAgICAgICAucmVt
b3ZlICAgICAgICAgPSBlaGNpX2JyY21fcmVtb3ZlLAo+ICsgICAgICAgLnNodXRkb3duICAgICAg
ID0gdXNiX2hjZF9wbGF0Zm9ybV9zaHV0ZG93biwKPiArICAgICAgIC5kcml2ZXIgICAgICAgICA9
IHsKPiArICAgICAgICAgICAgICAgLm93bmVyICA9IFRISVNfTU9EVUxFLAo+ICsgICAgICAgICAg
ICAgICAubmFtZSAgID0gImVoY2ktYnJjbSIsCj4gKyAgICAgICAgICAgICAgIC5wbSAgICAgPSAm
ZWhjaV9icmNtX3BtX29wcywKPiArICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2Zf
bWF0Y2hfcHRyKGJyY21fZWhjaV9vZl9tYXRjaCksCj4gKyAgICAgICB9Cj4gK307CgpZb3Ugd29u
J3QgZXZlciB1c2UgdGhpcyBkcml2ZXIgd2l0aG91dCBDT05GSUdfT0YsIHNvIGp1c3QgcmVtb3Zl
IHRoZSAjaWZkZWYgYW5kCm9mX21hdGNoX3B0cigpIHdyYXBwZXIgaGVyZS4gSXQgd2lsbCBzdGls
bCBidWlsZCBmaW5lIHdpdGhvdXQgQ09ORklHX09GLgoKICAgICAgQXJuZAo=

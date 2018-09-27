Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/5] usb: host: Add OHCI driver for Broadcom STB SoCs
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a0rN=E7vnK3Ri8srXBDT7cdsVj-n=G6VGBROc0o8vrcpw@mail.gmail.com>
Date: Thu, 27 Sep 2018 11:08:39 +0200
To: Al Cooper <alcooperx@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, David Miller <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Dmitry Osipenko <digetx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, sunjianguo1@huawei.com, James Hogan <jhogan@kernel.org>, Alban Bedel <albeu@free.fr>, Lu Baolu <baolu.lu@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Alex Elder <elder@linaro.org>, Hans de Goede <hdegoede@redhat.com>, USB list <linux-usb@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTI6MjAgQU0gQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21h
aWwuY29tPiB3cm90ZToKPgo+IFRoaXMgZHJpdmVyIGVuYWJsZXMgVVNCIE9IQ0kgb24gQnJvYWRj
b20gQVJNIGFuZCBNSVBTIFNUQiBTb0NzLgo+IFRoZSBkcml2ZXJzIGRlcGVuZCBvbiBhIG1hdGNo
aW5nICJicmNtLGJyY21zdGItdXNiLXBoeSIKPiBCcm9hZGNvbSBTVEIgVVNCIFBoeSBkcml2ZXIu
Cj4KPiBUaGUgc3RhbmRhcmQgcGxhdGZvcm0gZHJpdmVyIGNhbid0IGJlIHVzZWQgYmVjYXVzZSBv
ZiBkaWZmZXJlbmNlcwo+IGluIFBIWSBhbmQgQ2xvY2sgaGFuZGxpbmcuIFRoZSBzdGFuZGFyZCBQ
SFkgaGFuZGxpbmcgaW4gaGNkLmMgd2lsbAo+IGRvIGEgcGh5X2V4aXQvcGh5X2luaXQgb24gc3Vz
cGVuZC9yZXN1bWUgYW5kIHRoaXMgd2lsbCBlbmQgdXAKPiBzaHV0dGluZyBkb3duIHRoZSBQSFlz
IHRvIHRoZSBwb2ludCB0aGF0IHRoZSBob3N0IGNvbnRyb2xsZXIKPiByZWdpc3RlcnMgYXJlIG5v
IGxvbmdlciBhY2Nlc3NpYmxlIGFuZCB3aWxsIGNhdXNlIHN1c3BlbmQgdG8gY3Jhc2guCj4gVGhl
IGNsb2NrcyBzcGVjaWZpZWQgaW4gZGV2aWNlIHRyZWUgZm9yIHRoZXNlIGRyaXZlcnMgYXJlIG5v
dAo+IGF2YWlsYWJsZSBpbiBtYWlubGluZSBzbyBpbnN0ZWFkIG9mIHJldHVybmluZyBFUFJPQkVf
REVGRVIgd2hlbgo+IHRoZSBzcGVjaWZpZWQgY2xvY2sgaXMgbm90IGZvdW5kIGFuZCBldmVudHVh
bGx5IGZhaWxpbmcgcHJvYmUsCj4gdGhlIGNsb2NrIHBvaW50ZXIgaXMgc2V0IHRvIE5VTEwgd2hp
Y2ggZGlzYWJsZXMgYWxsIGNsb2NrIGhhbmRsaW5nLgoKQm90aCBvZiB0aGVzZSBzb3VuZCBsaWtl
IGZhaXJseSBtaW5vciBkaWZmZXJlbmNlcywgSSB3b25kZXIgaWYgdGhlCmdlbmVyaWMgY29kZSBj
b3VsZCBiZSBhZGFwdGVkIHRvIGhhdmUgYSBzcGVjaWFsIGNhc2UgZm9yIHRoZXNlCnJhdGhlciB0
aGFuIGR1cGxpY2F0aW5nIGl0LgoKICAgICAgICBBcm5kCg==

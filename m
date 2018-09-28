Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: dwc2: Fix HiKey regression caused by power_down feature
From: John Stultz <john.stultz@linaro.org>
Message-Id: <CALAqxLU01RGdmGfdNHUfXu1TCbwGDV6R0PtY_Ef5DvLyLCxb5A@mail.gmail.com>
Date: Fri, 28 Sep 2018 11:32:34 -0700
To: Artur Petrosyan <arthur.petrosyan@synopsys.com>
Cc: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, lkml <linux-kernel@vger.kernel.org>, John Youn <John.Youn@synopsys.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgNTozMyBBTSwgQXJ0dXIgUGV0cm9zeWFuCjxhcnRodXIu
cGV0cm9zeWFuQHN5bm9wc3lzLmNvbT4gd3JvdGU6Cj4gV2Ugd291bGQgbGlrZSB0byBidXkgdGhl
IEhpS2V5IGJvYXJkIHRvIHBlcmZvcm0gdGVzdGVzLgo+IFdlIGZvdW5kIHRoaXMgSGlLZXkgTGVN
YWtlciB0byBoYXZlIFVTQiAyLjAgcG9ydHMKPiBodHRwczovL3d3dy5lYmF5LmNvbS9pdG0vSGlL
ZXktTGVNYWtlci12ZXJzaW9uLTJHQi1LaXJpbi02MjAtU29DLTgtY29yZS1BUk0tQ29ydGV4LUE1
My1DUFUtQVJNLU1hbGktNDUwLzI2Mzk1ODA0NzMwOD9oYXNoPWl0ZW0zZDc1MjAyYTRjOmc6YUdz
QUFPU3dPa3hicXFvdAo+IG9uIGViYXkuCj4KPiBDb3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gdGhh
dCBpdCBpcyB0aGUgcmlnaHQgYm9hcmQgdG8gdGVzdCB0aGUgaXNzdWVzCj4geW91IG1lbnRpb24u
CgpZZXAuIFRoYXQncyB0aGUgb25lLgoKdGhhbmtzCi1qb2huCg==

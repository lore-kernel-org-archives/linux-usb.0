Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/4] usb: dwc3: gadget: clear DWC3_EP_TRANSFER_STARTED on cmd complete
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Message-Id: <87tvh840yl.fsf@linux.intel.com>
Date: Wed, 13 Feb 2019 09:11:30 +0200
To: Thinh Nguyen <thinh.nguyen@synopsys.com>Thinh Nguyen <thinh.nguyen@synopsys.com>, Linux USB <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpUaGluaCBOZ3V5ZW4gPHRoaW5oLm5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoKCjxz
bmlwPgoKPj4gTm90ZSB0aGF0IHN0YXJ0IHRyYW5zZmVyIGNhbWUgYmVmb3JlIEVuZCBUcmFuc2Zl
ciBjb21wbGV0aW9uLgo+Pgo+PiAvbWUgZ29lcyBsb29rIGZ1cnRlcgo+Pgo+PiBJIGNhbiBzZWUg
d2hhdCdzIGdvaW5nIG9uLiBUaGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgd2UgaXNzdWUgYSBTdGFy
dAo+PiBUcmFuc2ZlciB0byBhbGwgYnVsayBlbmRwb2ludHMgd2hlbiB0aGV5IGFyZSBlbmFibGVk
LiBVcG9uIGVwX2Rpc2FibGUsCj4+IHdlIGlzc3VlIEVuZCBUcmFuc2Zlci4gQmVjYXVzZSB5b3Un
cmUgc3dpdGNoaW5nIGludGVyZmFjZXMgYWxsIHRoZSB0aW1lLAo+PiB0aGVuIHlvdSBleHBvc2Vk
IHRoZSByYWNlIGJldHdlZW4gZXBfZGlzYWJsZSBmb2xsb3dlZCBieSBlcF9lbmFibGUgYW5kCj4+
IEVuZCBUcmFuc2ZlciBjb21wbGV0aW9uLgo+Pgo+PiBXb3VsZCBpdCBiZSBlbm91Z2ggdG8ganVz
dCBza2lwIHRoZSBjb21wbGV0aW9uIGludGVycnVwdCBmcm9tCj4+IGVwX2Rpc2FibGU/Cj4+Cj4+
Cj4KPiBZb3VyIHBhdGNoIHJlc29sdmVzIHRoaXMgaXNzdWUuIENhbiB5b3UgY3JlYXRlIGEgZm9y
bWFsIHBhdGNoIGZvciB0aGlzPwoKd2lsbCBkbywgdGhhbmtzCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC] USB: PCI: set 32bit DMA mask for PCI based USB controllers
From: Christoph Hellwig <hch@lst.de>
Message-Id: <20190130074059.GA29458@lst.de>
Date: Wed, 30 Jan 2019 08:40:59 +0100
To: Hanjun Guo <guohanjun@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com, John Garry <john.garry@huawei.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, anthony.jebson@huawei.com, Hanjun Guo <hanjun.guo@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDM6MDE6NTRQTSArMDgwMCwgSGFuanVuIEd1byB3cm90
ZToKPiBUaGlzIGlzIHRoZSBSRkMgdmVyc2lvbiwgSSdtIG5vdCBzdXJlIHRoaXMgaXMgdGhlIGJl
c3Qgc29sdXRpb24sCj4gY29tbWVudHMgYXJlIHdhcm1seSB3ZWxjb21lZC4KPiAKPiBUaGFua3MK
PiBIYW5qdW4KPiAKPiAgZHJpdmVycy91c2IvY29yZS9oY2QtcGNpLmMgfCA0ICsrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9jb3JlL2hjZC1wY2kuYyBiL2RyaXZlcnMvdXNiL2NvcmUvaGNkLXBjaS5jCj4gaW5kZXggMDM0
MzI0Ni4uYTljMzNlNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3VzYi9jb3JlL2hjZC1wY2kuYwo+
ICsrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaGNkLXBjaS5jCj4gQEAgLTE4OCw2ICsxODgsMTAgQEAg
aW50IHVzYl9oY2RfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpkZXYsIGNvbnN0IHN0cnVjdCBw
Y2lfZGV2aWNlX2lkICppZCkKPiAgCWlmIChwY2lfZW5hYmxlX2RldmljZShkZXYpIDwgMCkKPiAg
CQlyZXR1cm4gLUVOT0RFVjsKPiAgCj4gKwlyZXR2YWwgPSBkbWFfY29lcmNlX21hc2tfYW5kX2Nv
aGVyZW50KCZkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDMyKSk7Cj4gKwlpZiAocmV0dmFsKQo+ICsJ
CXJldHVybiByZXR2YWw7CgpkbWFfY29lcmNlX21hc2tfYW5kX2NvaGVyZW50IGlzIG9ubHkgZm9y
IHBsYXRmb3JtIGRldmljZXMgKGFuZCBJJ20Kbm90IHN1cmUgaXQgaXMgYSBnb29kIGlkZWEgdG8g
c3RhcnQgd2l0aCwgYnV0IHRoYXQgaXMgYSBkaWZmZXJlbnQKc3RvcnkpLgoKUENJIGRldmljZSBz
aG91bGQgaGF2ZSB0aGUgZG1hX21hc2sgcG9pbnRlciBzZXQgYWxyZWFkeSwgc28geW91IHNob3Vs
ZAp1c2UgZG1hX3NldF9tYXNrX2FuZF9jb2hlcmVudCBoZXJlLgo=

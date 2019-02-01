Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC] USB: PCI: set 32bit DMA mask for PCI based USB controllers
From: Hanjun Guo <guohanjun@huawei.com>
Message-Id: <ce031291-3050-3817-0ed9-9d83dad0cc55@huawei.com>
Date: Fri, 1 Feb 2019 13:55:00 +0800
To: John Garry <john.garry@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: linux-usb@vger.kernel.org, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>, anthony.jebson@huawei.com, Hanjun Guo <hanjun.guo@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgSm9obiwKCk9uIDIwMTkvMS8zMSAxNzo1NCwgSm9obiBHYXJyeSB3cm90ZToKPiBPbiAzMC8w
MS8yMDE5IDA3OjAxLCBIYW5qdW4gR3VvIHdyb3RlOgo+PiBGcm9tOiBIYW5qdW4gR3VvIDxoYW5q
dW4uZ3VvQGxpbmFyby5vcmc+ClsuLi5dCj4+Cj4+IMKgZHJpdmVycy91c2IvY29yZS9oY2QtcGNp
LmMgfCA0ICsrKysKPj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL2hjZC1wY2kuYyBiL2RyaXZlcnMvdXNiL2NvcmUv
aGNkLXBjaS5jCj4+IGluZGV4IDAzNDMyNDYuLmE5YzMzZTYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvdXNiL2NvcmUvaGNkLXBjaS5jCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2NvcmUvaGNkLXBjaS5j
Cj4+IEBAIC0xODgsNiArMTg4LDEwIEBAIGludCB1c2JfaGNkX3BjaV9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqZGV2LCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCj4+IMKgwqDCoMKgIGlm
IChwY2lfZW5hYmxlX2RldmljZShkZXYpIDwgMCkKPj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVOT0RFVjsKPj4KPj4gK8KgwqDCoCByZXR2YWwgPSBkbWFfY29lcmNlX21hc2tfYW5kX2NvaGVy
ZW50KCZkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDMyKSk7Cj4+ICvCoMKgwqAgaWYgKHJldHZhbCkK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXR2YWw7Cj4gCj4gSGkgSGFuanVuLAo+IAo+IFlv
dSdyZSBtaXNzaW5nIHRpZHktdXAgdXBvbiBmYWlsdXJlLgoKR29vZCBjYXRjaCwgbmVlZHMgdG8g
ZGlzYWJsZSBwY2kgZm9yIGZhaWx1cmUsIEkgd2lsbCBzZW5kCmEgdXBkYXRlZCB2ZXJzaW9uIHRv
IGFkZHJlc3MgdGhlIGNvbW1lbnRzIGZyb20geW91IGFuZCBDaHJpc3RvcGguCgpUaGFua3MKSGFu
anVuCg==

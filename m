Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC] USB: PCI: set 32bit DMA mask for PCI based USB controllers
From: Hanjun Guo <guohanjun@huawei.com>
Message-Id: <e47d89e3-9bb0-95b0-db63-717594b1692b@huawei.com>
Date: Fri, 1 Feb 2019 17:13:52 +0800
To: John Garry <john.garry@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Robin Murphy <robin.murphy@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: linux-usb@vger.kernel.org, linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@huawei.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>, anthony.jebson@huawei.com, Hanjun Guo <hanjun.guo@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

T24gMjAxOS8yLzEgMTM6NTUsIEhhbmp1biBHdW8gd3JvdGU6Cj4gSGkgSm9obiwKPiAKPiBPbiAy
MDE5LzEvMzEgMTc6NTQsIEpvaG4gR2Fycnkgd3JvdGU6Cj4+IE9uIDMwLzAxLzIwMTkgMDc6MDEs
IEhhbmp1biBHdW8gd3JvdGU6Cj4+PiBGcm9tOiBIYW5qdW4gR3VvIDxoYW5qdW4uZ3VvQGxpbmFy
by5vcmc+Cj4gWy4uLl0KPj4+Cj4+PiDCoGRyaXZlcnMvdXNiL2NvcmUvaGNkLXBjaS5jIHwgNCAr
KysrCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvY29yZS9oY2QtcGNpLmMgYi9kcml2ZXJzL3VzYi9jb3JlL2hjZC1w
Y2kuYwo+Pj4gaW5kZXggMDM0MzI0Ni4uYTljMzNlNiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMv
dXNiL2NvcmUvaGNkLXBjaS5jCj4+PiArKysgYi9kcml2ZXJzL3VzYi9jb3JlL2hjZC1wY2kuYwo+
Pj4gQEAgLTE4OCw2ICsxODgsMTAgQEAgaW50IHVzYl9oY2RfcGNpX3Byb2JlKHN0cnVjdCBwY2lf
ZGV2ICpkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPj4+IMKgwqDCoMKgIGlm
IChwY2lfZW5hYmxlX2RldmljZShkZXYpIDwgMCkKPj4+IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9ERVY7Cj4+Pgo+Pj4gK8KgwqDCoCByZXR2YWwgPSBkbWFfY29lcmNlX21hc2tfYW5kX2Nv
aGVyZW50KCZkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDMyKSk7Cj4+PiArwqDCoMKgIGlmIChyZXR2
YWwpCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldHZhbDsKPj4KPj4gSGkgSGFuanVuLAo+
Pgo+PiBZb3UncmUgbWlzc2luZyB0aWR5LXVwIHVwb24gZmFpbHVyZS4KPiAKPiBHb29kIGNhdGNo
LCBuZWVkcyB0byBkaXNhYmxlIHBjaSBmb3IgZmFpbHVyZSwgSSB3aWxsIHNlbmQKPiBhIHVwZGF0
ZWQgdmVyc2lvbiB0byBhZGRyZXNzIHRoZSBjb21tZW50cyBmcm9tIHlvdSBhbmQgQ2hyaXN0b3Bo
LgoKVGhlcmUgaXMgYSBfRE1BIG1ldGhvZCB3aGljaCB3YXMgaW50cm9kdWNlZCBpbiBBQ1BJIDYu
MiB0byBjb3Zlcgp0aGlzLCBJIHdpbGwgdHJ5IHRoYXQgc29sdXRpb24gdGhlbiByZXBvcnQgYmFj
ay4KClRoYW5rcwpIYW5qdW4K

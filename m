Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,01/10] dt-bindings: phy: Add support for HiSilicon's hi3660 USB PHY
From: Yu Chen <chenyu56@huawei.com>
Message-Id: <5ee91d42-ab9d-1bd2-d39e-8af4d69a5c19@huawei.com>
Date: Tue, 19 Feb 2019 11:55:31 +0800
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: liuyu712@hisilicon.com, Rob Herring <robh@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Mark Rutland <mark.rutland@arm.com>, Binghui Wang <wangbinghui@hisilicon.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiAyMDE5LzIvMTkgMTE6MDMsIENodW5mZW5nIFl1biB3cm90ZToKPj4+PiArCj4+Pj4g
K0V4YW1wbGU6Cj4+Pj4gKwl1c2ItcGh5IHsKPj4+PiArCQljb21wYXRpYmxlID0gImhpc2lsaWNv
bixoaTM2NjAtdXNiLXBoeSI7Cj4+Pj4gKwkJI3BoeS1jZWxscyA9IDwwPjsKPj4+PiArCQloaXNp
bGljb24scGVyaWNyZy1zeXNjb24gPSA8JmNyZ19jdHJsPjsKPj4+PiArCQloaXNpbGljb24scGN0
cmwtc3lzY29uID0gPCZwY3RybD47Cj4+Pj4gKwkJaGlzaWxpY29uLHVzYjMtb3RnLWJjLXN5c2Nv
biA9IDwmdXNiM19vdGdfYmM+Owo+Pj4KPj4+IEFyZSBtb3N0IG9mIHRoZSByZWdpc3RlcnMgd2l0
aGluIG9uZSBvZiB0aGVzZSBibG9ja3M/IElmIHNvLCBtYWtlIHRoaXMgCj4+PiBub2RlIGEgY2hp
bGQgb2YgdGhhdCBub2RlLgo+PiBJIG1ldCBhIHByb2JsZW0gd2hlbiBJIG1hZGUgdGhpcyBub2Rl
IGEgY2hpbGQgb2YgdGhlIHN5c2NvbiBub2RlLAo+PiB0aGUgZHJpdmVyICJwaHktaGkzNjYwLXVz
YjMiIHdhcyBub3QgcHJvYmVkLgo+PiBEbyB5b3UgaGF2ZSBhbnkgaWRlYSBhYm91dCBob3cgdG8g
bWFrZSBpdCBwcm9iZWQgd2hlbiBpdCBpcyBhIGNoaWxkIG5vZGU/Cj4gY2FsbCBvZl9wbGF0Zm9y
bV9wb3B1bGF0ZSgpIGluIHBhcmVudCBub2RlJ3MgZHJpdmVyLAo+IGJ1dCBJIGRvbid0IGtub3cg
d2hldGhlciBpdCdzIGEgc3RhbmRhcmQgd2F5ClllcywgdGhpcyBmdW5jdGlvbiBpcyB1c2VkIGlu
IGR3YzMgZHJpdmVyIHRvIHByb2JlIHRoZSBjaGlsZCBub2RlLgpCdXQgSSB0aGluayBpdCBpcyBu
b3QgYSBnb29kIHdheSB0byBtb2RpZnkgdGhlIHN5c2NvbiBkcml2ZXIuCj4+Pgo+Pj4+ICsJCWhp
c2lsaWNvbixleWUtZGlhZ3JhbS1wYXJhbSA9IDwweDIyNDY2ZTQ+Owo+Pj4+ICsJfTsKPj4+PiAt
LSAKPj4+PiAyLjE1LjAtcmMyCj4+Pj4KClRoYW5rcwpZdSBDaGVuCg==

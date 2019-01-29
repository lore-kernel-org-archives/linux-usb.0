Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: dwc3: gadget: synchronize_irq dwc irq in suspend
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Message-Id: <87womng2uw.fsf@linux.intel.com>
Date: Tue, 29 Jan 2019 12:44:23 +0200
To: "He, Bo" <bo.he@intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Linux USB <linux-usb@vger.kernel.org>
Cc: "Wang, Yu Y" <yu.y.wang@intel.com>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgoiSGUsIEJvIiA8Ym8uaGVAaW50ZWwuY29tPiB3cml0ZXM6Cj4gYWdyZWUgeW91ciBmaW5k
aW5ncy4KPgo+IHNvIGl0J3MgYmV0dGVyIG1vdmUgdGhlIHN5bmNocm9uaXplX2lycSgpIGFmdGVy
IHRoZSBzcGluX3VubG9ja19pcnFyZXN0b3JlKCkuCj4gc3RhdGljIGludCBkd2MzX3N1c3BlbmRf
Y29tbW9uKHN0cnVjdCBkd2MzICpkd2MpCj4gewo+IAl1bnNpZ25lZCBsb25nCWZsYWdzOwo+Cj4g
CXN3aXRjaCAoZHdjLT5kcl9tb2RlKSB7Cj4gCWNhc2UgVVNCX0RSX01PREVfUEVSSVBIRVJBTDoK
PiAJY2FzZSBVU0JfRFJfTU9ERV9PVEc6Cj4gCQlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2Nr
LCBmbGFncyk7Cj4gCQlkd2MzX2dhZGdldF9zdXNwZW5kKGR3Yyk7Cj4gCQlzcGluX3VubG9ja19p
cnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsKPiAJCXN5bmNocm9uaXplX2lycSgpCgppbmRl
ZWQsIEkgbWlzc2VkIHRoYXQgd2hlbiBJIGZpcnN0IHJldmlld2VkIHRoZSBwYXRjaC4gQ2FyZSB0
byBzZW5kIGEgZml4Pwo=

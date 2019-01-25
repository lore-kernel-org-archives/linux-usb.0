Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,07/12] usb: roles: Find the usb role switch by also matching against the device node
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190125123540.GA7262@kuha.fi.intel.com>
Date: Fri, 25 Jan 2019 14:35:40 +0200
To: Chen Yu <chenyu56@huawei.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, liuyu712@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKYW4gMjEsIDIwMTkgYXQgMDM6NTE6MzVQTSArMDIwMCwgSGVpa2tpIEtyb2dlcnVz
IHdyb3RlOgo+IEhpLAo+IAo+IE9uIE1vbiwgSmFuIDIxLCAyMDE5IGF0IDA0OjM2OjEzUE0gKzA4
MDAsIENoZW4gWXUgd3JvdGU6Cj4gPiBIYXZlIHRoZSBmd25vZGVfZ2V0X25hbWUoKSBwYXRjaGVz
IGJlZW4gYWNjZXB0ZWQ/Cj4gCj4gTm8sIEkgZGlkbid0IGhhdmUgYSB1c2VyIGZvciB0aGUgZnVu
Y3Rpb24gYW55bW9yZToKPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOC8xMi8xNy8yODQKPiAK
PiA+IEFuZCBJIHdpbGwgYmUgZ3JhdGVmdWwgaWYgeW91IGNhbiB0ZWxsIG1lIHlvdXIgcGxhbiBh
Ym91dCB0aGUKPiA+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzEwLzI0LzYxOSBwYXRjaGVz
Lgo+IAo+IFRoZSBwbGFuIGlzIHRvIHNlbmQgYSBuZXcgdmVyc2lvbiBvZiB0aGVtIHRvZ2V0aGVy
IHdpdGggdGhlCj4gZndub2RlX2dldF9uYW1lKCkgcGF0Y2guIEkgY2FuIHNlbmQgdGhlbSB0aGlz
IHdlZWsuCgpJJ20gYWJvdXQgdG8gc2VuZCB0aGUgZ3JhcGggc3VwcG9ydCBmb3IgdGhlIGRldmlj
ZSBjb25uZWN0aW9uIEFQSSwgYnV0Cmp1c3QgbGV0dGluZyB5b3Uga25vdyB0aGF0IEkgZGlkIG5v
dCBuZWVkIHRoZSBmd25vZGVfZ2V0X25hbWUoKSBpbiB0aGUKZW5kIGluIHRoYXQgc2VyaWVzIHVu
Zm9ydHVuYXRlbHkuCgoKQnIsCg==

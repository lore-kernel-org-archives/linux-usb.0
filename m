Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,3/3] usb: dwc2: Make dwc2_readl/writel functions endianness-agnostic.
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <8736w5yp5e.fsf@linux.intel.com>
Date: Fri, 27 Jul 2018 13:00:13 +0300
To: Grigor Tovmasyan <Grigor.Tovmasyan@synopsys.com>, Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: John Youn <John.Youn@synopsys.com>
List-ID: <linux-usb.vger.kernel.org>

aGksCgpHcmlnb3IgVG92bWFzeWFuIDxHcmlnb3IuVG92bWFzeWFuQHN5bm9wc3lzLmNvbT4gd3Jp
dGVzOgo+PiBAQCAtMzk1LDYgKzQxMiw4IEBAIHN0YXRpYyBpbnQgZHdjMl9kcml2ZXJfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQo+PiAgIAlkZXZfZGJnKCZkZXYtPmRldiwgIm1h
cHBlZCBQQSAlMDhseCB0byBWQSAlcFxuIiwKPj4gICAJCSh1bnNpZ25lZCBsb25nKXJlcy0+c3Rh
cnQsIGhzb3RnLT5yZWdzKTsKPj4gICAKPj4gKwloc290Zy0+bmVlZHNfYnl0ZV9zd2FwID0gZHdj
Ml9jaGVja19jb3JlX2VuZGlhbm5lc3MoaHNvdGcpOwo+PiArCj4+ICAgCXJldHZhbCA9IGR3YzJf
bG93bGV2ZWxfaHdfaW5pdChoc290Zyk7Cj4+ICAgCWlmIChyZXR2YWwpCj4+ICAgCQlyZXR1cm4g
cmV0dmFsOwo+PiAKPgo+IEkgYmVsaWV2ZSB0aGlzIG9uZSB3aWxsIHdvcmsgOikKCnBlcmZlY3Rs
eSwgSSdsbCBwdXNoIGl0IHNob3J0bHkKCj4gU29ycnkgZm9yIGluY29udmVuaWVuY2UuCgpub3Qg
YXQgYWxsIDspIFRoYW5rcwo=

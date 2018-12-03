Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,07/12] usb: roles: Find the usb role switch by also matching against the device node
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75VfUKAQ+Q0cQz-4-=i2JL9uACBX1bVvCeNjZLL1HStDGKQ@mail.gmail.com>
Date: Mon, 3 Dec 2018 10:17:20 +0200
To: chenyu56@huawei.com
Cc: USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBEZWMgMywgMjAxOCBhdCA1OjQ1IEFNIFl1IENoZW4gPGNoZW55dTU2QGh1YXdlaS5j
b20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIGNvZGUgZm9yIHN1cHBvcnRpbmcgZmluZCB1
c2Igcm9sZSBzd2l0Y2ggYnkgbWF0Y2hpbmcgYWdhaW5zdAo+IHRoZSBkZXZpY2Ugbm9kZSBkZXNj
cmliZWQgdXNpbmcgb2ZfZ3JhcGguCgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9tdXRleC5oPgo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsjaW5j
bHVkZSA8bGludXgvb2YuaD4KPiArI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+CgpLZWVwIGl0
IG9yZGVyZWQuCgo+ICtzdGF0aWMgaW50IF9fc3dpdGNoX21hdGNoX2J5X29mX25vZGUoc3RydWN0
IGRldmljZSAqZGV2LCBjb25zdCB2b2lkICpuYW1lKQo+ICt7Cj4gKyAgICAgICBpZiAoIWRldi0+
cGFyZW50IHx8ICFkZXYtPnBhcmVudC0+b2Zfbm9kZSkKPiArICAgICAgICAgICAgICAgcmV0dXJu
IDA7Cj4gKwo+ICsgICAgICAgcmV0dXJuIG9mX25vZGVfbmFtZV9lcShkZXYtPnBhcmVudC0+b2Zf
bm9kZSwgKGNvbnN0IGNoYXIgKiluYW1lKTsKPiArfQoKSSB0aGluayBIZWlra2kgaGFzIGludHJv
ZHVjZWQgc29tZSBtb3JlIGdlbmVyaWMgZnVuY3Rpb24gZm9yIHRoaXMuCgo+ICAgICAgICAgc3cg
PSBkZXZpY2VfY29ubmVjdGlvbl9maW5kX21hdGNoKGRldiwgInVzYi1yb2xlLXN3aXRjaCIsIE5V
TEwsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXNiX3JvbGVf
c3dpdGNoX21hdGNoKTsKCj4gKyAgICAgICBzdyA9IG9mX2dyYXBoX2ZpbmRfbWF0Y2hfYnlfdHlw
ZShkZXYsICJ1c2Itcm9sZS1zd2l0Y2giKTsKCldoeSB0aGlzIGlzIGhlcmU/ISBkZXZpY2VfY29u
bmVjdGlvbl9maW5kX21hdGNoKCkgc2hvdWxkIHRha2UgY2FyZSBmb3IgT0YgY2FzZS4K

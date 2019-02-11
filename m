Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,6/9] usb: roles: Find the muxes by also matching against the device node
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190211124042.GF16987@kuha.fi.intel.com>
Date: Mon, 11 Feb 2019 14:40:42 +0200
To: Jun Li <jun.li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chen Yu <chenyu56@huawei.com>, Hans de Goede <hdegoede@redhat.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBGZWIgMTEsIDIwMTkgYXQgMTI6NDY6MjlQTSArMDIwMCwgSGVpa2tpIEtyb2dlcnVz
IHdyb3RlOgo+IE9uIE1vbiwgRmViIDExLCAyMDE5IGF0IDA5OjU4OjA0QU0gKzAwMDAsIEp1biBM
aSB3cm90ZToKPiA+IEhpIEhlaWtraSwKPiA+IAo+ID4gPiBAQCAtODQsNyArODUsMTIgQEAgZW51
bSB1c2Jfcm9sZSB1c2Jfcm9sZV9zd2l0Y2hfZ2V0X3JvbGUoc3RydWN0Cj4gPiA+IHVzYl9yb2xl
X3N3aXRjaCAqc3cpICB9ICBFWFBPUlRfU1lNQk9MX0dQTCh1c2Jfcm9sZV9zd2l0Y2hfZ2V0X3Jv
bGUpOwo+ID4gPiAKPiA+ID4gLXN0YXRpYyBpbnQgX19zd2l0Y2hfbWF0Y2goc3RydWN0IGRldmlj
ZSAqZGV2LCBjb25zdCB2b2lkICpuYW1lKQo+ID4gPiArc3RhdGljIGludCBzd2l0Y2hfZndub2Rl
X21hdGNoKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qgdm9pZCAqZndub2RlKQo+ID4gPiArewo+
ID4gPiArCXJldHVybiBkZXZfZndub2RlKGRldikgPT0gZndub2RlOwo+ID4gCj4gPiBZb3UgbWlz
c2VkIHRoZSBjb21tZW50Cj4gPiBodHRwczovL2xrbWwub3JnL2xrbWwvMjAxOS8xLzIyLzQzNwo+
ID4gCj4gPiByZXR1cm4gZGV2X2Z3bm9kZShkZXYtPnBhcmVudCkgPT0gZndub2RlOwo+IAo+IFRo
YXQncyBhY3R1YWxseSBub3QgdGhlIGNhc2UuIHN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2hfZGVzYyBo
YXMgYSBtZW1iZXIKPiBmb3IgZndub2RlLCBhbmQgdGhhdCdzIHdoYXQgd2UgdXNlIHdpdGggdGhl
IGFjdHVhbCBtdXggZGV2aWNlLiBDaGVjawo+IHVzYl9yb2xlX3N3aXRjaF9yZWdpc3RlcigpOgo+
IAo+ICAgICAgICAgLi4uCj4gICAgICAgICBzdy0+ZGV2LmZ3bm9kZSA9IGRlc2MtPmZ3bm9kZTsK
PiAgICAgICAgIC4uLgo+IAo+IFNvcnJ5IGZvciBub3QgcmVhbGl6aW5nIGl0IGJlZm9yZS4KCkp1
c3QgdG8gY2xhcmlmeS4gVGhlIGN1cnJlbnQgcGF0Y2ggaXMgT0suIE5vIGNoYW5nZXMgbmVlZGVk
LgoKCnRoYW5rcywK

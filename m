Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [usb-next,v2] usb: xhci: skip phys initialization of shared hcd
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180322090127.GA12048@kroah.com>
Date: Thu, 22 Mar 2018 10:01:27 +0100
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDQ6Mzk6MjBQTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdy
b3RlOgo+IFRoZSBwaHlzIGhhcyBhbHJlYWR5IGJlZW4gaW5pdGlhbGl6ZWQgd2hlbiBhZGQgcHJp
bWFyeSBoY2QsCj4gaW5jbHVkaW5nIHVzYjIgcGh5cyBhbmQgdXNiMyBwaHlzIGFsc28gaWYgZXhp
c3QsIHNvIG5lZWRuJ3QKPiByZS1wYXJzZSAicGh5cyIgcHJvcGVydHkgYWdhaW4uCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL3VzYi9jb3JlL2hjZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCldoYXQgY2hhbmdlZCBmcm9tIHZlcnNpb24gMT8K
CkFsd2F5cyBwdXQgdGhhdCBiZWxvdyB0aGUgLS0tIGxpbmUgbGlrZSB0aGUga2VybmVsIGRvY3Vt
ZW50YXRpb24gYXNrcwp5b3UgdG8gZG8uCgp2Mz8KCnRoYW5rcywKCmdyZWcgay1oCi0tLQpUbyB1
bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGlu
dXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVs
Lm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9y
ZG9tby1pbmZvLmh0bWwK

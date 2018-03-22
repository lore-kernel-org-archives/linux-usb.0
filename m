Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [usb-next,v2] usb: xhci: skip phys initialization of shared hcd
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180322125300.GA22130@kroah.com>
Date: Thu, 22 Mar 2018 13:53:00 +0100
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBNYXIgMjIsIDIwMTggYXQgMDg6MTI6NTBQTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdy
b3RlOgo+IFRoZSBwaHlzIGhhcyBhbHJlYWR5IGJlZW4gaW5pdGlhbGl6ZWQgd2hlbiBhZGQgcHJp
bWFyeSBoY2QsCj4gaW5jbHVkaW5nIHVzYjIgcGh5cyBhbmQgdXNiMyBwaHlzIGFsc28gaWYgZXhp
c3QsIHNvIG5lZWRuJ3QKPiByZS1wYXJzZSAicGh5cyIgcHJvcGVydHkgYWdhaW4uCgpXYWl0LCB3
aHkgZG9lcyB0aGUgc3ViamVjdCBzYXkgInhoY2kiLCB3aGVuIHRoaXMgaXMgaW4gVVNCIGNvcmUg
Y29kZT8KCkknbGwgZ28gZWRpdCB0aGF0IGJ5IGhhbmQuLi4KLS0tClRvIHVuc3Vic2NyaWJlIGZy
b20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRo
ZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFq
b3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRt
bAo=

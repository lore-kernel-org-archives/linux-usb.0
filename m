Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5] usb: core: phy: clean up return value check about devm_of_phy_get_by_index()
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Message-Id: <CAFBinCB8J1TP_xsg8cprHBzQrNwUVg7TxbRBw3GamyWUe8yH7g@mail.gmail.com>
Date: Mon, 3 Sep 2018 20:09:31 +0200
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, matthias.bgg@gmail.com, johan@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBBdWcgMzEsIDIwMTggYXQgMTI6MDIgUE0gQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55
dW5AbWVkaWF0ZWsuY29tPiB3cm90ZToKPgo+IFVzZSBJU19FUlIoKSBpbnN0ZWFkIG9mIElTX0VS
Ul9PUl9OVUxMKCkgYmVjYXVzZSBkZXZtX29mX3BoeV9nZXRfYnlfaW5kZXgoKQo+IG5ldmVyIHJl
dHVybiBOVUxMIHZhbHVlOwo+IEJ1dCBzdGlsbCBuZWVkIGlnbm9yZSB0aGUgZXJyb3Igb2YgLUVO
T0RFViwgZm9yIG1vcmUgaW5mb3JtYXRpb24sIHBsZWFzZQo+IHJlZmVyIHRvOgo+IFswXSBodHRw
czovL2xrbWwub3JnL2xrbWwvMjAxOC80LzE5Lzg4Cj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcGF0Y2gvMTAxNjAxODEvCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4g
PGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IEpvaGFuIEhvdm9sZCA8
am9oYW5Aa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRp
bi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgp0aGFua3MgdG8gYm90aCBvZiB5b3UgZm9y
IGZpeGluZyBteSBjb2RlIQoKClJlZ2FyZHMKTWFydGluCg==

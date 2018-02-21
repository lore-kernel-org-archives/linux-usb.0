Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,5/6] extcon: add possibility to get extcon device by OF node
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75VdxGDCGQBN05bL3_h8P62-v6+5oGW3M7CA+701o15ZXnQ@mail.gmail.com>
Date: Wed, 21 Feb 2018 16:27:11 +0200
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, USB <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBGZWIgMjEsIDIwMTggYXQgMTA6NTUgQU0sIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFA
c2Ftc3VuZy5jb20+IHdyb3RlOgo+IFNpbmNlIGV4dGNvbiBwcm9wZXJ0eSBpcyBub3QgYWxsb3dl
ZCBpbiBEVCwgZXh0Y29uIHN1YnN5c3RlbSByZXF1aXJlcwo+IGFub3RoZXIgd2F5IHRvIGdldCBl
eHRjb24gZGV2aWNlLiBMZXRzIHRyeSB0aGUgc2ltcGxlc3QgYXBwcm9hY2ggLSBnZXQKPiBlZGV2
IGJ5IG9mX25vZGUuCgo+ICsvKgo+ICsgKiBleHRjb25fZ2V0X2VkZXZfYnlfb2Zfbm9kZSAtIEdl
dCB0aGUgZXh0Y29uIGRldmljZSBmcm9tIGRldmljZXRyZWUuCj4gKyAqIEBub2RlICAgICAgIDog
T0Ygbm9kZSBpZGVudHlmeWluZyBlZGV2Cj4gKyAqCj4gKyAqIFJldHVybiB0aGUgcG9pbnRlciBv
ZiBleHRjb24gZGV2aWNlIGlmIHN1Y2Nlc3Mgb3IgRVJSX1BUUihlcnIpIGlmIGZhaWwuCj4gKyAq
Lwo+ICtzdHJ1Y3QgZXh0Y29uX2RldiAqZXh0Y29uX2dldF9lZGV2X2J5X29mX25vZGUoc3RydWN0
IGRldmljZV9ub2RlICpub2RlKQoKRmlyc3Qgb2YgYWxsLCB0aGUgYWxsIG90aGVyIHNpbWlsYXIg
Y2FzZXMgdXNlICJfYnlfbm9kZSIgaW4gdGhlIG5hbWUuClNlY29uZCwgaXQncyBub3QgX2dldF8s
IGl0J3MgX2ZpbmRfLgoKPiArewo+ICsgICAgICAgc3RydWN0IGV4dGNvbl9kZXYgKmVkZXY7Cj4g
Kwo+ICsgICAgICAgbXV0ZXhfbG9jaygmZXh0Y29uX2Rldl9saXN0X2xvY2spOwo+ICsgICAgICAg
bGlzdF9mb3JfZWFjaF9lbnRyeShlZGV2LCAmZXh0Y29uX2Rldl9saXN0LCBlbnRyeSkKPiArICAg
ICAgICAgICAgICAgaWYgKGVkZXYtPmRldi5wYXJlbnQgJiYgZWRldi0+ZGV2LnBhcmVudC0+b2Zf
bm9kZSA9PSBub2RlKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAg
ICAgZWRldiA9IEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7Cj4gK291dDoKPiArICAgICAgIG11dGV4
X3VubG9jaygmZXh0Y29uX2Rldl9saXN0X2xvY2spOwo+ICsKPiArICAgICAgIHJldHVybiBlZGV2
OwoKQ2FuJ3QgaXQgYmUgZG9uZSB1c2luZyBidXNfZmluZF9kZXZpY2UoKT8KCj4gK30KClNlZSBn
b29kIGV4YW1wbGUgaW4gaTJjLWNvcmUtb2YuYwoKb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2Rl
KCkKb2ZfZ2V0X2kyY19hZGFwdGVyX2J5X25vZGUoKQo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/5] usb: roles: add API to get usb_role_switch by node
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Message-Id: <1552282615.10179.25.camel@mhfsdcap03>
Date: Mon, 11 Mar 2019 13:36:55 +0800
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBGcmksIDIwMTktMDMtMDggYXQgMDg6NTIgKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3
cm90ZToKPiBPbiBGcmksIE1hciA4LCAyMDE5IGF0IDg6MTQgQU0gQ2h1bmZlbmcgWXVuIDxjaHVu
ZmVuZy55dW5AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgdXNiX3JvbGVfc3dpdGNo
X2dldF9ieV9ub2RlKCkgdG8gbWFrZSBlYXNpZXIgdG8gZ2V0Cj4gPiB1c2Jfcm9sZV9zd2l0Y2gg
Ynkgbm9kZSB3aGljaCByZWdpc3RlciBpdC4KPiA+IEl0J3MgdXNlZnVsIHdoZW4gdGhlcmUgaXMg
bm90IGRldmljZV9jb25uZWN0aW9uIHJlZ2lzdGVyZWQKPiA+IGJldHdlZW4gdHdvIGRyaXZlcnMg
YW5kIG9ubHkga25vd3MgdGhlIG5vZGUgd2hpY2ggcmVnaXN0ZXIKPiA+IHVzYl9yb2xlX3N3aXRj
aC4KPiAKPiA+ICtzdGF0aWMgaW50IF9fc3dpdGNoX21hdGNoX25vZGUoc3RydWN0IGRldmljZSAq
ZGV2LCBjb25zdCB2b2lkICpub2RlKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0dXJuIGRldi0+cGFy
ZW50LT5vZl9ub2RlID09IChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKilub2RlOwo+ID4gK30K
PiAKPiBIbW0uLi4gU2hvdWxkbid0IGJlIHNsaWdodGx5IGJldHRlciB0byBjb21wYXJlIGZ3bm9k
ZSBpbnN0ZWFkPwo+IApVc2luZyBmd25vZGUgaXMgaW5kZWVkIHN1aXRhYmxlIGZvciBtb3JlIGNh
c2VzLApJIGZpbmQgdGhhdCB0aGVyZSBhcmUgbWFueSBmdW5jdGlvbnMgbmFtZWQgeHhfYnlfbm9k
ZSB1c2luZyBub2RlLCBidXQKbm90IGZ3bm9kZSwgaXMgdGhlcmUgYW55IHJ1bGVzIGFib3V0IGNo
b2ljZSBiZXR3ZWVuIGRldmljZV9ub2RlIGFuZApmd25vZGVfaGFuZGxlPwoKVGhhbmtzCg==

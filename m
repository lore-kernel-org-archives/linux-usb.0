Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/6] usb: roles: add API to get usb_role_switch by node
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190315091127.GF7752@kuha.fi.intel.com>
Date: Fri, 15 Mar 2019 11:11:27 +0200
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMTA6MTg6MzVBTSArMDIwMCwgSGVpa2tpIEtyb2dlcnVz
IHdyb3RlOgo+IEFuZHkgYWxyZWFkeSBwb2ludGVkIG91dCB0aGF0IHlvdSBuZWVkIHRvIHVzZSBm
d25vZGVzLgo+IAo+IFJ1bGUgb2YgdGh1bWI6IFlvdSBhbHdheXMgdXNlIGZ3bm9kZXMuIE9ubHkg
aWYgdGhlcmUgaXMgc29tZXRoaW5nIHRoYXQKPiBjYW4ndCBiZSBkb25lIHdpdGggZndub2RlcyB5
b3UgdXNlIERUIG9yIEFDUEkgbm9kZXMgZGlyZWN0bHkuCj4gCj4gSW4gdGhpcyBjYXNlIHRoZXJl
IGlzIGFic29sdXRlbHkgbm90aGluZyB0aGF0IHdvdWxkIHByZXZlbnQgeW91IGZyb20KPiB1c2lu
ZyBmd25vZGVzLgoKLi4uCgo+ICsvKioKPiArICogdXNiX3JvbGVfc3dpdGNoX2dldF9ieV9ub2Rl
IC0gRmluZCBVU0Igcm9sZSBzd2l0Y2ggYnkgaXQncyBwYXJlbnQgbm9kZQo+ICsgKiBAbm9kZTog
VGhlIG5vZGUgdGhhdCByZWdpc3RlciBVU0Igcm9sZSBzd2l0Y2gKPiArICoKPiArICogRmluZHMg
YW5kIHJldHVybnMgcm9sZSBzd2l0Y2ggcmVnaXN0ZXJlZCBieSBAbm9kZS4gVGhlIHJlZmVyZW5j
ZSBjb3VudAo+ICsgKiBmb3IgdGhlIGZvdW5kIHN3aXRjaCBpcyBpbmNyZW1lbnRlZC4KPiArICov
Cj4gK3N0cnVjdCB1c2Jfcm9sZV9zd2l0Y2ggKnVzYl9yb2xlX3N3aXRjaF9nZXRfYnlfbm9kZShz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCgpUaGlzIGlzIG15IHByb3Bvc2FsIGZvciBmdW5jdGlv
biBwcm90b3R5cGU6CgpzdHJ1Y3QgdXNiX3JvbGVfc3dpdGNoICoKZndub2RlX3VzYl9yb2xlX3N3
aXRjaF9nZXQoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSk7CgoKdGhhbmtzLAo=

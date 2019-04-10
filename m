Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,6/6] usb: mtu3: register a USB Role Switch for dual role mode
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190410102415.GH20058@kuha.fi.intel.com>
Date: Wed, 10 Apr 2019 13:24:15 +0300
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Min Guo <min.guo@mediatek.com>, Alan Stern <stern@rowland.harvard.edu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBBcHIgMDMsIDIwMTkgYXQgMTA6MDk6MTRBTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdy
b3RlOgo+ICtzdGF0aWMgaW50IHNzdXNiX3JvbGVfc3dfcmVnaXN0ZXIoc3RydWN0IG90Z19zd2l0
Y2hfbXRrICpvdGdfc3gpCj4gK3sKPiArCXN0cnVjdCB1c2Jfcm9sZV9zd2l0Y2hfZGVzYyByb2xl
X3N4X2Rlc2MgPSB7IDAgfTsKPiArCXN0cnVjdCBzc3VzYl9tdGsgKnNzdXNiID0KPiArCQljb250
YWluZXJfb2Yob3RnX3N4LCBzdHJ1Y3Qgc3N1c2JfbXRrLCBvdGdfc3dpdGNoKTsKPiArCj4gKwlp
ZiAoIW90Z19zeC0+cm9sZV9zd191c2VkKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCXJvbGVfc3hf
ZGVzYy5zZXQgPSBzc3VzYl9yb2xlX3N3X3NldDsKPiArCXJvbGVfc3hfZGVzYy5nZXQgPSBzc3Vz
Yl9yb2xlX3N3X2dldDsKCiAgICAgICAgcm9sZV9zd19kZXNjLmZ3bm9kZSA9IGRldl9md25vZGUo
c3N1c2ItPmRldik7Cgo+ICsJb3RnX3N4LT5yb2xlX3N3ID0gdXNiX3JvbGVfc3dpdGNoX3JlZ2lz
dGVyKHNzdXNiLT5kZXYsICZyb2xlX3N4X2Rlc2MpOwo+ICsKPiArCXJldHVybiBQVFJfRVJSX09S
X1pFUk8ob3RnX3N4LT5yb2xlX3N3KTsKPiArfQoKdGhhbmtzLAo=

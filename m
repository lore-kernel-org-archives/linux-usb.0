Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: musb: Fix external abort in musb_remove on omap2430
From: Bin Liu <b-liu@ti.com>
Message-Id: <20180309141130.GM14921@uda0271908>
Date: Fri, 9 Mar 2018 08:11:30 -0600
To: Merlijn Wajer <merlijn@wizzup.org>
Cc: ivo.g.dimitrov.75@gmail.com, linux-omap@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBUaHUsIE1hciAwOCwgMjAxOCBhdCAxMToxOTo0OFBNICswMTAwLCBNZXJsaWpuIFdh
amVyIHdyb3RlOgo+IFRoaXMgZml4ZXMgYW4gb29wcyBvbiB1bmJpbmQgLyBtb2R1bGUgdW5sb2Fk
IChvbiB0aGUgbXVzYiBvbWFwMjQzMAo+IHBsYXRmb3JtKS4KPiAKPiBtdXNiX3JlbW92ZSBmdW5j
dGlvbiBub3cgY2FsbHMgbXVzYl9wbGF0Zm9ybV9leGl0IGJlZm9yZSBkaXNhYmxpbmcKPiBydW50
aW1lIHBtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1lcmxpam4gV2FqZXIgPG1lcmxpam5Ad2l6enVw
Lm9yZz4KCkFwcGxpZWQuIFRoYW5rcy4KClJlZ2FyZHMsCi1CaW4uCi0tLQpUbyB1bnN1YnNjcmli
ZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBp
bgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3Jl
IG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZv
Lmh0bWwK

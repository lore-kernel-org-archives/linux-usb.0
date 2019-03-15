Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/6] usb: roles: add API to get usb_role_switch by node
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Message-Id: <1552641248.10179.134.camel@mhfsdcap03>
Date: Fri, 15 Mar 2019 17:14:08 +0800
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Hans de Goede <hdegoede@redhat.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

SGksCk9uIEZyaSwgMjAxOS0wMy0xNSBhdCAxMToxMSArMDIwMCwgSGVpa2tpIEtyb2dlcnVzIHdy
b3RlOgo+IE9uIEZyaSwgTWFyIDE1LCAyMDE5IGF0IDEwOjE4OjM1QU0gKzAyMDAsIEhlaWtraSBL
cm9nZXJ1cyB3cm90ZToKPiA+IEFuZHkgYWxyZWFkeSBwb2ludGVkIG91dCB0aGF0IHlvdSBuZWVk
IHRvIHVzZSBmd25vZGVzLgo+ID4gCj4gPiBSdWxlIG9mIHRodW1iOiBZb3UgYWx3YXlzIHVzZSBm
d25vZGVzLiBPbmx5IGlmIHRoZXJlIGlzIHNvbWV0aGluZyB0aGF0Cj4gPiBjYW4ndCBiZSBkb25l
IHdpdGggZndub2RlcyB5b3UgdXNlIERUIG9yIEFDUEkgbm9kZXMgZGlyZWN0bHkuCj4gPiAKPiA+
IEluIHRoaXMgY2FzZSB0aGVyZSBpcyBhYnNvbHV0ZWx5IG5vdGhpbmcgdGhhdCB3b3VsZCBwcmV2
ZW50IHlvdSBmcm9tCj4gPiB1c2luZyBmd25vZGVzLgo+IAo+IC4uLgo+IAo+ID4gKy8qKgo+ID4g
KyAqIHVzYl9yb2xlX3N3aXRjaF9nZXRfYnlfbm9kZSAtIEZpbmQgVVNCIHJvbGUgc3dpdGNoIGJ5
IGl0J3MgcGFyZW50IG5vZGUKPiA+ICsgKiBAbm9kZTogVGhlIG5vZGUgdGhhdCByZWdpc3RlciBV
U0Igcm9sZSBzd2l0Y2gKPiA+ICsgKgo+ID4gKyAqIEZpbmRzIGFuZCByZXR1cm5zIHJvbGUgc3dp
dGNoIHJlZ2lzdGVyZWQgYnkgQG5vZGUuIFRoZSByZWZlcmVuY2UgY291bnQKPiA+ICsgKiBmb3Ig
dGhlIGZvdW5kIHN3aXRjaCBpcyBpbmNyZW1lbnRlZC4KPiA+ICsgKi8KPiA+ICtzdHJ1Y3QgdXNi
X3JvbGVfc3dpdGNoICp1c2Jfcm9sZV9zd2l0Y2hfZ2V0X2J5X25vZGUoc3RydWN0IGRldmljZV9u
b2RlICpub2RlKQo+IAo+IFRoaXMgaXMgbXkgcHJvcG9zYWwgZm9yIGZ1bmN0aW9uIHByb3RvdHlw
ZToKPiAKPiBzdHJ1Y3QgdXNiX3JvbGVfc3dpdGNoICoKPiBmd25vZGVfdXNiX3JvbGVfc3dpdGNo
X2dldChzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlKTsKT2ssIHRoYW5rcyBhZ2Fpbgo+IAo+
IAo+IHRoYW5rcywKPgo=

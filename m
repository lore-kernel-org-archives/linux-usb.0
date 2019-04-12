Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/4] ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on wakeup
From: Matthias Kaehlcke <mka@chromium.org>
Message-Id: <20190412235738.GZ112750@google.com>
Date: Fri, 12 Apr 2019 16:57:38 -0700
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>, amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMDM6NDE6NDlQTSAtMDcwMCwgRG91Z2xhcyBBbmRlcnNv
biB3cm90ZToKPiBUaGUgImhvc3QiIFVTQiBwb3J0IG9uIHJrMzI4OCBoYXMgYSBoYXJkd2FyZSBl
cnJhdGEgd2hlcmUgd2UndmUgZ290IHRvCj4gYXNzZXJ0IGEgUEhZIHJlc2V0IHdoZW5ldmVyIHdl
IHNlZSBhIHJlbW90ZSB3YWtldXAuICBBZGQgdGhhdCBxdWlyawo+IHByb3BlcnR5IHRvIHRoZSBk
ZXZpY2UgdHJlZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVy
c0BjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4OC5kdHNp
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3JrMzI4
OC5kdHNpCj4gaW5kZXggOTJlMDYwMDU5NWY4Li42MzY3YzFiNTBmZDcgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9y
azMyODguZHRzaQo+IEBAIC02MTcsNiArNjE3LDcgQEAKPiAgCQlkcl9tb2RlID0gImhvc3QiOwo+
ICAJCXBoeXMgPSA8JnVzYnBoeTI+Owo+ICAJCXBoeS1uYW1lcyA9ICJ1c2IyLXBoeSI7Cj4gKwkJ
c25wcyxyZXNldC1waHktb24td2FrZTsKPiAgCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAJfTsK
PiAgCgpSZXZpZXdlZC1ieTogTWF0dGhpYXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cg==

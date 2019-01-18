Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,4/4] usb: musb: Add support for MediaTek musb controller
From: min.guo@mediatek.com
Message-Id: <1547792054.4433.254.camel@mhfsdcap03>
Date: Fri, 18 Jan 2019 14:14:14 +0800
To: Tony Lindgren <tony@atomide.com>
Cc: Bin Liu <b-liu@ti.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, hdegoede@redhat.com, Yonglong Wu <yonglong.wu@mediatek.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAyMDE5LTAxLTE3IGF0IDA2OjMzIC0wODAwLCBUb255IExpbmRncmVuIHdyb3RlOgo+
IEhpLAo+IAo+ICogbWluLmd1b0BtZWRpYXRlay5jb20gPG1pbi5ndW9AbWVkaWF0ZWsuY29tPiBb
MTkwMTE3IDA3OjE2XToKPiA+IFRoZXJlIGFyZSBzb21lIHF1aXJrIG9mIE1lZGlhVGVrIG11c2Ig
Y29udHJvbGxlciwgc3VjaCBhczoKPiA+ICAtVzFDIGludGVycnVwdCBzdGF0dXMgcmVnaXN0ZXJz
Cj4gPiAgLVByaXZhdGUgZGF0YSB0b2dnbGUgcmVnaXN0ZXJzCj4gPiAgLU5vIGRlZGljYXRlZCBE
TUEgaW50ZXJydXB0IGxpbmUKPiAKPiBDYW4geW91IHBsZWFzZSBzZXBhcmF0ZSB0aGUgbXVzYiBn
ZW5lcmljIGNoYW5nZXMgbGlzdGVkIGFib3ZlCj4gaW50byBzZXBhcmF0ZSBpbmRpdmlkdWFsIHBh
dGNoZXMgaW4gcHJlcGFyYXRpb24gZm9yIGFkZGluZwo+IHN1cHBvcnQgZm9yIG5ldyBoYXJkd2Fy
ZT8KPiAKPiBPdGhlcndpc2Ugd2UnbGwgaGF2ZSBoYXJkIHRpbWUgZmluZGluZyBvdXQgd2l0aCBn
aXQgYmlzZWN0IHdoYXQKPiBleGFjdGx5IGJyZWFrcyB0aGluZ3MgaWYgd2UgcnVuIGludG8gdHJv
dWJsZS4KClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLgpJIHByZXBhcmVkIHRvIGRpdmlkZSB0
aGVzZSBjaGFuZ2VzIGludG8gc2VwYXJhdGUgcGF0Y2hlcy4gTGF0ZXIsIE1yLkJpbgpzdWdnZXN0
ZWQgbm90IHRvIGRvIHRoaXMuCgpUaGUgZGV0YWlsZWQgaW5mb3JtYXRpb24gY2FuIGJlIHJlZmVy
cmVkIHRvOgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNzQzNTYxLwpodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwNzYzNzM3LwpodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzEwNzQ2Mzc0MS8KCj4gUmVnYXJkcywKPiAKPiBUb255Cg==

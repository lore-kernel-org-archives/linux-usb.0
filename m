Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: renesas_usbhs: replace udelay() with usleep_range()
From: Simon Horman <horms@verge.net.au>
Message-Id: <20190117104311.zwr6fg3lip2xauec@verge.net.au>
Date: Thu, 17 Jan 2019 11:43:12 +0100
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgMDQ6MjQ6MTVQTSArMDkwMCwgWW9zaGloaXJvIFNoaW1v
ZGEgd3JvdGU6Cj4gQWNjb3JkaW5nIHRvIERvY3VtZW50YXRpb24vdGltZXJzL3RpbWVycy1ob3d0
by50eHQsIGEgZHJpdmVyIHNob3VsZAo+IHVzZSB1c2xlZXBfcmFuZ2UoKSBpbnN0ZWFkIG9mIHVk
ZWxheSgpIG9uIE5PTi1BVE9NSUMgQ09OVEVYVCBpZgo+ICJTTEVFUElORyBGT1IgflVTRUNTIE9S
IFNNQUxMIE1TRUNTICggMTB1cyAtIDIwbXMpIi4KPiAKPiBTaW5jZSB0aGUgLmhhcmR3YXJlX2lu
aXQoKSBhbmQgLnBvd2VyX2N0cmwoKSB3aWxsIHJ1biBvbiBOT04tQVRPTUlDCj4gQ09OVEVYVCwg
dGhpcyBwYXRjaCByZXBsYWNlcyB1ZGVsYXkoKSB3aXRoIHVzbGVlcF9yYW5nZSgpLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hpbW9kYS51aEByZW5l
c2FzLmNvbT4KClJldmlld2VkLWJ5OiBTaW1vbiBIb3JtYW4gPGhvcm1zK3JlbmVzYXNAdmVyZ2Uu
bmV0LmF1Pgo=

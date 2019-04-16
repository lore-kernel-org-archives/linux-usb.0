Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/4] usb: dwc2: optionally assert phy reset when waking up
From: Doug Anderson <dianders@chromium.org>
Message-Id: <CAD=FV=Vy8A2PE+EeYJi7n7O8c2_JuCpvHLiMXL_Ad-kqW208QA@mail.gmail.com>
Date: Tue, 16 Apr 2019 14:54:23 -0700
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>, Alexandru M Stan <amstan@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, Ryan Case <ryandcase@chromium.org>, Julius Werner <jwerner@chromium.org>, Elaine Zhang <zhangqing@rock-chips.com>, Yunzhi Li <lyz@rock-chips.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBGcmksIEFwciAxMiwgMjAxOSBhdCA0OjU2IFBNIE1hdHRoaWFzIEthZWhsY2tlIDxt
a2FAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+IEBAIC01MjcxLDExICs1MjgyLDEwIEBAIGludCBk
d2MyX2hjZF9pbml0KHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykKPiA+ICAgICAgICAgICAgICAg
aHNvdGctPmhjX3B0cl9hcnJheVtpXSA9IGNoYW5uZWw7Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAg
ICAgLyogSW5pdGlhbGl6ZSBoc290ZyBzdGFydCB3b3JrICovCj4gPiArICAgICAvKiBJbml0aWFs
aXplIHdvcmsgKi8KPiA+ICAgICAgIElOSVRfREVMQVlFRF9XT1JLKCZoc290Zy0+c3RhcnRfd29y
aywgZHdjMl9oY2Rfc3RhcnRfZnVuYyk7Cj4gPiAtCj4gPiAtICAgICAvKiBJbml0aWFsaXplIHBv
cnQgcmVzZXQgd29yayAqLwo+ID4gICAgICAgSU5JVF9ERUxBWUVEX1dPUksoJmhzb3RnLT5yZXNl
dF93b3JrLCBkd2MyX2hjZF9yZXNldF9mdW5jKTsKPiA+ICsgICAgIElOSVRfV09SSygmaHNvdGct
PnBoeV9yZXNldF93b3JrLCBkd2MyX2hjZF9waHlfcmVzZXRfZnVuYyk7Cj4KPiBZb3UgYWxzbyB3
YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSB3b3JrIGlzIGNhbmNlbGxlZCB3aGVuIHRoZQo+IGNv
bnRyb2xsZXIgaXMgc3RvcHBlZC9yZW1vdmVkLiBJdCBzZWVtcyBkd2MyX2hjZF9zdG9wKCkgd291
bGQgYmUgYQo+IHN1aXRhYmxlIHBsYWNlIGZvciB0aGF0LgoKR29vZCBwb2ludC4gIGR3YzJfaGNk
X3N0b3AoKSBkb2Vzbid0IHdvcmsgdGhvdWdoIGJlY2F1c2UgaXQncyBjYWxsZWQKd2l0aCBpbnRl
cnJ1cHRzIGRpc2FibGVkIChiZWNhdXNlIGl0J3MgaG9sZGluZyB0aGUgaHNvdGctPmxvY2sKc3Bp
bmxvY2spLiAgSSBwdXQgaXQgaW4gZHdjMl9oY2RfZnJlZSgpIHdoZXJlIHRoZXJlJ3MgYW5vdGhl
ciBzaW1pbGFyCmNhbmNlbC4KCi1Eb3VnCg==

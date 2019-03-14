Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/7] usb: gadget: udc: renesas_usb3: Use usb_role_switch framework
From: Biju Das <biju.das@bp.renesas.com>
Message-Id: <TYAPR01MB2111006A25126526EE125484B84B0@TYAPR01MB2111.jpnprd01.prod.outlook.com>
Date: Thu, 14 Mar 2019 09:32:29 +0000
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Simon Horman <horms+renesas@verge.net.au>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Kees Cook <keescook@chromium.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgU2hpbW9kYS1TYW4sCgpTb3JyeS4gSSBwYXN0ZWQgYSB3cm9uZyBsaW5rLgoKPiA+IFRoaXMg
Y2F1c2VzIGJ1aWxkIGVycm9yIGJlY2F1c2Ugc3RydWN0IHVzYl9yb2xlX3N3aXRjaF9kZXNjIGRv
ZXNuJ3QKPiA+IGhhdmUgZndub2RlLgo+IAo+IEkgaGF2ZSBjb21waWxlZCB0aGlzIGNvZGUgd2l0
aCBsaW51eC1uZXh0IGFuZCB0aGUgY29tbWl0Cj4gMDlhYTExY2ZkYTlkODE4NjA0NmIgKCJkZXZp
Y2UgY29ubmVjdGlvbjogQWRkIGZ3bm9kZSBtZW1iZXIgdG8gc3RydWN0Cj4gZGV2aWNlX2Nvbm5l
Y3Rpb24iKSBkZWZpbmVzIHRoZSBwcm9wZXJ0eSBmd25vZGUuIFRoZSBIRDNTUzMyMjAgcG9ydAo+
IGNvbnRyb2xsZXIgZHJpdmVyIHVzZXMgdXNiLXJvbGUtc3dpdGNoIHByb3BlcnR5IHRvIGdldCBy
b2xlLXN3aXRjaCBoYW5kbGUKPiB1c2luZyBncmFwaCBhcGkncy4KPiAKPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LQo+IG5leHQuZ2l0
L2NvbW1pdC8/aD1uZXh0LQo+IDIwMTkwMzA2JmlkPTA5YWExMWNmZGE5ZDgxODYwNDZiY2QxYWRj
ZDY0OThiNjg4MTE0ZjQKCkNvbW1pdCBpZCBlYzY5ZTk1MzNjNDg3OWM4MWViNzEyMjc3MTc5Mjg2
NGViNDlhZjM1ICgidXNiOiByb2xlczogRmluZCB0aGUgbXV4ZXMgYnkgYWxzbyBtYXRjaGluZyBh
Z2FpbnN0IHRoZSBkZXZpY2Ugbm9kZSIpCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY29tbWl0Lz9oPW5leHQtMjAxOTAz
MDYmaWQ9ZWM2OWU5NTMzYzQ4NzljODFlYjcxMjI3NzE3OTI4NjRlYjQ5YWYzNQoKcmVnYXJkcywK
QmlqdQo=

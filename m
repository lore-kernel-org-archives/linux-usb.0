Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: gadget: udc: renesas_usb3: add support for r8a774c0
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <TY2PR01MB2297A0B026B45621F220F259D8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
Date: Fri, 14 Dec 2018 09:06:02 +0000
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms+renesas@verge.net.au>, Kees Cook <keescook@chromium.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgRmFicml6aW8sCgo+IEZyb206IEZhYnJpemlvIENhc3RybywgU2VudDogRnJpZGF5LCBEZWNl
bWJlciAxNCwgMjAxOCA1OjI0IEFNCj4gCj4gUlovRzJFIFVTQiAzLjAgaW1wbGVtZW50YXRpb24g
aXMgbGlrZSB0aGUgb25lIGZvdW5kIG9uIFItQ2FyIEUzLAo+IHRoZXJlZm9yZSBhZGQgdGhlIHNh
bWUgcXVpcmsuCj4gCj4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5j
YXN0cm9AYnAucmVuZXNhcy5jb20+CgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCEKClJldmlld2Vk
LWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+
CgpCZXN0IHJlZ2FyZHMsCllvc2hpaGlybyBTaGltb2RhCgo+IC0tLQo+ICBkcml2ZXJzL3VzYi9n
YWRnZXQvdWRjL3JlbmVzYXNfdXNiMy5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9yZW5l
c2FzX3VzYjMuYyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvcmVuZXNhc191c2IzLmMKPiBpbmRl
eCBjZGZmYmQxLi4xODQ0NGE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMv
cmVuZXNhc191c2IzLmMKPiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL3JlbmVzYXNfdXNi
My5jCj4gQEAgLTI2MjUsNiArMjYyNSwxMCBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB1c2Iz
X29mX21hdGNoKTsKPiAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJpYnV0
ZSByZW5lc2FzX3VzYjNfcXVpcmtzX21hdGNoW10gPSB7Cj4gIAl7Cj4gKwkJLnNvY19pZCA9ICJy
OGE3NzRjMCIsCj4gKwkJLmRhdGEgPSAmcmVuZXNhc191c2IzX3ByaXZfcjhhNzc5OTAsCj4gKwl9
LAo+ICsJewo+ICAJCS5zb2NfaWQgPSAicjhhNzc5NSIsIC5yZXZpc2lvbiA9ICJFUzEuKiIsCj4g
IAkJLmRhdGEgPSAmcmVuZXNhc191c2IzX3ByaXZfcjhhNzc5NV9lczEsCj4gIAl9LAo+IC0tCj4g
Mi43LjQK

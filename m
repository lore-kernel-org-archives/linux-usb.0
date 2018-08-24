Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: host: xhci-rcar: Add support for r8a774a1
From: Biju Das <biju.das@bp.renesas.com>
Message-Id: <1535105808-11401-1-git-send-email-biju.das@bp.renesas.com>
Date: Fri, 24 Aug 2018 11:16:48 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Fengguang Wu <fengguang.wu@intel.com>, Chris Brandt <chris.brandt@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHI4YTc3NGExIChSWi9HMk0pLgoKU2lnbmVkLW9m
Zi1ieTogQmlqdSBEYXMgPGJpanUuZGFzQGJwLnJlbmVzYXMuY29tPgpSZXZpZXdlZC1ieTogRmFi
cml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Ci0tLQogZHJpdmVy
cy91c2IvaG9zdC94aGNpLXJjYXIuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yY2FyLmMgYi9kcml2
ZXJzL3VzYi9ob3N0L3hoY2ktcmNhci5jCmluZGV4IGYzM2ZmYzIuLmM5MDZiMTMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1yY2FyLmMKKysrIGIvZHJpdmVycy91c2IvaG9zdC94
aGNpLXJjYXIuYwpAQCAtNzIsNiArNzIsMTAgQEAgTU9EVUxFX0ZJUk1XQVJFKFhIQ0lfUkNBUl9G
SVJNV0FSRV9OQU1FX1YzKTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2NfZGV2aWNlX2F0dHJp
YnV0ZSByY2FyX3F1aXJrc19tYXRjaFtdICA9IHsKIAl7CisJCS5zb2NfaWQgPSAicjhhNzc0YTEi
LAorCQkuZGF0YSA9ICh2b2lkICopUkNBUl9YSENJX0ZJUk1XQVJFX1YzLAorCX0sCisJewogCQku
c29jX2lkID0gInI4YTc3OTUiLCAucmV2aXNpb24gPSAiRVMxLioiLAogCQkuZGF0YSA9ICh2b2lk
ICopUkNBUl9YSENJX0ZJUk1XQVJFX1YyLAogCX0sCg==

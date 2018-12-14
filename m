Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: renesas_usbhs: add support for RZ/G2E
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Message-Id: <1544776023-13364-1-git-send-email-fabrizio.castro@bp.renesas.com>
Date: Fri, 14 Dec 2018 08:27:03 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Simon Horman <horms+renesas@verge.net.au>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, Chris Brandt <chris.brandt@renesas.com>, Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SFMtVVNCIGZvdW5kIGluIFJaL0cyRSAoYS5rLmEuIHI4YTc3NGMwKSBpcyB2ZXJ5IHNpbWlsYXIg
dG8gdGhlCm9uZSBmb3VuZCBpbiBSLUNhciBFMyAoYS5rLmEuIHI4YTc3OTkwKSwgYXMgaXQgbmVl
ZHMgdG8gcmVsZWFzZQp0aGUgUExMIHJlc2V0IGJ5IHRoZSBVR0NUUkwgcmVnaXN0ZXIgbGlrZSBS
LUNhciBFMywgdGhlcmVmb3JlIGFkZApyOGE3NzRjMCBzdXBwb3J0IGluIGEgc2ltaWxhciBmYXNo
aW9uIHRvIHdoYXQgd2FzIGRvbmUgZm9yIHRoZQpyOGE3Nzk5MC4KClNpZ25lZC1vZmYtYnk6IEZh
YnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgotLS0KIGRyaXZl
cnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2Nv
bW1vbi5jIGIvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYwppbmRleCAyZmY3OTkx
Li4yNDlmYmVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5j
CisrKyBiL2RyaXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMKQEAgLTU0MCw2ICs1NDAs
MTAgQEAgc3RhdGljIGludCB1c2Joc2NfZHJ2Y2xsYmNrX25vdGlmeV9ob3RwbHVnKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAgKi8KIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHVzYmhzX29mX21hdGNoW10gPSB7CiAJeworCQkuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHVz
YmhzLXI4YTc3NGMwIiwKKwkJLmRhdGEgPSAodm9pZCAqKVVTQkhTX1RZUEVfUkNBUl9HRU4zX1dJ
VEhfUExMLAorCX0sCisJewogCQkuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHVzYmhzLXI4YTc3OTAi
LAogCQkuZGF0YSA9ICh2b2lkICopVVNCSFNfVFlQRV9SQ0FSX0dFTjIsCiAJfSwK

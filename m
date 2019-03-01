Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/4] usb: common: Consider only available nodes for dr_mode
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Message-Id: <1551438348-22119-2-git-send-email-fabrizio.castro@bp.renesas.com>
Date: Fri,  1 Mar 2019 11:05:45 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org, #@vger.kernel.org, v4.4+@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

VGhlcmUgYXJlIGNhc2VzIHdoZXJlIG11bHRpcGxlIGRldmljZSB0cmVlIG5vZGVzIHBvaW50IHRv
IHRoZQpzYW1lIHBoeSBub2RlIGJ5IG1lYW5zIG9mIHRoZSAicGh5cyIgcHJvcGVydHksIGJ1dCB3
ZSBzaG91bGQKb25seSBjb25zaWRlciB0aG9zZSBub2RlcyB0aGF0IGFyZSBtYXJrZWQgYXMgYXZh
aWxhYmxlIHJhdGhlcgp0aGFuIGp1c3QgYW55IG5vZGUuCgpGaXhlczogOThiZmIzOTQ2Njk1ICgi
dXNiOiBvZjogYWRkIGFuIGFwaSB0byBnZXQgZHJfbW9kZSBieSB0aGUgcGh5IG5vZGUiKQpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjQrClNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENh
c3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgotLS0KIGRyaXZlcnMvdXNiL2Nv
bW1vbi9jb21tb24uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMgYi9kcml2ZXJzL3VzYi9jb21t
b24vY29tbW9uLmMKaW5kZXggNDgyNzdiYi4uNzNjOGU2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy91
c2IvY29tbW9uL2NvbW1vbi5jCisrKyBiL2RyaXZlcnMvdXNiL2NvbW1vbi9jb21tb24uYwpAQCAt
MTQ1LDYgKzE0NSw4IEBAIGVudW0gdXNiX2RyX21vZGUgb2ZfdXNiX2dldF9kcl9tb2RlX2J5X3Bo
eShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgYXJnMCkKIAogCWRvIHsKIAkJY29udHJvbGxl
ciA9IG9mX2ZpbmRfbm9kZV93aXRoX3Byb3BlcnR5KGNvbnRyb2xsZXIsICJwaHlzIik7CisJCWlm
ICghb2ZfZGV2aWNlX2lzX2F2YWlsYWJsZShjb250cm9sbGVyKSkKKwkJCWNvbnRpbnVlOwogCQlp
bmRleCA9IDA7CiAJCWRvIHsKIAkJCWlmIChhcmcwID09IC0xKSB7Cg==

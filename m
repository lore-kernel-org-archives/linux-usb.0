Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/3] usb: roles: Use the "compatible" property instead of a boolean property
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190327164339.31205-3-heikki.krogerus@linux.intel.com>
Date: Wed, 27 Mar 2019 19:43:38 +0300
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Biju Das <biju.das@bp.renesas.com>, Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SW5zdGVhZCBvZiBzZWFyY2hpbmcgZm9yIGEgYm9vbGVhbiBwcm9wZXJ0eSwgbWF0Y2hpbmcKYWdh
aW5zdCB0aGUgImNvbXBhdGlibGUiIHByb3BlcnR5LgoKU2lnbmVkLW9mZi1ieTogSGVpa2tpIEty
b2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvdXNi
L3JvbGVzL2NsYXNzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9yb2xlcy9jbGFzcy5jIGIvZHJp
dmVycy91c2Ivcm9sZXMvY2xhc3MuYwppbmRleCBmNDVkOGRmNWNmYjguLjNkYzFlMDU5NTljMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy91c2Ivcm9sZXMvY2xhc3MuYworKysgYi9kcml2ZXJzL3VzYi9y
b2xlcy9jbGFzcy5jCkBAIC0xMDEsNyArMTAxLDcgQEAgc3RhdGljIHZvaWQgKnVzYl9yb2xlX3N3
aXRjaF9tYXRjaChzdHJ1Y3QgZGV2aWNlX2Nvbm5lY3Rpb24gKmNvbiwgaW50IGVwLAogCXN0cnVj
dCBkZXZpY2UgKmRldjsKIAogCWlmIChjb24tPmZ3bm9kZSkgewotCQlpZiAoIWZ3bm9kZV9wcm9w
ZXJ0eV9wcmVzZW50KGNvbi0+Zndub2RlLCBjb24tPmlkKSkKKwkJaWYgKCFmd25vZGVfaXNfY29t
cGF0aWJsZShjb24tPmZ3bm9kZSwgY29uLT5pZCkpCiAJCQlyZXR1cm4gTlVMTDsKIAogCQlkZXYg
PSBjbGFzc19maW5kX2RldmljZShyb2xlX2NsYXNzLCBOVUxMLCBjb24tPmZ3bm9kZSwK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,4/5] usb: dwc3: drd: Switch to device property for 'extcon' handling
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-Id: <20181110181101.24557-4-andriy.shevchenko@linux.intel.com>
Date: Sat, 10 Nov 2018 20:11:00 +0200
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Roger Quadros <rogerq@ti.com>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-ID: <linux-usb.vger.kernel.org>

U3dpdGNoIHRvIGRldmljZSBwcm9wZXJ0eSBmb3IgJ2V4dGNvbicgaGFuZGxpbmcuCk5vIGZ1bmN0
aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxh
bmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy91c2IvZHdjMy9k
cmQuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kcmQuYyBiL2RyaXZlcnMvdXNi
L2R3YzMvZHJkLmMKaW5kZXggZTdlNDIxNTIxYTM0Li41ZGM0Y2RkZDViNjggMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdXNiL2R3YzMvZHJkLmMKKysrIGIvZHJpdmVycy91c2IvZHdjMy9kcmQuYwpAQCAt
MTAsNiArMTAsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2V4dGNvbi5oPgogI2luY2x1ZGUgPGxpbnV4
L29mX2dyYXBoLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVk
ZSA8bGludXgvcHJvcGVydHkuaD4KIAogI2luY2x1ZGUgImRlYnVnLmgiCiAjaW5jbHVkZSAiY29y
ZS5oIgpAQCAtNDg1LDggKzQ4Niw4IEBAIHN0YXRpYyBzdHJ1Y3QgZXh0Y29uX2RldiAqZHdjM19n
ZXRfZXh0Y29uKHN0cnVjdCBkd2MzICpkd2MpCiAJc3RydWN0IGRldmljZV9ub2RlICpucF9waHks
ICpucF9jb25uOwogCXN0cnVjdCBleHRjb25fZGV2ICplZGV2OwogCi0JaWYgKG9mX3Byb3BlcnR5
X3JlYWRfYm9vbChkZXYtPm9mX25vZGUsICJleHRjb24iKSkKLQkJcmV0dXJuIGV4dGNvbl9nZXRf
ZWRldl9ieV9waGFuZGxlKGR3Yy0+ZGV2LCAwKTsKKwlpZiAoZGV2aWNlX3Byb3BlcnR5X3JlYWRf
Ym9vbChkZXYsICJleHRjb24iKSkKKwkJcmV0dXJuIGV4dGNvbl9nZXRfZWRldl9ieV9waGFuZGxl
KGRldiwgMCk7CiAKIAlucF9waHkgPSBvZl9wYXJzZV9waGFuZGxlKGRldi0+b2Zfbm9kZSwgInBo
eXMiLCAwKTsKIAlucF9jb25uID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG5wX3BoeSwgLTEs
IC0xKTsK

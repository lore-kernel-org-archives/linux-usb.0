Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,08/10] spi: s3c64xx: samsung: Remove support for Exynos5440
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <20180424203239.21885-9-krzk@kernel.org>
Date: Tue, 24 Apr 2018 22:32:37 +0200
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIEV4eW5vczU0NDAgaXMgbm90IGFjdGl2ZWx5IGRldmVsb3BlZCwgdGhlcmUgYXJlIG5vIGRl
dmVsb3BtZW50CmJvYXJkcyBhdmFpbGFibGUgYW5kIHByb2JhYmx5IHRoZXJlIGFyZSBubyByZWFs
IHByb2R1Y3RzIHdpdGggaXQuClJlbW92ZSB3aWRlLXRyZWUgc3VwcG9ydCBmb3IgRXh5bm9zNTQ0
MC4KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL3NwaS9zcGktczNjNjR4eC5jIHwgMTIgLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXMz
YzY0eHguYyBiL2RyaXZlcnMvc3BpL3NwaS1zM2M2NHh4LmMKaW5kZXggNzU1YWIyZGM2OTY5Li5m
NTVkYzc4OTU3YWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1zM2M2NHh4LmMKKysrIGIv
ZHJpdmVycy9zcGkvc3BpLXMzYzY0eHguYwpAQCAtMTM3NiwxNSArMTM3Niw2IEBAIHN0YXRpYyBz
dHJ1Y3QgczNjNjR4eF9zcGlfcG9ydF9jb25maWcgZXh5bm9zNF9zcGlfcG9ydF9jb25maWcgPSB7
CiAJLmNsa19mcm9tX2NtdQk9IHRydWUsCiB9OwogCi1zdGF0aWMgc3RydWN0IHMzYzY0eHhfc3Bp
X3BvcnRfY29uZmlnIGV4eW5vczU0NDBfc3BpX3BvcnRfY29uZmlnID0gewotCS5maWZvX2x2bF9t
YXNrCT0geyAweDFmZiB9LAotCS5yeF9sdmxfb2Zmc2V0CT0gMTUsCi0JLnR4X3N0X2RvbmUJPSAy
NSwKLQkuaGlnaF9zcGVlZAk9IHRydWUsCi0JLmNsa19mcm9tX2NtdQk9IHRydWUsCi0JLnF1aXJr
cwkJPSBTM0M2NFhYX1NQSV9RVUlSS19QT0xMLAotfTsKLQogc3RhdGljIHN0cnVjdCBzM2M2NHh4
X3NwaV9wb3J0X2NvbmZpZyBleHlub3M3X3NwaV9wb3J0X2NvbmZpZyA9IHsKIAkuZmlmb19sdmxf
bWFzawk9IHsgMHgxZmYsIDB4N0YsIDB4N0YsIDB4N0YsIDB4N0YsIDB4MWZmfSwKIAkucnhfbHZs
X29mZnNldAk9IDE1LApAQCAtMTQyOCw5ICsxNDE5LDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgczNjNjR4eF9zcGlfZHRfbWF0Y2hbXSA9IHsKIAl7IC5jb21wYXRpYmxlID0g
InNhbXN1bmcsZXh5bm9zNDIxMC1zcGkiLAogCQkJLmRhdGEgPSAodm9pZCAqKSZleHlub3M0X3Nw
aV9wb3J0X2NvbmZpZywKIAl9LAotCXsgLmNvbXBhdGlibGUgPSAic2Ftc3VuZyxleHlub3M1NDQw
LXNwaSIsCi0JCQkuZGF0YSA9ICh2b2lkICopJmV4eW5vczU0NDBfc3BpX3BvcnRfY29uZmlnLAot
CX0sCiAJeyAuY29tcGF0aWJsZSA9ICJzYW1zdW5nLGV4eW5vczctc3BpIiwKIAkJCS5kYXRhID0g
KHZvaWQgKikmZXh5bm9zN19zcGlfcG9ydF9jb25maWcsCiAJfSwK

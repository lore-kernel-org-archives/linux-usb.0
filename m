Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,02/10] ata: ahci-platform: Remove support for Exynos5440
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <20180424203239.21885-3-krzk@kernel.org>
Date: Tue, 24 Apr 2018 22:32:31 +0200
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIEV4eW5vczU0NDAgaXMgbm90IGFjdGl2ZWx5IGRldmVsb3BlZCwgdGhlcmUgYXJlIG5vIGRl
dmVsb3BtZW50CmJvYXJkcyBhdmFpbGFibGUgYW5kIHByb2JhYmx5IHRoZXJlIGFyZSBubyByZWFs
IHByb2R1Y3RzIHdpdGggaXQuClJlbW92ZSB3aWRlLXRyZWUgc3VwcG9ydCBmb3IgRXh5bm9zNTQ0
MC4KClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4K
LS0tCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXRhL2FoY2ktcGxhdGZvcm0u
dHh0IHwgMSAtCiBkcml2ZXJzL2F0YS9haGNpX3BsYXRmb3JtLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9haGNpLXBsYXRmb3Jt
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvYWhjaS1wbGF0Zm9y
bS50eHQKaW5kZXggYzc2MGVjYjgxMzgxLi42NjM3NjY2ODU4MTggMTAwNjQ0Ci0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvYWhjaS1wbGF0Zm9ybS50eHQKKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9haGNpLXBsYXRmb3JtLnR4dApA
QCAtMTcsNyArMTcsNiBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgogICAtICJtYXJ2ZWxsLGFybWFk
YS0zODAtYWhjaSIKICAgLSAibWFydmVsbCxhcm1hZGEtMzcwMC1haGNpIgogICAtICJzbnBzLGR3
Yy1haGNpIgotICAtICJzbnBzLGV4eW5vczU0NDAtYWhjaSIKICAgLSAic25wcyxzcGVhci1haGNp
IgogICAtICJnZW5lcmljLWFoY2kiCiAtIGludGVycnVwdHMgICAgICAgIDogPGludGVycnVwdCBt
YXBwaW5nIGZvciBTQVRBIElSUT4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvYXRhL2FoY2lfcGxhdGZv
cm0uYyBiL2RyaXZlcnMvYXRhL2FoY2lfcGxhdGZvcm0uYwppbmRleCA5OWY5YTg5NWE0NTkuLjU2
NDU3MGVhM2UyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9hdGEvYWhjaV9wbGF0Zm9ybS5jCisrKyBi
L2RyaXZlcnMvYXRhL2FoY2lfcGxhdGZvcm0uYwpAQCAtNzUsNyArNzUsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBhaGNpX29mX21hdGNoW10gPSB7CiAJeyAuY29tcGF0aWJs
ZSA9ICJnZW5lcmljLWFoY2kiLCB9LAogCS8qIEtlZXAgdGhlIGZvbGxvd2luZyBjb21wYXRpYmxl
cyBmb3IgZGV2aWNlIHRyZWUgY29tcGF0aWJpbGl0eSAqLwogCXsgLmNvbXBhdGlibGUgPSAic25w
cyxzcGVhci1haGNpIiwgfSwKLQl7IC5jb21wYXRpYmxlID0gInNucHMsZXh5bm9zNTQ0MC1haGNp
IiwgfSwKIAl7IC5jb21wYXRpYmxlID0gImlibSw0NzZndHItYWhjaSIsIH0sCiAJeyAuY29tcGF0
aWJsZSA9ICJzbnBzLGR3Yy1haGNpIiwgfSwKIAl7IC5jb21wYXRpYmxlID0gImhpc2lsaWNvbixo
aXNpLWFoY2kiLCB9LAo=

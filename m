Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,03/10] cpufreq: exynos: Remove support for Exynos5440
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <20180425024824.7ej2sz5jlbiuqeqh@vireshk-i7>
Date: Wed, 25 Apr 2018 08:18:24 +0530
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMjQtMDQtMTgsIDIyOjMyLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IFRoZSBFeHlu
b3M1NDQwIGlzIG5vdCBhY3RpdmVseSBkZXZlbG9wZWQsIHRoZXJlIGFyZSBubyBkZXZlbG9wbWVu
dAo+IGJvYXJkcyBhdmFpbGFibGUgYW5kIHByb2JhYmx5IHRoZXJlIGFyZSBubyByZWFsIHByb2R1
Y3RzIHdpdGggaXQuCj4gUmVtb3ZlIHdpZGUtdHJlZSBzdXBwb3J0IGZvciBFeHlub3M1NDQwLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4K
PiAtLS0KPiAgLi4uL2JpbmRpbmdzL2NwdWZyZXEvY3B1ZnJlcS1leHlub3M1NDQwLnR4dCAgICAg
ICAgfCAgMjggLS0KPiAgZHJpdmVycy9jcHVmcmVxL0tjb25maWcuYXJtICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMTQgLQo+ICBkcml2ZXJzL2NwdWZyZXEvTWFrZWZpbGUgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvY3B1ZnJlcS9leHlub3M1NDQwLWNwdWZy
ZXEuYyAgICAgICAgICAgICAgIHwgNDUyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICA0IGZpbGVz
IGNoYW5nZWQsIDQ5NSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcHVmcmVxL2NwdWZyZXEtZXh5bm9zNTQ0MC50eHQK
PiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY3B1ZnJlcS9leHlub3M1NDQwLWNwdWZyZXEu
YwoKQWNrZWQtYnk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Cg==

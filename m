Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,03/10] cpufreq: exynos: Remove support for Exynos5440
From: Rob Herring <robh@kernel.org>
Message-Id: <20180501140840.GA27306@rob-hp-laptop>
Date: Tue, 1 May 2018 09:08:40 -0500
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMTA6MzI6MzJQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgRXh5bm9zNTQ0MCBpcyBub3QgYWN0aXZlbHkgZGV2ZWxvcGVkLCB0
aGVyZSBhcmUgbm8gZGV2ZWxvcG1lbnQKPiBib2FyZHMgYXZhaWxhYmxlIGFuZCBwcm9iYWJseSB0
aGVyZSBhcmUgbm8gcmVhbCBwcm9kdWN0cyB3aXRoIGl0Lgo+IFJlbW92ZSB3aWRlLXRyZWUgc3Vw
cG9ydCBmb3IgRXh5bm9zNTQ0MC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9jcHVmcmVxL2NwdWZy
ZXEtZXh5bm9zNTQ0MC50eHQgICAgICAgIHwgIDI4IC0tCj4gIGRyaXZlcnMvY3B1ZnJlcS9LY29u
ZmlnLmFybSAgICAgICAgICAgICAgICAgICAgICAgIHwgIDE0IC0KPiAgZHJpdmVycy9jcHVmcmVx
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgLQo+ICBkcml2ZXJzL2Nw
dWZyZXEvZXh5bm9zNTQ0MC1jcHVmcmVxLmMgICAgICAgICAgICAgICB8IDQ1MiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA0OTUgZGVsZXRpb25zKC0pCj4gIGRlbGV0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY3B1ZnJlcS9j
cHVmcmVxLWV4eW5vczU0NDAudHh0Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2NwdWZy
ZXEvZXh5bm9zNTQ0MC1jcHVmcmVxLmMKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxp
bmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1h
am9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3Zn
ZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==

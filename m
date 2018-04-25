Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,09/10] usb: host: exynos: Remove support for Exynos5440
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180425120407.GA6582@kroah.com>
Date: Wed, 25 Apr 2018 14:04:07 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMTA6MzI6MzhQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgRXh5bm9zNTQ0MCBpcyBub3QgYWN0aXZlbHkgZGV2ZWxvcGVkLCB0
aGVyZSBhcmUgbm8gZGV2ZWxvcG1lbnQKPiBib2FyZHMgYXZhaWxhYmxlIGFuZCBwcm9iYWJseSB0
aGVyZSBhcmUgbm8gcmVhbCBwcm9kdWN0cyB3aXRoIGl0Lgo+IFJlbW92ZSB3aWRlLXRyZWUgc3Vw
cG9ydCBmb3IgRXh5bm9zNTQ0MC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvdXNiL2hvc3QvZWhjaS1leHlu
b3MuYyB8IDcgLS0tLS0tLQo+ICBkcml2ZXJzL3VzYi9ob3N0L29oY2ktZXh5bm9zLmMgfCA2IC0t
LS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEdy
ZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQpUbyB1bnN1
YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgt
dXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9y
ZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9t
by1pbmZvLmh0bWwK

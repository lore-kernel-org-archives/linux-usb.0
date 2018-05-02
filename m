Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,07/10] pinctrl: samsung: Remove support for Exynos5440
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <20180502170937.bqnzjk4e2h3k7t4j@kozik-lap>
Date: Wed, 2 May 2018 19:09:37 +0200
To: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMTA6MzI6MzZQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgRXh5bm9zNTQ0MCBpcyBub3QgYWN0aXZlbHkgZGV2ZWxvcGVkLCB0
aGVyZSBhcmUgbm8gZGV2ZWxvcG1lbnQKPiBib2FyZHMgYXZhaWxhYmxlIGFuZCBwcm9iYWJseSB0
aGVyZSBhcmUgbm8gcmVhbCBwcm9kdWN0cyB3aXRoIGl0Lgo+IFJlbW92ZSB3aWRlLXRyZWUgc3Vw
cG9ydCBmb3IgRXh5bm9zNTQ0MC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvcGluY3RybC9zYW1zdW5nL0tj
b25maWcgICAgICAgICAgICAgIHwgICAxMCArLQo+ICBkcml2ZXJzL3BpbmN0cmwvc2Ftc3VuZy9N
YWtlZmlsZSAgICAgICAgICAgICB8ICAgIDEgLQo+ICBkcml2ZXJzL3BpbmN0cmwvc2Ftc3VuZy9w
aW5jdHJsLWV4eW5vczU0NDAuYyB8IDEwMDUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEwMTQgZGVsZXRpb25zKC0pCj4gIGRl
bGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BpbmN0cmwvc2Ftc3VuZy9waW5jdHJsLWV4eW5vczU0
NDAuYwo+IAoKQXBwbGllZC4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCi0tLQpUbyB1bnN1YnNj
cmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNi
IiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpN
b3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1p
bmZvLmh0bWwK

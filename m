Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: thermal: samsung: Remove support for Exynos5440
From: Rob Herring <robh@kernel.org>
Message-Id: <20180501144516.GA519@rob-hp-laptop>
Date: Tue, 1 May 2018 09:45:16 -0500
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMjYsIDIwMTggYXQgMDE6MjE6MTJQTSArMDIwMCwgQmFydGxvbWllaiBab2xu
aWVya2lld2ljeiB3cm90ZToKPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+Cj4gU3ViamVjdDogW1BBVENIXSB0aGVybWFsOiBzYW1zdW5nOiBSZW1vdmUgc3VwcG9y
dCBmb3IgRXh5bm9zNTQ0MAo+IAo+IFRoZSBFeHlub3M1NDQwIGlzIG5vdCBhY3RpdmVseSBkZXZl
bG9wZWQsIHRoZXJlIGFyZSBubyBkZXZlbG9wbWVudAo+IGJvYXJkcyBhdmFpbGFibGUgYW5kIHBy
b2JhYmx5IHRoZXJlIGFyZSBubyByZWFsIHByb2R1Y3RzIHdpdGggaXQuCj4gUmVtb3ZlIHdpZGUt
dHJlZSBzdXBwb3J0IGZvciBFeHlub3M1NDQwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiBbYi56b2xuaWVya2llOiBwb3J0ZWQgb3Zl
ciBkcml2ZXIgY2hhbmdlc10KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3
aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gRWR1YXJkbywgaGVyZSBpcyBh
IHZlcnNpb24gd2hpY2ggYXBwbGllcyBvbiB0b3Agb2YgcGVuZGluZyBFeHlub3MKPiB0aGVybWFs
IGNoYW5nZXMgKGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzQvMTYvMjU2KS4KPiAKPiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RoZXJtYWwvZXh5bm9zLXRoZXJtYWwudHh0
IHwgICAxNCAKPiAgZHJpdmVycy90aGVybWFsL3NhbXN1bmcvZXh5bm9zX3RtdS5jICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDE2MSAtLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMTcxIGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2Vu
ZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3Nh
Z2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBo
dHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

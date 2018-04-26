Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,06/10] thermal: samsung: Remove support for Exynos5440
From: Chanwoo Choi <cw00.choi@samsung.com>
Message-Id: <5AE12E4A.90907@samsung.com>
Date: Thu, 26 Apr 2018 10:41:30 +0900
To: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgS3J6eXN6dG9mLAoKT24gMjAxOOuFhCAwNOyblCAyNeydvCAwNTozMiwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPiBUaGUgRXh5bm9zNTQ0MCBpcyBub3QgYWN0aXZlbHkgZGV2ZWxvcGVk
LCB0aGVyZSBhcmUgbm8gZGV2ZWxvcG1lbnQKPiBib2FyZHMgYXZhaWxhYmxlIGFuZCBwcm9iYWJs
eSB0aGVyZSBhcmUgbm8gcmVhbCBwcm9kdWN0cyB3aXRoIGl0Lgo+IFJlbW92ZSB3aWRlLXRyZWUg
c3VwcG9ydCBmb3IgRXh5bm9zNTQ0MC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RoZXJtYWwvZXh5bm9zLXRoZXJtYWwudHh0IHwgIDE0ICstCj4gIGRyaXZlcnMvdGhlcm1hbC9z
YW1zdW5nL2V4eW5vc190bXUuYyAgICAgICAgICAgICAgIHwgMTU1ICstLS0tLS0tLS0tLS0tLS0t
LS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvc2Ftc3VuZy9leHlub3NfdG11LmggICAgICAgICAgICAg
ICB8ICAgMSAtCj4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNjYgZGVsZXRp
b25zKC0pCgoKQWZ0ZXIgYXBwbGllZCB0aGlzIHBhdGNoLCBJIHRlc3RlZCB0aGUgYnVpbGQgYW5k
IGZvdW5kIG91dAonZXh5bm9zNTQ0MCcga2V5d29yZC4gVGhlcmUgaXMgb25lIGNvbW1lbnQgaW5j
bHVkaW5nICdleHlub3M1NDQwJyBhcyBmb2xsb3dpbmc6CgoKQWZ0ZXIgcmVtb3ZpbmcgaXQsIGxv
b2tzIGdvb2QgdG8gbWUuClJldmlld2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1z
dW5nLmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvc2Ftc3VuZy9leHlub3NfdG11
LmMgYi9kcml2ZXJzL3RoZXJtYWwvc2Ftc3VuZy9leHlub3NfdG11LmMKaW5kZXggZjkyZjQ3MGJj
ZTIxLi5jYjUyNTIyOGNmZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGhlcm1hbC9zYW1zdW5nL2V4
eW5vc190bXUuYworKysgYi9kcml2ZXJzL3RoZXJtYWwvc2Ftc3VuZy9leHlub3NfdG11LmMKQEAg
LTk0Myw3ICs5NDMsNyBAQCBzdGF0aWMgdm9pZCBleHlub3M0MjEwX3RtdV9jbGVhcl9pcnFzKHN0
cnVjdCBleHlub3NfdG11X2RhdGEgKmRhdGEpCiAgICAgICAgICogRXh5bm9zMzI1MCwgRXh5bm9z
NDQxMiwgRXh5bm9zNTI1MCBhbmQgRXh5bm9zNTI2MCBpbmNvcnJlY3RseQogICAgICAgICAqIHN0
YXRlcyB0aGF0IElOVENMRUFSIHJlZ2lzdGVyIGhhcyBhIGRpZmZlcmVudCBwbGFjaW5nIG9mIGJp
dHMKICAgICAgICAgKiByZXNwb25zaWJsZSBmb3IgRkFMTCBJUlFzIHRoYW4gSU5UU1RBVCByZWdp
c3Rlci4gIEV4eW5vczU0MjAKLSAgICAgICAgKiBhbmQgRXh5bm9zNTQ0MCBkb2N1bWVudGF0aW9u
IGlzIGNvcnJlY3QgKEV4eW5vczQyMTAgZG9lc24ndAorICAgICAgICAqIGRvY3VtZW50YXRpb24g
aXMgY29ycmVjdCAoRXh5bm9zNDIxMCBkb2Vzbid0CiAgICAgICAgICogc3VwcG9ydCBGQUxMIElS
UXMgYXQgYWxsKS4KICAgICAgICAgKi8KICAgICAgICB3cml0ZWwodmFsX2lycSwgZGF0YS0+YmFz
ZSArIHRtdV9pbnRjbGVhcik7Cg==

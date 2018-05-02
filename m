Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,01/10] ARM: dts: exynos: Remove Exynos5440
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-Id: <20180502170751.5ci6hgvtlytwyvqh@kozik-lap>
Date: Wed, 2 May 2018 19:07:51 +0200
To: Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tejun Heo <tj@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede <hdegoede@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMTA6MzI6MzBQTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgRXh5bm9zNTQ0MCAocXVhZC1jb3JlIEExNSB3aXRoIEdNQUMsIFBD
SWUsIFNBVEEpIHdhcyB0YXJnZXRpbmcKPiBzZXJ2ZXIgcGxhdGZvcm1zIGJ1dCBpdCBkaWQgbm90
IG1ha2UgaXQgdG8gdGhlIG1hcmtldCByZWFsbHkuICBUaGVyZSBhcmUKPiBubyBkZXZlbG9wbWVu
dCBib2FyZHMgd2l0aCBpdCBhbmQgcHJvYmFibHkgdGhlcmUgYXJlIG5vIHJlYWwgcHJvZHVjdHMK
PiBuZWl0aGVyLiAgVGhlIGRldmVsb3BtZW50IGZvciBFeHlub3M1NDQwIGVuZGVkIGluIDIwMTMg
YW5kIHNpbmNlIHRoZW4KPiB0aGUgcGxhdGZvcm0gaXMgaW4gbWFpbnRlbmFuY2UgbW9kZS4KPiAK
PiBSZW1vdmUgYWxsIERldmljZSBUcmVlIHNvdXJjZXMgZm9yIEV4eW5vczU0NDAsIGFzIGZpcnN0
IHN0ZXAgb2YgcmVtb3ZhbAo+IG9mIHRoZSBwbGF0Zm9ybSB0byBzaW1wbGlmeSB0aGUgY29kZSBh
bmQgZHJpdmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9hcm0vc2Ftc3VuZy9zYW1zdW5nLWJv
YXJkcy50eHQgICAgICAgIHwgICAyIC0KPiAgYXJjaC9hcm0vYm9vdC9kdHMvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgLQo+ICBhcmNoL2FybS9ib290L2R0cy9leHlub3M1
NDQwLXNkNXYxLmR0cyAgICAgICAgICAgICB8ICA0MiAtLS0KPiAgYXJjaC9hcm0vYm9vdC9kdHMv
ZXh5bm9zNTQ0MC1zc2RrNTQ0MC5kdHMgICAgICAgICAgfCAgODEgLS0tLS0KPiAgYXJjaC9hcm0v
Ym9vdC9kdHMvZXh5bm9zNTQ0MC10bXUtc2Vuc29yLWNvbmYuZHRzaSAgfCAgMjAgLS0KPiAgYXJj
aC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQ0MC10cmlwLXBvaW50cy5kdHNpICAgICAgfCAgMjEgLS0K
PiAgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQ0MC5kdHNpICAgICAgICAgICAgICAgICAgfCAz
NTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDcgZmlsZXMgY2hhbmdlZCwgNTIzIGRlbGV0aW9u
cygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQ0MC1z
ZDV2MS5kdHMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0
NDAtc3NkazU0NDAuZHRzCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9l
eHlub3M1NDQwLXRtdS1zZW5zb3ItY29uZi5kdHNpCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybS9ib290L2R0cy9leHlub3M1NDQwLXRyaXAtcG9pbnRzLmR0c2kKPiAgZGVsZXRlIG1vZGUg
MTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0NDAuZHRzaQo+IAoKQXBwbGllZC4KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDog
c2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1l
c3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0
ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

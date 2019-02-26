Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1] usb: chipidea: tegra: Fix missed ci_hdrc_remove_device()
From: Dmitry Osipenko <digetx@gmail.com>
Message-Id: <e7693387-9ac5-b2d8-0a0f-d507dfe05830@gmail.com>
Date: Tue, 26 Feb 2019 17:33:05 +0300
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>
Cc: Peter Chen <peter.chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

MjYuMDIuMjAxOSAxMzo1NiwgR3JlZyBLcm9haC1IYXJ0bWFuINC/0LjRiNC10YI6Cj4gT24gTW9u
LCBGZWIgMjUsIDIwMTkgYXQgMDg6MDc6MTVBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3Rl
Ogo+PiDQkiBNb24sIDI1IEZlYiAyMDE5IDAyOjI3OjE5ICswMDAwCj4+IFBldGVyIENoZW4gPHBl
dGVyLmNoZW5AbnhwLmNvbT4g0L/QuNGI0LXRgjoKPj4KPj4+ICAKPj4+Pgo+Pj4+IEZpeGVzOiBk
ZmViYjVmNDNhNzg4MjdhICgidXNiOiBjaGlwaWRlYTogQWRkIHN1cHBvcnQgZm9yCj4+Pj4gVGVn
cmEyMC8zMC8xMTQvMTI0IikgIAo+Pj4KPj4+IEkgc3VwcG9zZSB5b3UgbmVlZCB0byBhcHBseSBh
dCBzdGFibGUgdHJlZSB0b28sIHJpZ2h0Pwo+Pj4KPj4KPj4gSXQgaXMgZW5vdWdoIHRvIGhhdmUg
dGhlICJGaXhlcyIgdGFnIHRvIGdldCBwYXRjaCBiYWNrcG9ydGVkIGludG8gYWxsCj4+IHJlbGV2
YW50IGtlcm5lbCB2ZXJzaW9ucy4KPiAKPiBObyBpdCBpcyBub3QuICBNeSBzY3JpcHRzIGRvIE5P
VCB0cmlnZ2VyIG9mZiBvZiB0aGUgZml4ZXM6IHRhZywgcGxlYXNlCj4gcmVhZDoKPiAgICAgaHR0
cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdGFibGUta2VybmVs
LXJ1bGVzLmh0bWwKPiBmb3IgaG93IHRvIGRvIHRoaXMgcHJvcGVybHkuCgpPa2F5LCBteSBiYWQg
dGhlbi4gTWF5YmUgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBjb3VsZCB3YXJuZWQgYnkgY2hlY2tw
YXRjaC4uIGFkZGluZyBKb2UgYW5kIEFuZHkgdG8gdGhlIHRocmVhZC4K

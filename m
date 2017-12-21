Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1] usb: chipidea: tegra: Use aligned DMA on Tegra30
From: Peter Chen <peter.chen@nxp.com>
Message-Id: <HE1PR04MB1450F7254808F7C7D63E098A8B0D0@HE1PR04MB1450.eurprd04.prod.outlook.com>
Date: Thu, 21 Dec 2017 01:43:45 +0000
To: Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

PiBPbiBUdWUsIERlYyAxOSwgMjAxNyBhdCAwNTo1ODowN0FNICswMzAwLCBEbWl0cnkgT3NpcGVu
a28gd3JvdGU6Cj4gPiBVU0IgRXRoZXJuZXQgZ2FkZ2V0IG5vdyB3b3JrcyBvbiBUZWdyYTMwLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4K
PiA+IC0tLQo+ID4gIGRyaXZlcnMvdXNiL2NoaXBpZGVhL2NpX2hkcmNfdGVncmEuYyB8IDIgKy0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBB
Y2tlZC1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFwcGxpZWQsIHRo
YW5rcy4KClBldGVyCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUg
bGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8g
bWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8v
dmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

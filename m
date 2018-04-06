Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [usb-next,v11,3/8] usb: core: add a wrapper for the USB PHYs on the HCD
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Message-Id: <CAK7LNAQ=ke2MJVx2Fs-bSAO40QT7ceMNfPXJy2AOREfNb_7r_g@mail.gmail.com>
Date: Fri, 6 Apr 2018 17:28:52 +0900
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Linux-OMAP <linux-omap@vger.kernel.org>, linux-tegra@vger.kernel.org, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Alan Stern <stern@rowland.harvard.edu>, Tony Prisk <linux@prisktech.co.nz>, Peter.Chen@nxp.com, Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, yixun.lan@amlogic.com, Chunfeng Yun <chunfeng.yun@mediatek.com>
List-ID: <linux-usb.vger.kernel.org>

MjAxOC0wNC0wNiAxNDoxNSBHTVQrMDk6MDAgTWFydGluIEJsdW1lbnN0aW5nbAo8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT46Cgo+Pgo+PiBXaGVuIHdpbGwgdGhpcyBiZSBhdmFp
bGFibGUgaW4gTGludXMnIHRyZWU/ICAgSW4gdGhlIGN1cnJlbnQgTVc/Cj4gdGhpcyBpcyBhbHJl
YWR5IGF2YWlsYWJsZSBpbiBMaW51cycgdHJlZS4gdGhlIGNvbW1pdCBmb3IgdGhpcyBzcGVjaWZp
Ywo+IHBhdGNoICgjMykgaXMga25vd24gYXMgMDdkYmZmMGRkYmQ4NmMKCgpPaCwgZ3JlYXQhICBU
aGFuayB5b3UuCgoKCj4+IFN1cmUsIEkgY2FuIHNlbmQgYSBwYXRjaCBhZnRlciBzb21lIGZsYXdz
IGFyZSBpcm9uZWQtb3V0Lgo+IGdyZWF0LCB0aGFuayB5b3UhCj4gY291bGQgeW91IGFsc28gbGV0
IG1lIGtub3cgb25jZSB5b3UgaGF2ZSB0ZXN0ZWQgdGhpcyBvbiBvbmUgb2YgeW91ciBTb0NzPwoK
SSB3aWxsLgo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/4] ARM: dts: rockchip: Add quirk for resetting rk3288's dwc2 host on wakeup
From: Doug Anderson <dianders@chromium.org>
Message-Id: <20190416215351.242246-5-dianders@chromium.org>
Date: Tue, 16 Apr 2019 14:53:51 -0700
To: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, mka@chromium.org, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

VGhlICJob3N0IiBVU0IgcG9ydCBvbiByazMyODggaGFzIGEgaGFyZHdhcmUgZXJyYXRhIHdoZXJl
IHdlJ3ZlIGdvdCB0bwphc3NlcnQgYSBQSFkgcmVzZXQgd2hlbmV2ZXIgd2Ugc2VlIGEgcmVtb3Rl
IHdha2V1cC4gIEFkZCB0aGF0IHF1aXJrCnByb3BlcnR5IHRvIHRoZSBkZXZpY2UgdHJlZS4KClNp
Z25lZC1vZmYtYnk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KUmV2
aWV3ZWQtYnk6IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgotLS0KCkNoYW5n
ZXMgaW4gdjI6IE5vbmUKCiBhcmNoL2FybS9ib290L2R0cy9yazMyODguZHRzaSB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvcmszMjg4LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yazMyODguZHRzaQppbmRleCA3ZTcw
ZWNmMmI5NWEuLmFhMDE3YWJmNGY0MiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmsz
Mjg4LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmszMjg4LmR0c2kKQEAgLTYyMSw2ICs2
MjEsNyBAQAogCQlkcl9tb2RlID0gImhvc3QiOwogCQlwaHlzID0gPCZ1c2JwaHkyPjsKIAkJcGh5
LW5hbWVzID0gInVzYjItcGh5IjsKKwkJc25wcyxyZXNldC1waHktb24td2FrZTsKIAkJc3RhdHVz
ID0gImRpc2FibGVkIjsKIAl9OwogCg==

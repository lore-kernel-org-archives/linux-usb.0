Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2,3/6] usb: xhci: xhci-plat: Add support for Broadcom STB SoC's
From: kbuild test robot <lkp@intel.com>
Message-Id: <201810190028.sduFtg5C%fengguang.wu@intel.com>
Date: Fri, 19 Oct 2018 00:49:15 +0800
To: Al Cooper <alcooperx@gmail.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgQWwsCgpJIGxvdmUgeW91ciBwYXRjaCEgWWV0IHNvbWV0aGluZyB0byBpbXByb3ZlOgoKW2F1
dG8gYnVpbGQgdGVzdCBFUlJPUiBvbiB1c2IvdXNiLXRlc3RpbmddClthbHNvIGJ1aWxkIHRlc3Qg
RVJST1Igb24gdjQuMTktcmM4IG5leHQtMjAxODEwMThdCltpZiB5b3VyIHBhdGNoIGlzIGFwcGxp
ZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBwbGVhc2UgZHJvcCB1cyBhIG5vdGUgdG8gaGVscCBp
bXByb3ZlIHRoZSBzeXN0ZW1dCgp1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xp
bnV4L2NvbW1pdHMvQWwtQ29vcGVyL0FkZC1YSENJLUVIQ0ktYW5kLU9IQ0ktc3VwcG9ydC1mb3It
QnJvYWRjb20tU1RCLVNvUy1zLzIwMTgxMDE5LTAwMTEzMgpiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC91c2IuZ2l0IHVzYi10ZXN0
aW5nCmNvbmZpZzogeDg2XzY0LXJhbmRjb25maWcteDAxNy0yMDE4NDEgKGF0dGFjaGVkIGFzIC5j
b25maWcpCmNvbXBpbGVyOiBnY2MtNyAoRGViaWFuIDcuMy4wLTEpIDcuMy4wCnJlcHJvZHVjZToK
ICAgICAgICAjIHNhdmUgdGhlIGF0dGFjaGVkIC5jb25maWcgdG8gbGludXggYnVpbGQgdHJlZQog
ICAgICAgIG1ha2UgQVJDSD14ODZfNjQgCgpOb3RlOiB0aGUgbGludXgtcmV2aWV3L0FsLUNvb3Bl
ci9BZGQtWEhDSS1FSENJLWFuZC1PSENJLXN1cHBvcnQtZm9yLUJyb2FkY29tLVNUQi1Tb1Mtcy8y
MDE4MTAxOS0wMDExMzIgSEVBRCA4MGFlZGYyMDM3YTZjNjk3YmZlMjE5M2ZmYmI2MzVlNGFiMjZh
MGI2IGJ1aWxkcyBmaW5lLgogICAgICBJdCBvbmx5IGh1cnRzIGJpc2VjdGliaWxpdHkuCgpBbGwg
ZXJyb3JzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cgo+PiBkcml2ZXJzL3VzYi8vaG9zdC94
aGNpLXBsYXQuYzoxMTc6MTY6IGVycm9yOiAneGhjaV9wbGF0X2JyY21faW5pdF9xdWlyaycgdW5k
ZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAneGhjaV9icmNt
X2luaXRfcXVpcmsnPwogICAgIC5pbml0X3F1aXJrID0geGhjaV9wbGF0X2JyY21faW5pdF9xdWly
awogICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogICAgICAgICAg
ICAgICAgICAgeGhjaV9icmNtX2luaXRfcXVpcmsKCnZpbSArMTE3IGRyaXZlcnMvdXNiLy9ob3N0
L3hoY2ktcGxhdC5jCgogICAxMTUJCiAgIDExNglzdGF0aWMgY29uc3Qgc3RydWN0IHhoY2lfcGxh
dF9wcml2IHhoY2lfcGxhdF9icmNtID0gewogPiAxMTcJCS5pbml0X3F1aXJrID0geGhjaV9wbGF0
X2JyY21faW5pdF9xdWlyawogICAxMTgJfTsKICAgMTE5Ci0tLQowLURBWSBrZXJuZWwgdGVzdCBp
bmZyYXN0cnVjdHVyZSAgICAgICAgICAgICAgICBPcGVuIFNvdXJjZSBUZWNobm9sb2d5IENlbnRl
cgpodHRwczovL2xpc3RzLjAxLm9yZy9waXBlcm1haWwva2J1aWxkLWFsbCAgICAgICAgICAgICAg
ICAgICBJbnRlbCBDb3Jwb3JhdGlvbgo=

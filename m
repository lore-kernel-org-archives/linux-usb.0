Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2,3/6] usb: xhci: xhci-plat: Add support for Broadcom STB SoC's
From: kbuild test robot <lkp@intel.com>
Message-Id: <201810191215.VkpbsNNM%fengguang.wu@intel.com>
Date: Fri, 19 Oct 2018 12:53:24 +0800
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
aW5nCmNvbmZpZzogaTM4Ni1yYW5kY29uZmlnLXMyLTIwMTg0MSAoYXR0YWNoZWQgYXMgLmNvbmZp
ZykKY29tcGlsZXI6IGdjYy02IChEZWJpYW4gNi40LjAtOSkgNi40LjAgMjAxNzEwMjYKcmVwcm9k
dWNlOgogICAgICAgICMgc2F2ZSB0aGUgYXR0YWNoZWQgLmNvbmZpZyB0byBsaW51eCBidWlsZCB0
cmVlCiAgICAgICAgbWFrZSBBUkNIPWkzODYgCgpBbGwgZXJyb3JzIChuZXcgb25lcyBwcmVmaXhl
ZCBieSA+Pik6Cgo+PiBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jOjExNzoxNjogZXJyb3I6
ICd4aGNpX3BsYXRfYnJjbV9pbml0X3F1aXJrJyB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1
bmN0aW9uKQogICAgIC5pbml0X3F1aXJrID0geGhjaV9wbGF0X2JyY21faW5pdF9xdWlyawogICAg
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKdmltICsveGhjaV9wbGF0
X2JyY21faW5pdF9xdWlyayArMTE3IGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMKCiAgIDEx
NQkKICAgMTE2CXN0YXRpYyBjb25zdCBzdHJ1Y3QgeGhjaV9wbGF0X3ByaXYgeGhjaV9wbGF0X2Jy
Y20gPSB7CiA+IDExNwkJLmluaXRfcXVpcmsgPSB4aGNpX3BsYXRfYnJjbV9pbml0X3F1aXJrCiAg
IDExOAl9OwogICAxMTkKLS0tCjAtREFZIGtlcm5lbCB0ZXN0IGluZnJhc3RydWN0dXJlICAgICAg
ICAgICAgICAgIE9wZW4gU291cmNlIFRlY2hub2xvZ3kgQ2VudGVyCmh0dHBzOi8vbGlzdHMuMDEu
b3JnL3BpcGVybWFpbC9rYnVpbGQtYWxsICAgICAgICAgICAgICAgICAgIEludGVsIENvcnBvcmF0
aW9uCg==

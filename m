Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: host: fix platform_no_drv_owner.cocci warnings
From: kbuild test robot <fengguang.wu@intel.com>
Message-Id: <20181110054846.GA16550@lkp-hsx03>
Date: Sat, 10 Nov 2018 13:48:46 +0800
To: Al Cooper <alcooperx@gmail.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

RnJvbToga2J1aWxkIHRlc3Qgcm9ib3QgPGZlbmdndWFuZy53dUBpbnRlbC5jb20+Cgpkcml2ZXJz
L3VzYi9ob3N0L2VoY2ktYnJjbS5jOjI1ODozLTg6IE5vIG5lZWQgdG8gc2V0IC5vd25lciBoZXJl
LiBUaGUgY29yZSB3aWxsIGRvIGl0LgoKIFJlbW92ZSAub3duZXIgZmllbGQgaWYgY2FsbHMgYXJl
IHVzZWQgd2hpY2ggc2V0IGl0IGF1dG9tYXRpY2FsbHkKCkdlbmVyYXRlZCBieTogc2NyaXB0cy9j
b2NjaW5lbGxlL2FwaS9wbGF0Zm9ybV9ub19kcnZfb3duZXIuY29jY2kKCkZpeGVzOiA1MWI0Yzc5
YTQ5ZjEgKCJ1c2I6IGhvc3Q6IEFkZCBhYmlsaXR5IHRvIGJ1aWxkIG5ldyBCcm9hZGNvbSBTVEIg
VVNCIGRyaXZlcnMiKQpDQzogQWwgQ29vcGVyIDxhbGNvb3BlcnhAZ21haWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8ZmVuZ2d1YW5nLnd1QGludGVsLmNvbT4KLS0tCgp1
cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2NvbW1pdHMvQWwtQ29vcGVy
L0FkZC1YSENJLUVIQ0ktYW5kLU9IQ0ktc3VwcG9ydC1mb3ItQnJvYWRjb20tU1RCLVNvUy1zLzIw
MTgxMTEwLTA2NTQ0MQpiYXNlOiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L2dyZWdraC91c2IuZ2l0IHVzYi10ZXN0aW5nCgogZWhjaS1icmNtLmMgfCAg
ICAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgotLS0gYS9kcml2ZXJzL3VzYi9o
b3N0L2VoY2ktYnJjbS5jCisrKyBiL2RyaXZlcnMvdXNiL2hvc3QvZWhjaS1icmNtLmMKQEAgLTI1
NSw3ICsyNTUsNiBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBlaGNpX2JyY21fCiAJ
LnJlbW92ZQkJPSBlaGNpX2JyY21fcmVtb3ZlLAogCS5zaHV0ZG93bgk9IHVzYl9oY2RfcGxhdGZv
cm1fc2h1dGRvd24sCiAJLmRyaXZlcgkJPSB7Ci0JCS5vd25lcgk9IFRISVNfTU9EVUxFLAogCQku
bmFtZQk9ICJlaGNpLWJyY20iLAogCQkucG0JPSAmZWhjaV9icmNtX3BtX29wcywKIAkJLm9mX21h
dGNoX3RhYmxlID0gYnJjbV9laGNpX29mX21hdGNoLAo=

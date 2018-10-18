Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2,1/6] dt-bindings: Add Broadcom STB OHCI, EHCI and XHCI binding document
From: Rob Herring <robh@kernel.org>
Message-Id: <20181018203808.GA25281@bogus>
Date: Thu, 18 Oct 2018 15:38:08 -0500
To: Al Cooper <alcooperx@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Alban Bedel <albeu@free.fr>, Alex Elder <elder@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Avi Fishman <avifishman70@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Bjorn Andersson <bjorn.andersson@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Hans de Goede <hdegoede@redhat.com>, James Hogan <jhogan@kernel.org>, Jianguo Sun <sunjianguo1@huawei.com>, Johan Hovold <johan@kernel.org>, Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rishabh Bhatnagar <rishabhb@codeaurora.org>, Roger Quadros <rogerq@ti.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCAxNyBPY3QgMjAxOCAxODoyOTowNCAtMDQwMCwgQWwgQ29vcGVyIHdyb3RlOgo+IEFk
ZCBEVCBiaW5kaW5ncyBkb2N1bWVudCBmb3IgQnJvYWRjb20gU1RCIFVTQiBPSENJLCBFSENJIGFu
ZAo+IFhIQ0kgZHJpdmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbCBDb29wZXIgPGFsY29vcGVy
eEBnbWFpbC5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9icmNtLGJj
bTc0NDUtZWhjaS50eHQgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrCj4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9icmNtLGJjbTc0NDUtb2hjaS50eHQgIHwgMjIgKysrKysrKysrKysr
KysrKysrKysrCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9icmNtLGJjbTc0NDUteGhj
aS50eHQgIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDY3
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvYnJjbSxiY203NDQ1LWVoY2kudHh0Cj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2JyY20sYmNtNzQ0NS1v
aGNpLnR4dAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9icmNtLGJjbTc0NDUteGhjaS50eHQKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo=

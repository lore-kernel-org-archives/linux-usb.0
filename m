Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,2/3] usb: dwc2: replace ioread32/iowrite32_rep with dwc2_readl/writel_rep
From: Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>
Message-Id: <3A9D5F5B1BA2034E826C50459B71BE044CB69F0C@am04wembxb.internal.synopsys.com>
Date: Fri, 27 Jul 2018 08:10:37 +0000
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, USB <linux-usb@vger.kernel.org>, John Youn <John.Youn@synopsys.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCk9uIDcvMjYvMjAxOCA3OjI3IFBNLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gVGh1
LCBKdWwgMjYsIDIwMTggYXQgNTowMCBQTSwgR2V2b3JnIFNhaGFreWFuCj4gPEdldm9yZy5TYWhh
a3lhbkBzeW5vcHN5cy5jb20+IHdyb3RlOgo+PiBkd2MyX3JlYWRsX3JlcC9kd2MyX3dyaXRlbF9y
ZXAgZnVuY3Rpb25zIHVzaW5nIHJlYWRsL3dyaXRlbCBpbiBhCj4+IGxvb3AuCj4gV2h5IHRoaXMg
aXMgYmV0dGVyPyBBbnkgcmVncmVzc2lvbiBvciB3aGF0Pwo+CmR3YzJfcmVhZGxfcmVwL2R3YzJf
d3JpdGVsX3JlcCB1c2VkIGluc3RlYWQgb2YKaW9yZWFkMzJfcmVwL2lvd3JpdGUzMl9yZXAgZm9y
IHRvIGJlIGFibGUgcGFzcyBzdHJ1Y3QgZHdjMl9oc290ZyB3aXRjaApyZXF1aXJlZCB0byBjaGVj
ayBuZWVkc19ieXRlX3N3YXAgZmxhZy4KLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0
OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBib2R5IG9mIGEg
bWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8g
YXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,v2,5/7] r8152: Check for supported Wake-on-LAN Modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180928231856.3587-6-f.fainelli@gmail.com>
Date: Fri, 28 Sep 2018 16:18:54 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBkb2VzIG5vdCBjaGVjayBmb3IgV2FrZS1vbi1MQU4gbW9kZXMgc3BlY2lmaWVk
IGJ5IGFuIHVzZXIsCmJ1dCB3aWxsIGNvbmRpdGlvbmFsbHkgc2V0IHRoZSBkZXZpY2UgYXMgd2Fr
ZS11cCBlbmFibGVkIG9yIG5vdCBiYXNlZCBvbgp0aGF0LCB3aGljaCBjb3VsZCBiZSBhIHZlcnkg
Y29uZnVzaW5nIHVzZXIgZXhwZXJpZW5jZS4KCkZpeGVzOiAyMWZmMmU4OTc2YjEgKCJyODE1Mjog
c3VwcG9ydCBXT0wiKQpTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxp
QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL25ldC91c2IvcjgxNTIuYyB8IDMgKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvdXNiL3I4
MTUyLmMgYi9kcml2ZXJzL25ldC91c2IvcjgxNTIuYwppbmRleCAyY2Q3MWJkYjY0ODQuLmYxYjUy
MDFjYzMyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvdXNiL3I4MTUyLmMKKysrIGIvZHJpdmVy
cy9uZXQvdXNiL3I4MTUyLmMKQEAgLTQ1MDYsNiArNDUwNiw5IEBAIHN0YXRpYyBpbnQgcnRsODE1
Ml9zZXRfd29sKHN0cnVjdCBuZXRfZGV2aWNlICpkZXYsIHN0cnVjdCBldGh0b29sX3dvbGluZm8g
KndvbCkKIAlpZiAoIXJ0bF9jYW5fd2FrZXVwKHRwKSkKIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwog
CisJaWYgKHdvbC0+d29sb3B0cyAmIH5XQUtFX0FOWSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKIAly
ZXQgPSB1c2JfYXV0b3BtX2dldF9pbnRlcmZhY2UodHAtPmludGYpOwogCWlmIChyZXQgPCAwKQog
CQlnb3RvIG91dF9zZXRfd29sOwo=

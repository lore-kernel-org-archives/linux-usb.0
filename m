Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,3/7] lan78xx: Check for supported Wake-on-LAN modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180924205420.31309-4-f.fainelli@gmail.com>
Date: Mon, 24 Sep 2018 13:54:16 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBzdXBwb3J0cyBhIGZhaXIgYW1vdW50IG9mIFdha2Utb24tTEFOIG1vZGVzLCBi
dXQgaXMgbm90CmNoZWNraW5nIHRoYXQgdGhlIHVzZXIgc3BlY2lmaWVkIG9uZSB0aGF0IGlzIHN1
cHBvcnRlZC4KCkZpeGVzOiA1NWQ3ZGU5ZGU2YzMgKCJNaWNyb2NoaXAncyBMQU43ODAwIGZhbWls
eSBVU0IgMi8zIHRvIDEwLzEwMC8xMDAwIEV0aGVybmV0IGRldmljZSBkcml2ZXIiKQpTaWduZWQt
b2ZmLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL25ldC91c2IvbGFuNzh4eC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC91c2IvbGFuNzh4eC5jIGIvZHJpdmVycy9u
ZXQvdXNiL2xhbjc4eHguYwppbmRleCBhOTk5MWM1ZjQ3MzYuLmUwYTU4OGQxYjhlNiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9uZXQvdXNiL2xhbjc4eHguYworKysgYi9kcml2ZXJzL25ldC91c2IvbGFu
Nzh4eC5jCkBAIC0xNDE1LDYgKzE0MTUsOSBAQCBzdGF0aWMgaW50IGxhbjc4eHhfc2V0X3dvbChz
dHJ1Y3QgbmV0X2RldmljZSAqbmV0ZGV2LAogCWlmICh3b2wtPndvbG9wdHMgJiBXQUtFX0FSUCkK
IAkJcGRhdGEtPndvbCB8PSBXQUtFX0FSUDsKIAorCWlmIChwZGF0YS0+d29sID09IDApCisJCXJl
dHVybiAtRUlOVkFMOworCiAJZGV2aWNlX3NldF93YWtldXBfZW5hYmxlKCZkZXYtPnVkZXYtPmRl
diwgKGJvb2wpd29sLT53b2xvcHRzKTsKIAogCXBoeV9ldGh0b29sX3NldF93b2wobmV0ZGV2LT5w
aHlkZXYsIHdvbCk7Cg==

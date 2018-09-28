Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,v2,4/7] sr9800: Check for supported Wake-on-LAN modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180928231856.3587-5-f.fainelli@gmail.com>
Date: Fri, 28 Sep 2018 16:18:53 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBjdXJyZW50bHkgc2lsZW50bHkgYWNjZXB0cyB1bnN1cHBvcnRlZCBXYWtlLW9u
LUxBTiBtb2Rlcwoob3RoZXIgdGhhbiBXQUtFX1BIWSBvciBXQUtFX01BR0lDKSB3aXRob3V0IHJl
cG9ydGluZyB0aGF0IHRvIHRoZSB1c2VyLAp3aGljaCBpcyBjb25mdXNpbmcuCgpGaXhlczogMTlh
MzhkOGUwYWEzICgiVVNCMk5FVCA6IFNSOTgwMCA6IE9uZSBjaGlwIFVTQjIuMCBVU0IyTkVUIFNS
OTgwMCBEZXZpY2UgRHJpdmVyIFN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIEZhaW5l
bGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL25ldC91c2Ivc3I5ODAwLmMg
fCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3VzYi9zcjk4MDAuYyBiL2RyaXZlcnMvbmV0L3VzYi9zcjk4MDAuYwppbmRleCA5
Mjc3YTBmMjI4ZGYuLjM1ZjM5ZjIzZDg4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvdXNiL3Ny
OTgwMC5jCisrKyBiL2RyaXZlcnMvbmV0L3VzYi9zcjk4MDAuYwpAQCAtNDIxLDYgKzQyMSw5IEBA
IHNyX3NldF93b2woc3RydWN0IG5ldF9kZXZpY2UgKm5ldCwgc3RydWN0IGV0aHRvb2xfd29saW5m
byAqd29saW5mbykKIAlzdHJ1Y3QgdXNibmV0ICpkZXYgPSBuZXRkZXZfcHJpdihuZXQpOwogCXU4
IG9wdCA9IDA7CiAKKwlpZiAod29saW5mby0+d29sb3B0cyAmIH4oV0FLRV9QSFkgfCBXQUtFX01B
R0lDKSkKKwkJcmV0dXJuIC1FSU5WQUw7CisKIAlpZiAod29saW5mby0+d29sb3B0cyAmIFdBS0Vf
UEhZKQogCQlvcHQgfD0gU1JfTU9OSVRPUl9MSU5LOwogCWlmICh3b2xpbmZvLT53b2xvcHRzICYg
V0FLRV9NQUdJQykK

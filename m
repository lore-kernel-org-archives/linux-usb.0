Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,2/7] ax88179_178a: Check for supported Wake-on-LAN modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180924205420.31309-3-f.fainelli@gmail.com>
Date: Mon, 24 Sep 2018 13:54:15 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBjdXJyZW50bHkgc2lsZW50bHkgYWNjZXB0cyB1bnN1cHBvcnRlZCBXYWtlLW9u
LUxBTiBtb2Rlcwoob3RoZXIgdGhhbiBXQUtFX1BIWSBvciBXQUtFX01BR0lDKSB3aXRob3V0IHJl
cG9ydGluZyB0aGF0IHRvIHRoZSB1c2VyLAp3aGljaCBpcyBjb25mdXNpbmcuCgpGaXhlczogZTJj
YTkwYzI3NmUxICgiYXg4ODE3OV8xNzhhOiBBU0lYIEFYODgxNzlfMTc4QSBVU0IgMy4wLzIuMCB0
byBnaWdhYml0IGV0aGVybmV0IGFkYXB0ZXIgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogRmxvcmlh
biBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9uZXQvdXNiL2F4
ODgxNzlfMTc4YS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC91c2IvYXg4ODE3OV8xNzhhLmMgYi9kcml2ZXJzL25ldC91
c2IvYXg4ODE3OV8xNzhhLmMKaW5kZXggOWU4YWQzNzJmNDE5Li4yMjA3ZjdhN2QxZmYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbmV0L3VzYi9heDg4MTc5XzE3OGEuYworKysgYi9kcml2ZXJzL25ldC91
c2IvYXg4ODE3OV8xNzhhLmMKQEAgLTU2Niw2ICs1NjYsOSBAQCBheDg4MTc5X3NldF93b2woc3Ry
dWN0IG5ldF9kZXZpY2UgKm5ldCwgc3RydWN0IGV0aHRvb2xfd29saW5mbyAqd29saW5mbykKIAlz
dHJ1Y3QgdXNibmV0ICpkZXYgPSBuZXRkZXZfcHJpdihuZXQpOwogCXU4IG9wdCA9IDA7CiAKKwlp
ZiAod29saW5mby0+d29sb3B0cyAmIH4oV0FLRV9QSFkgfCBXQUtFX01BR0lDKSkKKwkJcmV0dXJu
IC1FSU5WQUw7CisKIAlpZiAod29saW5mby0+d29sb3B0cyAmIFdBS0VfUEhZKQogCQlvcHQgfD0g
QVhfTU9OSVRPUl9NT0RFX1JXTEM7CiAJaWYgKHdvbGluZm8tPndvbG9wdHMgJiBXQUtFX01BR0lD
KQo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,1/7] asix: Check for supported Wake-on-LAN modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180924205420.31309-2-f.fainelli@gmail.com>
Date: Mon, 24 Sep 2018 13:54:14 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBjdXJyZW50bHkgc2lsZW50bHkgYWNjZXB0cyB1bnN1cHBvcnRlZCBXYWtlLW9u
LUxBTiBtb2Rlcwoob3RoZXIgdGhhbiBXQUtFX1BIWSBvciBXQUtFX01BR0lDKSB3aXRob3V0IHJl
cG9ydGluZyB0aGF0IHRvIHRoZSB1c2VyLAp3aGljaCBpcyBjb25mdXNpbmcuCgpGaXhlczogMmU1
NWNjNzIxMGZlICgiW1BBVENIXSBVU0I6IHVzYm5ldCAoMy85KSBtb2R1bGUgZm9yIEFTSVggRXRo
ZXJuZXQgYWRhcHRlcnMiKQpTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5l
bGxpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL25ldC91c2IvYXNpeF9jb21tb24uYyB8IDMgKysr
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvdXNiL2FzaXhfY29tbW9uLmMgYi9kcml2ZXJzL25ldC91c2IvYXNpeF9jb21tb24uYwppbmRl
eCBlOTVkZDEyZWRlYzQuLjAyM2I4ZDBiZjE3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvdXNi
L2FzaXhfY29tbW9uLmMKKysrIGIvZHJpdmVycy9uZXQvdXNiL2FzaXhfY29tbW9uLmMKQEAgLTYw
Nyw2ICs2MDcsOSBAQCBpbnQgYXNpeF9zZXRfd29sKHN0cnVjdCBuZXRfZGV2aWNlICpuZXQsIHN0
cnVjdCBldGh0b29sX3dvbGluZm8gKndvbGluZm8pCiAJc3RydWN0IHVzYm5ldCAqZGV2ID0gbmV0
ZGV2X3ByaXYobmV0KTsKIAl1OCBvcHQgPSAwOwogCisJaWYgKHdvbGluZm8tPndvbG9wdHMgJiB+
KFdBS0VfUEhZIHwgV0FLRV9NQUdJQykpCisJCXJldHVybiAtRUlOVkFMOworCiAJaWYgKHdvbGlu
Zm8tPndvbG9wdHMgJiBXQUtFX1BIWSkKIAkJb3B0IHw9IEFYX01PTklUT1JfTElOSzsKIAlpZiAo
d29saW5mby0+d29sb3B0cyAmIFdBS0VfTUFHSUMpCg==

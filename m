Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,7/7] smsc95xx: Check for Wake-on-LAN modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180924205420.31309-8-f.fainelli@gmail.com>
Date: Mon, 24 Sep 2018 13:54:20 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBkb2VzIG5vdCBjaGVjayBmb3IgV2FrZS1vbi1MQU4gbW9kZXMgc3BlY2lmaWVk
IGJ5IGFuIHVzZXIsCmJ1dCB3aWxsIGNvbmRpdGlvbmFsbHkgc2V0IHRoZSBkZXZpY2UgYXMgd2Fr
ZS11cCBlbmFibGVkIG9yIG5vdCBiYXNlZCBvbgp0aGF0LCB3aGljaCBjb3VsZCBiZSBhIHZlcnkg
Y29uZnVzaW5nIHVzZXIgZXhwZXJpZW5jZS4KCkZpeGVzOiBlMGU0NzRhODNjMTggKCJzbXNjOTV4
eDogYWRkIHdvbCBtYWdpYyBwYWNrZXQgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IEZsb3JpYW4g
RmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbmV0L3VzYi9zbXNj
OTV4eC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC91c2Ivc21zYzk1eHguYyBiL2RyaXZlcnMvbmV0L3VzYi9zbXNjOTV4
eC5jCmluZGV4IDA2YjRkMjkwNzg0ZC4uMjYyZTdhM2MyM2NiIDEwMDY0NAotLS0gYS9kcml2ZXJz
L25ldC91c2Ivc21zYzk1eHguYworKysgYi9kcml2ZXJzL25ldC91c2Ivc21zYzk1eHguYwpAQCAt
Nzc0LDYgKzc3NCw5IEBAIHN0YXRpYyBpbnQgc21zYzk1eHhfZXRodG9vbF9zZXRfd29sKHN0cnVj
dCBuZXRfZGV2aWNlICpuZXQsCiAJc3RydWN0IHNtc2M5NXh4X3ByaXYgKnBkYXRhID0gKHN0cnVj
dCBzbXNjOTV4eF9wcml2ICopKGRldi0+ZGF0YVswXSk7CiAJaW50IHJldDsKIAorCWlmICh3b2xp
bmZvLT53b2xvcHRzICYgflNVUFBPUlRFRF9XQUtFKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXBk
YXRhLT53b2xvcHRzID0gd29saW5mby0+d29sb3B0cyAmIFNVUFBPUlRFRF9XQUtFOwogCiAJcmV0
ID0gZGV2aWNlX3NldF93YWtldXBfZW5hYmxlKCZkZXYtPnVkZXYtPmRldiwgcGRhdGEtPndvbG9w
dHMpOwo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,v2,6/7] smsc75xx: Check for Wake-on-LAN modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180928231856.3587-7-f.fainelli@gmail.com>
Date: Fri, 28 Sep 2018 16:18:55 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBkb2VzIG5vdCBjaGVjayBmb3IgV2FrZS1vbi1MQU4gbW9kZXMgc3BlY2lmaWVk
IGJ5IGFuIHVzZXIsCmJ1dCB3aWxsIGNvbmRpdGlvbmFsbHkgc2V0IHRoZSBkZXZpY2UgYXMgd2Fr
ZS11cCBlbmFibGVkIG9yIG5vdCBiYXNlZCBvbgp0aGF0LCB3aGljaCBjb3VsZCBiZSBhIHZlcnkg
Y29uZnVzaW5nIHVzZXIgZXhwZXJpZW5jZS4KCkZpeGVzOiA2YzYzNjUwMzI2MGQgKCJzbXNjNzV4
eDogYWRkIHdvbCBtYWdpYyBwYWNrZXQgc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IEZsb3JpYW4g
RmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvbmV0L3VzYi9zbXNj
NzV4eC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC91c2Ivc21zYzc1eHguYyBiL2RyaXZlcnMvbmV0L3VzYi9zbXNjNzV4
eC5jCmluZGV4IDA1NTUzZDI1MjQ0Ni4uZTVhNGNiYjM2NmRjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L25ldC91c2Ivc21zYzc1eHguYworKysgYi9kcml2ZXJzL25ldC91c2Ivc21zYzc1eHguYwpAQCAt
NzMxLDYgKzczMSw5IEBAIHN0YXRpYyBpbnQgc21zYzc1eHhfZXRodG9vbF9zZXRfd29sKHN0cnVj
dCBuZXRfZGV2aWNlICpuZXQsCiAJc3RydWN0IHNtc2M3NXh4X3ByaXYgKnBkYXRhID0gKHN0cnVj
dCBzbXNjNzV4eF9wcml2ICopKGRldi0+ZGF0YVswXSk7CiAJaW50IHJldDsKIAorCWlmICh3b2xp
bmZvLT53b2xvcHRzICYgflNVUFBPUlRFRF9XQUtFKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXBk
YXRhLT53b2xvcHRzID0gd29saW5mby0+d29sb3B0cyAmIFNVUFBPUlRFRF9XQUtFOwogCiAJcmV0
ID0gZGV2aWNlX3NldF93YWtldXBfZW5hYmxlKCZkZXYtPnVkZXYtPmRldiwgcGRhdGEtPndvbG9w
dHMpOwo=

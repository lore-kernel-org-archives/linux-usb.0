Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net,v2,3/7] lan78xx: Check for supported Wake-on-LAN modes
From: Florian Fainelli <f.fainelli@gmail.com>
Message-Id: <20180928231856.3587-4-f.fainelli@gmail.com>
Date: Fri, 28 Sep 2018 16:18:52 -0700
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Steve Glendinning <steve.glendinning@shawell.net>, Kees Cook <keescook@chromium.org>, Alexander Kurz <akurz@blala.de>, Hayes Wang <hayeswang@realtek.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Grant Grundler <grundler@chromium.org>, zhong jiang <zhongjiang@huawei.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Ran Wang <ran.wang_1@nxp.com>, Eric Dumazet <edumazet@google.com>, "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

VGhlIGRyaXZlciBzdXBwb3J0cyBhIGZhaXIgYW1vdW50IG9mIFdha2Utb24tTEFOIG1vZGVzLCBi
dXQgaXMgbm90CmNoZWNraW5nIHRoYXQgdGhlIHVzZXIgc3BlY2lmaWVkIG9uZSB0aGF0IGlzIHN1
cHBvcnRlZC4KCkZpeGVzOiA1NWQ3ZGU5ZGU2YzMgKCJNaWNyb2NoaXAncyBMQU43ODAwIGZhbWls
eSBVU0IgMi8zIHRvIDEwLzEwMC8xMDAwIEV0aGVybmV0IGRldmljZSBkcml2ZXIiKQpTaWduZWQt
b2ZmLWJ5OiBGbG9yaWFuIEZhaW5lbGxpIDxmLmZhaW5lbGxpQGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL25ldC91c2IvbGFuNzh4eC5jIHwgMTcgKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L3VzYi9sYW43OHh4LmMgYi9kcml2ZXJzL25ldC91c2IvbGFuNzh4eC5jCmluZGV4IGE5
OTkxYzVmNDczNi4uYzNjOWJhNDRlMmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC91c2IvbGFu
Nzh4eC5jCisrKyBiL2RyaXZlcnMvbmV0L3VzYi9sYW43OHh4LmMKQEAgLTE0MDEsMTkgKzE0MDEs
MTAgQEAgc3RhdGljIGludCBsYW43OHh4X3NldF93b2woc3RydWN0IG5ldF9kZXZpY2UgKm5ldGRl
diwKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAotCXBkYXRhLT53b2wgPSAwOwotCWlm
ICh3b2wtPndvbG9wdHMgJiBXQUtFX1VDQVNUKQotCQlwZGF0YS0+d29sIHw9IFdBS0VfVUNBU1Q7
Ci0JaWYgKHdvbC0+d29sb3B0cyAmIFdBS0VfTUNBU1QpCi0JCXBkYXRhLT53b2wgfD0gV0FLRV9N
Q0FTVDsKLQlpZiAod29sLT53b2xvcHRzICYgV0FLRV9CQ0FTVCkKLQkJcGRhdGEtPndvbCB8PSBX
QUtFX0JDQVNUOwotCWlmICh3b2wtPndvbG9wdHMgJiBXQUtFX01BR0lDKQotCQlwZGF0YS0+d29s
IHw9IFdBS0VfTUFHSUM7Ci0JaWYgKHdvbC0+d29sb3B0cyAmIFdBS0VfUEhZKQotCQlwZGF0YS0+
d29sIHw9IFdBS0VfUEhZOwotCWlmICh3b2wtPndvbG9wdHMgJiBXQUtFX0FSUCkKLQkJcGRhdGEt
PndvbCB8PSBXQUtFX0FSUDsKKwlpZiAod29sLT53b2xvcHRzICYgfldBS0VfQUxMKQorCQlyZXR1
cm4gLUVJTlZBTDsKKworCXBkYXRhLT53b2wgPSB3b2wtPndvbG9wdHM7CiAKIAlkZXZpY2Vfc2V0
X3dha2V1cF9lbmFibGUoJmRldi0+dWRldi0+ZGV2LCAoYm9vbCl3b2wtPndvbG9wdHMpOwogCg==

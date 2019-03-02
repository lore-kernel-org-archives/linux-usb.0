Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,06/12] usb: dwc3: Increase timeout for CmdAct cleared by device controller
From: Yu Chen <chenyu56@huawei.com>
Message-Id: <20190302090505.65542-7-chenyu56@huawei.com>
Date: Sat, 2 Mar 2019 17:04:59 +0800
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-ID: <linux-usb.vger.kernel.org>

SXQgbmVlZHMgbW9yZSB0aW1lIGZvciB0aGUgZGV2aWNlIGNvbnRyb2xsZXIgdG8gY2xlYXIgdGhl
IENtZEFjdCBvZgpERVBDTUQgb24gSGlzaWxpY29uIEtpcmluIFNvYy4KCkNjOiBBbmR5IFNoZXZj
aGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+CkNjOiBGZWxpcGUgQmFsYmkgPGJhbGJp
QGtlcm5lbC5vcmc+CkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgpDYzogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+CkNjOiBCaW5n
aHVpIFdhbmcgPHdhbmdiaW5naHVpQGhpc2lsaWNvbi5jb20+ClNpZ25lZC1vZmYtYnk6IFl1IENo
ZW4gPGNoZW55dTU2QGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dh
ZGdldC5jCmluZGV4IDZjOWI3NmJjYzJlMS4uODRkNzAxYjM3MTcxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMKQEAg
LTI3MCw3ICsyNzAsNyBAQCBpbnQgZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoc3RydWN0IGR3YzNf
ZXAgKmRlcCwgdW5zaWduZWQgY21kLAogewogCWNvbnN0IHN0cnVjdCB1c2JfZW5kcG9pbnRfZGVz
Y3JpcHRvciAqZGVzYyA9IGRlcC0+ZW5kcG9pbnQuZGVzYzsKIAlzdHJ1Y3QgZHdjMwkJKmR3YyA9
IGRlcC0+ZHdjOwotCXUzMgkJCXRpbWVvdXQgPSAxMDAwOworCXUzMgkJCXRpbWVvdXQgPSA1MDAw
OwogCXUzMgkJCXNhdmVkX2NvbmZpZyA9IDA7CiAJdTMyCQkJcmVnOwogCg==

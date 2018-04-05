Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4/4] usb: gadget: udc: renesas_usb3: should call devm_phy_get() before add udc
From: Sasha Levin <Alexander.Levin@microsoft.com>
Message-Id: <DM5PR2101MB1032EE36A67D5FFEE3546351FBBB0@DM5PR2101MB1032.namprd21.prod.outlook.com>
Date: Thu, 5 Apr 2018 01:34:20 +0000
To: Sasha Levin <Alexander.Levin@microsoft.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "balbi@kernel.org" <balbi@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgWW9zaGloaXJvIFNoaW1vZGEuCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlz
IGNvbW1pdCBoYXMgYmVlbiBwcm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoi
IHRhZy4KZml4aW5nIGNvbW1pdDogMjc5ZDRiYzY0MDYwIHVzYjogZ2FkZ2V0OiB1ZGM6IHJlbmVz
YXNfdXNiMzogYWRkIHN1cHBvcnQgZm9yIGdlbmVyaWMgcGh5LgoKVGhlIGJvdCBoYXMgYWxzbyBk
ZXRlcm1pbmVkIGl0J3MgcHJvYmFibHkgYSBidWcgZml4aW5nIHBhdGNoLiAoc2NvcmU6IDk5LjEw
NzYpCgpUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjQuMTUuMTUsIAoK
djQuMTUuMTU6IEZhaWxlZCB0byBhcHBseSEgUG9zc2libGUgZGVwZW5kZW5jaWVzOgogICAgOTM4
NDA4Y2NlOGNkOiAoInVzYjogZ2FkZ2V0OiB1ZGM6IHJlbmVzYXNfdXNiMzogc2hvdWxkIGNhbGwg
cG1fcnVudGltZV9lbmFibGUoKSBiZWZvcmUgYWRkIHVkYyIpCi0tLQpUaGFua3MuClNhc2hhLS0K
VG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJl
IGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtl
cm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9t
YWpvcmRvbW8taW5mby5odG1sCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: net: usb: pegasus: Replace mdelay() with msleep() in setup_pegasus_II()
From: David Miller <davem@davemloft.net>
Message-Id: <20180727.141249.2268355680445612136.davem@davemloft.net>
Date: Fri, 27 Jul 2018 14:12:49 -0700 (PDT)
To: baijiaju1990@gmail.com
Cc: petkan@nucleusys.com, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogSmlhLUp1IEJhaSA8YmFpamlhanUxOTkwQGdtYWlsLmNvbT4KRGF0ZTogRnJpLCAyNyBK
dWwgMjAxOCAxNjozNjoyOSArMDgwMAoKPiBzZXR1cF9wZWdhc3VzX0lJKCkgaXMgbmV2ZXIgY2Fs
bGVkIGluIGF0b21pYyBjb250ZXh0Lgo+IEl0IGNhbGxzIG1kZWxheSgpIHRvIGJ1c2lseSB3YWl0
LCB3aGljaCBpcyBub3QgbmVjZXNzYXJ5Lgo+IG1kZWxheSgpIGNhbiBiZSByZXBsYWNlZCB3aXRo
IG1zbGVlcCgpLgo+IAo+IFRoaXMgaXMgZm91bmQgYnkgYSBzdGF0aWMgYW5hbHlzaXMgdG9vbCBu
YW1lZCBEQ05TIHdyaXR0ZW4gYnkgbXlzZWxmLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppYS1KdSBC
YWkgPGJhaWppYWp1MTk5MEBnbWFpbC5jb20+CgpBcHBsaWVkLgotLS0KVG8gdW5zdWJzY3JpYmUg
ZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4K
dGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBt
YWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5o
dG1sCg==

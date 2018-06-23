Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: net: drivers/net: Convert random_ether_addr to eth_random_addr
From: David Miller <davem@davemloft.net>
Message-Id: <20180623.105055.470247977870986966.davem@davemloft.net>
Date: Sat, 23 Jun 2018 10:50:55 +0900 (KST)
To: joe@perches.com
Cc: derek.chickles@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, ulli.kroll@googlemail.com, linus.walleij@linaro.org, yisen.zhuang@huawei.com, salil.mehta@huawei.com, jeffrey.t.kirsher@intel.com, bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, harish.patil@cavium.com, manish.chopra@cavium.com, Dept-GELinuxNICDev@cavium.com, linux-net-drivers@solarflare.com, ecree@solarflare.com, bkenward@solarflare.com, grygorii.strashko@ti.com, w-kwok2@ti.com, m-karicheri2@ti.com, jdmason@kudzu.us, dave.jiang@intel.com, allenbh@gmail.com, woojung.huh@microchip.com, ath9k-devel@qca.qualcomm.com, mareklindner@neomailbox.ch, sw@simonwunderlich.de, a@unstable.cc, kvalo@codeaurora.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, intel-wired-lan@lists.osuosl.org, linux-omap@vger.kernel.org, linux-ntb@googlegroups.com, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KRGF0ZTogRnJpLCAyMiBKdW4gMjAx
OCAxMDo1MTowMCAtMDcwMAoKPiByYW5kb21fZXRoZXJfYWRkciBpcyBhICNkZWZpbmUgZm9yIGV0
aF9yYW5kb21fYWRkciB3aGljaCBpcwo+IGdlbmVyYWxseSBwcmVmZXJyZWQgaW4ga2VybmVsIGNv
ZGUgYnkgfjM6MQo+IAo+IENvbnZlcnQgdGhlIHVzZXMgb2YgcmFuZG9tX2V0aGVyX2FkZHIgdG8g
ZW5hYmxlIHJlbW92aW5nIHRoZSAjZGVmaW5lCj4gCj4gTWlzY2VsbGFuZWE6Cj4gCj4gbyBDb252
ZXJ0ICZ2Zm1hY1swXSB0byBlcXVpdmFsZW50IHZmbWFjIGFuZCBhdm9pZCB1bm5lY2Vzc2FyeSBs
aW5lIHdyYXAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29t
PgoKSSdsbCBhcHBseSB0aGlzIHRvIG5ldC1uZXh0LCB0aGFua3MgSm9lLgotLS0KVG8gdW5zdWJz
Y3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVz
YiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcK
TW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8t
aW5mby5odG1sCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,07/12] phy: Add usb phy support for hi3660 Soc of Hisilicon
From: Yu Chen <chenyu56@huawei.com>
Message-Id: <d17d12d1-0f72-9820-5f1d-bc29578e7a68@huawei.com>
Date: Mon, 4 Mar 2019 10:37:20 +0800
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: liuyu712@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, wanghu17@hisilicon.com, butao@hisilicon.com, Yao Chen <chenyao11@huawei.com>, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei <songxiaowei@hisilicon.com>, xu yiping <xuyiping@hisilicon.com>, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Kishon Vijay Abraham I <kishon@ti.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, Pengcheng Li <lpc.li@hisilicon.com>, Jianguo Sun <sunjianguo1@huawei.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgQW5keSwKCk9uIDIwMTkvMy8yIDIzOjU2LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24g
U2F0LCBNYXIgMiwgMjAxOSBhdCAxMTowNiBBTSBZdSBDaGVuIDxjaGVueXU1NkBodWF3ZWkuY29t
PiB3cm90ZToKPj4KPj4gVGhpcyBkcml2ZXIgaGFuZGxlcyB1c2IgcGh5IHBvd2VyIG9uIGFuZCBz
aHV0ZG93biBmb3IgaGkzNjYwIFNvYyBvZgo+PiBIaXNpbGljb24uCj4gCj4gRmV3IGNvbW1lbnRz
IGJlbG93LiBBZnRlciBmaXhpbmcgdGhlbSwgRldJVwo+IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZj
aGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Cj4gCj4+ICsjZGVmaW5lIEhJMzY2MF9V
U0JfREVGQVVMVF9QSFlfUEFSQU0gICAgICAgICAgIDB4MWM0NjZlMwo+IAo+IEEgYml0IG9mIGRl
c2NyaXB0aW9uIHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSB3aGF0IHRoaXMgdmFsdWUgbWVhbnMuCj4g
Ck9LLgo+PiArICAgICAgIC8qIGRlbGF5IGZvciBleGl0IGZyb20gSUREUSBtb2RlICovCj4+ICsg
ICAgICAgdXNsZWVwX3JhbmdlKDEwMCwgMTAwKTsKPiAKPiAxMDAsMTAwID8gSSB0aGluayB5b3Ug
bmVlZCB0byBnaXZlIGEgcm9vbSB0byBzY2hlZHVsZXIsIGF0IGxlYXN0IDIwJQo+IG1hcmdpbiB3
b3VsZCBiZSBnb29kIHRvIGhhdmUuCj4gCj4+ICsgICAgICAgLyogZGVsYXkgZm9yIHZidXMgdmFs
aWQgKi8KPj4gKyAgICAgICB1c2xlZXBfcmFuZ2UoMTAwLCAxMDApOwo+IAo+IERpdHRvLgo+IAo+
IApPSy4KClRoYW5rcwpZdSBDaGVuCg==

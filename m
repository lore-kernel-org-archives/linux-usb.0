Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] usb: renesas_usbhs: Remove dummy runtime PM callbacks
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Message-Id: <OSBPR01MB229369A87CAC7846EB6BD8A6D8F00@OSBPR01MB2293.jpnprd01.prod.outlook.com>
Date: Fri, 26 Oct 2018 02:09:31 +0000
To: Wolfram Sang <wsa@the-dreams.de>, Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgV29sZnJhbS1zYW4sCgo+IEZyb206IFdvbGZyYW0gU2FuZywgU2VudDogRnJpZGF5LCBPY3Rv
YmVyIDI2LCAyMDE4IDc6NTggQU0KPHNuaXA+Cj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZf
cG1fb3BzIHVzYmhzY19wbV9vcHMgPSB7Cj4gPiAgCS5zdXNwZW5kCQk9IHVzYmhzY19zdXNwZW5k
LAo+ID4gIAkucmVzdW1lCQkJPSB1c2Joc2NfcmVzdW1lLAo+IAo+IFVucmVsYXRlZCB0byB0aGlz
IHBhdGNoLCBidXQgSSB3b25kZXIgcmlnaHQgbm93OiBpcyB0aGVyZSBhIHJlYXNvbiBub3QKPiB0
byB1c2UgU0VUX1NZU1RFTV9TTEVFUF9QTV9PUFMgaGVyZT8gU2hpbW9kYS1zYW4/CgpJIGRvbid0
IGtub3cgd2h5IGJlY2F1c2UgdGhpcyBjb2RlIGlzIGNvbnRyaWJ1dGVkIGZyb20gTW9yaW1vdG8t
c2FuLgpJJ20gZ3Vlc3NpbmcgdGhpcyBjb2RlIHNlZW1zIHRvIGNvbWUgZnJvbSBzaF9ldGguYyBv
ciBpMmMtc2hfbW9iaWxlLmMKYW5kIHdlIGRvbid0IGhhdmUgdGhlIFNFVF9TWVNURU1fU0xFRVBf
UE1fT1BTIG1hY3JvIGF0IDIwMDkuCk1vcmltb3RvLXNhbiBjb250cmlidXRlZCB0aGlzIGNvZGUg
YXQgMjAxMCwgYnV0IGl0IHNlZW1zIG5vdCB0byByZWFsaXplCndlIGhhdmUgc3VjaCBtYWNyby4K
CkFueXdheSwgSSdsbCB0cnkgdG8gdXNlIFNFVF9TWVNURU1fU0xFRVBfUE1fT1BTIG9uIHRoZSBy
ZW5lc2FzX3VzYmhzIGRyaXZlci4KCkJlc3QgcmVnYXJkcywKWW9zaGloaXJvIFNoaW1vZGEK

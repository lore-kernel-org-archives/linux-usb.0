Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: r8152: Fix an error on RTL8153-BD MAC Address Passthrough support
From: David Miller <davem@davemloft.net>
Message-Id: <20190222.113739.447921290920279650.davem@davemloft.net>
Date: Fri, 22 Feb 2019 11:37:39 -0800 (PST)
To: david0813@gmail.com
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, hayeswang@realtek.com, mario.limonciello@dell.com, bigeasy@linutronix.de, edumazet@google.com, jslaby@suse.cz, f.fainelli@gmail.com, david.chen7@dell.com, kai.heng.feng@canonical.com, zhongjiang@huawei.com
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogRGF2aWQgQ2hlbiA8ZGF2aWQwODEzQGdtYWlsLmNvbT4KRGF0ZTogV2VkLCAyMCBGZWIg
MjAxOSAxMzo0NzoxOSArMDgwMAoKPiBGcm9tOiBEYXZpZCBDaGVuIDxkYXZpZC5jaGVuN0BkZWxs
LmNvbT4KPiAKPiBSVEw4MTUzLUJEIGlzIHVzZWQgaW4gRGVsbCBEQTMwMCB0eXBlLUMgZG9uZ2xl
Lgo+IEFkZGVkIFJUTDgxNTMtQkQgc3VwcG9ydCB0byBhY3RpdmF0ZSBNQUMgYWRkcmVzcyBwYXNz
IHRocm91Z2ggb24gREEzMDAuCj4gQXBwbHkgY29ycmVjdGlvbiBvbiBwcmV2aW91c2x5IHN1Ym1p
dHRlZCBwYXRjaCBpbiBuZXQuZ2l0IHRyZWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgQ2hl
biA8ZGF2aWQuY2hlbjdAZGVsbC5jb20+CgpBcHBsaWVkLCB0aGFua3MuCg==

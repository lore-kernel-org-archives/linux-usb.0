Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/3] usb: ehci: fsl: Update register accessing for arm/arm64 platforms
From: Alan Stern <stern@rowland.harvard.edu>
Message-Id: <Pine.LNX.4.44L0.1901171107150.1207-100000@iolanthe.rowland.org>
Date: Thu, 17 Jan 2019 11:08:17 -0500 (EST)
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAxNyBKYW4gMjAxOSwgUmFuIFdhbmcgd3JvdGU6Cgo+IGFybS9hcm02NCdzIGlvLmgg
ZG9lc24ndCBkZWZpbmUgY2xyYml0czMyKCkgYW5kIGNscnNldGJpdHNfYmUzMigpLCB3aGljaAo+
IGNhdXNpbmcgY29tcGlsZSBmYWlsdXJlIG9uIHNvbWUgTGF5ZXJzY2FwZSBQbGF0Zm9ybXMgKHN1
Y2ggYXMgTFMxMDIxQSBhbmQKPiBMUzIwMTJBIHdoaWNoIGFsc28gaW50ZWdyYXRlcyBGU0wgRUhD
SSBjb250cm9sbGVyKS4gU28gdXNlCj4gaW9yZWFkMzJiZSgpL2lvd3JpdGUzMmJlKCkgaW5zdGVh
ZCB0byBtYWtlIGl0IHdvcmthYmxlIG9uIGJvdGgKPiBwb3dlcnBjIGFuZCBhcm0uCgpGb3IgcGF0
Y2hlcyAxLzMgYW5kIDMvMzoKCkFja2VkLWJ5OiBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhh
cnZhcmQuZWR1PgoKSGF2ZSB5b3UgdGVzdGVkIHRoZXNlIG9uIHRoZSBMYXllcnNjYXBlIHBsYXRm
b3JtcyB0byBtYWtlIHN1cmUgdGhleSAKd29yayBjb3JyZWN0bHk/CgpBbGFuIFN0ZXJuCg==

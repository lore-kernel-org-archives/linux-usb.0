Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/3] USB: xhci-hcd: Add get_resuming_ports method
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-Id: <d9a3f76f-4a25-990a-53c5-7414e730842d@linux.intel.com>
Date: Mon, 11 Jun 2018 14:09:10 +0300
To: Alan Stern <stern@rowland.harvard.edu>, Greg KH <greg@kroah.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, USB list <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gMDguMDYuMjAxOCAyMzo1OSwgQWxhbiBTdGVybiB3cm90ZToKPiBUaGlzIHBhdGNoIGFkZHMg
c3VwcG9ydCBmb3IgdGhlIG5ldyBnZXRfcmVzdW1pbmdfcG9ydHMgSENEIG1ldGhvZCB0bwo+IHRo
ZSB4aGNpLWhjZCBkcml2ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxhbiBTdGVybiA8c3Rlcm5A
cm93bGFuZC5oYXJ2YXJkLmVkdT4KPiBDQzogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBp
bnRlbC5jb20+Cj4gCgpBY2tlZC1ieTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51
eC5pbnRlbC5jb20+Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUg
bGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8g
bWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8v
dmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

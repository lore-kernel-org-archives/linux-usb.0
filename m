Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,01/12] drivers: base: Unified device connection lookup
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180314122508.GA7672@kroah.com>
Date: Wed, 14 Mar 2018 13:25:08 +0100
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgMDI6MTM6MjNQTSArMDIwMCwgSGVpa2tpIEtyb2dlcnVz
IHdyb3RlOgo+ID4gU29ycnkgSSBtaXNzZWQgdGhpcyB0aGUgbGFzdCByZXZpZXcgY3ljbGVzLgo+
IAo+IE5wLiBJJ2xsIHByZXBhcmUgdjguIFRoaXMgd2lsbCBub3QgYWZmZWN0IHRoZSBvdGhlciBw
YXRjaGVzLCBzbyBpcyBpdAo+IGVub3VnaCBpZiBJIGp1c3QgdXBkYXRlIHRoaXMgcGF0Y2g/IE9y
IGRvIHlvdSBwcmVmZXIgdGhhdCBJIHJlLXNlbmQKPiB0aGUgd2hvbGUgc2VyaWVzPwoKUmVzZW5k
aW5nIHRoZSB3aG9sZSBzZXJpZXMgbWFrZXMgaXQgZWFzaWVzdCBmb3IgbWUsIHRoYW5rcy4KCmdy
ZWcgay1oCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAi
dW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jk
b21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5r
ZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

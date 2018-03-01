Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v5,01/12] drivers: base: Unified device connection lookup
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180301072825.GC5335@kuha.fi.intel.com>
Date: Thu, 1 Mar 2018 09:28:25 +0200
To: Jun Li <jun.li@nxp.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBUaHUsIE1hciAwMSwgMjAxOCBhdCAxMjo1Njo1N0FNICswMDAwLCBKdW4gTGkgd3Jv
dGU6Cj4gPiArc3RydWN0IGRldmljZSAqZGV2aWNlX2ZpbmRfY29ubmVjdGlvbihzdHJ1Y3QgZGV2
aWNlICpkZXYsIGNvbnN0IGNoYXIKPiA+ICsqY29uX2lkKSB7Cj4gPiArCXJldHVybiBfX2Rldmlj
ZV9maW5kX2Nvbm5lY3Rpb24oZGV2LCBjb25faWQsIGdlbmVyaWNfbWF0Y2gsIE5VTEwpOyB9Cj4g
Cj4gLSAgICAgICByZXR1cm4gX19kZXZpY2VfZmluZF9jb25uZWN0aW9uKGRldiwgY29uX2lkLCBn
ZW5lcmljX21hdGNoLCBOVUxMKTsKPiArICAgICAgIHJldHVybiBfX2RldmljZV9maW5kX2Nvbm5l
Y3Rpb24oZGV2LCBjb25faWQsIE5VTEwsIGdlbmVyaWNfbWF0Y2gpOwoKR29vZCBjYXRjaCEKClRo
YW5rcywK

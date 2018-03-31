Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,07/13] staging: typec: tcpci: register port before request irq
From: Dan Carpenter <dan.carpenter@oracle.com>
Message-Id: <20180331080157.p43cejithiyiutix@mwanda>
Date: Sat, 31 Mar 2018 11:01:57 +0300
To: Jun Li <jun.li@nxp.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux@roeck-us.net" <linux@roeck-us.net>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>
List-ID: <linux-usb.vger.kernel.org>

T24gU2F0LCBNYXIgMzEsIDIwMTggYXQgMDM6MDk6NDRBTSArMDAwMCwgSnVuIExpIHdyb3RlOgo+
IFRoaXMgcGF0Y2ggaXMgdG8gY2hhbmdlIHRoZSBzZXF1ZW5jZSBvZiByZWdpc3RlciBwb3J0IGFu
ZCByZXF1ZXN0IGlycSwKPiBpZiBlcnJvciBjb2RlIGNoZWNraW5nIG9mIG9yaWdpbmFsIGNvZGUg
aGFzIHRoZSBwcm9ibGVtLCBJIHRoaW5rIHRoYXQKPiBzaG91bGQgYmUgYW5vdGhlciBwYXRjaCB0
byBmaXggaXQsIEkgY2FuIGRvIHRoYXQgbGF0ZXIuCgpGYWlyIGVub3VnaC4gIFRoYXQncyByZWFz
b25hYmxlLiAgVGhhbmtzIQoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgotLS0KVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIg
aW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9y
ZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5m
by5odG1sCg==

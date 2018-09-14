Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] typec: tcpm: Do not disconnect link for self powered devices
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180914095440.GF19329@kuha.fi.intel.com>
Date: Fri, 14 Sep 2018 12:54:40 +0300
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiBUaHUsIFNlcCAxMywgMjAxOCBhdCAwNDoxNjowOFBNIC0wNzAwLCBCYWRocmkgSmFn
YW4gU3JpZGhhcmFuIHdyb3RlOgo+ID4gPiBZb3UgZG8gbmVlZCB0byBpbnRyb2R1Y2UgYSBuZXcg
ZGV2aWNlIHByb3BlcnR5IGFscmVhZHkuIFRoZW4gcmVhZCB0aGUKPiAKPiBUaGlzIHdvdWxkIGJl
IHBhcnQgb2YgdXNiLWNvbm5lY3RvciBiaW5kaW5nLiByaWdodCA/CgpZZXMsIHRoYXQgaXMgcHJv
YmFibGUgdGhlIGNvcnJlY3QgcGxhY2UgZm9yIHRoYXQuIEl0J3Mgbm90IHRjcG0vdGNwY2kKc3Bl
Y2lmaWMuCgpCdXQgSSBkb24ndCB0aGluayBpdCdzIFR5cGUtQyBzcGVjaWZpYyBlaXRoZXIuIFBl
cmhhcHMgaXQgc2hvdWxkCmdvIHVuZGVyICJPcHRpb25hbCBQcm9wZXJ0aWVzIiBpbnN0ZWFkIG9m
ICJPcHRpb25hbCBwcm9wZXJ0aWVzIGZvcgp1c2ItYy1jb25uZWN0b3IiPwoKClRoYW5rcywK

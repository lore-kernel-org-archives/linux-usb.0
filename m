Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
From: Joe Perches <joe@perches.com>
Message-Id: <1512663652.960.41.camel@perches.com>
Date: Thu, 07 Dec 2017 08:20:52 -0800
To: Alan Stern <stern@rowland.harvard.edu>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?ISO-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAyMDE3LTEyLTA3IGF0IDEwOjEyIC0wNTAwLCBBbGFuIFN0ZXJuIHdyb3RlOgo+IFRo
ZSByZWFsIHByb2JsZW0gaXMgdGhhdCB0aGUga2VybmVsIGRldmVsb3BtZW50IGNvbW11bml0eSBk
b2Vzbid0IGhhdmUKPiBhIGZpeGVkIHBvbGljeSBvbiBob3cgdG8gaGFuZGxlIG1lbW9yeSBhbGxv
Y2F0aW9uIGVycm9ycy4KW10KPiBJZiB0aGVyZSB3YXMgb25lIGFncmVlZC11cG9uIHBvbGljeSwg
dGhlbiB3ZSBjb3VsZCBkZWZpbml0aXZlbHkgcG9pbnQgCj4gdG8gb2xkIGNvZGUgYW5kIHNheSAi
VGhhdCdzIHdyb25nLCBhbmQgaGVyZSBpcyBob3cgaXQgc2hvdWxkIGJlIGZpeGVkLiIgIAo+IEJ1
dCBjdXJyZW50bHkgdGhpcyBpcyBub3QgcG9zc2libGUsIGFuZCB3ZSBlbmQgdXAgd2l0aCByZXBl
dGl0aXZlIAo+IGRpc2N1c3Npb25zIGxpa2UgdGhpcyBvbmUgdGhhdCBhcmVuJ3Qgb2YgZ2VuZXJh
bCB1c2UuCgpXZWxsIHN0YXRlZC4KCk15IHByZWZlcnJlZCBwb2xpY3kgd291bGQgYmUgdG8gcmVt
b3ZlIGFsbCB0aGUgaW5kaXZpZHVhbAphbGxvY2F0aW9uIGZhaWx1cmUgbWVzc2FnZXMgYW5kIG9u
bHkgdXNlIHRoZSBnZW5lcmljCndhcm5fYWxsb2MoKS9kdW1wX3N0YWNrKCkgbWVjaGFuaXNtLgot
LS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2Ny
aWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2Vy
Lmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9y
Zy9tYWpvcmRvbW8taW5mby5odG1sCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v8,01/12] drivers: base: Unified device connection lookup
From: Hans de Goede <hdegoede@redhat.com>
Message-Id: <eb9950fe-54fd-eda8-e678-f2216204f62f@redhat.com>
Date: Tue, 20 Mar 2018 13:21:57 +0100
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGksCgpPbiAyMC0wMy0xOCAxMTozMiwgSGVpa2tpIEtyb2dlcnVzIHdyb3RlOgo+IE9uIFR1ZSwg
TWFyIDIwLCAyMDE4IGF0IDEyOjA0OjEyUE0gKzAyMDAsIEhlaWtraSBLcm9nZXJ1cyB3cm90ZToK
Pj4+PiArdm9pZCBkZXZpY2VfY29ubmVjdGlvbl9yZW1vdmUoc3RydWN0IGRldmljZV9jb25uZWN0
aW9uICpjb24pCj4+Pj4gK3sKPj4+PiArCW11dGV4X2xvY2soJmRldmNvbl9sb2NrKTsKPj4+PiAr
CWxpc3RfZGVsX3JjdSgmY29uLT5saXN0KTsKPj4+Cj4+PiBTZWUsIHJjdT8KPj4KPj4gVHJ1ZS4g
SSdsbCBzZW5kIG9uZSBtb3JlIHZlcnNpb24uCj4gCj4gQmVmb3JlIEkgZG8gdGhhdCwgSGFucywg
Y2FuIHlvdSBxdWlja2x5IGNoZWNrIHRoaXMgYW5kIHNlZSB0aGF0IEkKPiBoYXZlIG5vdCBtYWRl
IGFueSBtb3JlIG1pc3Rha2VzPyBJIGRvbid0IHRydXN0IG15c2VsZiBhbnltb3JlIHdpdGgKPiB0
aGVzZS4KClRoaXMgbG9va3MgZ29vZCB0byBtZSAobm90ZSBJIGRpZCBub3QgdGVzdCBvbmx5IHJl
dmlld2VkKS4KClJlZ2FyZHMsCgpIYW5zCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlz
dDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBh
IG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZv
IGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

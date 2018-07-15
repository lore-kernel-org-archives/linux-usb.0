Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: host: xhci-plat: Iterate over parent nodes for finding quirks
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180715080206.GA19377@kroah.com>
Date: Sun, 15 Jul 2018 10:02:06 +0200
To: Anurag Kumar Vulisha <anuragku@xilinx.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>
List-ID: <linux-usb.vger.kernel.org>

T24gU2F0LCBKdWwgMTQsIDIwMTggYXQgMDM6Mzc6MjBQTSArMDAwMCwgQW51cmFnIEt1bWFyIFZ1
bGlzaGEgd3JvdGU6Cj4gSEkgR3JlZywKPiAKPiBQaW5nIQo+IFRob3VnaHQgb2YgZ2l2aW5nIGEg
ZnJpZW5kbHkgcmVtYWluZGVyIGFib3V0IHRoaXMgcGF0Y2guCgpJIGFtIG5vdCB0aGUgeGhjaSBt
YWludGFpbmVyLCBJIG5lZWQgdG8gd2FpdCBmcm9tIGFuIGFjayBmcm9tIGhpbSBiZWZvcmUKSSBj
YW4gdGFrZSBpdC4KCnRoYW5rcywKCmdyZWcgay1oCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRo
aXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9k
eSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9t
byBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

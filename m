Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: host: xhci-plat: Iterate over parent nodes for finding quirks
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180612080256.GA17399@kroah.com>
Date: Tue, 12 Jun 2018 10:02:56 +0200
To: Anurag Kumar Vulisha <anuragku@xilinx.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBKdW4gMTIsIDIwMTggYXQgMDc6MDM6MzlBTSArMDAwMCwgQW51cmFnIEt1bWFyIFZ1
bGlzaGEgd3JvdGU6Cj4gSGkgR3JlZywKPiAKPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IGhh
dmUgYW55IGNvbW1lbnRzIG9uIHRoaXMgcGF0Y2guIAoKSXQgaXMgdGhlIG1pZGRsZSBvZiB0aGUg
bWVyZ2Ugd2luZG93LCBJIGNhbiBub3QgZG8gYW55dGhpbmcgd2l0aCBhbnkKcGF0Y2hlcyB1bnRp
bCBhZnRlciA0LjE4LXJjMSBpcyBvdXQuCgpQbGVhc2UgYmUgcGF0aWVudC4KCnRoYW5rcywKCmdy
ZWcgay1oCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAi
dW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jk
b21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5r
ZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

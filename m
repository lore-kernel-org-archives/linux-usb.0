Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/2] usb/gadget: Add driver for Aspeed SoC virtual hub
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <1517051234.2312.60.camel@kernel.crashing.org>
Date: Sat, 27 Jan 2018 22:07:14 +1100
To: Fengguang Wu <lkp@intel.com>
Cc: kbuild-all@01.org, linux-usb@vger.kernel.org, Greg KH <greg@kroah.com>, Joel Stanley <joel.stanley@au1.ibm.com>, Andrew Jeffery <andrew@aj.id.au>, Felipe Balbi <balbi@kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCAyMDE4LTAxLTI2IGF0IDEyOjU1ICswODAwLCBGZW5nZ3VhbmcgV3Ugd3JvdGU6Cj4g
PiA+IAo+ID4gPiAgICAgICBVRENWREJHKHZodWIsICJpcnEgc3RhdHVzPSUwOHgsIGVwX2Fja3M9
JTA4eCBlcF9uYWNrcz0lMDh4XG4iLAo+ID4gCj4gPiBUaGlzIGlzIHJhdGhlciBib2d1cyB0b28u
IG0zMnIncyByZWFkbCgpIGlzIHJldHVybmluZyB1bnNpZ25lZCBsb25nLCBpdAo+ID4gc2hvdWxk
IGJlIHVuc2lnbmVkIGludCBvciB1MzIuCj4gCj4gVW5mb3J0dW5hdGVseSBtMzJyIGlzIG1hcmtl
ZCBvcnBoYW5lZCBpbiBNQUlOVEFJTkVSUy4gV2UgY291bGQgc3RvcAo+IHRlc3RpbmcgaXQgaWYg
bm8gb25lIHdpbGwgc3RlcCB1cCB0byBmaXggaXRzIGlzc3Vlcy4KCkkgc3VwcG9zZS4gVW5sZXNz
IHNvbWVib2R5IGRpc2FncmVlcyB3aXRoIG15IHJlYXNvbmluZy4uLgoKQ2hlZXJzLApCZW4uCi0t
LQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3Jp
YmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIu
a2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3Jn
L21ham9yZG9tby1pbmZvLmh0bWwK

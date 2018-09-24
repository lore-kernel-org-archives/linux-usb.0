Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: xhci: Add check for invalid byte size error when UAS devices are connected.
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-Id: <58201720-ee34-a866-b177-084b9f36c40c@linux.intel.com>
Date: Mon, 24 Sep 2018 16:09:59 +0300
To: Sandeep Singh <Sandeep.Singh@amd.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMjEuMDkuMjAxOCAxNjoyMiwgU2FuZGVlcCBTaW5naCB3cm90ZToKPiBGcm9tOiBTYW5kZWVw
IFNpbmdoIDxzYW5kZWVwLnNpbmdoQGFtZC5jb20+Cj4gCj4gT2JzZXJ2ZWQgIlRSQiBjb21wbGV0
aW9uIGNvZGUgKDI3KSIgZXJyb3Igd2hpY2ggY29ycmVzcG9uZHMgdG8gU3RvcHBlZCAtCj4gTGVu
Z3RoIEludmFsaWQgZXJyb3IoeGhjaSBzcGVjIHNlY3Rpb24gNC4xNy40KSB3aGlsZSBjb25uZWN0
aW5nIFVTQiB0bwo+IFNBVEEgYnJpZGdlLgo+IAo+IExvb2tzIGxpa2UgdGhpcyBjYXNlIHdhcyBu
b3QgY29uc2lkZXJlZCB3aGVuIHRoZSBmb2xsb3dpbmcgcGF0Y2hbMV0gd2FzCj4gY29tbWl0dGVk
LiBIZW5jZSBhZGRpbmcgdGhpcyBuZXcgY2hlY2sgd2hpY2ggY2FuIHByZXZlbnQKPiB0aGUgaW52
YWxpZCBieXRlIHNpemUgZXJyb3IuCj4gCj4gWzFdIGFkZTJlM2EgeGhjaTogaGFuZGxlIHRyYW5z
ZmVyIGV2ZW50cyB3aXRob3V0IFRSQiBwb2ludGVyCj4gCgpUaGFua3MsIGFkZGluZyB0byBxdWV1
ZS4KCkp1c3Qgb3V0IG9mIGN1cmlvc2l0eSwgd2FzIHRoZSBUUkIgcG9pbnRlciBiaXRzIGFsbCB6
ZXJvZXMKaW4gdGhpcyAgU3RvcHBlZCAtTGVuZ3RoIGludmFsaWQgdHJhbnNmZXIgZXZlbnQgVFJC
PwoKLU1hdGhpYXMK

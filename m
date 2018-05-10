Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/2] usb: misc: xapea00x: perform platform initialization of TPM
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-Id: <20180510015938.GN6190@linux.intel.com>
Date: Thu, 10 May 2018 04:59:38 +0300
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: "David R. Bild" <david.bild@xaptum.com>, philip.b.tricca@intel.com, Jason Gunthorpe <jgg@ziepe.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Huewe <peterhuewe@gmx.de>, linux-usb@vger.kernel.org, linux-integrity@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBNYXkgMDgsIDIwMTggYXQgMDg6MzY6MjVBTSAtMDcwMCwgSmFtZXMgQm90dG9tbGV5
IHdyb3RlOgo+IEVhcmx5IGJvb3QgbWVhbnMgdXNlcnNwYWNlLiBmb3IgYSBob3QgcGx1Z2dhYmxl
IGRldmljZSwgdGhpcyB3b3VsZAo+IHByb2JhYmx5IGJlIHNvbWV0aGluZyBpbiB1ZGV2IGlmIHlv
dSBmb2xsb3cgdGhlIG5vLWRhZW1vbiBtb2RlbCBhbmQgdGhlCj4gZGFlbW9uIGNvdWxkIGRvIGl0
IGlmIHlvdSBkbyBmb2xsb3cgdGhlIGRhZW1vbiBtb2RlbC4KPiAKPiBKYW1lcwoKQ291bGQgdGhp
cyBiZSBpbXBsZW1lbnRlZCBhcyBhIGZpcnN0IHByaW9yaXR5IHRvIGRhZW1vbi4gSWYgaXQgdHVy
bnMgb3V0CnRvIGJlIGJhZCBhcHByb2FjaCB3ZSBjYW4gcmVjb25zaWRlciBrZXJuZWwuIElmIHdl
IGxhbmQgaXQgdG8ga2VybmVsIGl0CmlzIGhhcmRlciB0byB0YWtlIHN0ZXBzIGJhY2suCgovSmFy
a2tvCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5z
dWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21v
QHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJu
ZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

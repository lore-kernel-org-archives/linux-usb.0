Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] usb: hub: add retry routine after intr URB submit error
From: Oliver Neukum <oneukum@suse.com>
Message-Id: <1542726774.28362.13.camel@suse.com>
Date: Tue, 20 Nov 2018 16:12:54 +0100
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

PiBBbnl0aW1lICJpbl9yZXNldCIgaXMgc2V0ICJxdWllc2NpbmciIGlzIGFsc28gc2V0Ogo+IAo+
IHN0YXRpYyBpbnQgaHViX3ByZV9yZXNldChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZikKPiB7
Cj4gCXN0cnVjdCB1c2JfaHViICpodWIgPSB1c2JfZ2V0X2ludGZkYXRhKGludGYpOwo+IAo+IAlo
dWJfcXVpZXNjZShodWIsIEhVQl9QUkVfUkVTRVQpOyAvL3NldHMgcXVpZXNjZQo+IAlodWItPmlu
X3Jlc2V0ID0gMTsKPiAJaHViX3BtX2JhcnJpZXJfZm9yX2FsbF9wb3J0cyhodWIpOwo+IAlyZXR1
cm4gMDsKPiB9Cj4gCj4gc3RhdGljIGludCBodWJfcG9zdF9yZXNldChzdHJ1Y3QgdXNiX2ludGVy
ZmFjZSAqaW50ZikKPiB7Cj4gCXN0cnVjdCB1c2JfaHViICpodWIgPSB1c2JfZ2V0X2ludGZkYXRh
KGludGYpOwo+IAo+IAlodWItPmluX3Jlc2V0ID0gMDsKPiAJaHViX3BtX2JhcnJpZXJfZm9yX2Fs
bF9wb3J0cyhodWIpOwo+IAlodWJfYWN0aXZhdGUoaHViLCBIVUJfUE9TVF9SRVNFVCk7IC8vY2xl
YXJzIHF1aWVzY2UKPiAJcmV0dXJuIDA7Cj4gfQo+IAo+IEkgc2hvdWxkIGJlIE9LIGlzbid0IGl0
PwoKU29ycnksIHllcywgSSBvdmVybG9va2VkIHRoYXQgdGhlcmUgYXJlIHR3byBmbGFncy4KCglS
ZWdhcmRzCgkJT2xpdmVyCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] usb: dwc2: gadget: Fix WkupAlert interrupt handler.
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87va5jehqx.fsf@linux.intel.com>
Date: Tue, 30 Oct 2018 14:33:42 +0200
To: Artur Petrosyan <arthur.petrosyan@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <minas.harutyunyan@synopsys.com>, linux-usb@vger.kernel.org
Cc: John Youn <john.youn@synopsys.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpBcnR1ciBQZXRyb3N5YW4gPGFydGh1ci5wZXRyb3N5YW5Ac3lub3BzeXMuY29tPiB3cml0
ZXM6Cj4gQWNjb3JkaW5nIHRvIHRoZSBkYXRhYm9vayBEQ1RMX1JNVFdLVVBTSUcgYml0Cj4gaXMg
ZGVmaW5lZCBpbiBEQ1RMIHJlZ2lzdGVyIG5vdCBpbiBEQ0ZHLgo+Cj4gVXBkYXRlZCBzZXR0aW5n
IERDVExfUk1UV0tVUFNJRyBiaXQgdG8gRENUTAo+IHJlZ2lzdGVyLgo+Cgpsb29rcyBsaWtlIHRo
aXMgbmVlZHMgYSBDYyBzdGFibGUgYW5kIEZpeGVzIHRhZy4gQ2FyZSB0byBhZGQ/Cg==

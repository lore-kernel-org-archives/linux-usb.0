Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usbip: vhci_hcd: Fix usb device and sockfd leaks
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180403065642.GB1093@kroah.com>
Date: Tue, 3 Apr 2018 08:56:42 +0200
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBBcHIgMDIsIDIwMTggYXQgMDI6NTI6MzJQTSAtMDYwMCwgU2h1YWggS2hhbiB3cm90
ZToKPiB2aGNpX2hjZCBmYWlscyB0byBkbyByZXNldCB0byBwdXQgdXNiIGRldmljZSBhbmQgc29j
a2ZkIGluIHRoZQo+IG1vZHVsZSByZW1vdmUvc3RvcCBwYXRocy4gRml4IHRoZSBsZWFrLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFNodWFoIEtoYW4gPHNodWFoa2hAb3NnLnNhbXN1bmcuY29tPgoKU2hv
dWxkIHRoaXMgYmUgbWFya2VkIGZvciB0aGUgc3RhYmxlIGtlcm5lbHM/Cgp0aGFua3MsCgpncmVn
IGstaAotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVu
c3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9t
b0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2Vy
bmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==

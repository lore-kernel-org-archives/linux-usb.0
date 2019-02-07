Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: xhci: Drop superfluous initialization in xhci_queue_ctrl_tx()
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <1683ed6e-c798-3a5b-341d-c0a7901887d0@cogentembedded.com>
Date: Thu, 7 Feb 2019 19:43:58 +0300
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-usb@vger.kernel.org
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGVsbG8hCgpPbiAwNy4wMi4yMDE5IDM6MDMsIEFuZHJleSBTbWlybm92IHdyb3RlOgoKPiBTaW1w
bGlmeSBmaWxlZCdzIGluaXRpYWxpemF0aW9uIGJ5IGRpcmVjdGx5IGFzc2lnbmluZyBpdHMgZmlu
YWwgdmFsdWUKCiAgICBmaWVsZCdzLgoKPiBpbnN0ZWFkIG9mIGluaXRpYWxpemluZyB0aGUgdmFy
aWFibGUgdG8gc2VybyBhbmQgdGhlbiBiaXR3aXNlIG9yLWluZwo+IGl0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+Cj4gQ2M6IE1h
dGhpYXMgTnltYW4gPG1hdGhpYXMubnltYW5AaW50ZWwuY29tPgo+IENjOiBHcmVnIEtyb2FoLUhh
cnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKWy4uLl0KCk1CUiwg
U2VyZ2VpCg==

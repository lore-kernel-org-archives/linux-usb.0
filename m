Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/5] usb: assign ACPI companions for embedded USB devices
From: "Ghorai, Sukumar" <sukumar.ghorai@intel.com>
Message-Id: <D73ECEF0C711E34A8F972E4B87F540058FBCF1CB@ORSMSX114.amr.corp.intel.com>
Date: Wed, 5 Dec 2018 17:19:16 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajat Jain <rajatja@google.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "rajatxjain@gmail.com" <rajatxjain@gmail.com>, "dtor@google.com" <dtor@google.com>, "Hegde, Raghuram" <raghuram.hegde@intel.com>, "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>
List-ID: <linux-usb.vger.kernel.org>

Pk9uIFdlZCwgTm92IDIxLCAyMDE4IGF0IDAzOjUwOjE3UE0gLTA4MDAsIFJhamF0IEphaW4gd3Jv
dGU6Cj4+IEZyb206IERtaXRyeSBUb3Jva2hvdiA8ZHRvckBjaHJvbWl1bS5vcmc+Cj4+Cj4+IFVT
QiBkZXZpY2VzIHBlcm1hbmVudGx5IGNvbm5lY3RlZCB0byBVU0IgcG9ydHMgbWF5IGJlIGRlc2Ny
aWJlZCBpbgo+PiBBQ1BJIHRhYmxlcyBhbmQgc2hhcmUgQUNQSSBkZXZpY2VzIHdpdGggcG9ydHMg
dGhleSBhcmUgY29ubmVjdGVkIHRvLgo+PiBTZWUgWzFdIGZvciBkZXRhaWxzLgo+Pgo+PiBUaGlz
IHdpbGwgYWxsb3cgdXMgdG8gZGVzY3JpYmUgc2lkZWJhbmQgcmVzb3VyY2VzIGZvciBkZXZpY2Vz
LCBzdWNoCj4+IGFzLCBmb3IgZXhhbXBsZSwgaGFyZCByZXNldCBsaW5lIGZvciBCVCBVU0IgY29u
dHJvbGxlcnMuCj4+Cj4+IFsxXQo+PiBodHRwczovL2RvY3MubWljcm9zb2Z0LmNvbS9lbi11cy93
aW5kb3dzLWhhcmR3YXJlL2RyaXZlcnMvYnJpbmd1cC9vdGhlCj4+IHItYWNwaS1uYW1lc3BhY2Ut
b2JqZWN0cyNhY3BpLW5hbWVzcGFjZS1oaWVyYXJjaHktYW5kLWFkci1mb3ItCj5lbWJlZGRlZAo+
PiAtdXNiLWRldmljZXMKPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IFRvcm9raG92IDxkdG9y
QGNocm9taXVtLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogUmFqYXQgSmFpbiA8cmFqYXRqYUBnb29n
bGUuY29tPiAoY2hhbmdlZCBob3cgd2UgZ2V0IHRoZQo+PiB1c2JfcG9ydCkKPgo+QWNrZWQtYnk6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+CgpUZXN0ZWQt
Ynk6IFN1a3VtYXIgR2hvcmFpIDxzdWt1bWFyLmdob3JhaUBpbnRlbC5jb20+Cg==

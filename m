Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/5] usb: split code locating ACPI companion into port and device
From: "Ghorai, Sukumar" <sukumar.ghorai@intel.com>
Message-Id: <D73ECEF0C711E34A8F972E4B87F540058FBCF24A@ORSMSX114.amr.corp.intel.com>
Date: Wed, 5 Dec 2018 17:41:30 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rajat Jain <rajatja@google.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "rajatxjain@gmail.com" <rajatxjain@gmail.com>, "dtor@google.com" <dtor@google.com>, "Hegde, Raghuram" <raghuram.hegde@intel.com>, "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>
List-ID: <linux-usb.vger.kernel.org>

Pk9uIFdlZCwgTm92IDIxLCAyMDE4IGF0IDAzOjUwOjE2UE0gLTA4MDAsIFJhamF0IEphaW4gd3Jv
dGU6Cj4+IEZyb206IERtaXRyeSBUb3Jva2hvdiA8ZHRvckBjaHJvbWl1bS5vcmc+Cj4+Cj4+IElu
IHByZXBhcmF0aW9uIGZvciBoYW5kbGluZyBlbWJlZGRlZCBVU0IgZGV2aWNlcyBsZXQncyBzcGxp
dAo+PiB1c2JfYWNwaV9maW5kX2NvbXBhbmlvbigpIGludG8gdXNiX2FjcGlfZmluZF9jb21wYW5p
b25fZm9yX2RldmljZSgpCj4+IGFuZCB1c2JfYWNwaV9maW5kX2NvbXBhbmlvbl9mb3JfcG9ydCgp
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGR0b3JAY2hyb21pdW0ub3Jn
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYWphdCBKYWluIDxyYWphdGphQGdvb2dsZS5jb20+Cj4KPkFj
a2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgoK
VGVzdGVkLWJ5OiBTdWt1bWFyIEdob3JhaSA8c3VrdW1hci5naG9yYWlAaW50ZWwuY29tPgo=

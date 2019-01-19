Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/5] usb: split code locating ACPI companion into port and device
From: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <C103ADA0-68A0-4571-AE47-1744E64E0D7E@holtmann.org>
Date: Sat, 19 Jan 2019 20:51:00 +0100
To: Rajat Jain <rajatja@google.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, netdev <netdev@vger.kernel.org>, rajatxjain@gmail.com, dtor@google.com, Raghuram Hegde <raghuram.hegde@intel.com>, chethan.tumkur.narayan@intel.com, sukumar.ghorai@intel.com
List-ID: <linux-usb.vger.kernel.org>

SGkgUmFqYXQsCgo+IEluIHByZXBhcmF0aW9uIGZvciBoYW5kbGluZyBlbWJlZGRlZCBVU0IgZGV2
aWNlcyBsZXQncyBzcGxpdAo+IHVzYl9hY3BpX2ZpbmRfY29tcGFuaW9uKCkgaW50byB1c2JfYWNw
aV9maW5kX2NvbXBhbmlvbl9mb3JfZGV2aWNlKCkgYW5kCj4gdXNiX2FjcGlfZmluZF9jb21wYW5p
b25fZm9yX3BvcnQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGR0b3JA
Y2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJhamF0IEphaW4gPHJhamF0amFAZ29vZ2xl
LmNvbT4KPiBBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiBUZXN0ZWQtYnk6IFN1a3VtYXIgR2hvcmFpIDxzdWt1bWFyLmdob3JhaUBpbnRl
bC5jb20+Cj4gLS0tCj4gdjQ6IEFkZCBBY2tlZC1ieSBhbmQgVGVzdGVkLWJ5IGluIHNpZ25hdHVy
ZXMuCj4gdjM6IHNhbWUgYXMgdjEKPiB2Mjogc2FtZSBhcyB2MQo+IAo+IGRyaXZlcnMvdXNiL2Nv
cmUvdXNiLWFjcGkuYyB8IDEzMyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0K
PiAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCgp3aGF0
IGlzIHRoZSBwbGFuIGhlcmU/IEkgdGFrZSB0aGlzIHZpYSBibHVldG9vdGgtbmV4dCB0cmVlPwoK
UmVnYXJkcwoKTWFyY2VsCg==

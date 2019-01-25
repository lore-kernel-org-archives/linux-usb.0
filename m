Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v6,1/4] usb: split code locating ACPI companion into port and device
From: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <7A631FFF-3C46-48B9-AAC6-F60F7B06D17D@holtmann.org>
Date: Fri, 25 Jan 2019 08:51:08 +0100
To: Rajat Jain <rajatja@google.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, netdev <netdev@vger.kernel.org>, rajatxjain@gmail.com, dtor@google.com, Raghuram Hegde <raghuram.hegde@intel.com>, Chethan T N <chethan.tumkur.narayan@intel.com>, sukumar.ghorai@intel.com
List-ID: <linux-usb.vger.kernel.org>

SGkgUmFqYXQsCgo+IEluIHByZXBhcmF0aW9uIGZvciBoYW5kbGluZyBlbWJlZGRlZCBVU0IgZGV2
aWNlcyBsZXQncyBzcGxpdAo+IHVzYl9hY3BpX2ZpbmRfY29tcGFuaW9uKCkgaW50byB1c2JfYWNw
aV9maW5kX2NvbXBhbmlvbl9mb3JfZGV2aWNlKCkgYW5kCj4gdXNiX2FjcGlfZmluZF9jb21wYW5p
b25fZm9yX3BvcnQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGR0b3JA
Y2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJhamF0IEphaW4gPHJhamF0amFAZ29vZ2xl
LmNvbT4KPiBBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiBUZXN0ZWQtYnk6IFN1a3VtYXIgR2hvcmFpIDxzdWt1bWFyLmdob3JhaUBpbnRl
bC5jb20+Cj4gLS0tCj4gdjY6IHNhbWUgYXMgdjQKPiB2NTogc2FtZSBhcyB2NAo+IHY0OiBBZGQg
QWNrZWQtYnkgYW5kIFRlc3RlZC1ieSBpbiBzaWduYXR1cmVzLgo+IHYzOiBzYW1lIGFzIHYxCj4g
djI6IHNhbWUgYXMgdjEKPiAKPiBkcml2ZXJzL3VzYi9jb3JlL3VzYi1hY3BpLmMgfCAxMzMgKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDcyIGlu
c2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQoKcGF0Y2ggaGFzIGJlZW4gYXBwbGllZCB0byBi
bHVldG9vdGgtbmV4dCB0cmVlLgoKUmVnYXJkcwoKTWFyY2VsCg==

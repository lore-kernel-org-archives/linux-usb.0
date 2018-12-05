Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,1/5] usb: split code locating ACPI companion into port and device
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20181205093228.GA1817@kroah.com>
Date: Wed, 5 Dec 2018 10:32:28 +0100
To: Rajat Jain <rajatja@google.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, rajatxjain@gmail.com, dtor@google.com, raghuram.hegde@intel.com, chethan.tumkur.narayan@intel.com, sukumar.ghorai@intel.com
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6NTA6MTZQTSAtMDgwMCwgUmFqYXQgSmFpbiB3cm90
ZToKPiBGcm9tOiBEbWl0cnkgVG9yb2tob3YgPGR0b3JAY2hyb21pdW0ub3JnPgo+IAo+IEluIHBy
ZXBhcmF0aW9uIGZvciBoYW5kbGluZyBlbWJlZGRlZCBVU0IgZGV2aWNlcyBsZXQncyBzcGxpdAo+
IHVzYl9hY3BpX2ZpbmRfY29tcGFuaW9uKCkgaW50byB1c2JfYWNwaV9maW5kX2NvbXBhbmlvbl9m
b3JfZGV2aWNlKCkgYW5kCj4gdXNiX2FjcGlfZmluZF9jb21wYW5pb25fZm9yX3BvcnQoKS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGR0b3JAY2hyb21pdW0ub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IFJhamF0IEphaW4gPHJhamF0amFAZ29vZ2xlLmNvbT4KCkFja2VkLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo=

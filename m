Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/5] usb: assign ACPI companions for embedded USB devices
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20181205093247.GB1817@kroah.com>
Date: Wed, 5 Dec 2018 10:32:47 +0100
To: Rajat Jain <rajatja@google.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, rajatxjain@gmail.com, dtor@google.com, raghuram.hegde@intel.com, chethan.tumkur.narayan@intel.com, sukumar.ghorai@intel.com
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBOb3YgMjEsIDIwMTggYXQgMDM6NTA6MTdQTSAtMDgwMCwgUmFqYXQgSmFpbiB3cm90
ZToKPiBGcm9tOiBEbWl0cnkgVG9yb2tob3YgPGR0b3JAY2hyb21pdW0ub3JnPgo+IAo+IFVTQiBk
ZXZpY2VzIHBlcm1hbmVudGx5IGNvbm5lY3RlZCB0byBVU0IgcG9ydHMgbWF5IGJlIGRlc2NyaWJl
ZCBpbiBBQ1BJCj4gdGFibGVzIGFuZCBzaGFyZSBBQ1BJIGRldmljZXMgd2l0aCBwb3J0cyB0aGV5
IGFyZSBjb25uZWN0ZWQgdG8uIFNlZSBbMV0KPiBmb3IgZGV0YWlscy4KPiAKPiBUaGlzIHdpbGwg
YWxsb3cgdXMgdG8gZGVzY3JpYmUgc2lkZWJhbmQgcmVzb3VyY2VzIGZvciBkZXZpY2VzLCBzdWNo
IGFzLAo+IGZvciBleGFtcGxlLCBoYXJkIHJlc2V0IGxpbmUgZm9yIEJUIFVTQiBjb250cm9sbGVy
cy4KPiAKPiBbMV0gaHR0cHM6Ly9kb2NzLm1pY3Jvc29mdC5jb20vZW4tdXMvd2luZG93cy1oYXJk
d2FyZS9kcml2ZXJzL2JyaW5ndXAvb3RoZXItYWNwaS1uYW1lc3BhY2Utb2JqZWN0cyNhY3BpLW5h
bWVzcGFjZS1oaWVyYXJjaHktYW5kLWFkci1mb3ItZW1iZWRkZWQtdXNiLWRldmljZXMKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBEbWl0cnkgVG9yb2tob3YgPGR0b3JAY2hyb21pdW0ub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IFJhamF0IEphaW4gPHJhamF0amFAZ29vZ2xlLmNvbT4gKGNoYW5nZWQgaG93IHdl
IGdldCB0aGUgdXNiX3BvcnQpCgpBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZz4K

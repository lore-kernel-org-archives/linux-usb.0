Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,1/5] usb: split code locating ACPI companion into port and device
From: Rajat Jain <rajatja@google.com>
Message-Id: <CACK8Z6FzWTZ_SYCBqGsOcf2xzSp3+W9HD-1inyRtJ=Wqsww8Pw@mail.gmail.com>
Date: Tue, 22 Jan 2019 14:28:27 -0800
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, netdev <netdev@vger.kernel.org>, Rajat Jain <rajatxjain@gmail.com>, Dmitry Torokhov <dtor@google.com>, Raghuram Hegde <raghuram.hegde@intel.com>, chethan.tumkur.narayan@intel.com, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgTWFyY2VsLAoKT24gU2F0LCBKYW4gMTksIDIwMTkgYXQgMTE6NTEgQU0gTWFyY2VsIEhvbHRt
YW5uIDxtYXJjZWxAaG9sdG1hbm4ub3JnPiB3cm90ZToKPgo+IEhpIFJhamF0LAo+Cj4gPiBJbiBw
cmVwYXJhdGlvbiBmb3IgaGFuZGxpbmcgZW1iZWRkZWQgVVNCIGRldmljZXMgbGV0J3Mgc3BsaXQK
PiA+IHVzYl9hY3BpX2ZpbmRfY29tcGFuaW9uKCkgaW50byB1c2JfYWNwaV9maW5kX2NvbXBhbmlv
bl9mb3JfZGV2aWNlKCkgYW5kCj4gPiB1c2JfYWNwaV9maW5kX2NvbXBhbmlvbl9mb3JfcG9ydCgp
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBUb3Jva2hvdiA8ZHRvckBjaHJvbWl1bS5v
cmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSYWphdCBKYWluIDxyYWphdGphQGdvb2dsZS5jb20+Cj4g
PiBBY2tlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KPiA+IFRlc3RlZC1ieTogU3VrdW1hciBHaG9yYWkgPHN1a3VtYXIuZ2hvcmFpQGludGVsLmNv
bT4KPiA+IC0tLQo+ID4gdjQ6IEFkZCBBY2tlZC1ieSBhbmQgVGVzdGVkLWJ5IGluIHNpZ25hdHVy
ZXMuCj4gPiB2Mzogc2FtZSBhcyB2MQo+ID4gdjI6IHNhbWUgYXMgdjEKPiA+Cj4gPiBkcml2ZXJz
L3VzYi9jb3JlL3VzYi1hY3BpLmMgfCAxMzMgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tCj4gPiAxIGZpbGUgY2hhbmdlZCwgNzIgaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25z
KC0pCj4KPiB3aGF0IGlzIHRoZSBwbGFuIGhlcmU/IEkgdGFrZSB0aGlzIHZpYSBibHVldG9vdGgt
bmV4dCB0cmVlPwoKWWVzLCBJJ2QgdGhpbmsgdGhhdCB3b3VsZCBiZSB0aGUgYmVzdCBwbGFuLiBE
bWl0cnkgLyBHcmVnIC0gZG8geW91CmhhdmUgYW55IG9iamVjdGlvbnMgLyBzdWdnZXN0aW9ucz8K
Cj4KPiBSZWdhcmRzCj4KPiBNYXJjZWwKPgo=

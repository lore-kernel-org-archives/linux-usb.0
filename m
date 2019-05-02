Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] xhci: Convert xhci_handshake() to use readl_poll_timeout_atomic()
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Message-Id: <c102196e-1250-307f-0b2e-d76c62a161a0@linux.intel.com>
Date: Thu, 2 May 2019 15:17:17 +0300
To: Raul Rangel <rrangel@chromium.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gMjkuNC4yMDE5IDIzLjA1LCBSYXVsIFJhbmdlbCB3cm90ZToKPiBPbiBUaHUsIEZlYiAwNywg
MjAxOSBhdCAwNTo0ODoxNlBNIC0wODAwLCBBbmRyZXkgU21pcm5vdiB3cm90ZToKPj4gWGhjaV9o
YW5kc2hha2UoKSBpbXBsZW1lbnRzIHRoZSBhbGdvcml0aG0gYWxyZWFkeSBjYXB0dXJlZCBieQo+
PiByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKCkuIENvbnZlcnQgdGhlIGZvcm1lciB0byB1c2Ug
dGhlIGxhdHRlciB0bwo+PiBhdm9pZCByZXBldGl0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXkgU21pcm5vdiA8YW5kcmV3LnNtaXJub3ZAZ21haWwuY29tPgo+IFRlc3RlZC1ieTogUmF1
bCBFIFJhbmdlbCA8cnJhbmdlbEBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IFJhdWwgRSBS
YW5nZWwgPHJyYW5nZWxAY2hyb21pdW0ub3JnPgo+IAo+IFRoaXMgZml4ZXMgYSBidWcgb24gdGhl
IEFNRCBTdG9uZXlyaWRnZSBwbGF0Zm9ybS4gdXNsZWVwKDEpIHNvbWV0aW1lcwo+IHRha2VzIG92
ZXIgMTBtcy4gVGhpcyBtZWFucyBhIDUgc2Vjb25kIHRpbWVvdXQgY2FuIGVhc2lseSB0YWtlIG92
ZXIgMTUKPiBzZWNvbmRzIHdoaWNoIHdpbGwgdHJpZ2dlciB0aGUgd2F0Y2hkb2cgYW5kIHJlYm9v
dCB0aGUgc3lzdGVtLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWRkaW5nIHRvIHF1ZXVl
CgotTWF0aGlhcwo=

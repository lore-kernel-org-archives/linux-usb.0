Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [07/12] xhci: Add option to get next extended capability in list by passing id = 0
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180216132136.GM1480@kuha.fi.intel.com>
Date: Fri, 16 Feb 2018 15:21:36 +0200
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMTE6NDc6NDZBTSArMDEwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPiBGcm9tOiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNv
bT4KPiAKPiBNb2RpZnkgeGhjaV9maW5kX25leHRfZXh0X2NhcChiYXNlLCBvZmZzZXQsIGlkKSB0
byByZXR1cm4gdGhlIG5leHQKPiBjYXBhYmlsaXR5IG9mZnNldCBpZiAwIGlzIHBhc3NlZCBmb3Ig
aWQuIE90aGVyd2lzZSBpdCB3aWxsIGJlaGF2ZSBhcwo+IHByZXZpb3VzbHkgYW5kIHJldHVybiB0
aGUgb2Zmc2V0IG9mIHRoZSBuZXh0IGNhcGFiaWxpdHkgd2l0aCBtYXRjaGluZyBpZAo+IAo+IGNh
cGFiaWxpdHkgaWQgMCBpcyBub3QgdXNlZCBieSB4aGNpIChyZXNlcnZlZCkKPiAKPiBUaGlzIGlz
IHVzZWZ1bCB3aGVuIHdlIHdhbnQgdG8gbG9vcCB0aHJvdWdoIGFsbCBjYXBhYmlsaXRpZXMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRl
bC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNv
bT4KCkZXSVc6CgpSZXZpZXdlZC1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNA
bGludXguaW50ZWwuY29tPgoKCkJyLAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/6] USB: move many drivers to use DEVICE_ATTR_RW
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <871signa5d.fsf@linux.intel.com>
Date: Tue, 23 Jan 2018 12:26:38 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Matthieu CASTET <castet.matthieu@free.fr>, Stanislaw Gruszka <stf_xl@wp.pl>, Peter Chen <Peter.Chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Bin Liu <b-liu@ti.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cml0
ZXM6Cj4gSW5zdGVhZCBvZiAib3BlbiBjb2RpbmciIGEgREVWSUNFX0FUVFIoKSBkZWZpbmUsIHVz
ZSB0aGUKPiBERVZJQ0VfQVRUUl9SVygpIG1hY3JvIGluc3RlYWQsIHdoaWNoIGRvZXMgZXZlcnl0
aGluZyBwcm9wZXJseSBpbnN0ZWFkLgo+Cj4gVGhpcyBkb2VzIHJlcXVpcmUgYSBmZXcgc3RhdGlj
IGZ1bmN0aW9ucyB0byBiZSByZW5hbWVkIHRvIHdvcmsgcHJvcGVybHksCj4gYnV0IHRoYW5rcyB0
byBhIHNjcmlwdCBmcm9tIEpvZSBQZXJjaGVzLCB0aGlzIHdhcyBlYXNpbHkgZG9uZS4KPgo+IFJl
cG9ydGVkLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgo+IENjOiBNYXR0aGlldSBD
QVNURVQgPGNhc3RldC5tYXR0aGlldUBmcmVlLmZyPgo+IENjOiBTdGFuaXNsYXcgR3J1c3prYSA8
c3RmX3hsQHdwLnBsPgo+IENjOiBQZXRlciBDaGVuIDxQZXRlci5DaGVuQG54cC5jb20+Cj4gQ2M6
IEFsYW4gU3Rlcm4gPHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU+Cj4gQ2M6IE1hdGhpYXMgTnlt
YW4gPG1hdGhpYXMubnltYW5AaW50ZWwuY29tPgo+IENjOiBCaW4gTGl1IDxiLWxpdUB0aS5jb20+
Cj4gQ2M6IEZlbGlwZSBCYWxiaSA8YmFsYmlAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgoKZm9yIGRyaXZl
cnMvdXNiL3BoeToKCkFja2VkLWJ5OiBGZWxpcGUgQmFsYmkgPGZlbGlwZS5iYWxiaUBsaW51eC5p
bnRlbC5jb20+Cg==

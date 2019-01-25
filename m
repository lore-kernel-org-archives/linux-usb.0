Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v6,4/4] Bluetooth: btusb: Use the cmd_timeout method to reset the Intel BT chip
From: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <9916633A-DB56-49E2-94D5-CE809AE20A31@holtmann.org>
Date: Fri, 25 Jan 2019 08:51:16 +0100
To: Rajat Jain <rajatja@google.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, Dmitry Torokhov <dtor@chromium.org>, Alex Hung <alex.hung@canonical.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, rajatxjain@gmail.com, dtor@google.com, raghuram.hegde@intel.com, chethan.tumkur.narayan@intel.com, sukumar.ghorai@intel.com
List-ID: <linux-usb.vger.kernel.org>

SGkgUmFqYXQsCgo+IElmIHRoZSBwbGF0Zm9ybSBwcm92aWRlcyBpdCwgdXNlIHRoZSByZXNldCBn
cGlvIHRvIHJlc2V0IHRoZSBJbnRlbCBCVAo+IGNoaXAsIGFzIHBhcnQgb2YgY21kX3RpbWVvdXQg
aGFuZGxpbmcuIFRoaXMgaGFzIGJlZW4gZm91bmQgaGVscGZ1bCBvbgo+IEludGVsIGJsdWV0b290
aCBjb250cm9sbGVycyB3aGVyZSB0aGUgZmlybXdhcmUgZ2V0cyBzdHVjayBhbmQgdGhlIG9ubHkK
PiB3YXkgb3V0IGlzIGEgaGFyZCByZXNldCBwaW4gcHJvdmlkZWQgYnkgdGhlIHBsYXRmb3JtLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJhamF0IEphaW4gPHJhamF0amFAZ29vZ2xlLmNvbT4KPiAtLS0K
PiB2NjogTW92ZSB0aGUgY21kX3RpbWVvdXQoKSBob29rIGFzc2lnbm1lbnQgd2l0aCBvdGhlciBo
b29rcywgbW92ZSB0aGUKPiAgICByZXNldF9ncGlvIGNoZWNrIGluIHRoZSB0aW1lb3V0IGZ1bmN0
aW9uLgo+IHY1OiBSZW5hbWUgdGhlIGhvb2sgdG8gY21kX3RpbWVvdXQsIGFuZCB3YWl0IGZvciA1
IHRpbWVvdXRzIGJlZm9yZQo+ICAgIHJlc2V0dGluZyB0aGUgZGV2aWNlLgo+IHY0OiBVc2UgZGF0
YS0+ZmxhZ3MgaW5zdGVhZCBvZiBjbGVhcmluZyB0aGUgcXVpcmsgaW4gYnR1c2JfaHdfcmVzZXQo
KQo+IHYzOiBCZXR0ZXIgZXJyb3IgaGFuZGxpbmcgZm9yIGdwaW9kX2dldF9vcHRpb25hbCgpCj4g
djI6IEhhbmRsZSB0aGUgRVBST0JFX0RFRkVSIGNhc2UuCj4gCj4gZHJpdmVycy9ibHVldG9vdGgv
YnR1c2IuYyB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IDEg
ZmlsZSBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCgpwYXRjaCBoYXMgYmVlbiBhcHBsaWVkIHRv
IGJsdWV0b290aC1uZXh0IHRyZWUuCgpSZWdhcmRzCgpNYXJjZWwK

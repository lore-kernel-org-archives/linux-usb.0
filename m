Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: gadget: f_fs: don't free buffer prematurely
From: fei.yang@intel.com
Message-Id: <02E7334B1630744CBDC55DA8586225837F7FB244@ORSMSX102.amr.corp.intel.com>
Date: Wed, 20 Mar 2019 05:38:38 +0000
To: "mgautam@codeaurora.org" <mgautam@codeaurora.org>
Cc: "balbi@kernel.org" <balbi@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "zhangjerry@google.com" <zhangjerry@google.com>, "andrzej.p@collabora.com" <andrzej.p@collabora.com>, "plr.vincent@gmail.com" <plr.vincent@gmail.com>, "Shen, JingX" <jingx.shen@intel.com>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb-owner@vger.kernel.org" <linux-usb-owner@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

Pj4gRnJvbTogRmVpIFlhbmcgPGZlaS55YW5nQGludGVsLmNvbT4KPj4gCj4+IFRoZSBmb2xsb3dp
bmcga2VybmVsIHBhbmljIGhhcHBlbnMgZHVlIHRvIHRoZSBpb19kYXRhIGJ1ZmZlciBnZXRzIAo+
PiBkZWFsbG9jYXRlZCBiZWZvcmUgdGhlIGFzeW5jIGlvIGlzIGNvbXBsZXRlZC4gQWRkIGEgY2hl
Y2sgZm9yIHRoZSBjYXNlIAo+PiB3aGVyZSBpb19kYXRhIGJ1ZmZlciBzaG91bGQgYmUgZGVhbGxv
Y2F0ZWQgYnkgZmZzX3VzZXJfY29weV93b3JrZXIuCj4gCj4gW3NuaXBdCj4KPiBQbGVhc2UgYWRk
IHRhZyAtICdGaXhlczogNzcyYTdhNzI0ZjYgKCJ1c2I6IGdhZGdldDogZl9mczogQWxsb3cgc2Nh
dHRlci1nYXRoZXIgYnVmZmVycyIpClNlbnQgW1BBVENIIFYyXQoKPj4gLS0tCj4+ICBkcml2ZXJz
L3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9mcy5jIHwgMyArKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9mcy5jCj4+IGIvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0
aW9uL2ZfZnMuYwo+PiBpbmRleCAyMDQxM2MyLi40N2JlOTYxIDEwMDY0NAo+PiAtLS0gYS9kcml2
ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl9mcy5jCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdl
dC9mdW5jdGlvbi9mX2ZzLmMKPj4gQEAgLTExMzMsNyArMTEzMyw4IEBAIHN0YXRpYyBzc2l6ZV90
IGZmc19lcGZpbGVfaW8oc3RydWN0IGZpbGUgKmZpbGUsCj4+IHN0cnVjdCBmZnNfaW9fZGF0YSAq
aW9fZGF0YSkKPj4gIGVycm9yX211dGV4Ogo+PiAgCW11dGV4X3VubG9jaygmZXBmaWxlLT5tdXRl
eCk7Cj4+ICBlcnJvcjoKPj4gLQlmZnNfZnJlZV9idWZmZXIoaW9fZGF0YSk7Cj4+ICsJaWYgKHJl
dCAhPSAtRUlPQ0JRVUVVRUQpIC8qIGRvbid0IGZyZWUgaWYgdGhlcmUgaXMgaW9jYiBxdWV1ZWQg
Ki8KPj4gKwkJZmZzX2ZyZWVfYnVmZmVyKGlvX2RhdGEpOwo+PiAgCXJldHVybiByZXQ7Cj4+ICB9
Cg==

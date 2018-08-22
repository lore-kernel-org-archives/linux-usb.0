Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Possible use_mm() mis-uses
From: Linus Torvalds <torvalds@linux-foundation.org>
Message-Id: <CA+55aFxWqg-t19i70mk-Y_dLVkjAjxV6jHnBZCTv0kg=MR8L7A@mail.gmail.com>
Date: Wed, 22 Aug 2018 13:07:34 -0700
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, Dave Airlie <airlied@linux.ie>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, DRI <dri-devel@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org, KVM list <kvm@vger.kernel.org>, intel-gvt-dev@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>, USB list <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMTI6NDQgUE0gRmVsaXggS3VlaGxpbmcgPGZlbGl4Lmt1
ZWhsaW5nQGFtZC5jb20+IHdyb3RlOgo+Cj4gWW91J3JlIHJpZ2h0LCBidXQgdGhhdCdzIGEgYml0
IGZyYWdpbGUgYW5kIGNvbnZvbHV0ZWQuIEknbGwgZml4IEtGRCB0bwo+IGhhbmRsZSB0aGlzIG1v
cmUgcm9idXN0bHkuIFNlZSB0aGUgYXR0YWNoZWQgKHVudGVzdGVkKSBwYXRjaC4KClllcywgdGhp
cyBwYXRjaCB0aGF0IG1ha2VzIHRoZSB3aG9sZSAiaGFzIHRvIHVzZSBjdXJyZW50IG1tIiBvciB1
c2VzCiJnZXRfdGFza19tbSgpIiBsb29rcyBnb29kIGZyb20gYSBWTTwgd29ycnkgc3RhbmRwb2lu
dC4KClRoYW5rcy4KCj4gQW5kCj4gb2J2aW91c2x5IHRoYXQgb3BhcXVlIHBvaW50ZXIgZGlkbid0
IHdvcmsgYXMgaW50ZW5kZWQuIEl0IGp1c3QgZ2V0cwo+IHByb21vdGVkIHRvIGFuIG1tX3N0cnVj
dCAqIHdpdGhvdXQgYSB3YXJuaW5nIGZyb20gdGhlIGNvbXBpbGVyLiBNYXliZSBJCj4gc2hvdWxk
IGNoYW5nZSB0aGF0IHRvIGEgbG9uZyB0byBtYWtlIGFidXNlIGVhc2llciB0byBzcG90LgoKVXNp
bmcgYSAidm9pZCAqIiBpcyBhY3R1YWxseSBqdXN0IGFib3V0IHRoZSB3b3JzdCBwb3NzaWJsZSB0
eXBlIGZvcgpzb21ldGhpbmcgdGhhdCBzaG91bGQgYmUgYSBjb29raWUsIGJlY2F1c2UgaXQgc2ls
ZW50bHkgdHJhbnNsYXRlcyB0bwphbnkgcG9pbnRlci4KCiJsb25nIiBpcyBhY3R1YWxseSBub3Qg
bXVjaCBiZXR0ZXIsIGJlY3Vhc2UgaXQgd2lsbCBzaWxlbnRseSBjb252ZXJ0CnRvIGFueSBpbnRl
Z2VyIHR5cGUuCgpBIGdvb2QgZmFpcmx5IHR5cGUtc2FmZSBjb29raWUgdHlwZSBpcyBhY3R1YWxs
eSB0aGlzOgoKICAgIHR5cGVkZWYgdm9sYXRpbGUgY29uc3Qgc3RydWN0IG5vX3N1Y2hfc3RydWN0
ICpjb29raWVfcHRyX3Q7CgphbmQgbm93IHNvbWV0aGluZyBvZiB0eXBlICJjb29raWVfcHRyX3Qi
IGlzIGFjdHVhbGx5IHZlcnkgIGhhcmQgdG8KY29udmVydCB0byBvdGhlciB0eXBlcyBieSBtaXN0
YWtlLgoKTm90ZSB0aGF0IHRoZSAidm9sYXRpbGUgY29uc3QiIGlzIG5vdCBqdXN0IHJhbmRvbSBu
b2lzZSAtIGl0J3Mgc28gdGhhdAppdCB3b24ndCBldmVuIGNvbnZlcnQgd2l0aG91dCB3YXJuaW5n
cyB0byB0aGluZ3MgdGhhdCB0YWtlIGEgImNvbnN0CnZvaWQgKiIgYXMgYW4gYXJndW1lbnQgKGxp
a2UsIHNheSwgdGhlIHNvdXJjZSBvZiAnbWVtY3B5KCknKS4KClNvIHlvdSBhbG1vc3QgX2hhdmVf
IHRvIGV4cGxpY2l0bHkgY2FzdCBpdCB0byB1c2UgaXQuCgogICAgICAgICAgIExpbnVzCg==

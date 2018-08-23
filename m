Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: Possible use_mm() mis-uses
From: Linus Torvalds <torvalds@linux-foundation.org>
Message-Id: <CA+55aFw7cbyB3CKGbzvdgavy7f3-SXsRKAJZJGcvSP4Wuu+ymQ@mail.gmail.com>
Date: Thu, 23 Aug 2018 11:03:19 -0700
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Oded Gabbay <oded.gabbay@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, Dave Airlie <airlied@linux.ie>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, KVM list <kvm@vger.kernel.org>, intel-gfx <intel-gfx@lists.freedesktop.org>, USB list <linux-usb@vger.kernel.org>, amd-gfx@lists.freedesktop.org, DRI <dri-devel@lists.freedesktop.org>, intel-gvt-dev@lists.freedesktop.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBBdWcgMjIsIDIwMTggYXQgMTE6MTYgUE0gWmhlbnl1IFdhbmcgPHpoZW55dXdAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPgo+IHllYWgsIHRoYXQncyB0aGUgY2xlYXIgd2F5IHRvIGZp
eCB0aGlzIGltby4gV2Ugb25seSBkZXBlbmQgb24gZ3Vlc3QKPiBsaWZlIGN5Y2xlIHRvIGFjY2Vz
cyBndWVzdCBtZW1vcnkgcHJvcGVybHkuIEhlcmUncyBwcm9wb3NlZCBmaXgsIHdpbGwKPiB2ZXJp
ZnkgYW5kIGludGVncmF0ZSBpdCBsYXRlci4KClRoYW5rcywgdGhpcyBsb29rcyBzYW5lIHRvIG1l
LAoKICAgICAgICAgICAgICAgIExpbnVzCg==

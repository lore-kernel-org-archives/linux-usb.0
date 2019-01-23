Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/3] treewide: Lift switch variables out of switches
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190123115829.GA31385@kroah.com>
Date: Wed, 23 Jan 2019 12:58:29 +0100
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laura Abbott <labbott@redhat.com>, Alexander Popov <alex.popov@linux.com>, xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, dev@openvswitch.org, linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-hardening@lists.openwall.com
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDM6MDM6NDdBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IFZhcmlhYmxlcyBkZWNsYXJlZCBpbiBhIHN3aXRjaCBzdGF0ZW1lbnQgYmVmb3JlIGFueSBj
YXNlIHN0YXRlbWVudHMKPiBjYW5ub3QgYmUgaW5pdGlhbGl6ZWQsIHNvIG1vdmUgYWxsIGluc3Rh
bmNlcyBvdXQgb2YgdGhlIHN3aXRjaGVzLgo+IEFmdGVyIHRoaXMsIGZ1dHVyZSBhbHdheXMtaW5p
dGlhbGl6ZWQgc3RhY2sgdmFyaWFibGVzIHdpbGwgd29yawo+IGFuZCBub3QgdGhyb3cgd2Fybmlu
Z3MgbGlrZSB0aGlzOgo+IAo+IGZzL2ZjbnRsLmM6IEluIGZ1bmN0aW9uIOKAmHNlbmRfc2lnaW9f
dG9fdGFza+KAmToKPiBmcy9mY250bC5jOjczODoxMzogd2FybmluZzogc3RhdGVtZW50IHdpbGwg
bmV2ZXIgYmUgZXhlY3V0ZWQgWy1Xc3dpdGNoLXVucmVhY2hhYmxlXQo+ICAgIHNpZ2luZm9fdCBz
aTsKPiAgICAgICAgICAgICAgXn4KClRoYXQncyBhIHBhaW4sIHNvIHRoaXMgbWVhbnMgd2UgY2Fu
J3QgaGF2ZSBhbnkgbmV3IHZhcmlhYmxlcyBpbiB7IH0Kc2NvcGUgZXhjZXB0IGZvciBhdCB0aGUg
dG9wIG9mIGEgZnVuY3Rpb24/CgpUaGF0J3MgZ29pbmcgdG8gYmUgYSBoYXJkIHRoaW5nIHRvIGtl
ZXAgZnJvbSBoYXBwZW5pbmcgb3ZlciB0aW1lLCBhcwp0aGlzIGlzIHZhbGlkIEMgOigKCmdyZWcg
ay1oCg==

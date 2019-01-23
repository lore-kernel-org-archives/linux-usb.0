Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/3] treewide: Lift switch variables out of switches
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-Id: <CAKv+Gu-ECKNy+nmnbsetkOg28VR1YkFgnRsu+u9mN4DC_poBwg@mail.gmail.com>
Date: Wed, 23 Jan 2019 13:12:26 +0100
To: Jann Horn <jannh@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, kernel list <linux-kernel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, Alexander Popov <alex.popov@linux.com>, xen-devel <xen-devel@lists.xenproject.org>, dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org, Network Development <netdev@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, dev@openvswitch.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCAyMyBKYW4gMjAxOSBhdCAxMzowOSwgSmFubiBIb3JuIDxqYW5uaEBnb29nbGUuY29t
PiB3cm90ZToKPgo+IE9uIFdlZCwgSmFuIDIzLCAyMDE5IGF0IDE6MDQgUE0gR3JlZyBLSCA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gT24gV2VkLCBKYW4gMjMsIDIwMTkg
YXQgMDM6MDM6NDdBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3RlOgo+ID4gPiBWYXJpYWJsZXMgZGVj
bGFyZWQgaW4gYSBzd2l0Y2ggc3RhdGVtZW50IGJlZm9yZSBhbnkgY2FzZSBzdGF0ZW1lbnRzCj4g
PiA+IGNhbm5vdCBiZSBpbml0aWFsaXplZCwgc28gbW92ZSBhbGwgaW5zdGFuY2VzIG91dCBvZiB0
aGUgc3dpdGNoZXMuCj4gPiA+IEFmdGVyIHRoaXMsIGZ1dHVyZSBhbHdheXMtaW5pdGlhbGl6ZWQg
c3RhY2sgdmFyaWFibGVzIHdpbGwgd29yawo+ID4gPiBhbmQgbm90IHRocm93IHdhcm5pbmdzIGxp
a2UgdGhpczoKPiA+ID4KPiA+ID4gZnMvZmNudGwuYzogSW4gZnVuY3Rpb24g4oCYc2VuZF9zaWdp
b190b190YXNr4oCZOgo+ID4gPiBmcy9mY250bC5jOjczODoxMzogd2FybmluZzogc3RhdGVtZW50
IHdpbGwgbmV2ZXIgYmUgZXhlY3V0ZWQgWy1Xc3dpdGNoLXVucmVhY2hhYmxlXQo+ID4gPiAgICBz
aWdpbmZvX3Qgc2k7Cj4gPiA+ICAgICAgICAgICAgICBefgo+ID4KPiA+IFRoYXQncyBhIHBhaW4s
IHNvIHRoaXMgbWVhbnMgd2UgY2FuJ3QgaGF2ZSBhbnkgbmV3IHZhcmlhYmxlcyBpbiB7IH0KPiA+
IHNjb3BlIGV4Y2VwdCBmb3IgYXQgdGhlIHRvcCBvZiBhIGZ1bmN0aW9uPwo+Cj4gQUZBSUNTIHRo
aXMgb25seSBhcHBsaWVzIHRvIHN3aXRjaCBzdGF0ZW1lbnRzIChiZWNhdXNlIHRoZXkganVtcCB0
byBhCj4gY2FzZSBhbmQgZG9uJ3QgZXhlY3V0ZSBzdHVmZiBhdCB0aGUgc3RhcnQgb2YgdGhlIGJs
b2NrKSwgbm90IGJsb2Nrcwo+IGFmdGVyIGlmL3doaWxlLy4uLiAuCj4KCkkgZ3Vlc3MgdGhhdCBt
ZWFucyBpdCBtYXkgYXBwbHkgdG8gb3RoZXIgY2FzZXMgd2hlcmUgeW91IGRvIGEgJ2dvdG8nCmlu
dG8gdGhlIG1pZGRsZSBvZiBhIGZvcigpIGxvb3AsIGZvciBpbnN0YW5jZSAoYXQgdGhlIGZpcnN0
Cml0ZXJhdGlvbiksIHdoaWNoIGlzIGFsc28gYSB2YWxpZCBwYXR0ZXJuLgoKSXMgdGhlcmUgYW55
IHdheSB0byB0YWcgdGhlc2UgYXNzaWdubWVudHMgc28gdGhlIGRpYWdub3N0aWMgZGlzcmVnYXJk
cyB0aGVtPwo=

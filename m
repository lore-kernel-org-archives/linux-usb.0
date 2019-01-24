Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/3] treewide: Lift switch variables out of switches
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190124081024.GA1108@kroah.com>
Date: Thu, 24 Jan 2019 09:10:24 +0100
To: Kees Cook <keescook@chromium.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Edwin Zimmerman <edwin@211mainstreet.net>, dev@openvswitch.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Network Development <netdev@vger.kernel.org>, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Linux-MM <linux-mm@kvack.org>, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>, intel-wired-lan@lists.osuosl.org, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Laura Abbott <labbott@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBKYW4gMjQsIDIwMTkgYXQgMDc6NTU6NTFBTSArMTMwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IE9uIFRodSwgSmFuIDI0LCAyMDE5IGF0IDQ6NDQgQU0gSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCAyMyBKYW4gMjAxOSwg
RWR3aW4gWmltbWVybWFuIDxlZHdpbkAyMTFtYWluc3RyZWV0Lm5ldD4gd3JvdGU6Cj4gPiA+IE9u
IFdlZCwgMjMgSmFuIDIwMTksIEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5j
b20+IHdyb3RlOgo+ID4gPj4gT24gV2VkLCAyMyBKYW4gMjAxOSwgR3JlZyBLSCA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPj4gPiBPbiBXZWQsIEphbiAyMywgMjAxOSBh
dCAwMzowMzo0N0FNIC0wODAwLCBLZWVzIENvb2sgd3JvdGU6Cj4gPiA+PiA+PiBWYXJpYWJsZXMg
ZGVjbGFyZWQgaW4gYSBzd2l0Y2ggc3RhdGVtZW50IGJlZm9yZSBhbnkgY2FzZSBzdGF0ZW1lbnRz
Cj4gPiA+PiA+PiBjYW5ub3QgYmUgaW5pdGlhbGl6ZWQsIHNvIG1vdmUgYWxsIGluc3RhbmNlcyBv
dXQgb2YgdGhlIHN3aXRjaGVzLgo+ID4gPj4gPj4gQWZ0ZXIgdGhpcywgZnV0dXJlIGFsd2F5cy1p
bml0aWFsaXplZCBzdGFjayB2YXJpYWJsZXMgd2lsbCB3b3JrCj4gPiA+PiA+PiBhbmQgbm90IHRo
cm93IHdhcm5pbmdzIGxpa2UgdGhpczoKPiA+ID4+ID4+Cj4gPiA+PiA+PiBmcy9mY250bC5jOiBJ
biBmdW5jdGlvbiDigJhzZW5kX3NpZ2lvX3RvX3Rhc2vigJk6Cj4gPiA+PiA+PiBmcy9mY250bC5j
OjczODoxMzogd2FybmluZzogc3RhdGVtZW50IHdpbGwgbmV2ZXIgYmUgZXhlY3V0ZWQgWy1Xc3dp
dGNoLXVucmVhY2hhYmxlXQo+ID4gPj4gPj4gICAgc2lnaW5mb190IHNpOwo+ID4gPj4gPj4gICAg
ICAgICAgICAgIF5+Cj4gPiA+PiA+Cj4gPiA+PiA+IFRoYXQncyBhIHBhaW4sIHNvIHRoaXMgbWVh
bnMgd2UgY2FuJ3QgaGF2ZSBhbnkgbmV3IHZhcmlhYmxlcyBpbiB7IH0KPiA+ID4+ID4gc2NvcGUg
ZXhjZXB0IGZvciBhdCB0aGUgdG9wIG9mIGEgZnVuY3Rpb24/Cj4gCj4gSnVzdCBpbiBjYXNlIHRo
aXMgd2Fzbid0IGNsZWFyOiBubywgaXQncyBqdXN0IHRoZSBzd2l0Y2ggc3RhdGVtZW50Cj4gYmVm
b3JlIHRoZSBmaXJzdCAiY2FzZSIuIEkgY2Fubm90IGltYWdpbmUgaG93IGJhZCBpdCB3b3VsZCBi
ZSBpZiB3ZQo+IGNvdWxkbid0IGhhdmUgYmxvY2stc2NvcGVkIHZhcmlhYmxlcyEgSGVoLiA6KQoK
U29ycnksIGl0IHdhcyBub3QgY2xlYXIgYXQgZmlyc3QgZ2xhbmNlLiAgU28gbm8gbW9yZSBvYmpl
Y3Rpb24gZnJvbSBtZQpmb3IgdGhpcyBjaGFuZ2UuCgpncmVnIGstaAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/3] treewide: Lift switch variables out of switches
From: Jann Horn <jannh@google.com>
Message-Id: <CAG48ez2vfXkr9dozJiGmze8k49VOXfs=K7M8bv0aQsDDpzrEFQ@mail.gmail.com>
Date: Wed, 23 Jan 2019 13:09:13 +0100
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, kernel list <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laura Abbott <labbott@redhat.com>, Alexander Popov <alex.popov@linux.com>, xen-devel <xen-devel@lists.xenproject.org>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org, Network Development <netdev@vger.kernel.org>, linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, dev@openvswitch.org, linux-kbuild@vger.kernel.org, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMTowNCBQTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4gT24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDM6MDM6NDdBTSAt
MDgwMCwgS2VlcyBDb29rIHdyb3RlOgo+ID4gVmFyaWFibGVzIGRlY2xhcmVkIGluIGEgc3dpdGNo
IHN0YXRlbWVudCBiZWZvcmUgYW55IGNhc2Ugc3RhdGVtZW50cwo+ID4gY2Fubm90IGJlIGluaXRp
YWxpemVkLCBzbyBtb3ZlIGFsbCBpbnN0YW5jZXMgb3V0IG9mIHRoZSBzd2l0Y2hlcy4KPiA+IEFm
dGVyIHRoaXMsIGZ1dHVyZSBhbHdheXMtaW5pdGlhbGl6ZWQgc3RhY2sgdmFyaWFibGVzIHdpbGwg
d29yawo+ID4gYW5kIG5vdCB0aHJvdyB3YXJuaW5ncyBsaWtlIHRoaXM6Cj4gPgo+ID4gZnMvZmNu
dGwuYzogSW4gZnVuY3Rpb24g4oCYc2VuZF9zaWdpb190b190YXNr4oCZOgo+ID4gZnMvZmNudGwu
Yzo3Mzg6MTM6IHdhcm5pbmc6IHN0YXRlbWVudCB3aWxsIG5ldmVyIGJlIGV4ZWN1dGVkIFstV3N3
aXRjaC11bnJlYWNoYWJsZV0KPiA+ICAgIHNpZ2luZm9fdCBzaTsKPiA+ICAgICAgICAgICAgICBe
fgo+Cj4gVGhhdCdzIGEgcGFpbiwgc28gdGhpcyBtZWFucyB3ZSBjYW4ndCBoYXZlIGFueSBuZXcg
dmFyaWFibGVzIGluIHsgfQo+IHNjb3BlIGV4Y2VwdCBmb3IgYXQgdGhlIHRvcCBvZiBhIGZ1bmN0
aW9uPwoKQUZBSUNTIHRoaXMgb25seSBhcHBsaWVzIHRvIHN3aXRjaCBzdGF0ZW1lbnRzIChiZWNh
dXNlIHRoZXkganVtcCB0byBhCmNhc2UgYW5kIGRvbid0IGV4ZWN1dGUgc3R1ZmYgYXQgdGhlIHN0
YXJ0IG9mIHRoZSBibG9jayksIG5vdCBibG9ja3MKYWZ0ZXIgaWYvd2hpbGUvLi4uIC4KCj4gVGhh
dCdzIGdvaW5nIHRvIGJlIGEgaGFyZCB0aGluZyB0byBrZWVwIGZyb20gaGFwcGVuaW5nIG92ZXIg
dGltZSwgYXMKPiB0aGlzIGlzIHZhbGlkIEMgOigK

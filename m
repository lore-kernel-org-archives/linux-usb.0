Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/3] treewide: Lift switch variables out of switches
From: William Kucharski <william.kucharski@oracle.com>
Message-Id: <536BB69D-6E93-4E32-8303-16D92E07D8AA@oracle.com>
Date: Wed, 23 Jan 2019 06:21:44 -0700
To: Jann Horn <jannh@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, kernel list <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Laura Abbott <labbott@redhat.com>, Alexander Popov <alex.popov@linux.com>, xen-devel <xen-devel@lists.xenproject.org>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-wired-lan <intel-wired-lan@lists.osuosl.org>, Network Development <netdev@vger.kernel.org>, linux-usb@vger.kernel.org, linux-fsdevel@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, dev@openvswitch.org, linux-kbuild@vger.kernel.org, linux-security-module <linux-security-module@vger.kernel.org>, Kernel Hardening <kernel-hardening@lists.openwall.com>
List-ID: <linux-usb.vger.kernel.org>

PiBPbiBKYW4gMjMsIDIwMTksIGF0IDU6MDkgQU0sIEphbm4gSG9ybiA8amFubmhAZ29vZ2xlLmNv
bT4gd3JvdGU6Cj4gCj4gQUZBSUNTIHRoaXMgb25seSBhcHBsaWVzIHRvIHN3aXRjaCBzdGF0ZW1l
bnRzIChiZWNhdXNlIHRoZXkganVtcCB0byBhCj4gY2FzZSBhbmQgZG9uJ3QgZXhlY3V0ZSBzdHVm
ZiBhdCB0aGUgc3RhcnQgb2YgdGhlIGJsb2NrKSwgbm90IGJsb2Nrcwo+IGFmdGVyIGlmL3doaWxl
Ly4uLiAuCgpJdCBib3RoZXJzIG1lIHRoYXQgd2UgYXJlIGdvaW5nIG91dCBvZiBvdXIgd2F5IHRv
IGRlcHJlY2F0ZSB2YWxpZCBDIGNvbnN0cnVjdHMKaW4gZmF2b3Igb2YgcGxhY2luZyB0aGUgZGVj
bGFyYXRpb25zIGVsc2V3aGVyZS4KCkFzIGN1cnJlbnQgY29tcGlsZXIgd2FybmluZ3Mgd291bGQg
Y2F0Y2ggYW55IHJlZmVyZW5jZSBiZWZvcmUgaW5pdGlhbGl6YXRpb24KdXNhZ2UgYW55d2F5LCBp
dCBzZWVtcyBsaWtlIHdlIGFyZSBsZXR0aW5nIGEgY29tcGlsZXIgd2FybmluZyByYXRoZXIgdGhh
biB0aGUKbGFuZ3VhZ2Ugc3RhbmRhcmQgZGljdGF0ZSBzeW50YXguCgpDZXJ0YWlubHkgaWYgd2Ug
d2FudCB0byBtYWtlIGl0IGEgYmVzdCBwcmFjdGljZSBjb2Rpbmcgc3R5bGUgaXNzdWUgd2UgY2Fu
LCBhbmQKdGhlbiBhbiBhcHByb3ByaWF0ZSBub3RlIGV4cGxhaW5pbmcgd2h5IHNob3VsZCBiZSBh
ZGRlZCB0bwpEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJzdC4K

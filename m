Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/3] treewide: Lift switch variables out of switches
From: Matthew Wilcox <willy@infradead.org>
Message-Id: <20190123191802.GB15311@bombadil.infradead.org>
Date: Wed, 23 Jan 2019 11:18:02 -0800
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, dev@openvswitch.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, linux-security-module@vger.kernel.org, kernel-hardening@lists.openwall.com, intel-wired-lan@lists.osuosl.org, linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org, Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, Alexander Popov <alex.popov@linux.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBKYW4gMjMsIDIwMTkgYXQgMDQ6MTc6MzBQTSArMDIwMCwgSmFuaSBOaWt1bGEgd3Jv
dGU6Cj4gQ2FuJ3QgaGF2ZToKPiAKPiAJc3dpdGNoIChpKSB7Cj4gCQlpbnQgajsKPiAJY2FzZSAw
Ogo+ICAgICAgICAgCS8qIC4uLiAqLwo+IAl9Cj4gCj4gYmVjYXVzZSBpdCBjYW4ndCBiZSB0dXJu
ZWQgaW50bzoKPiAKPiAJc3dpdGNoIChpKSB7Cj4gCQlpbnQgaiA9IDA7IC8qIG5vdCB2YWxpZCBD
ICovCj4gCWNhc2UgMDoKPiAgICAgICAgIAkvKiAuLi4gKi8KPiAJfQo+IAo+IGJ1dCBjYW4gaGF2
ZSBlLmcuOgo+IAo+IAlzd2l0Y2ggKGkpIHsKPiAJY2FzZSAwOgo+IAkJewo+IAkJCWludCBqID0g
MDsKPiAJICAgICAgICAJLyogLi4uICovCj4gCQl9Cj4gCX0KPiAKPiBJIHRoaW5rIEtlZXMnIGFw
cHJvYWNoIG9mIG1vdmluZyBzdWNoIHZhcmlhYmxlIGRlY2xhcmF0aW9ucyB0byB0aGUKPiBlbmNs
b3NpbmcgYmxvY2sgc2NvcGUgaXMgYmV0dGVyIHRoYW4gYWRkaW5nIGFub3RoZXIgbmVzdGluZyBi
bG9jay4KCkFub3RoZXIgbmVzdGluZyBsZXZlbCB3b3VsZCBiZSBiYWQsIGJ1dCBJIHRoaW5rIHRo
aXMgaXMgT0s6CgoJc3dpdGNoIChpKSB7CgljYXNlIDA6IHsKCQlpbnQgaiA9IDA7CiAgICAgICAg
CS8qIC4uLiAqLwoJfQoJY2FzZSAxOiB7CgkJdm9pZCAqcCA9IHE7CgkJLyogLi4uICovCgl9Cgl9
CgpJIGNhbiBpbWFnaW5lIEtlZXMnIHBhdGNoIG1pZ2h0IGhhdmUgYSBiYWQgZWZmZWN0IG9uIHN0
YWNrIGNvbnN1bXB0aW9uLAp1bmxlc3MgR0NDIGNhbiBiZSByZWxpZWQgb24gdG8gYmUgc21hcnQg
ZW5vdWdoIHRvIG5vdGljZSB0aGUKbm9uLW92ZXJsYXBwaW5nIGxpdmVuZXNzIG9mIHRoZSB2cmlh
YmxlcyBhbmQgdXNlIHRoZSBzYW1lIHN0YWNrIHNsb3RzCmZvciBib3RoLgo=

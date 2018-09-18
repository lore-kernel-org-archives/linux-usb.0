Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/17] compat_ioctl: move more drivers to generic_compat_ioctl_ptrarg
From: Jason Gunthorpe <jgg@ziepe.ca>
Message-Id: <20180918175952.GJ11367@ziepe.ca>
Date: Tue, 18 Sep 2018 11:59:52 -0600
To: Darren Hart <dvhart@infradead.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMTA6NTE6MDhBTSAtMDcwMCwgRGFycmVuIEhhcnQgd3Jv
dGU6Cj4gT24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDk6NTc6NDhQTSArMDEwMCwgQWwgVmlybyB3
cm90ZToKPiA+IE9uIEZyaSwgU2VwIDE0LCAyMDE4IGF0IDAxOjM1OjA2UE0gLTA3MDAsIERhcnJl
biBIYXJ0IHdyb3RlOgo+ID4gIAo+ID4gPiBBY2tlZC1ieTogRGFycmVuIEhhcnQgKFZNd2FyZSkg
PGR2aGFydEBpbmZyYWRlYWQub3JnPgo+ID4gPiAKPiA+ID4gQXMgZm9yIGEgbG9uZ2VyIHRlcm0g
c29sdXRpb24sIHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGluaXQgZm9wcyBpbiBzdWNoCj4gPiA+
IGEgd2F5IHRoYXQgdGhlIGNvbXBhdF9pb2N0bCBjYWxsIGRlZmF1bHRzIHRvIGdlbmVyaWNfY29t
cGF0X2lvY3RsX3B0cmFyZwo+ID4gPiBzbyB3ZSBkb24ndCBoYXZlIHRvIGR1cGxpY2F0ZSB0aGlz
IGJvaWxlcnBsYXRlIGZvciBldmVyeSBpb2N0bCBmb3BzCj4gPiA+IHN0cnVjdHVyZT8KPiA+IAo+
ID4gCUJhZCBpZGVhLCB0aGF0Li4uICBCZWNhdXNlIHNldmVyYWwgeWVhcnMgZG93biB0aGUgcm9h
ZCBzb21lYm9keSB3aWxsIGFkZAo+ID4gYW4gaW9jdGwgdGhhdCB0YWtlcyBhbiB1bnNpZ25lZCBp
bnQgZm9yIGFyZ3VtZW50LiAgV2l0aG91dCBzbyBtdWNoIGFzIGxvb2tpbmcKPiA+IGF0IHlvdXIg
bWFnaWNhbCBteXN0ZXJ5IG1hY3JvIGJlaW5nIHVzZWQgdG8gaW5pdGlhbGl6ZSBmaWxlX29wZXJh
dGlvbnMuCj4gCj4gRmFpciwgYmVpbmcgZXhwbGljaXQgaW4gdGhlIGRlY2xhcmF0aW9uIGFzIGl0
IGlzIGN1cnJlbnRseSBtYXkgYmUKPiBwcmVmZXJhYmxlIHRoZW4uCgpJdCB3b3VsZCBiZSBtdWNo
IGNsZWFuZXIgYW5kIHNhZmVyIGlmIHlvdSBjb3VsZCBhcnJhbmdlIHRoaW5ncyB0byBhZGQKc29t
ZXRoaW5nIGxpa2UgdGhpcyB0byBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zOgoKICBsb25nICgqcHRy
X2lvY3RsKSAoc3RydWN0IGZpbGUgKiwgdW5zaWduZWQgaW50LCB2b2lkIF9fdXNlciAqKTsKCldo
ZXJlIHRoZSBjb3JlIGNvZGUgYXV0b21hdGljYWxseSBjb252ZXJ0cyB0aGUgdW5zaWduZWQgbG9u
ZyB0byB0aGUKdm9pZCBfX3VzZXIgKiBhcyBhcHByb3ByaWF0ZS4KClRoZW4gaXQganVzdCB3b3Jr
cyByaWdodCBhbHdheXMgYW5kIHRoZSBjb21waWxlciB3aWxsIGhlbHAgYWRkcmVzcwpBbCdzIGNv
bmNlcm4gZG93biB0aGUgcm9hZC4KCkNoZWVycywKSmFzb24K

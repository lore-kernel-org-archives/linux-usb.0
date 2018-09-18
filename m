Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/17] compat_ioctl: move more drivers to generic_compat_ioctl_ptrarg
From: Darren Hart <dvhart@infradead.org>
Message-Id: <20180918175108.GF35251@wrath>
Date: Tue, 18 Sep 2018 10:51:08 -0700
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDk6NTc6NDhQTSArMDEwMCwgQWwgVmlybyB3cm90ZToK
PiBPbiBGcmksIFNlcCAxNCwgMjAxOCBhdCAwMTozNTowNlBNIC0wNzAwLCBEYXJyZW4gSGFydCB3
cm90ZToKPiAgCj4gPiBBY2tlZC1ieTogRGFycmVuIEhhcnQgKFZNd2FyZSkgPGR2aGFydEBpbmZy
YWRlYWQub3JnPgo+ID4gCj4gPiBBcyBmb3IgYSBsb25nZXIgdGVybSBzb2x1dGlvbiwgd291bGQg
aXQgYmUgcG9zc2libGUgdG8gaW5pdCBmb3BzIGluIHN1Y2gKPiA+IGEgd2F5IHRoYXQgdGhlIGNv
bXBhdF9pb2N0bCBjYWxsIGRlZmF1bHRzIHRvIGdlbmVyaWNfY29tcGF0X2lvY3RsX3B0cmFyZwo+
ID4gc28gd2UgZG9uJ3QgaGF2ZSB0byBkdXBsaWNhdGUgdGhpcyBib2lsZXJwbGF0ZSBmb3IgZXZl
cnkgaW9jdGwgZm9wcwo+ID4gc3RydWN0dXJlPwo+IAo+IAlCYWQgaWRlYSwgdGhhdC4uLiAgQmVj
YXVzZSBzZXZlcmFsIHllYXJzIGRvd24gdGhlIHJvYWQgc29tZWJvZHkgd2lsbCBhZGQKPiBhbiBp
b2N0bCB0aGF0IHRha2VzIGFuIHVuc2lnbmVkIGludCBmb3IgYXJndW1lbnQuICBXaXRob3V0IHNv
IG11Y2ggYXMgbG9va2luZwo+IGF0IHlvdXIgbWFnaWNhbCBteXN0ZXJ5IG1hY3JvIGJlaW5nIHVz
ZWQgdG8gaW5pdGlhbGl6ZSBmaWxlX29wZXJhdGlvbnMuCgpGYWlyLCBiZWluZyBleHBsaWNpdCBp
biB0aGUgZGVjbGFyYXRpb24gYXMgaXQgaXMgY3VycmVudGx5IG1heSBiZQpwcmVmZXJhYmxlIHRo
ZW4uCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/17] compat_ioctl: move more drivers to generic_compat_ioctl_ptrarg
From: Al Viro <viro@ZenIV.linux.org.uk>
Message-Id: <20180914205748.GC19965@ZenIV.linux.org.uk>
Date: Fri, 14 Sep 2018 21:57:48 +0100
To: Darren Hart <dvhart@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDE6MzU6MDZQTSAtMDcwMCwgRGFycmVuIEhhcnQgd3Jv
dGU6CiAKPiBBY2tlZC1ieTogRGFycmVuIEhhcnQgKFZNd2FyZSkgPGR2aGFydEBpbmZyYWRlYWQu
b3JnPgo+IAo+IEFzIGZvciBhIGxvbmdlciB0ZXJtIHNvbHV0aW9uLCB3b3VsZCBpdCBiZSBwb3Nz
aWJsZSB0byBpbml0IGZvcHMgaW4gc3VjaAo+IGEgd2F5IHRoYXQgdGhlIGNvbXBhdF9pb2N0bCBj
YWxsIGRlZmF1bHRzIHRvIGdlbmVyaWNfY29tcGF0X2lvY3RsX3B0cmFyZwo+IHNvIHdlIGRvbid0
IGhhdmUgdG8gZHVwbGljYXRlIHRoaXMgYm9pbGVycGxhdGUgZm9yIGV2ZXJ5IGlvY3RsIGZvcHMK
PiBzdHJ1Y3R1cmU/CgoJQmFkIGlkZWEsIHRoYXQuLi4gIEJlY2F1c2Ugc2V2ZXJhbCB5ZWFycyBk
b3duIHRoZSByb2FkIHNvbWVib2R5IHdpbGwgYWRkCmFuIGlvY3RsIHRoYXQgdGFrZXMgYW4gdW5z
aWduZWQgaW50IGZvciBhcmd1bWVudC4gIFdpdGhvdXQgc28gbXVjaCBhcyBsb29raW5nCmF0IHlv
dXIgbWFnaWNhbCBteXN0ZXJ5IG1hY3JvIGJlaW5nIHVzZWQgdG8gaW5pdGlhbGl6ZSBmaWxlX29w
ZXJhdGlvbnMuCgoJRldJVywgSSB3b3VsZCBuYW1lIHRoYXQgaGVscGVyIGluIG1vcmUgYmx1bnQg
d2F5IC0gc29tZXRoaW5nIGxpa2UKY29tcGF0X2lvY3RsX29ubHlfY29tcGF0X3BvaW50ZXJfaW9j
dGxzX2hlcmUoKS4uLgo=

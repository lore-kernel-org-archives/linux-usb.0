Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/17] compat_ioctl: move more drivers to generic_compat_ioctl_ptrarg
From: David Sterba <dsterba@suse.cz>
Message-Id: <20180914142324.GI5847@twin.jikos.cz>
Date: Fri, 14 Sep 2018 16:23:24 +0200
To: Arnd Bergmann <arnd@arndb.de>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMDU6MDg6NTJQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBUaGUgLmlvY3RsIGFuZCAuY29tcGF0X2lvY3RsIGZpbGUgb3BlcmF0aW9ucyBoYXZl
IHRoZSBzYW1lIHByb3RvdHlwZSBzbwo+IHRoZXkgY2FuIGJvdGggcG9pbnQgdG8gdGhlIHNhbWUg
ZnVuY3Rpb24sIHdoaWNoIHdvcmtzIGdyZWF0IGFsbW9zdCBhbGwKPiB0aGUgdGltZSB3aGVuIGFs
bCB0aGUgY29tbWFuZHMgYXJlIGNvbXBhdGlibGUuCj4gCj4gT25lIGV4Y2VwdGlvbiBpcyB0aGUg
czM5MCBhcmNoaXRlY3R1cmUsIHdoZXJlIGEgY29tcGF0IHBvaW50ZXIgaXMgb25seQo+IDMxIGJp
dCB3aWRlLCBhbmQgY29udmVydGluZyBpdCBpbnRvIGEgNjQtYml0IHBvaW50ZXIgcmVxdWlyZXMg
Y2FsbGluZwo+IGNvbXBhdF9wdHIoKS4gTW9zdCBkcml2ZXJzIGhlcmUgd2lsbCBldmVyIHJ1biBp
biBzMzkwLCBidXQgc2luY2Ugd2Ugbm93Cj4gaGF2ZSBhIGdlbmVyaWMgaGVscGVyIGZvciBpdCwg
aXQncyBlYXN5IGVub3VnaCB0byB1c2UgaXQgY29uc2lzdGVudGx5Lgo+IAo+IEkgZG91YmxlLWNo
ZWNrZWQgYWxsIHRoZXNlIGRyaXZlcnMgdG8gZW5zdXJlIHRoYXQgYWxsIGlvY3RsIGFyZ3VtZW50
cwo+IGFyZSB1c2VkIGFzIHBvaW50ZXJzIG9yIGFyZSBpZ25vcmVkLCBidXQgYXJlIG5vdCBpbnRl
cnByZXRlZCBhcyBpbnRlZ2VyCj4gdmFsdWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCgo+ICBmcy9idHJmcy9zdXBlci5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMiArLQoKQWNrZWQtYnk6IERhdmlkIFN0ZXJiYSA8ZHN0ZXJi
YUBzdXNlLmNvbT4K

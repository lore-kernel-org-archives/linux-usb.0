Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-Id: <20190425125301.5165cf15@coco.lan>
Date: Thu, 25 Apr 2019 12:53:01 -0300
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devel@driverdev.osuosl.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Sean Young <sean@mess.org>
List-ID: <linux-usb.vger.kernel.org>

RW0gVGh1LCAyNSBBcHIgMjAxOSAxNjozNTozNCArMDEwMApBbCBWaXJvIDx2aXJvQHplbml2Lmxp
bnV4Lm9yZy51az4gZXNjcmV2ZXU6Cgo+IE9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDEyOjIxOjUz
UE0gLTAzMDAsIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToKPiAKPiA+IElmIEkgdW5kZXJz
dGFuZCB5b3VyIHBhdGNoIGRlc2NyaXB0aW9uIHdlbGwsIHVzaW5nIGNvbXBhdF9wdHJfaW9jdGwK
PiA+IG9ubHkgd29ya3MgaWYgdGhlIGRyaXZlciBpcyBub3QgZm9yIHMzOTAsIHJpZ2h0PyAgCj4g
Cj4gTm87IHMzOTAgaXMgd2hlcmUgIm9oLCBqdXN0IHNldCAtPmNvbXBhdF9pb2N0bCBzYW1lIGFz
IC0+dW5sb2NrZWRfaW9jdGwKPiBhbmQgYmUgZG9uZSB3aXRoIHRoYXQ7IGNvbXBhdF9wdHIoKSBp
cyBhIG5vLW9wIGFueXdheSIgYnJlYWtzLiAgSU9XLAo+IHMzOTAgaXMgdGhlIHJlYXNvbiBmb3Ig
aGF2aW5nIGNvbXBhdF9wdHJfaW9jdGwoKSBpbiB0aGUgZmlyc3QgcGxhY2U7Cj4gdGhhdCB0aGlu
ZyB3b3JrcyBvbiBhbGwgYmlhcmNoIGFyY2hpdGVjdHVyZXMsIGFzIGxvbmcgYXMgYWxsIHN0dWZm
Cj4gaGFuZGxlZCBieSAtPmlvY3RsKCkgdGFrZXMgcG9pbnRlciB0byBhcmNoLWluZGVwZW5kZW50
IG9iamVjdCBhcwo+IGFyZ3VtZW50LiAgSU9XLAo+IAlhcmd1bWVudCBpZ25vcmVkID0+IE9LCj4g
CWFueSBhcml0aG1ldGljYWwgdHlwZSA9PiBubyBnbywgY29tcGF0X3B0cigpIHdvdWxkIGJ1Z2dl
ciBpdAo+IAlwb2ludGVyIHRvIGludCA9PiBPSwoKVGhhdCdzIHRoZSBjYXNlIGZvciBhbGwgTElS
QyBpb2N0bHM6IHRoZXkgYWxsIHVzZSBhIHBvaW50ZXIgdG8gdTMyCmFyZ3VtZW50LgoKPiAJcG9p
bnRlciB0byBzdHJpbmcgPT4gT0sKPiAJcG9pbnRlciB0byB1NjQgPT4gT0sKPiAJcG9pbnRlciB0
byBzdHJ1Y3Qge3U2NCBhZGRyOyBjaGFyIHNbMTFdO30gPT4gT0sKPiAJcG9pbnRlciB0byBsb25n
ID0+IG5lZWRzIGV4cGxpY2l0IGhhbmRsZXIKPiAJcG9pbnRlciB0byBzdHJ1Y3Qge3ZvaWQgKmFk
ZHI7IGNoYXIgc1sxMV07fSA9PiBuZWVkcyBleHBsaWNpdCBoYW5kbGVyCj4gCXBvaW50ZXIgdG8g
c3RydWN0IHtpbnQgeDsgdTY0IHk7fSA9PiBuZWVkcyBleHBsaWNpdCBoYW5kbGVyIG9uIGFtZDY0
Cj4gRm9yICJqdXN0IHVzZSAtPnVubG9ja2VkX2lvY3RsIGZvciAtPmlvY3RsIiB3ZSBoYXZlCj4g
CWFyZ3VtZW50IGlnbm9yZWQgPT4gT0sKPiAJYW55IGFyaXRobWV0aWNhbCB0eXBlID0+IE9LCj4g
CWFueSBwb2ludGVyID0+IGluc3RhbnQgYnJlYWthZ2Ugb24gczM5MCwgaW4gYWRkdGlvbiB0byBj
YXNlcyB0aGF0IGJyZWFrCj4gd2l0aCBjb21wYXRfcHRyX2lvY3RsKCkuCj4gCj4gUHJvYmFibHkg
c29tZSBmb3JtIG9mIHRoYXQgb3VnaHQgdG8gZ28gaW50byBjb21taXQgbWVzc2FnZSBmb3IgY29t
cGF0X3B0cl9pb2N0bCgpCj4gaW50cm9kdWN0aW9uLi4uCgpBZ3JlZWQuCgpUaGFua3MsCk1hdXJv
Cg==

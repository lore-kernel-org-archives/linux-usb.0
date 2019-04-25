Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a2HmiYQJ2FV2FgLiFsD8M9UKteC9Jetx7ja06PQVZWYfA@mail.gmail.com>
Date: Thu, 25 Apr 2019 17:55:23 +0200
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, driverdevel <devel@driverdev.osuosl.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Sean Young <sean@mess.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNTozNSBQTSBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4KPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCAxMjoyMTo1M1BNIC0w
MzAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4KPiA+IElmIEkgdW5kZXJzdGFuZCB5
b3VyIHBhdGNoIGRlc2NyaXB0aW9uIHdlbGwsIHVzaW5nIGNvbXBhdF9wdHJfaW9jdGwKPiA+IG9u
bHkgd29ya3MgaWYgdGhlIGRyaXZlciBpcyBub3QgZm9yIHMzOTAsIHJpZ2h0Pwo+Cj4gTm87IHMz
OTAgaXMgd2hlcmUgIm9oLCBqdXN0IHNldCAtPmNvbXBhdF9pb2N0bCBzYW1lIGFzIC0+dW5sb2Nr
ZWRfaW9jdGwKPiBhbmQgYmUgZG9uZSB3aXRoIHRoYXQ7IGNvbXBhdF9wdHIoKSBpcyBhIG5vLW9w
IGFueXdheSIgYnJlYWtzLiAgSU9XLAo+IHMzOTAgaXMgdGhlIHJlYXNvbiBmb3IgaGF2aW5nIGNv
bXBhdF9wdHJfaW9jdGwoKSBpbiB0aGUgZmlyc3QgcGxhY2U7Cj4gdGhhdCB0aGluZyB3b3JrcyBv
biBhbGwgYmlhcmNoIGFyY2hpdGVjdHVyZXMsIGFzIGxvbmcgYXMgYWxsIHN0dWZmCj4gaGFuZGxl
ZCBieSAtPmlvY3RsKCkgdGFrZXMgcG9pbnRlciB0byBhcmNoLWluZGVwZW5kZW50IG9iamVjdCBh
cwo+IGFyZ3VtZW50LiAgSU9XLAo+ICAgICAgICAgYXJndW1lbnQgaWdub3JlZCA9PiBPSwo+ICAg
ICAgICAgYW55IGFyaXRobWV0aWNhbCB0eXBlID0+IG5vIGdvLCBjb21wYXRfcHRyKCkgd291bGQg
YnVnZ2VyIGl0Cj4gICAgICAgICBwb2ludGVyIHRvIGludCA9PiBPSwo+ICAgICAgICAgcG9pbnRl
ciB0byBzdHJpbmcgPT4gT0sKPiAgICAgICAgIHBvaW50ZXIgdG8gdTY0ID0+IE9LCj4gICAgICAg
ICBwb2ludGVyIHRvIHN0cnVjdCB7dTY0IGFkZHI7IGNoYXIgc1sxMV07fSA9PiBPSwoKVG8gYmUg
ZXh0cmEgcGVkYW50aWMsIHRoZSAnc3RydWN0IHt1NjQgYWRkcjsgY2hhciBzWzExXTt9ICcKY2Fz
ZSBpcyBhbHNvIGJyb2tlbiBvbiB4ODYsIGJlY2F1c2Ugc2l6ZW9mIChvYmopIGlzIHNtYWxsZXIK
b24gaTM4NiwgZXZlbiB0aG91Z2ggdGhlIGxvY2F0aW9uIG9mIHRoZSBtZW1iZXJzIGFyZQp0aGUg
c2FtZS4gaS5lLiB5b3UgY2FuIGNvcHlfZnJvbV91c2VyKCkgdGhpcywgYnV0IG5vdApjb3B5X3Rv
X3VzZXIoKSwgd2hpY2ggb3ZlcndyaXRlcyA0IGJ5dGVzIGFmdGVyIHRoZSBlbmQgb2YKdGhlIDIw
LWJ5dGUgdXNlciBzdHJ1Y3R1cmUuCgogICAgICAgQXJuZAo=

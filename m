Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
From: Al Viro <viro@ZenIV.linux.org.uk>
Message-Id: <20190425153534.GS2217@ZenIV.linux.org.uk>
Date: Thu, 25 Apr 2019 16:35:34 +0100
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devel@driverdev.osuosl.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Sean Young <sean@mess.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMTI6MjE6NTNQTSAtMDMwMCwgTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIHdyb3RlOgoKPiBJZiBJIHVuZGVyc3RhbmQgeW91ciBwYXRjaCBkZXNjcmlwdGlvbiB3
ZWxsLCB1c2luZyBjb21wYXRfcHRyX2lvY3RsCj4gb25seSB3b3JrcyBpZiB0aGUgZHJpdmVyIGlz
IG5vdCBmb3IgczM5MCwgcmlnaHQ/CgpObzsgczM5MCBpcyB3aGVyZSAib2gsIGp1c3Qgc2V0IC0+
Y29tcGF0X2lvY3RsIHNhbWUgYXMgLT51bmxvY2tlZF9pb2N0bAphbmQgYmUgZG9uZSB3aXRoIHRo
YXQ7IGNvbXBhdF9wdHIoKSBpcyBhIG5vLW9wIGFueXdheSIgYnJlYWtzLiAgSU9XLApzMzkwIGlz
IHRoZSByZWFzb24gZm9yIGhhdmluZyBjb21wYXRfcHRyX2lvY3RsKCkgaW4gdGhlIGZpcnN0IHBs
YWNlOwp0aGF0IHRoaW5nIHdvcmtzIG9uIGFsbCBiaWFyY2ggYXJjaGl0ZWN0dXJlcywgYXMgbG9u
ZyBhcyBhbGwgc3R1ZmYKaGFuZGxlZCBieSAtPmlvY3RsKCkgdGFrZXMgcG9pbnRlciB0byBhcmNo
LWluZGVwZW5kZW50IG9iamVjdCBhcwphcmd1bWVudC4gIElPVywKCWFyZ3VtZW50IGlnbm9yZWQg
PT4gT0sKCWFueSBhcml0aG1ldGljYWwgdHlwZSA9PiBubyBnbywgY29tcGF0X3B0cigpIHdvdWxk
IGJ1Z2dlciBpdAoJcG9pbnRlciB0byBpbnQgPT4gT0sKCXBvaW50ZXIgdG8gc3RyaW5nID0+IE9L
Cglwb2ludGVyIHRvIHU2NCA9PiBPSwoJcG9pbnRlciB0byBzdHJ1Y3Qge3U2NCBhZGRyOyBjaGFy
IHNbMTFdO30gPT4gT0sKCXBvaW50ZXIgdG8gbG9uZyA9PiBuZWVkcyBleHBsaWNpdCBoYW5kbGVy
Cglwb2ludGVyIHRvIHN0cnVjdCB7dm9pZCAqYWRkcjsgY2hhciBzWzExXTt9ID0+IG5lZWRzIGV4
cGxpY2l0IGhhbmRsZXIKCXBvaW50ZXIgdG8gc3RydWN0IHtpbnQgeDsgdTY0IHk7fSA9PiBuZWVk
cyBleHBsaWNpdCBoYW5kbGVyIG9uIGFtZDY0CkZvciAianVzdCB1c2UgLT51bmxvY2tlZF9pb2N0
bCBmb3IgLT5pb2N0bCIgd2UgaGF2ZQoJYXJndW1lbnQgaWdub3JlZCA9PiBPSwoJYW55IGFyaXRo
bWV0aWNhbCB0eXBlID0+IE9LCglhbnkgcG9pbnRlciA9PiBpbnN0YW50IGJyZWFrYWdlIG9uIHMz
OTAsIGluIGFkZHRpb24gdG8gY2FzZXMgdGhhdCBicmVhawp3aXRoIGNvbXBhdF9wdHJfaW9jdGwo
KS4KClByb2JhYmx5IHNvbWUgZm9ybSBvZiB0aGF0IG91Z2h0IHRvIGdvIGludG8gY29tbWl0IG1l
c3NhZ2UgZm9yIGNvbXBhdF9wdHJfaW9jdGwoKQppbnRyb2R1Y3Rpb24uLi4K

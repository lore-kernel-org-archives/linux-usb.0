Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a3CzKLvpUiVV_k__kkaZ=wg2fqnFEzWYL9qNwBfxMKZ9w@mail.gmail.com>
Date: Fri, 26 Apr 2019 09:46:13 +0200
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, driverdevel <devel@driverdev.osuosl.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Sean Young <sean@mess.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMTE6MjUgUE0gSm9oYW5uZXMgQmVyZwo8am9oYW5uZXNA
c2lwc29sdXRpb25zLm5ldD4gd3JvdGU6Cj4gT24gVGh1LCAyMDE5LTA0LTI1IGF0IDE3OjU1ICsw
MjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gT24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNToz
NSBQTSBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IE9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDEyOjIxOjUzUE0gLTAzMDAsIE1hdXJvIENhcnZhbGhv
IENoZWhhYiB3cm90ZToKPiA+ID4KPiA+ID4gPiBJZiBJIHVuZGVyc3RhbmQgeW91ciBwYXRjaCBk
ZXNjcmlwdGlvbiB3ZWxsLCB1c2luZyBjb21wYXRfcHRyX2lvY3RsCj4gPiA+ID4gb25seSB3b3Jr
cyBpZiB0aGUgZHJpdmVyIGlzIG5vdCBmb3IgczM5MCwgcmlnaHQ/Cj4gPiA+Cj4gPiA+IE5vOyBz
MzkwIGlzIHdoZXJlICJvaCwganVzdCBzZXQgLT5jb21wYXRfaW9jdGwgc2FtZSBhcyAtPnVubG9j
a2VkX2lvY3RsCj4gPiA+IGFuZCBiZSBkb25lIHdpdGggdGhhdDsgY29tcGF0X3B0cigpIGlzIGEg
bm8tb3AgYW55d2F5IiBicmVha3MuICBJT1csCj4gPiA+IHMzOTAgaXMgdGhlIHJlYXNvbiBmb3Ig
aGF2aW5nIGNvbXBhdF9wdHJfaW9jdGwoKSBpbiB0aGUgZmlyc3QgcGxhY2U7Cj4gPiA+IHRoYXQg
dGhpbmcgd29ya3Mgb24gYWxsIGJpYXJjaCBhcmNoaXRlY3R1cmVzLCBhcyBsb25nIGFzIGFsbCBz
dHVmZgo+ID4gPiBoYW5kbGVkIGJ5IC0+aW9jdGwoKSB0YWtlcyBwb2ludGVyIHRvIGFyY2gtaW5k
ZXBlbmRlbnQgb2JqZWN0IGFzCj4gPiA+IGFyZ3VtZW50LiAgSU9XLAo+ID4gPiAgICAgICAgIGFy
Z3VtZW50IGlnbm9yZWQgPT4gT0sKPiA+ID4gICAgICAgICBhbnkgYXJpdGhtZXRpY2FsIHR5cGUg
PT4gbm8gZ28sIGNvbXBhdF9wdHIoKSB3b3VsZCBidWdnZXIgaXQKPiA+ID4gICAgICAgICBwb2lu
dGVyIHRvIGludCA9PiBPSwo+ID4gPiAgICAgICAgIHBvaW50ZXIgdG8gc3RyaW5nID0+IE9LCj4g
PiA+ICAgICAgICAgcG9pbnRlciB0byB1NjQgPT4gT0sKPiA+ID4gICAgICAgICBwb2ludGVyIHRv
IHN0cnVjdCB7dTY0IGFkZHI7IGNoYXIgc1sxMV07fSA9PiBPSwo+ID4KPiA+IFRvIGJlIGV4dHJh
IHBlZGFudGljLCB0aGUgJ3N0cnVjdCB7dTY0IGFkZHI7IGNoYXIgc1sxMV07fSAnCj4gPiBjYXNl
IGlzIGFsc28gYnJva2VuIG9uIHg4NiwgYmVjYXVzZSBzaXplb2YgKG9iaikgaXMgc21hbGxlcgo+
ID4gb24gaTM4NiwgZXZlbiB0aG91Z2ggdGhlIGxvY2F0aW9uIG9mIHRoZSBtZW1iZXJzIGFyZQo+
ID4gdGhlIHNhbWUuIGkuZS4geW91IGNhbiBjb3B5X2Zyb21fdXNlcigpIHRoaXMKPgo+IEFjdHVh
bGx5LCB5b3UgY2FuJ3QgZXZlbiBkbyB0aGF0IGJlY2F1c2UgdGhlIHN0cnVjdCBtaWdodCBzaXQg
YXQgdGhlIGVuZAo+IG9mIGEgcGFnZSBhbmQgdGhlbiB5b3UnZCBlcnJvbmVvdXNseSBmYXVsdCBp
biB0aGlzIGNhc2UuCj4KPiBXZSBoYWQgdGhpcyBhIHdoaWxlIGFnbyB3aXRoIHN0cnVjdCBpZnJl
cSwgc2VlIGNvbW1pdCA5ODQwNjEzM2RkIGFuZCBpdHMKPiBwYXJlbnRzLgoKWWVzLCB5b3UgYXJl
IHJpZ2h0LiBWZXJ5IHJhcmUgdG8gaGl0IHdpdGggcmVhbC1saWZlIGNvZGUsIGJ1dCBlYXNpbHkK
cmVwcm9kdWNlZCBieSBpbnRlbnRpb25hbGx5IGhpdHRpbmcgaXQgYW5kIGNsZWFybHkgYSBidWcu
CgpBcyB0aGUgc2F5aW5nIGdvZXMKCiAgfCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuICJhbHdheXMg
d29ya3MiIGFuZCAiYWxtb3N0IGFsd2F5cyB3b3JrcyIKICB8IGlzIGNhbGxlZCBkYXRhIGNvcnJ1
cHRpb24KCmhlcmUgdGhlIGRpZmZlcmVuY2UgaXMgYW4gLUVGQVVMVC4KCiAgICAgIEFybmQK

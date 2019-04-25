Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
From: Johannes Berg <johannes@sipsolutions.net>
Message-Id: <5511420228cb38d08a67c0f6a614b7671d7d23d4.camel@sipsolutions.net>
Date: Thu, 25 Apr 2019 23:25:43 +0200
To: Arnd Bergmann <arnd@arndb.de>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, driverdevel <devel@driverdev.osuosl.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Sean Young <sean@mess.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCAyMDE5LTA0LTI1IGF0IDE3OjU1ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IE9uIFRodSwgQXByIDI1LCAyMDE5IGF0IDU6MzUgUE0gQWwgVmlybyA8dmlyb0B6ZW5pdi5saW51
eC5vcmcudWs+IHdyb3RlOgo+ID4gCj4gPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCAxMjoyMTo1
M1BNIC0wMzAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPiAKPiA+ID4gSWYgSSB1
bmRlcnN0YW5kIHlvdXIgcGF0Y2ggZGVzY3JpcHRpb24gd2VsbCwgdXNpbmcgY29tcGF0X3B0cl9p
b2N0bAo+ID4gPiBvbmx5IHdvcmtzIGlmIHRoZSBkcml2ZXIgaXMgbm90IGZvciBzMzkwLCByaWdo
dD8KPiA+IAo+ID4gTm87IHMzOTAgaXMgd2hlcmUgIm9oLCBqdXN0IHNldCAtPmNvbXBhdF9pb2N0
bCBzYW1lIGFzIC0+dW5sb2NrZWRfaW9jdGwKPiA+IGFuZCBiZSBkb25lIHdpdGggdGhhdDsgY29t
cGF0X3B0cigpIGlzIGEgbm8tb3AgYW55d2F5IiBicmVha3MuICBJT1csCj4gPiBzMzkwIGlzIHRo
ZSByZWFzb24gZm9yIGhhdmluZyBjb21wYXRfcHRyX2lvY3RsKCkgaW4gdGhlIGZpcnN0IHBsYWNl
Owo+ID4gdGhhdCB0aGluZyB3b3JrcyBvbiBhbGwgYmlhcmNoIGFyY2hpdGVjdHVyZXMsIGFzIGxv
bmcgYXMgYWxsIHN0dWZmCj4gPiBoYW5kbGVkIGJ5IC0+aW9jdGwoKSB0YWtlcyBwb2ludGVyIHRv
IGFyY2gtaW5kZXBlbmRlbnQgb2JqZWN0IGFzCj4gPiBhcmd1bWVudC4gIElPVywKPiA+ICAgICAg
ICAgYXJndW1lbnQgaWdub3JlZCA9PiBPSwo+ID4gICAgICAgICBhbnkgYXJpdGhtZXRpY2FsIHR5
cGUgPT4gbm8gZ28sIGNvbXBhdF9wdHIoKSB3b3VsZCBidWdnZXIgaXQKPiA+ICAgICAgICAgcG9p
bnRlciB0byBpbnQgPT4gT0sKPiA+ICAgICAgICAgcG9pbnRlciB0byBzdHJpbmcgPT4gT0sKPiA+
ICAgICAgICAgcG9pbnRlciB0byB1NjQgPT4gT0sKPiA+ICAgICAgICAgcG9pbnRlciB0byBzdHJ1
Y3Qge3U2NCBhZGRyOyBjaGFyIHNbMTFdO30gPT4gT0sKPiAKPiBUbyBiZSBleHRyYSBwZWRhbnRp
YywgdGhlICdzdHJ1Y3Qge3U2NCBhZGRyOyBjaGFyIHNbMTFdO30gJwo+IGNhc2UgaXMgYWxzbyBi
cm9rZW4gb24geDg2LCBiZWNhdXNlIHNpemVvZiAob2JqKSBpcyBzbWFsbGVyCj4gb24gaTM4Niwg
ZXZlbiB0aG91Z2ggdGhlIGxvY2F0aW9uIG9mIHRoZSBtZW1iZXJzIGFyZQo+IHRoZSBzYW1lLiBp
LmUuIHlvdSBjYW4gY29weV9mcm9tX3VzZXIoKSB0aGlzCgpBY3R1YWxseSwgeW91IGNhbid0IGV2
ZW4gZG8gdGhhdCBiZWNhdXNlIHRoZSBzdHJ1Y3QgbWlnaHQgc2l0IGF0IHRoZSBlbmQKb2YgYSBw
YWdlIGFuZCB0aGVuIHlvdSdkIGVycm9uZW91c2x5IGZhdWx0IGluIHRoaXMgY2FzZS4KCldlIGhh
ZCB0aGlzIGEgd2hpbGUgYWdvIHdpdGggc3RydWN0IGlmcmVxLCBzZWUgY29tbWl0IDk4NDA2MTMz
ZGQgYW5kIGl0cwpwYXJlbnRzLgoKam9oYW5uZXMK

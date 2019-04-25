Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
From: Al Viro <viro@ZenIV.linux.org.uk>
Message-Id: <20190425164235.GT2217@ZenIV.linux.org.uk>
Date: Thu, 25 Apr 2019 17:42:35 +0100
To: Arnd Bergmann <arnd@arndb.de>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, driverdevel <devel@driverdev.osuosl.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Sean Young <sean@mess.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMDU6NTU6MjNQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCA1OjM1IFBNIEFsIFZpcm8gPHZpcm9AemVu
aXYubGludXgub3JnLnVrPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCAx
MjoyMTo1M1BNIC0wMzAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPgo+ID4gPiBJ
ZiBJIHVuZGVyc3RhbmQgeW91ciBwYXRjaCBkZXNjcmlwdGlvbiB3ZWxsLCB1c2luZyBjb21wYXRf
cHRyX2lvY3RsCj4gPiA+IG9ubHkgd29ya3MgaWYgdGhlIGRyaXZlciBpcyBub3QgZm9yIHMzOTAs
IHJpZ2h0Pwo+ID4KPiA+IE5vOyBzMzkwIGlzIHdoZXJlICJvaCwganVzdCBzZXQgLT5jb21wYXRf
aW9jdGwgc2FtZSBhcyAtPnVubG9ja2VkX2lvY3RsCj4gPiBhbmQgYmUgZG9uZSB3aXRoIHRoYXQ7
IGNvbXBhdF9wdHIoKSBpcyBhIG5vLW9wIGFueXdheSIgYnJlYWtzLiAgSU9XLAo+ID4gczM5MCBp
cyB0aGUgcmVhc29uIGZvciBoYXZpbmcgY29tcGF0X3B0cl9pb2N0bCgpIGluIHRoZSBmaXJzdCBw
bGFjZTsKPiA+IHRoYXQgdGhpbmcgd29ya3Mgb24gYWxsIGJpYXJjaCBhcmNoaXRlY3R1cmVzLCBh
cyBsb25nIGFzIGFsbCBzdHVmZgo+ID4gaGFuZGxlZCBieSAtPmlvY3RsKCkgdGFrZXMgcG9pbnRl
ciB0byBhcmNoLWluZGVwZW5kZW50IG9iamVjdCBhcwo+ID4gYXJndW1lbnQuICBJT1csCj4gPiAg
ICAgICAgIGFyZ3VtZW50IGlnbm9yZWQgPT4gT0sKPiA+ICAgICAgICAgYW55IGFyaXRobWV0aWNh
bCB0eXBlID0+IG5vIGdvLCBjb21wYXRfcHRyKCkgd291bGQgYnVnZ2VyIGl0Cj4gPiAgICAgICAg
IHBvaW50ZXIgdG8gaW50ID0+IE9LCj4gPiAgICAgICAgIHBvaW50ZXIgdG8gc3RyaW5nID0+IE9L
Cj4gPiAgICAgICAgIHBvaW50ZXIgdG8gdTY0ID0+IE9LCj4gPiAgICAgICAgIHBvaW50ZXIgdG8g
c3RydWN0IHt1NjQgYWRkcjsgY2hhciBzWzExXTt9ID0+IE9LCj4gCj4gVG8gYmUgZXh0cmEgcGVk
YW50aWMsIHRoZSAnc3RydWN0IHt1NjQgYWRkcjsgY2hhciBzWzExXTt9ICcKPiBjYXNlIGlzIGFs
c28gYnJva2VuIG9uIHg4NiwgYmVjYXVzZSBzaXplb2YgKG9iaikgaXMgc21hbGxlcgo+IG9uIGkz
ODYsIGV2ZW4gdGhvdWdoIHRoZSBsb2NhdGlvbiBvZiB0aGUgbWVtYmVycyBhcmUKPiB0aGUgc2Ft
ZS4gaS5lLiB5b3UgY2FuIGNvcHlfZnJvbV91c2VyKCkgdGhpcywgYnV0IG5vdAo+IGNvcHlfdG9f
dXNlcigpLCB3aGljaCBvdmVyd3JpdGVzIDQgYnl0ZXMgYWZ0ZXIgdGhlIGVuZCBvZgo+IHRoZSAy
MC1ieXRlIHVzZXIgc3RydWN0dXJlLgoKRCdvaCEgIEZXSVcsIGl0IG1pZ2h0IGJlIHdvcnRoIHB1
dHRpbmcgaW50byBEb2N1bWVudGF0aW9uLyBzb21ld2hlcmU7CmJhc2ljYWxseSwgd2hhdCBpcyBh
bmQgd2hhdCBpc24ndCBiaWFyY2gtbmV1dHJhbC4KCk9yIGFyY2gtbmV1dHJhbCwgZm9yIHRoYXQg
bWF0dGVyIC0gaXQncyB2ZXJ5IGNsb3NlLiAgVGhlIG9ubHkgcmVhbApleGNlcHRpb24sIElJUkMs
IGlzIGFuIGV4dHJhIHR3aXN0IG9uIG02OGssIHdoZXJlIGludCBiZWhhdmVzCmxpa2UgeDg2IGxv
bmcgbG9uZyAtIGl0cyBhbGlnbm1lbnQgaXMgb25seSBoYWxmIGl0cyBzaXplLCBzbwpzaXplb2Yo
c3RydWN0IHtjaGFyIGM7IGludCB4O30pIGlzIDYsIG5vdCA4IGFzIGV2ZXJ5d2hlcmUKZWxzZS4g
IElycmVsZXZhbnQgZm9yIGJpYXJjaCwgdGhhbmtmdWxseSAodW50aWwgc29tZWJvZHkgZ2V0cyBp
bnNhbmUKZW5vdWdoIHRvIGltcGxlbWVudCA2NGJpdCBjb2xkZmlyZSwga2VybmVsIHBvcnQgZm9y
IGl0ICphbmQqIGJpYXJjaApzdXBwb3J0IGZvciBtNjhrIGJpbmFyaWVzIG9uIHRoYXQgdGhpbmcs
IHRoYXQgaXMpLi4uCg==

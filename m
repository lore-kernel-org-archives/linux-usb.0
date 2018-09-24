Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/17] compat_ioctl: move more drivers to generic_compat_ioctl_ptrarg
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a1Bh9NnncbcT0X4fKWC7B0FnqYyEMUwB6MvmzaNO7VhFQ@mail.gmail.com>
Date: Mon, 24 Sep 2018 23:17:01 +0200
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Darren Hart <dvhart@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, gregkh <gregkh@linuxfoundation.org>, David Miller <davem@davemloft.net>, driverdevel <devel@driverdev.osuosl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-fbdev@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBTZXAgMjQsIDIwMTggYXQgMTA6MzUgUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+IHdyb3RlOgo+IE9uIE1vbiwgU2VwIDI0LCAyMDE4IGF0IDEwOjE4OjUyUE0gKzAyMDAs
IEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAxOCwgMjAxOCBhdCA3OjU5IFBN
IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPiB3cm90ZToKPiA+ID4gT24gVHVlLCBTZXAg
MTgsIDIwMTggYXQgMTA6NTE6MDhBTSAtMDcwMCwgRGFycmVuIEhhcnQgd3JvdGU6Cj4gPiA+ID4g
T24gRnJpLCBTZXAgMTQsIDIwMTggYXQgMDk6NTc6NDhQTSArMDEwMCwgQWwgVmlybyB3cm90ZToK
PiA+ID4gPiA+IE9uIEZyaSwgU2VwIDE0LCAyMDE4IGF0IDAxOjM1OjA2UE0gLTA3MDAsIERhcnJl
biBIYXJ0IHdyb3RlOgo+ID4gV2UgYWxyZWFkeSBkbyB0aGlzIGluc2lkZSBvZiBzb21lIHN1YnN5
c3RlbXMsIG5vdGFibHkgZHJpdmVycy9tZWRpYS8sCj4gPiBhbmQgaXQgc2ltcGxpZmllcyB0aGUg
aW1wbGVtZW50YXRpb24gb2YgdGhlIGlvY3RsIGhhbmRsZXIgZnVuY3Rpb24KPiA+IHNpZ25pZmlj
YW50bHkuIFdlIG9idmlvdXNseSBjYW5ub3QgZG8gdGhpcyBpbiBnZW5lcmFsLCBib3RoIGJlY2F1
c2Ugb2YKPiA+IHRyYWRpdGlvbmFsIGRyaXZlcnMgdGhhdCBoYXZlIDE2LWJpdCBjb21tYW5kIGNv
ZGVzIChkcml2ZXJzL3R0eSBhbmQgb3RoZXJzKQo+ID4gYW5kIGFsc28gYmVjYXVzZSBvZiBkcml2
ZXJzIHRoYXQgYnkgYWNjaWRlbnQgZGVmaW5lZCB0aGUgY29tbWFuZHMKPiA+IGluY29ycmVjdGx5
IGFuZCB1c2UgdGhlIHdyb25nIHR5cGUgb3IgdGhlIHdyb25nIGRpcmVjdGlvbiBpbiB0aGUKPiA+
IGRlZmluaXRpb24uCj4KPiBUaGF0IGNvdWxkIHdvcmsgd2VsbCwgYnV0IHRoZSBmaXJzdCBpZGVh
IGNvdWxkIGJlIGRvbmUgZ2xvYmFsbHkgYW5kCj4gbWVjaGFuaWNhbGx5LCB3aGlsZSB0aGlzIHdv
dWxkIHJlcXVpcmUgdmVyeSBjYXJlZnVsIHBlci1kcml2ZXIKPiBpbnZlc3RpZ2F0aW9uLgo+Cj4g
UGFydGljdWxhcmx5IGlmIHRoZSBjb3JlIGNvZGUgaGFzIHdvcnNlIHBlcmZvcm1hbmNlLi4gaWUg
ZHVlIHRvCj4ga21hbGxvYyBjYWxscyBvciBzb21ldGhpbmcuCj4KPiBJIHRoaW5rIGl0IHdvdWxk
IG1ha2UgbW9yZSBzZW5zZSB0byBzdGFydCBieSBoYXZpbmcgdGhlIGNvcmUgZG8gdGhlCj4gY2Fz
ZSB0byBfX3VzZXIgYW5kIHRoZW4gYWRkIGFub3RoZXIgZW50cnkgcG9pbnQgdG8gaGF2ZSB0aGUg
Y29yZSBkbwo+IHRoZSBjb3B5X2Zyb21fdXNlciwgYW5kIHNvIG9uLgoKSGF2aW5nIHNpeCBzZXBh
cmF0ZSBjYWxsYmFjayBwb2ludGVycyB0byBpbXBsZW1lbnQgYSBzaW5nbGUKc3lzdGVtIGNhbGwg
c2VlbXMgYSBiaXQgZXhjZXNzaXZlIHRob3VnaC4KCiAgICAgICAgQXJuZAo=

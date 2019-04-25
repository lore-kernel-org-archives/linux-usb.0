Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,12/26] compat_ioctl: move more drivers to compat_ptr_ioctl
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a1qCQJEkne3uAw-Ep-taNU9t5Y2ZmgoiCGmOz1BSwmzEw@mail.gmail.com>
Date: Thu, 25 Apr 2019 17:32:05 +0200
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Sterba <dsterba@suse.com>, Darren Hart <dvhart@infradead.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, driverdevel <devel@driverdev.osuosl.org>, qat-linux@intel.com, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-iio@vger.kernel.org, linux-rdma <linux-rdma@vger.kernel.org>, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci <linux-pci@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, linux-remoteproc@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>, linux-scsi <linux-scsi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, Networking <netdev@vger.kernel.org>, Sean Young <sean@mess.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNToyMiBQTSBNYXVybyBDYXJ2YWxobyBDaGVoYWIKPG1j
aGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPiB3cm90ZToKPiBFbSBUdWUsIDE2IEFwciAyMDE5IDIy
OjI1OjMzICswMjAwIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IGVzY3JldmV1Ogo+Cj4g
SWYgSSB1bmRlcnN0YW5kIHlvdXIgcGF0Y2ggZGVzY3JpcHRpb24gd2VsbCwgdXNpbmcgY29tcGF0
X3B0cl9pb2N0bAo+IG9ubHkgd29ya3MgaWYgdGhlIGRyaXZlciBpcyBub3QgZm9yIHMzOTAsIHJp
Z2h0PwoKTm8sIHRoZSBwdXJwb3NlIG9mIGNvbXBhdF9wdHJfaW9jdGwoKSBpcyB0byBtYWtlIHN1
cmUgaXQgd29ya3MKZXZlcnl3aGVyZSBpbmNsdWRpbmcgczM5MC4KCkV2ZW4gb24gczM5MCBpdCB0
ZW5kcyB0byB3b3JrIG1vc3Qgb2YgdGhlIHRpbWUsIGJ1dCBmb3IgY29ycmVjdG5lc3MKdGhlIHVw
cGVyIGJpdCBvZiBhIDMyLWJpdCBwb2ludGVyIG5lZWRzIHRvIGJlIGNsZWFyZWQsIGFzCmNvbXBh
dF9wdHJfaW9jdGwgZG9lcywgaW4gY2FzZSBzb21lIGFwcGxpY2F0aW9uIHBhc3NlcyBhIHBvaW50
ZXIKd2l0aCB0aGF0IGJpdCBzZXQuIFtJSVJDLCBpbiB0aGUgaW5zdHJ1Y3Rpb24gcG9pbnRlciwg
dGhlIGhpZ2ggYml0IGlzIHNldCwgaW4KZGF0YSByZWZlcmVuY2VzIGl0IGlzIGlnbm9yZWQgYnV0
IHVzdWFsbHkgY2xlYXJlZCwgYnV0IGl0IG1heSBiZSBsZWZ0Cm9uIGZvciBJUC1yZWxhdGl2ZSBh
ZGRyZXNzIGdlbmVyYXRpb25dCgogICAgICAgQXJuZAo=

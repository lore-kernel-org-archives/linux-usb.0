Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,02/17] compat_ioctl: move drivers to generic_compat_ioctl_ptrarg
From: Arnd Bergmann <arnd@arndb.de>
Message-Id: <CAK8P3a1RoYo0VHrDfxdmJt9ns0ErTeuctH9CPG5_mg7JTwZtEQ@mail.gmail.com>
Date: Wed, 12 Sep 2018 18:20:34 +0200
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, gregkh <gregkh@linuxfoundation.org>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, "Winkler, Tomas" <tomas.winkler@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, David Miller <davem@davemloft.net>, Alex Williamson <alex.williamson@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-integrity@vger.kernel.org, linux1394-devel@lists.sourceforge.net, USB list <linux-usb@vger.kernel.org>, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, Networking <netdev@vger.kernel.org>, driverdevel <devel@driverdev.osuosl.org>, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgNTozMyBQTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVw
ZS5jYT4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAxMiwgMjAxOCBhdCAwNTowMTowM1BNICswMjAw
LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4gRWFjaCBvZiB0aGVzZSBkcml2ZXJzIGhhcyBhIGNv
cHkgb2YgdGhlIHNhbWUgdHJpdmlhbCBoZWxwZXIgZnVuY3Rpb24gdG8KPiA+IGNvbnZlcnQgdGhl
IHBvaW50ZXIgYXJndW1lbnQgYW5kIHRoZW4gY2FsbCB0aGUgbmF0aXZlIGlvY3RsIGhhbmRsZXIu
Cj4gPgo+ID4gV2Ugbm93IGhhdmUgYSBnZW5lcmljIGltcGxlbWVudGF0aW9uIG9mIHRoYXQsIHNv
IHVzZSBpdC4KPiA+Cj4KPiBGb3IgdnRwbToKPgo+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4KPiBBcm5kLCB3b3VsZCB5b3UgY29uc2lkZXIgaW5jbHVk
aW5nIGEgcGF0Y2ggYXMgcGFydCBvZi9hZnRlciB0aGlzCj4gc2VyaWVzIHRvIG1ha2UgY29tcGF0
X2lvY3RsIGluIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3V2ZXJic19tYWluLmMKPiB1c2UgdGhp
cyBhcyB3ZWxsPyAgTG9va3MgbGlrZSBhIGJ1ZyB0b28/CgpUaGF0IHNob3VsZCBiZSBpbmNsdWRl
ZCBpbiBwYXRjaCA1IGluIHRoaXMgc2VyaWVzLiBJIG1heSBoYXZlIHNraXBwZWQKc29tZSBDYyB0
aGVyZSBzaW5jZSBpdCBoYWQgdG9vIG1hbnkgcmVjaXBpZW50cyAoc2VudCBvbmx5IHRvIHRoZQpt
YWlsaW5nIGxpc3RzIGluc3RlYWQpLgoKICAgICAgICBBcm5kCg==

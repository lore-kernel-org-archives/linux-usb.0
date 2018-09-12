Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,02/17] compat_ioctl: move drivers to generic_compat_ioctl_ptrarg
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180912181338.GD15031@kroah.com>
Date: Wed, 12 Sep 2018 20:13:38 +0200
To: Arnd Bergmann <arnd@arndb.de>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Tomas Winkler <tomas.winkler@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, "David S. Miller" <davem@davemloft.net>, Alex Williamson <alex.williamson@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMDU6MDE6MDNQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBFYWNoIG9mIHRoZXNlIGRyaXZlcnMgaGFzIGEgY29weSBvZiB0aGUgc2FtZSB0cml2
aWFsIGhlbHBlciBmdW5jdGlvbiB0bwo+IGNvbnZlcnQgdGhlIHBvaW50ZXIgYXJndW1lbnQgYW5k
IHRoZW4gY2FsbCB0aGUgbmF0aXZlIGlvY3RsIGhhbmRsZXIuCj4gCj4gV2Ugbm93IGhhdmUgYSBn
ZW5lcmljIGltcGxlbWVudGF0aW9uIG9mIHRoYXQsIHNvIHVzZSBpdC4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKQWNrZWQtYnk6IEdyZWcgS3JvYWgt
SGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cg==

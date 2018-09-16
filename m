Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,02/17] compat_ioctl: move drivers to generic_compat_ioctl_ptrarg
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Message-Id: <20180916190724.GA7473@linux.intel.com>
Date: Sun, 16 Sep 2018 22:07:24 +0300
To: Arnd Bergmann <arnd@arndb.de>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Tomas Winkler <tomas.winkler@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, "David S. Miller" <davem@davemloft.net>, Alex Williamson <alex.williamson@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMDU6MDE6MDNQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL3RwbS90cG1fdnRwbV9wcm94eS5jIGIv
ZHJpdmVycy9jaGFyL3RwbS90cG1fdnRwbV9wcm94eS5jCj4gaW5kZXggODdhMGNlNDdmMjAxLi5h
MTcwZjVjYTc0MTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jaGFyL3RwbS90cG1fdnRwbV9wcm94
eS5jCj4gKysrIGIvZHJpdmVycy9jaGFyL3RwbS90cG1fdnRwbV9wcm94eS5jCj4gQEAgLTY3OCwy
MCArNjc4LDEwIEBAIHN0YXRpYyBsb25nIHZ0cG14X2ZvcHNfaW9jdGwoc3RydWN0IGZpbGUgKmYs
IHVuc2lnbmVkIGludCBpb2N0bCwKPiAgCX0KPiAgfQo+ICAKPiAtI2lmZGVmIENPTkZJR19DT01Q
QVQKPiAtc3RhdGljIGxvbmcgdnRwbXhfZm9wc19jb21wYXRfaW9jdGwoc3RydWN0IGZpbGUgKmYs
IHVuc2lnbmVkIGludCBpb2N0bCwKPiAtCQkJCQkgIHVuc2lnbmVkIGxvbmcgYXJnKQo+IC17Cj4g
LQlyZXR1cm4gdnRwbXhfZm9wc19pb2N0bChmLCBpb2N0bCwgKHVuc2lnbmVkIGxvbmcpY29tcGF0
X3B0cihhcmcpKTsKPiAtfQo+IC0jZW5kaWYKPiAtCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmls
ZV9vcGVyYXRpb25zIHZ0cG14X2ZvcHMgPSB7Cj4gIAkub3duZXIgPSBUSElTX01PRFVMRSwKPiAg
CS51bmxvY2tlZF9pb2N0bCA9IHZ0cG14X2ZvcHNfaW9jdGwsCj4gLSNpZmRlZiBDT05GSUdfQ09N
UEFUCj4gLQkuY29tcGF0X2lvY3RsID0gdnRwbXhfZm9wc19jb21wYXRfaW9jdGwsCj4gLSNlbmRp
Zgo+ICsJLmNvbXBhdF9pb2N0bCA9IGdlbmVyaWNfY29tcGF0X2lvY3RsX3B0cmFyZywKPiAgCS5s
bHNlZWsgPSBub29wX2xsc2VlaywKPiAgfTsKClJldmlld2VkLWJ5OiBKYXJra28gU2Fra2luZW4g
PGphcmtrby5zYWtraW5lbkBsaW51eC5pbnRlbC5jb20+CgovSmFya2tvCg==

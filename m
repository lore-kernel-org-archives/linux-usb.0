Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,05/17] compat_ioctl: move more drivers to generic_compat_ioctl_ptrarg
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Message-Id: <20181006070521.GM12063@builder>
Date: Sat, 6 Oct 2018 00:05:21 -0700
To: Arnd Bergmann <arnd@arndb.de>
Cc: viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org, linux-iio@vger.kernel.org, linux-rdma@vger.kernel.org, linux-nvdimm@lists.01.org, linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkIDEyIFNlcCAwODowOCBQRFQgMjAxOCwgQXJuZCBCZXJnbWFubiB3cm90ZToKClsuLl0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ycG1zZy9ycG1zZ19jaGFyLmMgYi9kcml2ZXJzL3JwbXNn
L3JwbXNnX2NoYXIuYwo+IGluZGV4IGE3NmI5NjNhN2U1MC4uMDJhZWZiMmIyZDQ3IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvcnBtc2cvcnBtc2dfY2hhci5jCj4gKysrIGIvZHJpdmVycy9ycG1zZy9y
cG1zZ19jaGFyLmMKPiBAQCAtMjg1LDcgKzI4NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmls
ZV9vcGVyYXRpb25zIHJwbXNnX2VwdGRldl9mb3BzID0gewo+ICAJLndyaXRlID0gcnBtc2dfZXB0
ZGV2X3dyaXRlLAo+ICAJLnBvbGwgPSBycG1zZ19lcHRkZXZfcG9sbCwKPiAgCS51bmxvY2tlZF9p
b2N0bCA9IHJwbXNnX2VwdGRldl9pb2N0bCwKPiAtCS5jb21wYXRfaW9jdGwgPSBycG1zZ19lcHRk
ZXZfaW9jdGwsCj4gKwkuY29tcGF0X2lvY3RsID0gZ2VuZXJpY19jb21wYXRfaW9jdGxfcHRyYXJn
LAo+ICB9Owo+ICAKPiAgc3RhdGljIHNzaXplX3QgbmFtZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRl
diwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCj4gQEAgLTQ0Niw3ICs0NDYsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBycG1zZ19jdHJsZGV2X2ZvcHMgPSB7
Cj4gIAkub3BlbiA9IHJwbXNnX2N0cmxkZXZfb3BlbiwKPiAgCS5yZWxlYXNlID0gcnBtc2dfY3Ry
bGRldl9yZWxlYXNlLAo+ICAJLnVubG9ja2VkX2lvY3RsID0gcnBtc2dfY3RybGRldl9pb2N0bCwK
PiAtCS5jb21wYXRfaW9jdGwgPSBycG1zZ19jdHJsZGV2X2lvY3RsLAo+ICsJLmNvbXBhdF9pb2N0
bCA9IGdlbmVyaWNfY29tcGF0X2lvY3RsX3B0cmFyZywKPiAgfTsKPiAgCgpGb3IgcnBtc2cgcGFy
dAoKQWNrZWQtYnk6IEJqb3JuIEFuZGVyc3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+
CgpSZWdhcmRzLApCam9ybgo=

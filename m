Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,2/2] usb: quirks: Add quirk to fix card reader and suspend on MacBooks
From: Ivan Mironov <mironov.ivan@gmail.com>
Message-Id: <20190213211323.6072-3-mironov.ivan@gmail.com>
Date: Thu, 14 Feb 2019 02:13:23 +0500
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Martin Liu <liumartin@google.com>, YueHaibing <yuehaibing@huawei.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Nicolas Boichat <drinkcat@chromium.org>, Jon Flatley <jflat@chromium.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Benson Leung <bleung@chromium.org>, Harry Pan <harry.pan@intel.com>, Jack Stocker <jackstocker.93@gmail.com>, Danilo Krummrich <danilokrummrich@dk-develop.de>, Samuel Sadok <samuel.sadok@bluewin.ch>, Ivan Mironov <mironov.ivan@gmail.com>
List-ID: <linux-usb.vger.kernel.org>

VGhpcyBlbmFibGVkIFVTQl9RVUlSS19ESVNBQkxFX0xJTktfT05fU1VTUEVORCBmb3IgdGhlIGVt
YmVkZGVkIFNEIGNhcmQKcmVhZGVyIHVzZWQgaW4gQXBwbGUgTWFjQm9vayBsYXB0b3BzLgoKTGlu
azogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTEyMDEKTGlu
azogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDI1MDkKU2ln
bmVkLW9mZi1ieTogSXZhbiBNaXJvbm92IDxtaXJvbm92Lml2YW5AZ21haWwuY29tPgotLS0KIGRy
aXZlcnMvdXNiL2NvcmUvcXVpcmtzLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb3JlL3F1aXJrcy5jIGIvZHJpdmVy
cy91c2IvY29yZS9xdWlya3MuYwppbmRleCBjMjZiYTc4NGRjNTQuLjgxOGY5NDlmZjFiOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy91c2IvY29yZS9xdWlya3MuYworKysgYi9kcml2ZXJzL3VzYi9jb3Jl
L3F1aXJrcy5jCkBAIC0zMTAsNiArMzEwLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2Rl
dmljZV9pZCB1c2JfcXVpcmtfbGlzdFtdID0gewogCS8qIGFwcGxldG91Y2ggKi8KIAl7IFVTQl9E
RVZJQ0UoMHgwNWFjLCAweDAyMWEpLCAuZHJpdmVyX2luZm8gPSBVU0JfUVVJUktfUkVTRVRfUkVT
VU1FIH0sCiAKKwkvKiBBcHBsZSBDYXJkIFJlYWRlciAqLworCXsgVVNCX0RFVklDRSgweDA1YWMs
IDB4ODQwNiksIC5kcml2ZXJfaW5mbyA9CisJICBVU0JfUVVJUktfRElTQUJMRV9MSU5LX09OX1NV
U1BFTkQgfSwKKwogCS8qIEdlbmVzeXMgTG9naWMgaHViLCBpbnRlcm5hbGx5IHVzZWQgYnkgS1kt
Njg4IFVTQiAzLjEgVHlwZS1DIEh1YiAqLwogCXsgVVNCX0RFVklDRSgweDA1ZTMsIDB4MDYxMiks
IC5kcml2ZXJfaW5mbyA9IFVTQl9RVUlSS19OT19MUE0gfSwKIAo=

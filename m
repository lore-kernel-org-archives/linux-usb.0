Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,09/26] compat_ioctl: move drivers to compat_ptr_ioctl
From: Jiri Kosina <jikos@kernel.org>
Message-Id: <nycvar.YFH.7.76.1904162230560.9803@cbobk.fhfr.pm>
Date: Tue, 16 Apr 2019 22:31:24 +0200 (CEST)
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgg@mellanox.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Tomas Winkler <tomas.winkler@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, "David S. Miller" <davem@davemloft.net>, Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Willem de Bruijn <willemb@google.com>, linux-integrity@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCAxNiBBcHIgMjAxOSwgQXJuZCBCZXJnbWFubiB3cm90ZToKCj4gRWFjaCBvZiB0aGVz
ZSBkcml2ZXJzIGhhcyBhIGNvcHkgb2YgdGhlIHNhbWUgdHJpdmlhbCBoZWxwZXIgZnVuY3Rpb24g
dG8KPiBjb252ZXJ0IHRoZSBwb2ludGVyIGFyZ3VtZW50IGFuZCB0aGVuIGNhbGwgdGhlIG5hdGl2
ZSBpb2N0bCBoYW5kbGVyLgo+IAo+IFdlIG5vdyBoYXZlIGEgZ2VuZXJpYyBpbXBsZW1lbnRhdGlv
biBvZiB0aGF0LCBzbyB1c2UgaXQuCj4gCj4gQWNrZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEphcmtrbyBTYWtraW5l
biA8amFya2tvLnNha2tpbmVuQGxpbnV4LmludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvY2hhci9wcGRldi5jICAgICAgICAg
ICAgICB8IDEyICstLS0tLS0tLS0KPiAgZHJpdmVycy9jaGFyL3RwbS90cG1fdnRwbV9wcm94eS5j
IHwgMTIgKy0tLS0tLS0tLQo+ICBkcml2ZXJzL2ZpcmV3aXJlL2NvcmUtY2Rldi5jICAgICAgfCAx
MiArLS0tLS0tLS0tCj4gIGRyaXZlcnMvaGlkL3VzYmhpZC9oaWRkZXYuYyAgICAgICB8IDExICst
LS0tLS0tLQoKRm9yIGhpZGRldi5jOgoKUmV2aWV3ZWQtYnk6IEppcmkgS29zaW5hIDxqa29zaW5h
QHN1c2UuY3o+Cg==

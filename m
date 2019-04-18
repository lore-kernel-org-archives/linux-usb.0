Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,09/26] compat_ioctl: move drivers to compat_ptr_ioctl
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20190418111017.GE23876@stefanha-x1.localdomain>
Date: Thu, 18 Apr 2019 12:10:17 +0100
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, y2038@lists.linaro.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Jason Gunthorpe <jgg@mellanox.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, Stefan Richter <stefanr@s5r6.in-berlin.de>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Tomas Winkler <tomas.winkler@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, "David S. Miller" <davem@davemloft.net>, Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Willem de Bruijn <willemb@google.com>, linux-integrity@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, devel@driverdev.osuosl.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMTYsIDIwMTkgYXQgMTA6MTk6NDdQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBFYWNoIG9mIHRoZXNlIGRyaXZlcnMgaGFzIGEgY29weSBvZiB0aGUgc2FtZSB0cml2
aWFsIGhlbHBlciBmdW5jdGlvbiB0bwo+IGNvbnZlcnQgdGhlIHBvaW50ZXIgYXJndW1lbnQgYW5k
IHRoZW4gY2FsbCB0aGUgbmF0aXZlIGlvY3RsIGhhbmRsZXIuCj4gCj4gV2Ugbm93IGhhdmUgYSBn
ZW5lcmljIGltcGxlbWVudGF0aW9uIG9mIHRoYXQsIHNvIHVzZSBpdC4KPiAKPiBBY2tlZC1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdl
ZC1ieTogSmFya2tvIFNha2tpbmVuIDxqYXJra28uc2Fra2luZW5AbGludXguaW50ZWwuY29tPgo+
IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPiAtLS0KPiAgZHJpdmVycy9j
aGFyL3BwZGV2LmMgICAgICAgICAgICAgIHwgMTIgKy0tLS0tLS0tLQo+ICBkcml2ZXJzL2NoYXIv
dHBtL3RwbV92dHBtX3Byb3h5LmMgfCAxMiArLS0tLS0tLS0tCj4gIGRyaXZlcnMvZmlyZXdpcmUv
Y29yZS1jZGV2LmMgICAgICB8IDEyICstLS0tLS0tLS0KPiAgZHJpdmVycy9oaWQvdXNiaGlkL2hp
ZGRldi5jICAgICAgIHwgMTEgKy0tLS0tLS0tCj4gIGRyaXZlcnMvaHd0cmFjaW5nL3N0bS9jb3Jl
LmMgICAgICB8IDEyICstLS0tLS0tLS0KPiAgZHJpdmVycy9taXNjL21laS9tYWluLmMgICAgICAg
ICAgIHwgMjIgKy0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9tdGQvdWJpL2NkZXYuYyAgICAg
ICAgICAgIHwgMzYgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL25ldC90
YXAuYyAgICAgICAgICAgICAgICAgfCAxMiArLS0tLS0tLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9w
aTQzMy9waTQzM19pZi5jICB8IDEyICstLS0tLS0tLS0KPiAgZHJpdmVycy91c2IvY29yZS9kZXZp
by5jICAgICAgICAgIHwgMTYgKy0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL3ZmaW8vdmZpby5jICAg
ICAgICAgICAgICAgfCAzOSArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGRyaXZl
cnMvdmhvc3QvbmV0LmMgICAgICAgICAgICAgICB8IDEyICstLS0tLS0tLS0KPiAgZHJpdmVycy92
aG9zdC9zY3NpLmMgICAgICAgICAgICAgIHwgMTIgKy0tLS0tLS0tLQo+ICBkcml2ZXJzL3Zob3N0
L3Rlc3QuYyAgICAgICAgICAgICAgfCAxMiArLS0tLS0tLS0tCj4gIGRyaXZlcnMvdmhvc3QvdnNv
Y2suYyAgICAgICAgICAgICB8IDEyICstLS0tLS0tLS0KPiAgZnMvZmF0L2ZpbGUuYyAgICAgICAg
ICAgICAgICAgICAgIHwgMTMgKy0tLS0tLS0tLS0KPiAgMTYgZmlsZXMgY2hhbmdlZCwgMjAgaW5z
ZXJ0aW9ucygrKSwgMjM3IGRlbGV0aW9ucygtKQoKVGhlIHZob3N0IHBhcnRzIGxvb2sgZ29vZDoK
ClJldmlld2VkLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+Cg==

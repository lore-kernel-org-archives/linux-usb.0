Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,1/1] r8152: sync sa_family with the media type of network device
From: crag0715@gmail.com
Message-Id: <CAP-8N0g4s2o7p1oL9swBUEjfiyxnU=4Xf2CXu2Fo-1+a2L2J8A@mail.gmail.com>
Date: Tue, 23 Apr 2019 10:52:21 +0800
To: Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, hayeswang@realtek.com, Mario Limonciello <mario_limonciello@dell.com>, "Crag.Wang" <crag.wang@dell.com>, "David S. Miller" <davem@davemloft.net>, Simon Glass <sjg@chromium.org>, Grant Grundler <grundler@chromium.org>, Sean Paul <seanpaul@chromium.org>, David Chen <david.chen7@dell.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Charles Hyde <charles.hyde@dell.corp-partner.google.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, zhong jiang <zhongjiang@huawei.com>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgNDozOSBBTSBKYWt1YiBLaWNpbnNraQo8amFrdWIua2lj
aW5za2lAbmV0cm9ub21lLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDIyIEFwciAyMDE5IDEzOjAz
OjQzICswODAwLCBjcmFnMDcxNUBnbWFpbC5jb20gd3JvdGU6Cj4gPiBGcm9tOiAiQ3JhZy5XYW5n
IiA8Y3JhZy53YW5nQGRlbGwuY29tPgo+ID4KPiA+IFdpdGhvdXQgdGhpcyBwYXRjaCB0aGUgc29j
a2V0IGFkZHJlc3MgZmFtaWx5IHNwb3JhZGljYWxseSBnZXRzIHdyb25nCj4gPiB2YWx1ZSBlbmRz
IHVwIHRoZSBkZXZfc2V0X21hY19hZGRyZXNzKCkgZmFpbHMgdG8gc2V0IHRoZSBkZXNpcmVkIE1B
Qwo+ID4gYWRkcmVzcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDcmFnLldhbmcgPGNyYWcud2Fu
Z0BkZWxsLmNvbT4KPgo+IENvZGUgbG9va3MgcmVhc29uYWJsZS4gIFRoaXMgbXVzdCBoYXZlIGJl
ZW4gY2F1c2VkIGJ5Ogo+Cj4gRml4ZXM6IDI1NzY2MjcxZTQyZiAoInI4MTUyOiBSZWZyZXNoIE1B
QyBhZGRyZXNzIGR1cmluZyBVU0JERVZGU19SRVNFVCIpCj4KPiB3aGljaCBpcyBzdGlsbCBpbiBu
ZXQtbmV4dC4gIEluIHRoZSBmdXR1cmUgcGxlYXNlIG1ha2Ugc3VyZSB5b3UgcmVhZDoKPgo+IGh0
dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L25ldHdvcmtpbmcvbmV0ZGV2LUZB
US5odG1sCj4KPiBJbiBwYXJ0aWN1bGFyOgo+Cj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2Mv
aHRtbC9sYXRlc3QvbmV0d29ya2luZy9uZXRkZXYtRkFRLmh0bWwjcS1ob3ctZG8taS1pbmRpY2F0
ZS13aGljaC10cmVlLW5ldC12cy1uZXQtbmV4dC1teS1wYXRjaC1zaG91bGQtYmUtaW4KPgo+IFRv
IGFzc3VyZSBzbW9vdGggZmxvdyBvZiB5b3VyIHBhdGNoZXMgaW50byB0aGUgdHJlZSA6KQo+Cj4g
UmV2aWV3ZWQtYnk6IEpha3ViIEtpY2luc2tpIDxqYWt1Yi5raWNpbnNraUBuZXRyb25vbWUuY29t
Pgo+ClllcywgcGF0Y2ggaXMgaW50ZW5kZWQgdG8gZml4IDI1NzY2MjcxZTQyZiB3aGljaCBpcyBz
dGlsbCBpbiBuZXQtbmV4dC4KCkl0IGFwcGVhcnMgdGhhdCBwcmVmaXggaXMgZGVzaXJlZCBpbiB0
aGUgc3ViamVjdC4gVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBpbmZvLgoKQ3JhZwo=

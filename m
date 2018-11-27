Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] xhci: workaround CSS timeout on AMD SNPS 3.0 xHC
From: Mathias Nyman <mathias.nyman@intel.com>
Message-Id: <d2583bdb-c63c-6d62-6b36-2f21d558bbbb@intel.com>
Date: Tue, 27 Nov 2018 13:48:02 +0200
To: Kai Heng Feng <kai.heng.feng@canonical.com>, "Singh, Sandeep" <sandeep.singh@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMjcuMTEuMjAxOCAwOTo0NCwgS2FpIEhlbmcgRmVuZyB3cm90ZToKPiAKPiAKPj4gT24gTm92
IDI0LCAyMDE4LCBhdCAwMDoyNCwgU2luZ2gsIFNhbmRlZXAgPHNhbmRlZXAuc2luZ2hAYW1kLmNv
bT4gd3JvdGU6Cj4+Cj4+IEZyb206IFNhbmRlZXAgU2luZ2ggPHNhbmRlZXAuc2luZ2hAYW1kLmNv
bT4KPj4KPj4gT2NjYXNpb25hbGx5IEFNRCBTTlBTIDMuMCB4SEMgZG9lcyBub3QgcmVzcG9uZCB0
bwo+PiBDU1Mgd2hlbiBzZXQsIGFsc28gaXQgZG9lcyBub3QgZmxhZyBhbnl0aGluZyBvbiBTUkUg
YW5kIEhDRQo+PiB0byBwb2ludCB0aGUgaW50ZXJuYWwgeEhDIGVycm9ycyBvbiBVU0JTVFMgcmVn
aXN0ZXIuIFRoaXMgc3RhbGxzCj4+IHRoZSBlbnRpcmUgc3lzdGVtIHdpZGUgc3VzcGVuZCBhbmQg
dGhlcmUgaXMgbm8gcG9pbnQgaW4gc3RhbGxpbmcKPj4ganVzdCBiZWNhdXNlIG9mIHhIQyBDU1Mg
aXMgbm90IHJlc3BvbmRpbmcuCj4+Cj4+IFRvIHdvcmsgYXJvdW5kIHRoaXMgcHJvYmxlbSwgaWYg
dGhlIHhIQyBkb2VzIG5vdCBmbGFnCj4+IGFueXRoaW5nIG9uIFNSRSBhbmQgSENFLCB3ZSBjYW4g
c2tpcCB0aGUgQ1NTCj4+IHRpbWVvdXQgYW5kIGFsbG93IHRoZSBzeXN0ZW0gdG8gY29udGludWUg
dGhlIHN1c3BlbmQuIE9uY2UgdGhlCj4+IHN5c3RlbSByZXN1bWUgaGFwcGVucyB3ZSBjYW4gaW50
ZXJuYWxseSByZXNldCB0aGUgY29udHJvbGxlcgo+PiB1c2luZyBYSENJX1JFU0VUX09OX1JFU1VN
RSBxdWlyawo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTaHlhbSBTdW5kYXIgUyBLIDxTaHlhbS1zdW5k
YXIuUy1rQGFtZC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbmRlZXAgU2luZ2ggPFNhbmRlZXAu
U2luZ2hAYW1kLmNvbT4KPj4gY2M6IE5laGFsIFNoYWggPE5laGFsLWJha3VsY2hhbmRyYS5TaGFo
QGFtZC5jb20+Cj4gCj4gVGVzdGVkLWJ5OiBLYWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNh
bm9uaWNhbC5jb20+CgpUaGFua3MsIGFwcGx5aW5nCgotTWF0aGlhcwo=

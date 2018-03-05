Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: inconsistent lock state with usbnet/asix usb ethernet and xhci
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-Id: <02679502-cf6e-8714-e879-50a922c5d976@samsung.com>
Date: Mon, 05 Mar 2018 08:45:00 +0100
To: Oliver Neukum <oneukum@suse.com>, Eric Dumazet <eric.dumazet@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>, Linux USB Mailing List <linux-usb@vger.kernel.org>, netdev@vger.kernel.org
Cc: Dean Jenkins <Dean_Jenkins@mentor.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgT2xpdmVyLAoKT24gMjAxOC0wMi0yNyAxNzowNywgT2xpdmVyIE5ldWt1bSB3cm90ZToKPiBB
bSBEaWVuc3RhZywgZGVuIDI3LjAyLjIwMTgsIDA3OjEzIC0wODAwIHNjaHJpZWIgRXJpYyBEdW1h
emV0Ogo+PiBPbiBUdWUsIDIwMTgtMDItMjcgYXQgMDc6MDkgLTA4MDAsIEVyaWMgRHVtYXpldCB3
cm90ZToKPj4+Cj4+PiBOb3RlIHRoYXQgZm9yIHRoaXMgb25lLCBpdCBzZWVtcyB3ZSBhbHNvIGNv
dWxkIHBlcmZvcm0gc3RhdHMgdXBkYXRlcyBpbgo+Pj4gQkggY29udGV4dCwgc2luY2Ugc2tiIGlz
IHF1ZXVlZCB2aWEgZGVmZXJfYmgoKQo+Pj4KPj4+IEJ1dCBzaW1wbGljaXR5IHdpbnMgSSBndWVz
cy4KPj4gVGhpbmtpbmcgbW9yZSBhYm91dCB0aGlzLCBJIGFtIG5vdCBzdXJlIHdlIGhhdmUgYW55
IGd1YXJhbnRlZSB0aGF0IFRYCj4+IGFuZCBSWCBjYW4gbm90IHJ1biBvbiBtdWx0aXBsZSBjcHVz
Lgo+Pgo+PiBVc2luZyBhbiB1bmlxdWUgc3luY3AgaXMgbm90IGdvaW5nIHRvIGJlIHNhZmUsIGV2
ZW4gaWYgd2UgbWFrZSBsb2NrZGVwCj4+IGhhcHB5IGVub3VnaCB3aXRoIHRoZSBsb2NhbF9pcnEg
c2F2ZS9yZXN0b3JlLgo+IFVuZm9ydHVuYXRlbHkgeW91IGFyZSByaWdodC4gSXQgaXMgbm90IGd1
YXJhbnRlZWQgZm9yIHNvbWUgaGFyZHdhcmUuCgpEb2VzIGl0IG1lYW4gdGhhdCB0aGUgZml4IHBy
b3Bvc2VkIGJ5IEVyaWMgaXMgbm90IHRoZSBwcm9wZXIgc29sdXRpb24/CgpCZXN0IHJlZ2FyZHMK

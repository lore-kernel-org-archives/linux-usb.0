Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [BACKPORT,4.4.y,25/25] USB: core: only clean up what we allocated
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190326013642.GE21198@kroah.com>
Date: Tue, 26 Mar 2019 10:36:42 +0900
To: Arnd Bergmann <arnd@arndb.de>
Cc: stable@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Suwan Kim <suwan.kim027@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Andrey Konovalov <andreyknvl@google.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBNYXIgMjIsIDIwMTkgYXQgMDQ6NDQ6MTZQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBGcm9tOiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4g
Cj4gV2hlbiBjbGVhbmluZyB1cCB0aGUgY29uZmlndXJhdGlvbnMsIG1ha2Ugc3VyZSB3ZSBvbmx5
IGZyZWUgdGhlIG51bWJlcgo+IG9mIGNvbmZpZ3VyYXRpb25zIGFuZCBpbnRlcmZhY2VzIHRoYXQg
d2UgY291bGQgaGF2ZSBhbGxvY2F0ZWQuCj4gCj4gUmVwb3J0ZWQtYnk6IEFuZHJleSBLb25vdmFs
b3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiBDYzogc3RhYmxlIDxzdGFibGVAdmdlci5rZXJu
ZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+Cj4gKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgMzJmZDg3YjNiYmY1
ZjdhMDQ1NTQ2NDAxZGZlMjg5NGRiYmY0ZDhjMykKPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdt
YW5uIDxhcm5kQGFybmRiLmRlPgo+IC0tLQo+ICBkcml2ZXJzL3VzYi9jb3JlL2NvbmZpZy5jIHwg
OSArKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCkFsc28gYWRkZWQgdG8gNC4xNC55IGFuZCA0LjkueQo=

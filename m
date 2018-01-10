Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dvb usb issues since kernel 4.9
From: Mike Galbraith <efault@gmx.de>
Message-Id: <1515553368.8252.5.camel@gmx.de>
Date: Wed, 10 Jan 2018 04:02:48 +0100
To: Jesper Dangaard Brouer <jbrouer@redhat.com>, Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, Ingo Molnar <mingo@kernel.org>, Josef Griebichler <griebichler.josef@gmx.at>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB list <linux-usb@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Rik van Riel <riel@redhat.com>, Paolo Abeni <pabeni@redhat.com>, Hannes Frederic Sowa <hannes@redhat.com>, linux-kernel <linux-kernel@vger.kernel.org>, netdev <netdev@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, LMML <linux-media@vger.kernel.org>, David Miller <davem@davemloft.net>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCAyMDE4LTAxLTA5IGF0IDIyOjI2ICswMTAwLCBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVy
IHdyb3RlOgo+IAo+IEkndmUgcHJldmlvdXNseSBleHBlcmllbmNlZCB0aGF0IHlvdSBjYW4gYmUg
YWZmZWN0ZWQgYnkgdGhlIHNjaGVkdWxlcgo+IGdyYW51bGFyaXR5LCB3aGljaCBpcyBhZGp1c3Rh
YmxlICh3aXRoIENPTkZJR19TQ0hFRF9ERUJVRz15KToKPiAKPiAgJCBncmVwIC1IIC4gL3Byb2Mv
c3lzL2tlcm5lbC9zY2hlZF8qX2dyYW51bGFyaXR5X25zCj4gIC9wcm9jL3N5cy9rZXJuZWwvc2No
ZWRfbWluX2dyYW51bGFyaXR5X25zOjIyNTAwMDAKPiAgL3Byb2Mvc3lzL2tlcm5lbC9zY2hlZF93
YWtldXBfZ3JhbnVsYXJpdHlfbnM6MzAwMDAwMAo+IAo+IFRoZSBhYm92ZSBudW1iZXJzIHdlcmUg
Y29uZmlybWVkIG9uIHRoZSBSUGkyIChzZWVbMl0pLiBXaXRoIGNvbW1pdAo+IDRjZDEzYzIxYjIw
NyAoInNvZnRpcnE6IExldCBrc29mdGlycWQgZG8gaXRzIGpvYiIpLCBJIGV4cGVjdC9hc3N1bWUg
dGhhdAo+IHNvZnRpcnEgcHJvY2Vzc2luZyBsYXRlbmN5IGlzIGJvdW5kZWQgYnkgdGhlIHNjaGVk
X3dha2V1cF9ncmFudWxhcml0eV9ucywKPiB3aGljaCB3aXRoIDMgbXMgaXMgbm90IGdvb2QgZW5v
dWdoIGZvciB0aGVpciB1c2UtY2FzZS4KCk5vdGUgb2YgY2F1dGlvbiB3cnQgdHdpZGRsaW5nwqBz
Y2hlZF93YWtldXBfZ3JhbnVsYXJpdHlfbnM6IGl0IG11c3QKcmVtYWluIDwgc2NoZWRfbGF0ZW5j
eV9ucy8yIGVsc2UgeW91IGVmZmVjdGl2ZWx5IGRpc2FibGUgd2FrZXVwCnByZWVtcHRpb24gY29t
cGxldGVseSwgdHVybmluZyBDRlMgaW50byBhIHRpY2sgZ3JhbnVsYXJpdHkgc2NoZWR1bGVyLgoK
CS1NaWtlCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAi
dW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jk
b21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5r
ZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

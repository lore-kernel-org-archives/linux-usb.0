Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/3] usb: gadget: ccid: add support for USB CCID Gadget Device
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Message-Id: <20180527054847.GB22105@gmail.com>
Date: Sun, 27 May 2018 07:48:47 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Felipe Balbi <balbi@kernel.org>, davem@davemloft.net, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Kate Stewart <kstewart@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gU2F0LCBNYXkgMjYsIDIwMTggYXQgMTA6NTY6NTJQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFNhdCwgTWF5IDI2LCAyMDE4IGF0IDEwOjMzOjU5UE0gKzAyMDAsIE1h
cmN1cyBGb2xrZXNzb24gd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJjdXMgRm9sa2Vzc29u
IDxtYXJjdXMuZm9sa2Vzc29uQGdtYWlsLmNvbT4KPiAKPiBJIGNhbid0IHRha2UgcGF0Y2hlcyB3
aXRob3V0IGFueSBjaGFuZ2Vsb2cgdGV4dC4gIEFuZCB3aHkgd291bGQgeW91Cj4gc3VibWl0IGEg
cGF0Y2ggb3ZlciAxMDAwIGxpbmVzIHdpdGhvdXQgYW55PwoKSSdtIHNvcnJ5LCBvYnZpb3VzbHkg
bm90IG11Y2ggd2VudCB3ZWxsIGZvciBtZSB5ZXN0ZXJkYXkuClRoZSBjaGFuZ2xlbG9nIHdhcyAi
Zml4dXA6ZWQiIGF3YXkgYW5kIG5vdyBJIG5vdGljZWQgdGhhdCBteQpwYXRjaCB2ZXJzaW9uIGhp
c3RvcnkgZGlkIG5vdCBmb2xsb3cgZm9yIHYyLgoKSXMgaXQgYmV0dGVyIHRvIHNlbmQgYSB2MyB3
aXRoIHVwZGF0ZWQgdmVyc2lvbiBoaXN0b3J5IG9yIHdhaXQgZm9yIG1vcmUKY29tbWVudHM/CgpJ
J2xsIHN0YXJ0IHJldmlldyBteSBwYXRjaGVzIGJldHRlciBiZWZvcmUgc2VuZGluZyB0aGVtLgpU
aGFuayB5b3UgZm9yIHlvdXIgdGltZSBhbmQgY29tbWVudHMuCgo+IAo+IFBsZWFzZSBmaXguCj4g
Cj4gdGhhbmtzLAo+IAo+IGdyZWcgay1oCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlz
dDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBh
IG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZv
IGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

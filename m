Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
From: Oliver Neukum <oneukum@suse.com>
Message-Id: <1512638231.17062.5.camel@suse.com>
Date: Thu, 07 Dec 2017 10:17:11 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dmitry Fleytman <dmitry@daynix.com>, Daniel Drake <drake@endlessm.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, Dan Carpenter <dan.carpenter@oracle.com>, Joe Perches <joe@perches.com>, =?ISO-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Alan Stern <stern@rowland.harvard.edu>, SF Markus Elfring <elfring@users.sourceforge.net>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

QW0gRG9ubmVyc3RhZywgZGVuIDA3LjEyLjIwMTcsIDA5OjU2ICswMTAwIHNjaHJpZWIgR3JlZyBL
cm9haC1IYXJ0bWFuOgo+IE9uIFRodSwgRGVjIDA3LCAyMDE3IGF0IDA5OjQ1OjM4QU0gKzAxMDAs
IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+IAo+ID4gQSBmZXcgY29tbWVudHMgKHRoaXMg
aXMgaW4gcmVzcG9uc2UgdG8gYSBwYXRjaCBmcm9tIE1hcmt1cywgc28gdGhlcmUgaGF2ZQo+ID4g
dG8gYmUgbG90cyBvZiBxdWVzdGlvbnMgYW5kIHVuY2VydGFpbnRpZXMgOy0pCj4gCj4gTm90ZSwg
YmVjYXVzZSBvZiB0aGUgcGF0Y2ggYXV0aG9yLCBJJ20gbm90IGFwcGx5aW5nIGl0IG5vIG1hdHRl
ciB3aGF0LAo+IHNvIHRoaXMgZGlzY3Vzc2lvbiBpcyByZWFsbHkgZ29pbmcgbm93aGVyZS4KCldl
IHJlYWxseSBuZWVkIHRvIGNvbWUgdG8gYSBjb25zZW5zdXMgb24gdGhhdCBxdWVzdGlvbi4KSWYg
dGhvc2UgYWRkaXRpb25hbCBtZXNzYWdlcyByZWFsbHkgYXJlIHJlZHVuZGFudCwgd2UgY291bGQg
c2F2ZQptZW1vcnkgZGVsZXRpbmcgdGhlbS4gT3IgYWx0ZXJuYXRpdmVseSwgaWYgdGhleSBhcmUg
bm90IGFuZCB3ZSBuZWVkIHRvCmtub3cgd2hpY2ggZGV2aWNlIGlzIGhpdCwgd2Ugc2hvdWxkIGNl
bnRyYWxpemUgdGhhdCByZXBvcnRpbmcKYW5kIHRlbGwgdGhlIFZNIHN1YnN5c3RlbSBub3QgdGhl
IGR1bXAgYSBzdGFjayB0cmFjZS4KCglSZWdhcmRzCgkJT2xpdmVyCi0tLQpUbyB1bnN1YnNjcmli
ZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBp
bgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3Jl
IG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZv
Lmh0bWwK

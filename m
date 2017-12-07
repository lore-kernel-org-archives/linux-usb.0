Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
From: Dan Carpenter <dan.carpenter@oracle.com>
Message-Id: <20171207093025.jzrloia7ea364iob@mwanda>
Date: Thu, 7 Dec 2017 12:30:25 +0300
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Joe Perches <joe@perches.com>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?iso-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBEZWMgMDcsIDIwMTcgYXQgMDk6NDU6MzhBTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+ID4KPiA+IFNtYWxsIGFsbG9jYXRpb25zIG5ldmVyIGZhaWwgaW4gdGhlIGN1
cnJlbnQga2VybmVsLgo+IAo+IEEgZmV3IGNvbW1lbnRzICh0aGlzIGlzIGluIHJlc3BvbnNlIHRv
IGEgcGF0Y2ggZnJvbSBNYXJrdXMsIHNvIHRoZXJlIGhhdmUKPiB0byBiZSBsb3RzIG9mIHF1ZXN0
aW9ucyBhbmQgdW5jZXJ0YWludGllcyA7LSkKPiAxLiBJbiB0aGUgY3VycmVudCBrZXJuZWwuIFdo
YXQgYWJvdXQgdGhlIGZ1dHVyZT8KClJpZ2h0LiAgTm8gb25lIGNhbiBwcmVkaWN0LiAgQW5kIHRo
ZSBzbWFsbCBhbGxvY2F0aW9ucyBkb24ndCBmYWlsIHJ1bGUKY2F1c2VzIHNvbWUgcHJvYmxlbXMu
Cgo+IDIuIElmIGEgc21hbGwgYWxsb2NhdGlvbiBjYW5ub3QgZmFpbCwgd2hhdCBoYXBwZW5zIGlm
IHRoZSBzbWFsbCBtZW1vcnkgc2xhYgo+ICAgIGlzIGV4aGF1c3RlZD8gQSBuZXcgcGFnZSBtdXN0
IGJlIGFsbG9jYXRlZCwgd2hpY2ggd2lsbCB0cmlnZ2VyIGFuIE9PTSwKPiAgICBhbmQgc29tZSBv
dGhlciBwYXJ0IG9mIHRoZSBzeXN0ZW0gd2lsbCBiZSBraWxsZWQgYW5kIGZhaWwuCgpSaWdodC4K
Cgo+IDMuIFRoaXMgZHJpdmVyIHVzZXMgR0ZQX0FUT01JQywgaXMgdGhhdCBndWFyYW50ZWVkIHRv
IHN1Y2NlZWQ/IEkgdGhpbmsgbm90Lgo+IAoKUmlnaHQgYWdhaW4uICBJIHdhcyBtaXNzaW5nIHRo
ZSBmaXJzdCBlbWFpbCBpbiB0aGUgdGhyZWFkIGJlY2F1c2Ugb2YgbXkKZW1haWwgZmlsdGVycyBz
byBJIGRpZG4ndCBzZWUgdGhpcyB3YXMgYXRvbWljLgoKcmVnYXJkcywKZGFuIGNhcnBlbnRlcgot
LS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2Ny
aWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2Vy
Lmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9y
Zy9tYWpvcmRvbW8taW5mby5odG1sCg==

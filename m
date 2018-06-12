Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] Convert target drivers to use sbitmap
From: Matthew Wilcox <willy@infradead.org>
Message-Id: <20180612030648.GA14222@bombadil.infradead.org>
Date: Mon, 11 Jun 2018 20:06:48 -0700
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, linux1394-devel@lists.sourceforge.net, linux-usb@vger.kernel.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, Juergen Gross <jgross@suse.com>, qla2xxx-upstream@qlogic.com, Kent Overstreet <kent.overstreet@gmail.com>, Matthew Wilcox <mawilcox@microsoft.com>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKdW4gMTEsIDIwMTggYXQgMDc6MTg6NTVQTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBBcmUgeW91IGdvaW5nIHRvIHB1c2ggdGhpcyBmdXJ0aGVyPyBJIHJlYWxseSB0aGluayB3
ZSBzaG91bGQuCgpZZXMsIEknbGwgcmVzdWJtaXQgaXQgdG9tb3Jyb3cuICBTb3JyeSBmb3IgZHJv
cHBpbmcgdGhlIGJhbGwgb24gdGhpcyBvbmUuCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMg
bGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBv
ZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBp
bmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

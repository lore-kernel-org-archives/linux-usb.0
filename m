Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] usb: hub: try old enumeration scheme first for high speed devices
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180920103742.GD14252@kroah.com>
Date: Thu, 20 Sep 2018 12:37:42 +0200
To: Roger Quadros <rogerq@ti.com>
Cc: Zeng Tao <prime.zeng@hisilicon.com>, stern@rowland.harvard.edu, mathias.nyman@linux.intel.com, drinkcat@chromium.org, felipe.balbi@linux.intel.com, drake@endlessm.com, ravisadineni@chromium.org, joe@perches.com, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Thymo van Beers <thymovanbeers@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Rientjes <rientjes@google.com>, Mike Looijmans <mike.looijmans@topic.nl>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDk6NTU6NDlBTSArMDMwMCwgUm9nZXIgUXVhZHJvcyB3
cm90ZToKPiBPbiAyMC8wOC8xOCAxMzowNCwgWmVuZyBUYW8gd3JvdGU6Cj4gPiBUaGUgbmV3IHNj
aGVtZSBpcyByZXF1aXJlZCBqdXN0IHRvIHN1cHBvcnQgbGVnYWN5IGxvdyBhbmQgZnVsbC1zcGVl
ZAo+ID4gZGV2aWNlcy4gRm9yIGhpZ2ggc3BlZWQgZGV2aWNlcywgaXQgd2lsbCBzbG93ZXIgdGhl
IGVudW1lcmF0aW9uIHNwZWVkLgo+ID4gU28gaW4gdGhpcyBwYXRjaCB3ZSB0cnkgdGhlICJvbGQi
IGVudW1lcmF0aW9uIHNjaGVtZSBmaXJzdCBmb3IgaGlnaCBzcGVlZAo+ID4gZGV2aWNlcywgYW5k
IHRoaXMgaXMgd2hhdCBXaW5kb3dzIGRvZXMgc2luY2UgV2luZG93cyA4Lgo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBaZW5nIFRhbyA8cHJpbWUuemVuZ0BoaXNpbGljb24uY29tPgo+IAo+IFlvdSBu
ZWVkIHRvIGFkZCBBbGFuJ3MgQWNrIGhlcmUuIEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdG8gcmVz
ZW5kIHRob3VnaC4KPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQHRpLmNv
bT4KClBsZWFzZSByZXNlbmQsIEkgbmVlZCBoaXMgYWNrIGhlcmUgOikKCnRoYW5rcywKCmdyZWcg
ay1oCg==

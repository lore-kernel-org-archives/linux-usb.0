Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: gadget: f_fs: don't free buffer prematurely
From: John Stultz <john.stultz@linaro.org>
Message-Id: <CALAqxLXaUAfz8n6Cpux7XBhHVHifTQhM_wnz4L3DzrmQ0GoCHg@mail.gmail.com>
Date: Tue, 19 Mar 2019 16:41:24 -0700
To: fei.yang@intel.com
Cc: Felipe Balbi <balbi@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Jerry Zhang <zhangjerry@google.com>, andrzej.p@collabora.com, Vincent Pelletier <plr.vincent@gmail.com>, jingx.shen@intel.com, Linux USB List <linux-usb@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgNDoyNSBQTSA8ZmVpLnlhbmdAaW50ZWwuY29tPiB3cm90
ZToKPgo+IEZyb206IEZlaSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+Cj4KPiBUaGUgZm9sbG93
aW5nIGtlcm5lbCBwYW5pYyBoYXBwZW5zIGR1ZSB0byB0aGUgaW9fZGF0YSBidWZmZXIgZ2V0cyBk
ZWFsbG9jYXRlZAo+IGJlZm9yZSB0aGUgYXN5bmMgaW8gaXMgY29tcGxldGVkLiBBZGQgYSBjaGVj
ayBmb3IgdGhlIGNhc2Ugd2hlcmUgaW9fZGF0YSBidWZmZXIKPiBzaG91bGQgYmUgZGVhbGxvY2F0
ZWQgYnkgZmZzX3VzZXJfY29weV93b3JrZXIuCgpZYXkhICBQZXJmZWN0ISBJIHdhcyB1cCBsYXRl
IGxhc3QgbmlnaHQgY2hhc2luZyB0aGlzIGNyYXNoLCBidXQKY291bGRuJ3QgZGUtdGhyZWFkIHdo
YXQgdGhlIHByb2JsZW0gd2FzLgpTbyB2ZXJ5IGhhcHB5IHRvIHNlZSB0aGlzIHBhdGNoIQoKSSds
bCB0ZXN0IGl0IGhlcmUgc2hvcnRseSEKCnRoYW5rcwotam9obgo=

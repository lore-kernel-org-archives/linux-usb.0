Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: dwc2: host: use hrtimer for NAK retries
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <87zhtk1gl8.fsf@linux.intel.com>
Date: Wed, 05 Dec 2018 11:13:39 +0200
To: Doug Anderson <dianders@chromium.org>, minas.harutyunyan@synopsys.com, Terin Stock <terin@terinstock.com>
Cc: linux-usb@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Dmitry Torokhov <dtor@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGksCgpEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyaXRlczoKPiA+PiBT
aWduZWQtb2ZmLWJ5OiBUZXJpbiBTdG9jayA8dGVyaW5AdGVyaW5zdG9jay5jb20+Cj4+ID4+IC0t
LQo+PiA+PiAgIGRyaXZlcnMvdXNiL2R3YzIvaGNkLmggICAgICAgfCAgICAyICstCj4+ID4+ICAg
ZHJpdmVycy91c2IvZHdjMi9oY2RfcXVldWUuYyB8ICAgMTkgKysrKysrKysrKysrLS0tLS0tLQo+
PiA+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
Pj4gPgo+PiA+IFJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1
bS5vcmc+Cj4+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gPgo+PiBBY2tlZC1ieTog
TWluYXMgSGFydXR5dW55YW4gPGhtaW5hc0BzeW5vcHN5cy5jb20+Cj4KPiBJdCBsb29rcyBsaWtl
IFRlcmluIG1pc3NlZCBDQ2luZyB5b3Ugb24gdGhlIG9yaWdpbmFsIHBhdGNoLiAgSSBhc3N1bWUK
PiB5b3UgYXJlIHN0aWxsIHBpY2tpbmcgdXAgZHdjMiBjaGFuZ2VzIGxpa2UgdGhpcz8gIElmIHNv
LCBzaG91bGQgaGUKPiByZXNlbmQgdGhlIHBhdGNoIHRhcmdldGluZyB5b3UgKGFuZCBpbmNsdWRp
bmcgTWluYXMgYW5kIG15IHRhZ3MpIG9yIGRvCj4geW91IHdhbnQgdG8gcGljayBpdCB1cCBmcm9t
IG9uZSBvZiB0aGUgbWFpbGluZyBsaXN0cyBoZSBDQ2VkPwoKSSdtIHBpY2tpbmcgaXQgdXAsIHRo
YW5rcwo=

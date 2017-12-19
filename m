Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4] usb: dwc2: host: Don't retry NAKed transactions right away
From: Stefan Wahren <stefan.wahren@i2se.com>
Message-Id: <581796864.256888.1513702600488@email.1und1.de>
Date: Tue, 19 Dec 2017 17:56:40 +0100 (CET)
To: John Youn <johnyoun@synopsys.com>, Doug Anderson <dianders@chromium.org>, Felipe Balbi <balbi@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Julius Werner <jwerner@chromium.org>, Eric Anholt <eric@anholt.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, John Stultz <john.stultz@linaro.org>, linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandru M Stan <amstan@chromium.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-rpi-kernel@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

SGkgRG91ZywKCj4gRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPiBoYXQgYW0g
MTkuIERlemVtYmVyIDIwMTcgdW0gMTY6NTcgZ2VzY2hyaWViZW46Cj4gCj4gCj4gRmVsaXBlLAo+
IAo+IE9uIFR1ZSwgRGVjIDEyLCAyMDE3IGF0IDEwOjMwIEFNLCBEb3VnbGFzIEFuZGVyc29uCj4g
PGRpYW5kZXJzQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gLi4uCj4gCj4gSSBkb24ndCBtZWFuIHRv
IGJlIGEgcGVzdCwgYnV0IEknbSBob3BpbmcgdGhhdCB3ZSBjYW4gbGFuZCB0aGlzCj4gc29tZXdo
ZXJlIChpZiBub3RoaW5nIGVsc2UgaW4geW91ciAvbmV4dCB0cmVlKSBqdXN0IHNvIGl0IGRvZXNu
J3QgbWlzcwo+IGFub3RoZXIgcmVsZWFzZSBjeWNsZS4gIElmIHlvdSdyZSBub3Qgc28ga2VlbiBv
biBjb2xsZWN0aW5nIGR3YzIgaG9zdAo+IHBhdGNoZXMgdGhlc2UgZGF5cywgSSBjYW4gYWxzbyBz
ZWUgaWYgR3JlZyBLSCBpcyB3aWxsaW5nIHRvIHRha2UgdGhpcwo+IGRpcmVjdGx5IGludG8gaGlz
IHRyZWUuICBQbGVhc2UgbGV0IG1lIGtub3cuICBUaGFua3MgZm9yIHlvdXIgdGltZSEKPiA6KQo+
IAo+IC1Eb3VnCgppdCdzIGFwcGxpZWQgdG8gbmV4dDoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2JhbGJpL3VzYi5naXQvY29tbWl0Lz9oPW5leHQmaWQ9
MzhkMmI1ZmI3NWMxNTkyM2ZiODljMzIxMzQ1MTZhNjIzNTE1YmNlNAotLS0KVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIg
aW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9y
ZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5m
by5odG1sCg==

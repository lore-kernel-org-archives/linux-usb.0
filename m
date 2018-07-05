Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: serial: cp210x: Implement GPIO support for CP2102N
From: Johan Hovold <johan@kernel.org>
Message-Id: <20180705131102.GC9802@localhost>
Date: Thu, 5 Jul 2018 15:11:02 +0200
To: Karoly Pados <pados@pados.hu>
Cc: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Martyn Welch <martyn.welch@collabora.co.uk>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBKdWwgMDIsIDIwMTggYXQgMDc6MTc6MzNQTSArMDAwMCwgS2Fyb2x5IFBhZG9zIHdy
b3RlOgoKPiBPbiBhIGRpZmZlcmVudCBub3RlLCB2MiBwYXRjaGVzIGFyZSBjb21pbmcgc29vbiB3
aXRoIHRoZSBmZWVkYmFjayBmcm9tIEpvaGFuCj4gaW5jb3Jwb3JhdGVkLiBEaWQgbm90IGZvcmdl
dCBhbmQgSSBzdGlsbCBpbnRlbmQgdG8gcG9saXNoIGV2ZXJ5dGhpbmcgdXAKPiBhcyByZXF1ZXN0
ZWQgdG8gZ2V0IHRoZXNlIGZlYXR1cmVzIGludG8gbWFpbmxpbmUuCgpTb3VuZHMgZ29vZCEKCkpv
aGFuCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5z
dWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21v
QHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJu
ZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

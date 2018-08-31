Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2,3/4] serial: f81232: implement break control
From: Johan Hovold <johan@kernel.org>
Message-Id: <20180831101315.GM28861@localhost>
Date: Fri, 31 Aug 2018 12:13:15 +0200
To: "Ji-Ze Hong \(Peter Hong\)" <hpeter@gmail.com>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, peter_hong@fintek.com.tw, hpeter+linux_kernel@gmail.com
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBdWcgMzAsIDIwMTggYXQgMDk6NTU6NDZBTSArMDgwMCwgSmktWmUgSG9uZyAoUGV0
ZXIgSG9uZykgd3JvdGU6Cj4gSGkgSm9oYW4sCj4gCj4gVGhpcyBhcnRpY2xlIGlzIGR1cGxpY2F0
aW9uIHdpdGgKPiBbUEFUQ0ggVjIgMy80XSBVU0I6IHNlcmlhbDogZjgxMjMyOiBpbXBsZW1lbnQg
YnJlYWsgY29udHJvbAo+IFtQQVRDSCBWMiAzLzRdIHNlcmlhbDogZjgxMjMyOiBpbXBsZW1lbnQg
YnJlYWsgY29udHJvbAo+IAkoVGl0bGUgbm90IHN0YXJ0IHdpdGggVVNCIHRva2VuKQo+IAo+IFNo
b3VsZCBJIGRpc2NhcmQgdGhpcyBQQVRDSF9WMiBzZXJpZXMgYW5kIHJlLXNlbmQgUEFUQ0hfVjMg
Pwo+IG9yIGNvdWxkIHlvdSBkaXNjYXJkIHRoZSBwYXRjaCAtIHNlcmlhbDogZjgxMjMyOiBpbXBs
ZW1lbnQgYnJlYWsgY29udHJvbAo+IG9ubHkgPwoKWWVzLCBubyBwcm9ibGVtLCBzbyBubyBuZWVk
IHRvIHJlc2VuZC4gQnV0IHRoYW5rcyBmb3IgaGlnaGxpZ2h0aW5nIHRoaXMuCgpJJ2xsIHRyeSB0
byBsb29rIGF0IHRoZXNlIG5leHQgd2Vlay4KCkpvaGFuCg==

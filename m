Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] usb: dwc3: gadget: Handle 0 xfer length for OUT EP
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <bb9c5c97-c2d7-5a96-a73b-abb4eef90916@cogentembedded.com>
Date: Mon, 21 Jan 2019 19:17:37 +0300
To: Tejas Joglekar <tejas.joglekar@synopsys.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Cc: John Youn <john.youn@synopsys.com>, stable@vger.kernel.org, thinh.nguyen@synopsys.com
List-ID: <linux-usb.vger.kernel.org>

SGVsbG8hCgpPbiAwMS8yMS8yMDE5IDEyOjMzIFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToKCj4g
Rm9yIE9VVCBlbmRwb2ludHMsIHplcm8tbGVuZ3RoIHRyYW5zZmVycyByZXF1aXJlIE1heFBhY2tl
dFNpemUgYnVmZmVyIGFzCj4gcGVyIHRoZSBEV0NfdXNiMyBwcm9ncmFtbWluZyBndWlkZSAzLjMw
YSBzZWN0aW9uIDQuMi4zLjMuCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGlzIGJ5IGV4cGxpY2l0
bHkgY2hlY2tpbmcgemVybyBsZW5ndGgKPiB0cmFuc2ZlciB0byBjb3JyZWN0bHkgcGFkIHVwIHRv
IE1heFBhY2tldFNpemUuCj4gCj4gRml4ZXM6IGM2MjY3YTUxNjM5YiAodXNiOiBkd2MzOiBnYWRn
ZXQ6IGFsaWduIHRyYW5zZmVycyB0bwo+IHdNYXhQYWNrZXRTaXplKQoKICAgUGxlYXNlIGVuY2xv
c2UgdGhlIHN1bW1hcnkgaW4gKCIiKSwgbm8ganVzdCAoKS4gQW5kIHBsZWFzZSBuZXZlciB3cmFw
IGl0LgoKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IAo+IFNpZ25lZC1vZmYtYnk6IFRl
amFzIEpvZ2xla2FyIDxqb2dsZWthckBzeW5vcHN5cy5jb20+ClsuLi5dCgpNQlIsIFNlcmdlaQo=

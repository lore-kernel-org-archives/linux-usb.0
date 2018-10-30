Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] usb: dwc2: gadget: Fix WkupAlert interrupt handler.
From: Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Message-Id: <3AD91E696667BF4BA728303C178E8A63532C22FA@am04wembxb.internal.synopsys.com>
Date: Tue, 30 Oct 2018 14:13:22 +0000
To: Felipe Balbi <balbi@kernel.org>, Artur Petrosyan <arthur.petrosyan@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Minas Harutyunyan <minas.harutyunyan@synopsys.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: John Youn <john.youn@synopsys.com>
List-ID: <linux-usb.vger.kernel.org>

SGkgQmFsYmksCgpPbiAxMC8zMC8yMDE4IDE2OjM0LCBGZWxpcGUgQmFsYmkgd3JvdGU6Cj4gCj4g
SGksCj4gCj4gQXJ0dXIgUGV0cm9zeWFuIDxhcnRodXIucGV0cm9zeWFuQHN5bm9wc3lzLmNvbT4g
d3JpdGVzOgo+PiBBY2NvcmRpbmcgdG8gdGhlIGRhdGFib29rIERDVExfUk1UV0tVUFNJRyBiaXQK
Pj4gaXMgZGVmaW5lZCBpbiBEQ1RMIHJlZ2lzdGVyIG5vdCBpbiBEQ0ZHLgo+Pgo+PiBVcGRhdGVk
IHNldHRpbmcgRENUTF9STVRXS1VQU0lHIGJpdCB0byBEQ1RMCj4+IHJlZ2lzdGVyLgo+Pgo+IAo+
IGxvb2tzIGxpa2UgdGhpcyBuZWVkcyBhIENjIHN0YWJsZSBhbmQgRml4ZXMgdGFnLiBDYXJlIHRv
IGFkZD8KPiAKPiAKCkkgdGhpbmssIHdlIGRvbid0IG5lZWQgdG8gYWRkIHRoaXMgcGF0Y2ggdG8g
c3RhYmxlIGFzIHRoaXMgY29kZSBpcyBub3QgCmluY2x1ZGVkIGluIGFueSBzdGFibGUgdmVyc2lv
bi4gQWNjb3JkaW5nIEdyZWcncyBtYWlsIChbR0lUIFBVTExdIFVTQiAKZHJpdmVyIHBhdGNoZXMg
Zm9yIDQuMjAtcmMxKSB0aGlzIGNvZGUgZmlyc3QgYXBwZWFyZWQgaW4gNC4yMC1yYzEuCgpJIHdp
bGwgYWRkIHRoZSBGaXhlcyB0YWcgdG8gdGhlIHBhdGNoIGFuZCBzZW5kIGl0IHdpdGggdmVyc2lv
biAyLgoKUmVnYXJkcywKQXJ0dXIK

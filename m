Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usbip: vhci_hcd: check port number before using
From: Shuah Khan <shuah@kernel.org>
Message-Id: <c7da9adc-3cb3-c5a6-519c-ba4440897c28@kernel.org>
Date: Mon, 8 Oct 2018 13:28:57 -0600
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Valentina Manea <valentina.manea.m@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, syzbot+600b03e0cf1b73bb23c4@syzkaller.appspotmail.com, stable <stable@vger.kernel.org>, Shuah Khan <shuah@kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgU3VkaXAsCgpPbiAxMC8wOC8yMDE4IDAxOjE5IFBNLCBTdWRpcCBNdWtoZXJqZWUgd3JvdGU6
Cj4gRnJvbTogU3VkaXAgTXVraGVyamVlIDxzdWRpcG0ubXVraGVyamVlQGdtYWlsLmNvbT4KPiAK
PiBUaGUgcG9ydCBudW1iZXIgaXMgY2hlY2tlZCBhbmQgaXQganVzdCBwcmludHMgYW4gZXJyb3Ig
bWVzc2FnZSBidXQgaXQKPiBzdGlsbCBjb250aW51ZXMgdG8gdXNlIHRoZSBpbnZhbGlkIHBvcnQu
IEFuZCBhcyBhIHJlc3VsdCBpdCBhY2Nlc3Nlcwo+IG1lbW9yeSB3aGljaCBpcyBub3QgaXRzIHJl
c3VsdGluZyBpbiAgQlVHIHJlcG9ydCBmcm9tIEtBU0FOLgoKWWVzIHRoZXJlIGlzIGFuIGlzc3Vl
IHdpdGggb3V0IG9mIGJvdW5kcyBhY2Nlc3MuIEJ1dCB0aGlzIGlzbid0IHRoZQpyaWdodCBmaXgu
Cgo+IAo+IFJlcG9ydGVkLWJ5OiBzeXpib3QrNjAwYjAzZTBjZjFiNzNiYjIzYzRAc3l6a2FsbGVy
LmFwcHNwb3RtYWlsLmNvbQo+IENjOiBzdGFibGUgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogU3VkaXAgTXVraGVyamVlIDxzdWRpcG0ubXVraGVyamVlQGdtYWlsLmNv
bT4KCkkgc2VudCBpbiBhIGZpeCBmb3IgdGhpcyBsYXN0IEZyaWRheS4KCmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA2Mjg4MzMvCgp0aGFua3MsCi0tIFNodWFoCg==

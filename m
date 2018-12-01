Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,10/10] usb: dwc3: Check MISSED ISOC bit only for ISOC endpoints
From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Message-Id: <1543662811-5194-11-git-send-email-anurag.kumar.vulisha@xilinx.com>
Date: Sat, 1 Dec 2018 16:43:31 +0530
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Johan Hovold <johan@kernel.org>, Jaejoong Kim <climbbb.kim@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Roger Quadros <rogerq@ti.com>, Manu Gautam <mgautam@codeaurora.org>, martin.petersen@oracle.com, Bart Van Assche <bvanassche@acm.org>, Mike Christie <mchristi@redhat.com>, Matthew Wilcox <willy@infradead.org>, Colin Ian King <colin.king@canonical.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Thinh Nguyen <thinhn@synopsys.com>, Tejas Joglekar <tejas.joglekar@synopsys.com>, Ajay Yugalkishore Pandey <APANDEY@xilinx.com>, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-ID: <linux-usb.vger.kernel.org>

V2hlbiBzdHJlYW1pbmcgaXMgZW5hYmxlZCBvbiBCVUxLIGVuZHBvaW50cyBhbmQgTFNUIGJpdCBp
cyBzZXQKb2JzZXJ2ZWQgTUlTU0VEIElTT0MgYml0IHNldCBpbiBldmVudC0+c3RhdHVzIGZvciBC
VUxLIGVwLiBTaW5jZQp0aGlzIGJpdCBpcyBvbmx5IHZhbGlkIGZvciBpc29jcm9ub3VzIGVuZHBv
aW50cywgY2hhbmdlZCB0aGUgY29kZQp0byBjaGVjayBmb3IgaXNvY3Jub3VzIGVuZHBvaW50cyB3
aGVuIE1JU1NFRCBJU09DIGJpdCBpcyBzZXQuCgpTaWduZWQtb2ZmLWJ5OiBBbnVyYWcgS3VtYXIg
VnVsaXNoYSA8YW51cmFnLmt1bWFyLnZ1bGlzaGFAeGlsaW54LmNvbT4KUmV2aWV3ZWQtYnk6IFRo
aW5oIE5ndXllbiA8dGhpbmhuQHN5bm9wc3lzLmNvbT4KVGVzdGVkLWJ5OiBUZWphcyBKb2dsZWth
ciA8dGVqYXMuam9nbGVrYXJAc3lub3BzeXMuY29tPgotLS0KIENoYW5nZXMgaW4gdjc6CgkxLiBO
b25lCgogQ2hhbmdlcyBpbiB2NjoKCTEuIE5vbmUKCiBDaGFuZ2VzIGluIHY1OgoJMS4gTm9uZQoK
IENoYW5nZXMgaW4gdjQ6CgkxLiBOb25lCgogQ2hhbmdlcyBpbiB2MzoKCTEuIE5vbmUKCiBDaGFu
Z2VzIGluIHYyOgoJMS4gTm9uZQotLS0KIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jCmluZGV4IDIxNjE3OWUuLjVkNWM1NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMKKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYwpAQCAtMjQwOSw3ICsyNDA5
LDggQEAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfZW5kcG9pbnRfdHJhbnNmZXJfaW5fcHJvZ3Jl
c3Moc3RydWN0IGR3YzNfZXAgKmRlcCwKIAlpZiAoZXZlbnQtPnN0YXR1cyAmIERFUEVWVF9TVEFU
VVNfQlVTRVJSKQogCQlzdGF0dXMgPSAtRUNPTk5SRVNFVDsKIAotCWlmIChldmVudC0+c3RhdHVz
ICYgREVQRVZUX1NUQVRVU19NSVNTRURfSVNPQykgeworCWlmICgoZXZlbnQtPnN0YXR1cyAmIERF
UEVWVF9TVEFUVVNfTUlTU0VEX0lTT0MpICYmCisJICAgIHVzYl9lbmRwb2ludF94ZmVyX2lzb2Mo
ZGVwLT5lbmRwb2ludC5kZXNjKSkgewogCQlzdGF0dXMgPSAtRVhERVY7CiAKIAkJaWYgKGxpc3Rf
ZW1wdHkoJmRlcC0+c3RhcnRlZF9saXN0KSkK

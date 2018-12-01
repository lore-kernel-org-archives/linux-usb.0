Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,04/10] usb: dwc3: update stream id in depcmd
From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Message-Id: <1543662811-5194-5-git-send-email-anurag.kumar.vulisha@xilinx.com>
Date: Sat, 1 Dec 2018 16:43:25 +0530
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Johan Hovold <johan@kernel.org>, Jaejoong Kim <climbbb.kim@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Roger Quadros <rogerq@ti.com>, Manu Gautam <mgautam@codeaurora.org>, martin.petersen@oracle.com, Bart Van Assche <bvanassche@acm.org>, Mike Christie <mchristi@redhat.com>, Matthew Wilcox <willy@infradead.org>, Colin Ian King <colin.king@canonical.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Thinh Nguyen <thinhn@synopsys.com>, Tejas Joglekar <tejas.joglekar@synopsys.com>, Ajay Yugalkishore Pandey <APANDEY@xilinx.com>, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-ID: <linux-usb.vger.kernel.org>

Rm9yIHN0cmVhbSBjYXBhYmxlIGVuZHBvaW50cywgc3RyZWFtIGlkIHJlbGF0ZWQgaW5mb3JtYXRp
b24KbmVlZHMgdG8gYmUgdXBkYXRlZCBpbnRvIERFUENNRCB3aGlsZSBpc3N1aW5nIFNUQVJUIFRS
QU5TRkVSLgpUaGlzIHBhdGNoIGRvZXMgdGhlIHNhbWUuCgpTaWduZWQtb2ZmLWJ5OiBBbnVyYWcg
S3VtYXIgVnVsaXNoYSA8YW51cmFnLmt1bWFyLnZ1bGlzaGFAeGlsaW54LmNvbT4KLS0tCiBDaGFu
Z2VzIGluIHY3OgoJMS4gUmV2ZXJ0ZWQgdG8gZGVwLT5zdHJlYW1fY2FwYWJsZSBmcm9tIGRlcC0+
ZW5kcG9pbnQuc3RyZWFtX2NhcGFibGUKCiBDaGFuZ2VzIGluIHY2OgoJMS4gVXNlZCBkZXAtPmVu
ZHBvaW50LnN0cmVhbV9jYXBhYmxlIGluc3RlYWQgb2YgZGVwLT5zdHJlYW1fY2FwYWJsZQoJICAg
ZmxhZwoKIENoYW5nZXMgaW4gdjU6CgkxLiBOb25lCgogQ2hhbmdlcyBpbiB2NDoKCTEuIE5vbmUK
CiBDaGFuZ2VzIGluIHYzOgoJMS4gTm9uZQoKIENoYW5nZXMgaW4gdjI6CgkxLiBOb25lCi0tLQog
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMKaW5kZXggMzE5YTNlZC4uMzE3MWMyNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYworKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5j
CkBAIC0xMjMyLDYgKzEyMzIsOSBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfa2lja190cmFu
c2ZlcihzdHJ1Y3QgZHdjM19lcCAqZGVwKQogCQlwYXJhbXMucGFyYW0xID0gbG93ZXJfMzJfYml0
cyhyZXEtPnRyYl9kbWEpOwogCQljbWQgPSBEV0MzX0RFUENNRF9TVEFSVFRSQU5TRkVSOwogCisJ
CWlmIChkZXAtPnN0cmVhbV9jYXBhYmxlKQorCQkJY21kIHw9IERXQzNfREVQQ01EX1BBUkFNKHJl
cS0+cmVxdWVzdC5zdHJlYW1faWQpOworCiAJCWlmICh1c2JfZW5kcG9pbnRfeGZlcl9pc29jKGRl
cC0+ZW5kcG9pbnQuZGVzYykpCiAJCQljbWQgfD0gRFdDM19ERVBDTURfUEFSQU0oZGVwLT5mcmFt
ZV9udW1iZXIpOwogCX0gZWxzZSB7Cg==

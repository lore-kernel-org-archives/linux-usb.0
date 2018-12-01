Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,06/10] usb: dwc3: don't issue no-op trb for stream capable endpoints
From: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Message-Id: <1543662811-5194-7-git-send-email-anurag.kumar.vulisha@xilinx.com>
Date: Sat, 1 Dec 2018 16:43:27 +0530
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Johan Hovold <johan@kernel.org>, Jaejoong Kim <climbbb.kim@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Roger Quadros <rogerq@ti.com>, Manu Gautam <mgautam@codeaurora.org>, martin.petersen@oracle.com, Bart Van Assche <bvanassche@acm.org>, Mike Christie <mchristi@redhat.com>, Matthew Wilcox <willy@infradead.org>, Colin Ian King <colin.king@canonical.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Thinh Nguyen <thinhn@synopsys.com>, Tejas Joglekar <tejas.joglekar@synopsys.com>, Ajay Yugalkishore Pandey <APANDEY@xilinx.com>, Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
List-ID: <linux-usb.vger.kernel.org>

VGhlIHN0cmVhbSBjYXBhYmxlIGVuZHBvaW50cyByZXF1aXJlIHN0cmVhbSBpZCB0byBiZSBnaXZl
bgp3aGVuIGlzc3VpbmcgU1RBUlQgVFJBTlNGRVIuIFdoaWxlIGlzc3Vpbmcgbm8tb3AgdHJiIHRo
ZQpzdHJlYW0gaWQgaXMgbm90IHlldCBrbm93biwgc28gZG9uJ3QgaXNzdWUgbm8tb3AgdHJiJ3Mg
b24Kc3RyZWFtIGNhcGFibGUgZW5kcG9pbnRzLgoKU2lnbmVkLW9mZi1ieTogQW51cmFnIEt1bWFy
IFZ1bGlzaGEgPGFudXJhZy5rdW1hci52dWxpc2hhQHhpbGlueC5jb20+Ci0tLQogQ2hhbmdlcyBp
biB2NzoKCTEuIFJldmVydGVkIHRvIGRlcC0+c3RyZWFtX2NhcGFibGUgZnJvbSBkZXAtPmVuZHBv
aW50LnN0cmVhbV9jYXBhYmxlCgogQ2hhbmdlcyBpbiB2NjoKCTEuIFJlcGxhY2VkIGRlcC0+c3Ry
ZWFtX2NhcGFibGUgd2l0aCBkZXAtPmVuZHBvaW50LnN0cmVhbV9jYXBhYmxlCgogQ2hhbmdlcyBp
biB2NToKCTEuIE5vbmUKCiBDaGFuZ2VzIGluIHY0OgoJMS4gTm9uZQoKIENoYW5nZXMgaW4gdjM6
CgkxLiBOb25lCgogQ2hhbmdlcyBpbiB2MjoKCTEuIE5vbmUKLS0tCiBkcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMKaW5kZXggM2VkZmMwYi4uNzhjOWJjNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYworKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jCkBA
IC02NzMsNyArNjczLDcgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X2VwX2VuYWJsZShzdHJ1
Y3QgZHdjM19lcCAqZGVwLCB1bnNpZ25lZCBpbnQgYWN0aW9uKQogCSAqIElzc3VlIFN0YXJ0VHJh
bnNmZXIgaGVyZSB3aXRoIG5vLW9wIFRSQiBzbyB3ZSBjYW4gYWx3YXlzIHJlbHkgb24gTm8KIAkg
KiBSZXNwb25zZSBVcGRhdGUgVHJhbnNmZXIgY29tbWFuZC4KIAkgKi8KLQlpZiAodXNiX2VuZHBv
aW50X3hmZXJfYnVsayhkZXNjKSB8fAorCWlmICgodXNiX2VuZHBvaW50X3hmZXJfYnVsayhkZXNj
KSAmJiAhZGVwLT5zdHJlYW1fY2FwYWJsZSkgfHwKIAkJCXVzYl9lbmRwb2ludF94ZmVyX2ludChk
ZXNjKSkgewogCQlzdHJ1Y3QgZHdjM19nYWRnZXRfZXBfY21kX3BhcmFtcyBwYXJhbXM7CiAJCXN0
cnVjdCBkd2MzX3RyYgkqdHJiOwo=

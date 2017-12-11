Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: serial: Avoid goto in bulk callbacks
From: Oliver Neukum <oneukum@suse.com>
Message-Id: <1512989901.22920.3.camel@suse.com>
Date: Mon, 11 Dec 2017 11:58:21 +0100
To: Ladislav Michl <ladis@linux-mips.org>, linux-usb@vger.kernel.org
Cc: Johan Hovold <johan@kernel.org>
List-ID: <linux-usb.vger.kernel.org>

QW0gTW9udGFnLCBkZW4gMTEuMTIuMjAxNywgMDA6MTEgKzAxMDAgc2NocmllYiBMYWRpc2xhdiBN
aWNobDoKPiBSZWZhY3RvciBidWxrIGNhbGxiYWNrIGZ1bmN0aW9ucyB0byBtYWtlIHVzZSBvZiBn
b3RvIHBvaW50bGVzcy4KPiAKPiAKCkhpLAoKeW91IHNlZW0gdG8gYXNzdW1lIHRoYXQgdGhpcyBp
cyBhIGdvb2QgdGhpbmcgYnkgaXRzZWxmIHdoaWNoCm5lZWRzIG5vIGZ1cnRoZXIganVzdGlmaWNh
dGlvbi4gSSBkaXNhZ3JlZS4gWW91IGR1cGxpY2F0ZWQKY29kZS4KCglSZWdhcmRzCgkJT2xpdmVy
Ci0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJz
Y3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZn
ZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwu
b3JnL21ham9yZG9tby1pbmZvLmh0bWwK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usbip: vhc_hcd: prevent module being removed while device are attached
From: Greg KH <greg@kroah.com>
Message-Id: <20180405191102.GA19263@kroah.com>
Date: Thu, 5 Apr 2018 21:11:02 +0200
To: Sasha Levin <Alexander.Levin@microsoft.com>
Cc: Shuah Khan <shuahkh@osg.samsung.com>, "valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>, "shuah@kernel.org" <shuah@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBBcHIgMDUsIDIwMTggYXQgMDQ6NDI6NDZQTSArMDAwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gSGkuCj4gCj4gW1RoaXMgaXMgYW4gYXV0b21hdGVkIGVtYWlsXQoKV2h5IGFyZSB5b3Ug
cnVubmluZyB0aGlzIGFnYWluc3QgcGF0Y2hlcyB0aGF0IGFyZSBub3QgeWV0IGluIExpbnVzJ3MK
dHJlZT8gIFRoYXQgZmVlbHMgb2RkLiAgT25seSBhYm91dCAxLzMgb2YgdGhlIHBhdGNoZXMgcG9z
dGVkIGVuZCB1cApiZWluZyBtZXJnZWQgKGF0IGJlc3QpLCBzbyBkb24ndCBkbyBleHRyYSB3b3Jr
IGJ5IHJ1bm5pbmcgdGhpcyBvbgpwYXRjaGVzIHRoYXQgbWlnaHQgbm90IGV2ZW4gYmUgbWVyZ2Vk
IGF0IGFsbC4KCnRoYW5rcywKCmdyZWcgay1oCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMg
bGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBv
ZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBp
bmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

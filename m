Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v7,05/10] usb: dwc3: make controller clear transfer resources after complete
From: Felipe Balbi <balbi@kernel.org>
Message-Id: <878t142vpq.fsf@linux.intel.com>
Date: Wed, 05 Dec 2018 11:01:37 +0200
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Johan Hovold <johan@kernel.org>, Jaejoong Kim <climbbb.kim@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Roger Quadros <rogerq@ti.com>, Manu Gautam <mgautam@codeaurora.org>, martin.petersen@oracle.com, Bart Van Assche <bvanassche@acm.org>, Mike Christie <mchristi@redhat.com>, Matthew Wilcox <willy@infradead.org>, Colin Ian King <colin.king@canonical.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, v.anuragkumar@gmail.com, Thinh Nguyen <thinhn@synopsys.com>, Tejas Joglekar <tejas.joglekar@synopsys.com>, Ajay Yugalkishore Pandey <APANDEY@xilinx.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpBbnVyYWcgS3VtYXIgVnVsaXNoYSA8YW51cmFnLmt1bWFyLnZ1bGlzaGFAeGlsaW54LmNv
bT4gd3JpdGVzOgo+IEBAIC0yNDg3LDYgKzI0OTcsMTEgQEAgc3RhdGljIHZvaWQgZHdjM19lbmRw
b2ludF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywKPiAgCX0KPiAgCj4gIAlzd2l0Y2ggKGV2
ZW50LT5lbmRwb2ludF9ldmVudCkgewo+ICsJY2FzZSBEV0MzX0RFUEVWVF9YRkVSQ09NUExFVEU6
Cj4gKwkJaWYgKCFkZXAtPnN0cmVhbV9jYXBhYmxlKQo+ICsJCQlicmVhazsKPiArCQlkZXAtPmZs
YWdzICY9IH5EV0MzX0VQX1RSQU5TRkVSX1NUQVJURUQ7Cj4gKwkJLyogRmFsbCBUaHJvdWdoICov
CgppbnN0ZWFkLCBsZXQncyBhZGQgYSBwcm9wZXIgaGFuZGxlciBmb3IgdGhpczoKCmR3YzNfZ2Fk
Z2V0X2VuZHBvaW50X3RyYW5zZmVyX2NvbXBsZXRlKGRlcCwgZXZlbnQpOwoKVGhhdCBoYW5kbGVy
IHNob3VsZCBiZSAic2VsZi1zdWZmaWNpZW50Ii4gSU9XLCB3ZSBzaG91bGRuJ3QgaGF2ZSB0aGlz
CmZhbGwgdGhyb3VnaCBoZXJlLiBUaGlzIG1lYW5zIHRoYXQgdGhlIG90aGVyIHBhdGNoIHdoZXJl
IHlvdSBtb2RpZnkKZHdjM19nYWRnZXRfdHJhbnNmZXJfaW5fcHJvZ3Jlc3MoKSBzaG91bGRuJ3Qg
YmUgbmVjZXNzYXJ5LCBzaW5jZSB0aGF0CmV2ZW50IHNob3VsZG4ndCBydW4gZm9yIHN0cmVhbSBj
YXBhYmxlIGVuZHBvaW50cy4KCldoaWxlIHJld3JpdGluZyB0aGUgcGF0Y2hlcywgcGxlYXNlIHJl
YmFzZSBvbiBteSB0ZXN0aW5nL25leHQgYXMgSSBoYXZlCmFwcGxpZWQgYSBmZXcgb2YgdGhlIHBh
dGNoZXMgaW4gdGhpcyBzZXJpZXMuCg==

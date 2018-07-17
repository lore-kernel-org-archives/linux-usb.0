Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dvb usb issues since kernel 4.9
From: Linus Torvalds <torvalds@linux-foundation.org>
Message-Id: <CA+55aFwb5hPtPFbB02SSn+wTkqTDSgHGFkiw7LB57mj42VzyZQ@mail.gmail.com>
Date: Tue, 17 Jul 2018 10:09:28 -0700
To: hannah@marvell.com
Cc: Jonathan Corbet <corbet@lwn.net>, David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josef Griebichler <griebichler.josef@gmx.at>, Hannes Frederic Sowa <hannes@redhat.com>, Jesper Dangaard Brouer <jbrouer@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Ingo Molnar <mingo@kernel.org>, Network Development <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, dma <dmaengine@vger.kernel.org>, vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, nadavh@marvell.com, thomas.petazzoni@bootlin.com, omrii@marvell.com
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgNDo1OCBBTSBIYW5uYSBIYXdhIDxoYW5uYWhAbWFydmVs
bC5jb20+IHdyb3RlOgo+Cj4gQWZ0ZXIgc29tZSBkZWJ1Zy9iaXNlY3QvZGlmZiwgZm91bmQgdGhh
dCBwYXRjaCAic29mdGlycTogTGV0IGtzb2Z0aXJxZAo+IGRvIGl0cyBqb2IiIGlzIHByb2JsZW1h
dGljIHBhdGNoLgoKT2ssIHRoaXMgdGhyZWFkIGRpZWQgZG93biB3aXRob3V0IGFueSByZXNvbHV0
aW9uLgoKPi0gVXNpbmcgdjQuMTQuMCAoaW5jbHVkaW5nIHNvZnRpcnEgcGF0Y2gpIGFuZCB0aGUg
YWRkaXRpb25hbCBmaXgKPiBwcm9wb3NlZCBieSBMaW51cyAtIG5vIHRpbWVvdXQgaXNzdWUuCgpB
cmUgeW91IHRhbGtpbmcgYWJvdXQgdGhlIHBhdGNoIHRoYXQgbWFkZSBISV9TT0ZUSVJRIGFuZApU
QVNLTEVUX1NPRlRJUlEgc3BlY2lhbCwgYW5kIGhhZCB0aGlzOgoKICAjZGVmaW5lIFNPRlRJUlFf
Tk9XX01BU0sgKCgxIDw8IEhJX1NPRlRJUlEpIHwgKDEgPDwgVEFTS0xFVF9TT0ZUSVJRKSkKCmlu
IGl0PwoKSSB0aGluayBJJ2xsIGp1c3QgY29tbWl0IHRoZSBkYW1uIHRoaW5nLiBJdCdzIGhhY2t5
LCBidXQgaXQncyBzaW1wbGUsCmFuZCBpdCBuZXZlciBnb3QgYXBwbGllZCBiZWNhdXNlIHdlIGhh
ZCBzbWFydGVyIHN1Z2dlc3Rpb25zLiBCdXQgdGhlCnNtYXJ0ZXIgc3VnZ2VzdGlvbnMgbmV2ZXIg
ZW5kZWQgdXAgYmVpbmcgYXBwbGllZCBlaXRoZXIsIHNvLi4KCiAgICAgICAgICAgICAgICAgICAg
ICAgTGludXMKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5l
ICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpv
cmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2Vy
Lmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: dvb usb issues since kernel 4.9
From: hannah@marvell.com
Message-Id: <361dec80-081e-c796-2052-71d006b84ffc@marvell.com>
Date: Tue, 17 Jul 2018 21:07:36 +0300
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>, David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josef Griebichler <griebichler.josef@gmx.at>, Hannes Frederic Sowa <hannes@redhat.com>, Jesper Dangaard Brouer <jbrouer@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Ingo Molnar <mingo@kernel.org>, Network Development <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, dma <dmaengine@vger.kernel.org>, vkoul@kernel.org, Dan Williams <dan.j.williams@intel.com>, nadavh@marvell.com, thomas.petazzoni@bootlin.com, omrii@marvell.com
List-ID: <linux-usb.vger.kernel.org>

SGkgTGludXMsCgpPbiAwNy8xNy8yMDE4IDA4OjA5IFBNLCBMaW51cyBUb3J2YWxkcyB3cm90ZToK
PiBPbiBUdWUsIEp1bCAxNywgMjAxOCBhdCA0OjU4IEFNIEhhbm5hIEhhd2EgPGhhbm5haEBtYXJ2
ZWxsLmNvbT4gd3JvdGU6Cj4+Cj4+IEFmdGVyIHNvbWUgZGVidWcvYmlzZWN0L2RpZmYsIGZvdW5k
IHRoYXQgcGF0Y2ggInNvZnRpcnE6IExldCBrc29mdGlycWQKPj4gZG8gaXRzIGpvYiIgaXMgcHJv
YmxlbWF0aWMgcGF0Y2guCj4KPiBPaywgdGhpcyB0aHJlYWQgZGllZCBkb3duIHdpdGhvdXQgYW55
IHJlc29sdXRpb24uCj4KPj4gLSBVc2luZyB2NC4xNC4wIChpbmNsdWRpbmcgc29mdGlycSBwYXRj
aCkgYW5kIHRoZSBhZGRpdGlvbmFsIGZpeAo+PiBwcm9wb3NlZCBieSBMaW51cyAtIG5vIHRpbWVv
dXQgaXNzdWUuCj4KPiBBcmUgeW91IHRhbGtpbmcgYWJvdXQgdGhlIHBhdGNoIHRoYXQgbWFkZSBI
SV9TT0ZUSVJRIGFuZAo+IFRBU0tMRVRfU09GVElSUSBzcGVjaWFsLCBhbmQgaGFkIHRoaXM6Cj4K
PiAgICNkZWZpbmUgU09GVElSUV9OT1dfTUFTSyAoKDEgPDwgSElfU09GVElSUSkgfCAoMSA8PCBU
QVNLTEVUX1NPRlRJUlEpKQo+Cj4gaW4gaXQ/CnllcywgZXhhY3RseS4uCgpMaW5rIHRvIHRoZSBw
YXRjaDoKaHR0cHM6Ly9naXQubGludXh0di5vcmcvbWNoZWhhYi9leHBlcmltZW50YWwuZ2l0L2Nv
bW1pdC8/aD12NC4xNSUyYm1lZGlhJTJiZHdjMiZpZD1jY2Y4MzNmZDRhNWI5OWMzZDNjZjJjMDlj
MDY1NjcwZjc0YTIzMGE3CgpUaGFua3MsCkhhbm5hCgo+Cj4gSSB0aGluayBJJ2xsIGp1c3QgY29t
bWl0IHRoZSBkYW1uIHRoaW5nLiBJdCdzIGhhY2t5LCBidXQgaXQncyBzaW1wbGUsCj4gYW5kIGl0
IG5ldmVyIGdvdCBhcHBsaWVkIGJlY2F1c2Ugd2UgaGFkIHNtYXJ0ZXIgc3VnZ2VzdGlvbnMuIEJ1
dCB0aGUKPiBzbWFydGVyIHN1Z2dlc3Rpb25zIG5ldmVyIGVuZGVkIHVwIGJlaW5nIGFwcGxpZWQg
ZWl0aGVyLCBzby4uCj4KPiAgICAgICAgICAgICAgICAgICAgICAgIExpbnVzCj4KLS0tClRvIHVu
c3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51
eC11c2IiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwu
b3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jk
b21vLWluZm8uaHRtbAo=

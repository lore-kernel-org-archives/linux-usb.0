Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
From: Dan Carpenter <dan.carpenter@oracle.com>
Message-Id: <20171208111144.qneozhok457wuukj@mwanda>
Date: Fri, 8 Dec 2017 14:11:44 +0300
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, USB list <linux-usb@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?iso-8859-1?Q?G=FCnter_R=F6ck?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBEZWMgMDYsIDIwMTcgYXQgMDk6MjA6MDVQTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIE1hcmt1cywKPiAKPiBPbiBXZWQsIERlYyA2LCAyMDE3IGF0IDY6NTEg
UE0sIFNGIE1hcmt1cyBFbGZyaW5nCj4gPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PiB3
cm90ZToKPiA+PiBUaGUgc3lzdGVtIHdpbGwgY29tZSB0byBhIGdyaW5kaW5nIGhhbHQgYW55d2F5
IGlmIGl0IGNhbid0IGFsbG9jYXRlIDI0IG9yIDQwIGJ5dGVzLgo+ID4KPiA+IE1heWJlLgo+IAo+
IFNpbmNlIHlvdSd2ZSBiZWVuIHNlbmRpbmcgemlsbGlvbnMgb2YgcGF0Y2hlcyBmb3IgdGhpcywg
cGVyaGFwcyB0aGUgdGltZQo+IGlzIHJpcGUgdG8gYWN0dWFsbHkgdHJ5IHRvIHRyaWdnZXIgdGhp
cywgYW5kIHNlZSB3aGF0IGhhcHBlbnM/Cj4gCj4gPj4gV2hpY2ggaXMgQlRXIG1vcmUgb3IgbGVz
cyB0aGUgYW1vdW50IG9mIG1lbW9yeSBzYXZlZCBieSBraWxsaW5nCj4gPj4gdGhlIHVzZWxlc3Mg
KGVycm9yKSBtZXNzYWdlLgo+ID4KPiA+IFdvdWxkIHlvdSBkYXJlIHRvIHJlc2VuZCB0aGlzIHVw
ZGF0ZSBzdWdnZXN0aW9uIGFmdGVyIHN1Y2ggYSB2aWV3Pwo+IAo+IE9mIGNvdXJzZS4gVGhhdCB3
YXMgaW1wbGllZC4KPiAKCk5vLiAgR3JlZyBtYWludGFpbnMgVVNCIGFuZCBoZSdzIGhhcyBibG9j
a2VkIE1hcmt1cywgYmVjYXVzZSBoZSBuZXZlcgpsaXN0ZW5zIHRvIGZlZWRiYWNrIGJ1dCBpbnN0
ZWFkIGp1c3QgcmVwc29uZHMgdGhhdCBoZSBoYXMgYSBkaWZmZXJlbnQKb3Bpbmlvbi4KCnJlZ2Fy
ZHMsCmRhbiBjYXJwZW50ZXIKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5k
IHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBib2R5IG9mIGEgbWVzc2Fn
ZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0
dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

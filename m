Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,1/5] drivercore: Revert "deferral race condition fix"
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75Vf7qozL8abZSh1gv_F3iSiZCprEK5_eGW=SRyUpjYrmtA@mail.gmail.com>
Date: Wed, 14 Nov 2018 10:45:22 +0200
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, USB <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Guenter Roeck <linux@roeck-us.net>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, rogerq@ti.com, Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Sebastian Reichel <sre@kernel.org>, Linux OMAP Mailing List <linux-omap@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Grant Likely <grant.likely@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBOb3YgMTQsIDIwMTggYXQgMjozNCBBTSBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDY6MTE6MjZQTSArMDIw
MCwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6Cj4KPiA+IGlmIHdlIHJldmVydCB0aGUgY29tbWl0IHRo
ZW4gdGhlIG9yaWdpbmFsIGlzc3VlIHdpbGwgcmUtc3VyZmFjZXMuIGFmYWlrCj4gPiBpdCB3YXMg
bm90IG9ubHkgYXVkaW8gd2hpY2ggaGl0IHRoZSAnbGFzdCBkcml2ZXIgdG8gYmUgcHJvYmVkIGZy
b20gdGhlCj4gPiBkZWZlcnJlZCBsaXN0IHdvdWxkIG5ldmVyIHByb2JlLCB1bmxlc3Mgd2UgcHJv
dm9rZSB0aGUga2VybmVsIHRvIGxvYWQKPiA+IGFkZGl0aW9uYWwgbW9kdWxlLCBvciByZW1vdmUv
cmVsb2FkIHRoZSBtb2R1bGUnIGlzc3VlLgo+Cj4gUmlnaHQsIGFyZW4ndCB3ZSBqdXN0IGdvaW5n
IHRvIGJlIHN3YXBwaW5nIG9uZSBidWcgZm9yIGFub3RoZXI/CgpIYXZlIGFueW9uZSBpbiBwb3Nz
ZXNzaW9uIG9mIERhdmluY2hpIHRlc3RlZCBtb3N0IHJlY2VudCBrZXJuZWwgd2l0aAp0aGlzIHJl
dmVydD8KCj4gPiBEbyBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IHRoYXQgaW4geW91ciBjYXNlIHlv
dSBoYXZlIHR3byBtb2R1bGVzCj4gPiAoZHdjMy1wY2kgYW5kIGV4dGNvbi1pbnRlbC1tcmZsZCkg
aW4gYSBkZWZlcnJlZCBwcm9iZSBsb29wLCBpb3cgYm90aCBvZgo+ID4gdGhlIGRyaXZlcnMgcmV0
dXJucyAtRVBST0JFX0RFRkVSIGFuZCB0aGV5IGp1c3Qgc3Bpbj8KPgo+ID4gSWYgYm90aCBpcyBk
ZWZlcnJpbmcsIGhvdyB0aGlzIHN1cHBvc2VkIHRvIHdvcms/Cj4KPiBJJ20gc3RydWdnbGluZyB0
byBmb2xsb3cgdGhlIG9yaWdpbmFsIGV4cGxhbmF0aW9uIHRvbyA6KAoKU29ycnksIGd1eXMsIEkg
Y29uZnVzZWQgYSBuaXQgbXlzZWxmLiBUaGUgYnVnIGlzIHRoZXJlLCBidXQKZXh4cGxhbmF0aW9u
IGlzIG5vdCBmdWxseSBjb3JyZW50LCBpbmRlZWQuIEknbGwgY29tZSBiYWNrIHdpdGggbW9yZQpk
ZXRhaWxzIGxhdGVyLgo=

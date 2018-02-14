Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] staging: typec: handle vendor defined part and modify drp toggling flow
From: Greg KH <greg@kroah.com>
Message-Id: <20180214153756.GA2393@kroah.com>
Date: Wed, 14 Feb 2018 16:37:56 +0100
To: =?utf-8?B?5p2O5pu45biG?= <leechu729@gmail.com>
Cc: heikki.krogerus@linux.intel.com, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, cy_huang@richtek.com, shufan_lee@richtek.com
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBGZWIgMTQsIDIwMTggYXQgMTA6NDM6NDVQTSArMDgwMCwg5p2O5pu45biGIHdyb3Rl
Ogo+IEhpIEdlcmcsCj4gCj4gCj4gV2hhdCBjaGFuZ2VkIGZyb20gdjE/Cj4gCj4gVGhlIGRpZmYg
YmV0d2VlbiB2MSBhbmQgdjIgaXMgYXMgZm9sbG93aW5nOgoKPHNuaXA+CgpZb3UgbmVlZCB0byBl
eHBsYWluIHdoYXQgY2hhbmdlZCBiZWxvdyB0aGUgLS0tIGxpbmUsIGFzIGlzIGRlc2NyaWJlZCBp
bgpEb2N1bWVudGF0aW9uL1N1Ym1pdHRpbmdQYXRjaGVzLgoKUGxlYXNlIGZpeCB0aGF0IHVwLCBh
bmQgdGhlIHRleHQgZm9yIHlvdXIgbmFtZSwgd2hlbiB5b3UgcmVzZW5kCnZlcnNpb24gMyBvZiB0
aGlzIHBhdGNoLgoKdGhhbmtzLAoKZ3JlZyBrLWgKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBib2R5
IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21v
IGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

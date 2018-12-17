Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,2/2] usb:cdns3 Add Cadence USB3 DRD Driver
From: Pawel Laszczak <pawell@cadence.com>
Message-Id: <BYAPR07MB47097F1DE4D13CB23763A7C8DDBC0@BYAPR07MB4709.namprd07.prod.outlook.com>
Date: Mon, 17 Dec 2018 11:51:50 +0000
To: Felipe Balbi <balbi@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgo+Cj4+Pj4gK3N0YXRpYyBpcnFyZXR1cm5fdCBjZG5zM19kZXZpY2VfaXJxX2hhbmRsZXIo
aW50IGlycSwgdm9pZCAqZGF0YSkKPj4+PiArewo+Pj4+ICsJc3RydWN0IGNkbnMzX2RldmljZSAq
cHJpdl9kZXY7Cj4+Pj4gKwlzdHJ1Y3QgY2RuczMgKmNkbnMgPSBkYXRhOwo+Pj4+ICsJaXJxcmV0
dXJuX3QgcmV0ID0gSVJRX05PTkU7Cj4+Pj4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOwo+Pj4+ICsJ
dTMyIHJlZzsKPj4+PiArCj4+Pj4gKwlwcml2X2RldiA9IGNkbnMtPmdhZGdldF9kZXY7Cj4+Pj4g
KwlzcGluX2xvY2tfaXJxc2F2ZSgmcHJpdl9kZXYtPmxvY2ssIGZsYWdzKTsKPj4+Cj4+PnlvdSdy
ZSBhbHJlYWR5IHJ1bm5pbmcgaW4gaGFyZGlycSBjb250ZXh0LiBXaHkgZG8geW91IG5lZWQgdGhp
cyBsb2NrIGF0Cj4+PmFsbD8gSSB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIHRoZSBoYXJkaXJxIGhh
bmRsZXIgdG8gbWFzayB5b3VyCj4+PmludGVycnVwdHMsIHNvIHRoZXkgZG9uJ3QgZmlyZSBhZ2Fp
biwgdGhlbiB1c2VkIHRoZSB0b3AtaGFsZiAoc29mdGlycSkKPj4+aGFuZGxlciB0byBhY3R1YWxs
eSBoYW5kbGUgdGhlIGludGVycnVwdHMuCj4+Cj4+IFllcywgc3Bpbl9sb2NrX2lycXNhdmUgaXMg
bm90IG5lY2Vzc2FyeSBoZXJlLgo+Pgo+PiBEbyB5b3UgbWVhbiByZXBsYWNpbmcgZGV2bV9yZXF1
ZXN0X2lycSB3aXRoIGEgcmVxdWVzdF90aHJlYWRlZF9pcnEgPwo+PiBJIGhhdmUgc2luZ2xlIGlu
dGVycnVwdCBsaW5lIHNoYXJlZCBiZXR3ZWVuICBIb3N0LCBEcml2ZXIsIERSRC9PVEcuCj4+IEkn
bSBub3Qgc3VyZSBpZiBpdCB3aWxsIHdvcmsgbW9yZSBlZmZpY2llbnRseS4KPgo+VGhlIHdob2xl
IGlkZWEgZm9yIHJ1bm5pbmcgdmVyeSBsaXR0bGUgaW4gaGFyZGlycSBjb250ZXh0IGlzIHRvIGdp
dmUgdGhlCj5zY2hlZHVsZXIgYSBjaGFuY2UgdG8gZGVjaWRlIHdoYXQgc2hvdWxkIHJ1bi4gVGhp
cyBpcyBpbXBvcnRhbnQgdG8KPnJlZHVjZSBsYXRlbmN5IHdoZW4gcnVubmluZyB3aXRoIFJUIHBh
dGNoc2V0IGFwcGxpZWQsIGZvcgo+ZXhhbXBsZS4gSG93ZXZlciwgSSdsbCBnaXZlIHlvdSB0aGF0
LCBpdCdzIGEgbWlub3IgcmVxdWlyZW1lbnQuIEl0J3MKPmp1c3QgdGhhdCwgdG8gbWUsIGl0J3Mg
YSBzbWFsbCBkZXRhaWwgdGhhdCdzIGVhc3kgdG8gaW1wbGVtZW50LgoKSSB3aWxsIGRvIGl0IGlu
IFBBVENIIHYyIG9yIFBBVENIIHYzLiAgCkkgbmVlZCB0byBwb3N0IG5leHQgdmVyc2lvbiBiZWZv
cmUgMjQgb2YgRGVjZW1iZXIsIHNvIGlmIEkgY2FuIGRvIGl0CmJlZm9yZSB0aGlzIGRhdGUgdGhl
biBpdCB3aWxsIGJlIGluIFBBVENIIHYyLiAKClRoYW5rcyAKUGF3ZWwK

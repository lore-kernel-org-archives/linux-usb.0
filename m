Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] usb: gadget: f_fs: don't free buffer prematurely
From: fei.yang@intel.com
Message-Id: <02E7334B1630744CBDC55DA8586225837F7FC660@ORSMSX102.amr.corp.intel.com>
Date: Fri, 22 Mar 2019 06:12:11 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "balbi@kernel.org" <balbi@kernel.org>, "andrzej.p@collabora.com" <andrzej.p@collabora.com>, "plr.vincent@gmail.com" <plr.vincent@gmail.com>, "Shen, JingX" <jingx.shen@intel.com>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

Pj4gVGhlIGZvbGxvd2luZyBrZXJuZWwgcGFuaWMgaGFwcGVucyBkdWUgdG8gdGhlIGlvX2RhdGEg
YnVmZmVyIGdldHMgCj4+IGRlYWxsb2NhdGVkIGJlZm9yZSB0aGUgYXN5bmMgaW8gaXMgY29tcGxl
dGVkLiBBZGQgYSBjaGVjayBmb3IgdGhlIGNhc2UgCj4+IHdoZXJlIGlvX2RhdGEgYnVmZmVyIHNo
b3VsZCBiZSBkZWFsbG9jYXRlZCBieSBmZnNfdXNlcl9jb3B5X3dvcmtlci4KPj4gCj4+IFsgICA0
MS42NjMzMzRdIEJVRzogdW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGF0IDAwMDAwMDAwMDAwMDAwNDgKPj4gCj4+IEZpeGVzOiA3NzJhN2E3MjRmNiAoInVz
YjogZ2FkZ2V0OiBmX2ZzOiBBbGxvdyBzY2F0dGVyLWdhdGhlciBidWZmZXJzIikKPj4gU2lnbmVk
LW9mZi1ieTogRmVpIFlhbmcgPGZlaS55YW5nQGludGVsLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IE1h
bnUgR2F1dGFtIDxtZ2F1dGFtQGNvZGVhdXJvcmEub3JnPgo+PiBUZXN0ZWQtYnk6IEpvaG4gU3R1
bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gdjI6IGFkZCB0YWc6ICJGaXhl
czogNzcyYTdhNzI0ZjYgLi4uLi4uIiwgUmV2aWV3ZWQtYnkgYW5kIFRlc3RlZC1ieS4KPj4gdjM6
IGNoZWNrIGRhdGEgZm9yIE5VTEwgaW5zdGVhZCBvZiAicmV0ID09IC1FSU9DQlFVRVVFRCIsIHdo
aWNoIHdvdWxkIGJlIHNhZmVyCj4+ICAgICBhbmQga2VlcCB0aGUgb3JpZ2luYWwgbG9naWMgaW50
YWN0Lgo+IAo+IElmIGl0ICJmaXhlcyIgYSBwcm9ibGVtIGluIDUuMCwgd2Ugc2hvdWxkIGFkZCBh
Ogo+IAlDYzogc3RhYmxlIDxzdGFibGVAdmdlci5rZXJuZWwub3JnPgo+IHRvIGl0IGFzIHdlbGwu
ClNlbnQgW1BBVENIIHY0XSB3aXRoIENjOiBzdGFibGUKCj4gdGhhbmtzLAo+IAo+IGdyZWcgay1o
Cg==

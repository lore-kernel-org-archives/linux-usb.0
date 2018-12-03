Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v1,09/12] usb: dwc3: Registering a role switch in the DRD code.
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20181203124325.GF24338@kuha.fi.intel.com>
Date: Mon, 3 Dec 2018 14:43:25 +0200
To: Yu Chen <chenyu56@huawei.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-ID: <linux-usb.vger.kernel.org>

T24gTW9uLCBEZWMgMDMsIDIwMTggYXQgMTE6NDU6MTJBTSArMDgwMCwgWXUgQ2hlbiB3cm90ZToK
PiBUaGUgVHlwZS1DIGRyaXZlcnMgdXNlIFVTQiByb2xlIHN3aXRjaCBBUEkgdG8gaW5mb3JtIHRo
ZQo+IHN5c3RlbSBhYm91dCB0aGUgbmVnb3RpYXRlZCBkYXRhIHJvbGUsIHNvIHJlZ2lzdGVyaW5n
IGEgcm9sZQo+IHN3aXRjaCBpbiB0aGUgRFJEIGNvZGUgaW4gb3JkZXIgdG8gc3VwcG9ydCBwbGF0
Zm9ybXMgd2l0aAo+IFVTQiBUeXBlLUMgY29ubmVjdG9ycy4KPiAKPiBDYzogRmVsaXBlIEJhbGJp
IDxiYWxiaUBrZXJuZWwub3JnPgo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFl1IENoZW4gPGNoZW55dTU2QGh1YXdl
aS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNA
bGludXguaW50ZWwuY29tPgo+IAo+IC0tCj4gdjA6Cj4gVGhlIHBhdGNoIGlzIHByb3ZpZGVkIGJ5
IEhlaWtraSBLcm9nZXJ1cy4gSSBtb2RpZmllZCBhbmQgdGVzdCBpdAo+IG9uIEhpa2V5OTYwIHBs
YXRmb3JtLgoKRWl0aGVyIG1ha2UgbWUgYXMgdGhlIG9yaWdpbmFsIGF1dGhvciBieSBhZGRpbmcg
YSAiZnJvbSIgbGluZSB3aXRoIG15CmFkZHJlc3MsIG9yIGp1c3QgdXNlIHRoYXQgIlN1Z2dlc3Rl
ZC1ieSIgdGFnIHdpdGggdGhpcyBwYXRjaCBhcyB3ZWxsLgoKCnRoYW5rcywK

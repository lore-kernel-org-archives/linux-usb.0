Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4.4,13/49] usb: dwc2: Fix UDC state tracking
From: "Levin, Alexander" <alexander.levin@verizon.com>
Message-Id: <20171212002742.7tcx6fztf2wx45te@sasha-lappy>
Date: Tue, 12 Dec 2017 00:27:44 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ben Hutchings <ben.hutchings@codethink.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Wei Xu <xuwei5@hisilicon.com>, Guodong Xu <guodong.xu@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, YongQin Liu <yongqin.liu@linaro.org>, John Youn <johnyoun@synopsys.com>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, Douglas Anderson <dianders@chromium.org>, Chen Yu <chenyu56@huawei.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, John Stultz <john.stultz@linaro.org>
List-ID: <linux-usb.vger.kernel.org>

T24gU2F0LCBEZWMgMDksIDIwMTcgYXQgMDY6MTI6NTZQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+T24gRnJpLCBEZWMgMDgsIDIwMTcgYXQgMDM6Mzc6MTdBTSArMDAwMCwgQmVu
IEh1dGNoaW5ncyB3cm90ZToKPj4gT24gVGh1LCAyMDE3LTEyLTA3IGF0IDE0OjA3ICswMTAwLCBH
cmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4+ID4gNC40LXN0YWJsZSByZXZpZXcgcGF0Y2guwqDC
oElmIGFueW9uZSBoYXMgYW55IG9iamVjdGlvbnMsIHBsZWFzZSBsZXQgbWUKPj4gPiBrbm93Lgo+
PiA+Cj4+ID4gLS0tLS0tLS0tLS0tLS0tLS0tCj4+ID4KPj4gPiBGcm9tOiBKb2huIFN0dWx0eiA8
am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPj4gPgo+PiA+Cj4+ID4gWyBVcHN0cmVhbSBjb21taXQg
Y2UyYjIxYTRlNWNlMDQyYzBhNDJjOWRiOGZhOWUwZjg0OTQyN2Q1ZSBdCj4+ID4KPj4gPiBJdCBo
YXMgYmVlbiBub3RpY2VkIHRoYXQgdGhlIGR3YzIgdWRjIHN0YXRlIHJlcG9ydGluZyBkb2Vzbid0
Cj4+ID4gc2VlbSB0byB3b3JrIChhdCBsZWFzdCBvbiBIaUtleSBib2FyZHMpLiBXaGVyZSBhZnRl
ciB0aGUgaW5pdGlhbAo+PiA+IHNldHVwLCB0aGUgc3lzZnMgL3N5cy9jbGFzcy91ZGMvZjcyYzAw
MDAudXNiL3N0YXRlIGZpbGUgd291bGQKPj4gPiByZXBvcnQgImNvbmZpZ3VyZWQiIG5vIG1hdHRl
ciB0aGUgc3RhdGUgb2YgdGhlIE9URyBwb3J0Lgo+PiA+Cj4+ID4gVGhpcyBwYXRjaCBhZGRzIGEg
Y2FsbCBzbyB0aGF0IHdlIHJlcG9ydCB0byB0aGUgVURDIGxheWVyIHdoZW4KPj4gPiB0aGUgZ2Fk
Z2V0IGRldmljZSBpcyBkaXNjb25uZWN0ZWQuCj4+ID4KPj4gPiBUaGlzIHBhdGNoIGRvZXMgZGVw
ZW5kIG9uIHRoZSBwcmV2aW91cyBwYXRjaCAoInVzYjogZHdjMjoKPj4gPiBJbXByb3ZlIGdhZGdl
dCBzdGF0ZSBkaXNjb25uZWN0aW9uIGhhbmRsaW5nIikgaW4gdGhpcyBwYXRjaCBzZXQKPj4gPiBp
biBvcmRlciB0byBwcm9wZXJseSB3b3JrLgo+Pgo+PiBUaGVuIHlvdSBzaG91bGQgYWRkIHRoYXQg
KGNvbW1pdCBkMjQ3MWQ0YTI0ZGYpLgo+Cj5BaCwgYnV0IHRoYXQgcGF0Y2ggZG9lc24ndCBhcHBs
eSA6KAo+Cj5TbywgSSd2ZSBkcm9wcGVkIHRoaXMgb25lLCBhbmQgdGhlIG9uZSBhZnRlciB0aGlz
IG9uZSAod2hpY2ggZGVwZW5kZWQgb24KPnRoaXMgb25lKSwgc28gYWxsIHNob3VsZCBiZSBiYWNr
IHRvIGhvdyB0aGluZ3Mgd2VyZS4KPgo+U2FzaGEsIGNhbiB5b3UgZml4IHRoaXMgdXAgYW5kIHN1
Ym1pdCBhbGwgMyBmb3IgdGhlIDQuNCwgNC45IGFuZCA0LjE0Cj50cmVlcyBzb21ldGltZSBpbiB0
aGUgZnV0dXJlPwoKU3VyZSwgSSdsbCByZXNlbmQgdGhpcy4K

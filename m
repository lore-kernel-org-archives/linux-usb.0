Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4.4,068/134] usb: dwc2: Make sure we disconnect the gadget state
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180403174156.GC32709@kroah.com>
Date: Tue, 3 Apr 2018 19:41:56 +0200
To: Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>, Guodong Xu <guodong.xu@linaro.org>, Amit Pundir <amit.pundir@linaro.org>, Rob Herring <robh+dt@kernel.org>, John Youn <johnyoun@synopsys.com>, Douglas Anderson <dianders@chromium.org>, Chen Yu <chenyu56@huawei.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org, John Stultz <john.stultz@linaro.org>, Sasha Levin <alexander.levin@microsoft.com>
List-ID: <linux-usb.vger.kernel.org>

T24gU3VuLCBBcHIgMDEsIDIwMTggYXQgMDQ6NDk6NDVQTSArMDEwMCwgQmVuIEh1dGNoaW5ncyB3
cm90ZToKPiBPbiBNb24sIDIwMTgtMDMtMTkgYXQgMTk6MDUgKzAxMDAsIEdyZWcgS3JvYWgtSGFy
dG1hbiB3cm90ZToKPiA+IDQuNC1zdGFibGUgcmV2aWV3IHBhdGNoLsKgwqBJZiBhbnlvbmUgaGFz
IGFueSBvYmplY3Rpb25zLCBwbGVhc2UgbGV0IG1lIGtub3cuCj4gPiAKPiA+IC0tLS0tLS0tLS0t
LS0tLS0tLQo+ID4gCj4gPiBGcm9tOiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9y
Zz4KPiA+IAo+ID4gCj4gPiBbIFVwc3RyZWFtIGNvbW1pdCBkYWQzZjc5M2YyMGZiYjVjMGMzNDJm
MGY1YTBiZGY2OWE0ZDc2MDg5IF0KPiAKPiBNYXliZSB3ZSBzaG91bGQgYWxzbyBoYXZlOgo+IAo+
IGNvbW1pdCBkMjQ3MWQ0YTI0ZGZiZmY1ZTQ2M2QzODJlMmM2ZmVjN2Q3ZTI1YTA5Cj4gQXV0aG9y
OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGluYXJvLm9yZz4KPiBEYXRlOsKgwqDCoE1vbiBP
Y3QgMjMgMTQ6MzI6NDggMjAxNyAtMDcwMAo+IAo+IMKgwqDCoMKgdXNiOiBkd2MyOiBJbXByb3Zl
IGdhZGdldCBzdGF0ZSBkaXNjb25uZWN0aW9uIGhhbmRsaW5nCgpHb29kIGlkZWEsIG5vdyBxdWV1
ZWQgdXAuCgpncmVnIGstaAotLS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQg
dGhlIGxpbmUgInVuc3Vic2NyaWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdl
IHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0
cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,18/19] net: usb: aqc111: Implement get/set_link_ksettings callbacks
From: Oliver Neukum <oneukum@suse.com>
Message-Id: <1539008296.10342.25.camel@suse.com>
Date: Mon, 08 Oct 2018 16:18:16 +0200
To: Igor Russkikh <Igor.Russkikh@aquantia.com>, "David S . Miller" <davem@davemloft.net>
Cc: Dmitry Bezrukov <Dmitry.Bezrukov@aquantia.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gRnIsIDIwMTgtMTAtMDUgYXQgMTA6MjUgKzAwMDAsIElnb3IgUnVzc2tpa2ggd3JvdGU6Cj4g
RnJvbTogRG1pdHJ5IEJlenJ1a292IDxkbWl0cnkuYmV6cnVrb3ZAYXF1YW50aWEuY29tPgo+IAo+
ICtzdGF0aWMgaW50IGFxYzExMV9nZXRfbGlua19rc2V0dGluZ3Moc3RydWN0IG5ldF9kZXZpY2Ug
Km5ldCwKPiArCQkJCSAgICAgc3RydWN0IGV0aHRvb2xfbGlua19rc2V0dGluZ3MgKmVsaykKPiAr
ewo+ICsJc3RydWN0IHVzYm5ldCAqZGV2ID0gbmV0ZGV2X3ByaXYobmV0KTsKPiArCWVudW0gdXNi
X2RldmljZV9zcGVlZCB1c2Jfc3BlZWQgPSBkZXYtPnVkZXYtPnNwZWVkOwo+ICsJc3RydWN0IGFx
YzExMV9kYXRhICphcWMxMTFfZGF0YSA9IChzdHJ1Y3QgYXFjMTExX2RhdGEgKilkZXYtPmRhdGFb
MF07Cj4gKwl1MzIgc3BlZWQgPSBTUEVFRF9VTktOT1dOOwo+ICsKPiArCWV0aHRvb2xfbGlua19r
c2V0dGluZ3NfemVyb19saW5rX21vZGUoZWxrLCBzdXBwb3J0ZWQpOwo+ICsJZXRodG9vbF9saW5r
X2tzZXR0aW5nc19hZGRfbGlua19tb2RlKGVsaywgc3VwcG9ydGVkLAo+ICsJCQkJCSAgICAgMTAw
YmFzZVRfRnVsbCk7Cj4gKwlldGh0b29sX2xpbmtfa3NldHRpbmdzX2FkZF9saW5rX21vZGUoZWxr
LCBzdXBwb3J0ZWQsCj4gKwkJCQkJICAgICAxMDAwYmFzZVRfRnVsbCk7Cj4gKwlpZiAodXNiX3Nw
ZWVkID09IFVTQl9TUEVFRF9TVVBFUikgewoKQW5kIFNVUEVSX1BMVVM/CgoJUmVnYXJkcwoJCU9s
aXZlcgo=

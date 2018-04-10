Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usbip: usbip_host: fix to hold parent lock for device_attach() calls
From: Sasha Levin <Alexander.Levin@microsoft.com>
Message-Id: <DM5PR2101MB103278A56AE5581E93D18A9FFBBE0@DM5PR2101MB1032.namprd21.prod.outlook.com>
Date: Tue, 10 Apr 2018 13:50:01 +0000
To: Sasha Levin <Alexander.Levin@microsoft.com>, Shuah Khan <shuahkh@osg.samsung.com>, "valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>, "shuah@kernel.org" <shuah@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, stable <stable@vger.kernel.org>"stable@vger.kernel.org" <stable@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlzIGNvbW1pdCBoYXMgYmVlbiBw
cm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhIC1zdGFibGUgdGFnLgpUaGUgc3RhYmxlIHRh
ZyBpbmRpY2F0ZXMgdGhhdCBpdCdzIHJlbGV2YW50IGZvciB0aGUgZm9sbG93aW5nIHRyZWVzOiBh
bGwKClRoZSBib3QgaGFzIGFsc28gZGV0ZXJtaW5lZCBpdCdzIHByb2JhYmx5IGEgYnVnIGZpeGlu
ZyBwYXRjaC4gKHNjb3JlOiA2Ny41OTM1KQoKVGhlIGJvdCBoYXMgdGVzdGVkIHRoZSBmb2xsb3dp
bmcgdHJlZXM6IHY0LjE2LjEsIHY0LjE1LjE2LCB2NC4xNC4zMywgdjQuOS45MywgdjQuNC4xMjcu
Cgp2NC4xNi4xOiBCdWlsZCBPSyEKdjQuMTUuMTY6IEJ1aWxkIE9LIQp2NC4xNC4zMzogQnVpbGQg
T0shCnY0LjkuOTM6IEJ1aWxkIE9LIQp2NC40LjEyNzogQnVpbGQgT0shCgpQbGVhc2UgbGV0IHVz
IGtub3cgaWYgeW91J2QgbGlrZSB0byBoYXZlIHRoaXMgcGF0Y2ggaW5jbHVkZWQgaW4gYSBzdGFi
bGUgdHJlZS4KLS0tClRoYW5rcywKU2FzaGEtLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlz
dDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBh
IG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZv
IGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

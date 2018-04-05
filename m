Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usbip: vhci_hcd: Fix usb device and sockfd leaks
From: Shuah Khan <shuahkh@osg.samsung.com>
Message-Id: <8ecab0f4-44e6-2e06-9074-f32fcc20bac9@osg.samsung.com>
Date: Thu, 5 Apr 2018 10:50:40 -0600
To: Sasha Levin <Alexander.Levin@microsoft.com>, "valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>, "shuah@kernel.org" <shuah@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>
List-ID: <linux-usb.vger.kernel.org>

T24gMDQvMDUvMjAxOCAxMDo0MiBBTSwgU2FzaGEgTGV2aW4gd3JvdGU6Cj4gSGkuCj4gCj4gW1Ro
aXMgaXMgYW4gYXV0b21hdGVkIGVtYWlsXQo+IAo+IFRoaXMgY29tbWl0IGhhcyBiZWVuIHByb2Nl
c3NlZCBieSB0aGUgLXN0YWJsZSBoZWxwZXIgYm90IGFuZCBkZXRlcm1pbmVkCj4gdG8gYmUgYSBo
aWdoIHByb2JhYmlsaXR5IGNhbmRpZGF0ZSBmb3IgLXN0YWJsZSB0cmVlcy4gKHNjb3JlOiAxMC42
MTAzKQo+IAo+IFRoZSBib3QgaGFzIHRlc3RlZCB0aGUgZm9sbG93aW5nIHRyZWVzOiB2NC4xNS4x
NSwgdjQuMTQuMzIsIHY0LjkuOTIsIHY0LjQuMTI2LCAKPiAKPiB2NC4xNS4xNTogQnVpbGQgT0sh
Cj4gdjQuMTQuMzI6IEJ1aWxkIE9LIQo+IHY0LjkuOTI6IEJ1aWxkIE9LIQo+IHY0LjQuMTI2OiBG
YWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxlIGRlcGVuZGVuY2llczoKPiAgICAgZjBmMWJlYjhmMTU1
ICgidXNiaXA6IHZoY2lfaGNkOiBGaXggdXNiIGRldmljZSBhbmQgc29ja2ZkIGxlYWtzIikKPiAK
PiAKClRoYW5rcy4gSSB3aWxsIHNlbmQgcGF0Y2ggZm9yIHY0LjQuMTI2IHRoYXQgeW91IGNhbiBh
cHBseSBmb3IgdGhpcyBmaXguCgp0aGFua3MsCi0tIFNodWFoCi0tLQpUbyB1bnN1YnNjcmliZSBm
cm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0
aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1h
am9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0
bWwK

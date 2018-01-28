Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [4.9] usbip: vhci_hcd: clear just the USB_PORT_STAT_POWER bit
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180128121425.GB26619@kroah.com>
Date: Sun, 28 Jan 2018 13:14:25 +0100
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMTE6NTQ6MzVBTSAtMDcwMCwgU2h1YWggS2hhbiB3cm90
ZToKPiBVcHN0cmVhbSBjb21taXQgMWM5ZGU1YmY0Mjg2ICgidXNiaXA6IHZoY2ktaGNkOiBBZGQg
VVNCMyBTdXBlclNwZWVkCj4gc3VwcG9ydCIpCgpIbSwgSSB0aGluayB5b3UgaGF2ZSB0aGUgd3Jv
bmcgY29tbWl0IGlkIGhlcmUuCgpJIGRvbid0IHNlZSBhbnkgY29tbWl0IHVwc3RyZWFtIHdpdGgg
dGhlIFN1YmplY3QgeW91IGhhdmUgaGVyZSwgd2hhdCBhcmUKeW91IHJlZmVycmluZyB0bz8KCnRo
YW5rcywKCmdyZWcgay1oCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0
aGUgbGluZSAidW5zdWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2Ug
dG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRw
Oi8vdmdlci5rZXJuZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

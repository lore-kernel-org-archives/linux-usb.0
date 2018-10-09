Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [net-next,01/19] net: usb: aqc111: Driver skeleton for Aquantia AQtion USB to 5GbE
From: =?utf-8?q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Message-Id: <878t379r6c.fsf@miraculix.mork.no>
Date: Tue, 09 Oct 2018 15:37:47 +0200
To: Igor Russkikh <Igor.Russkikh@aquantia.com>
Cc: "David S . Miller" <davem@davemloft.net>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Dmitry Bezrukov <Dmitry.Bezrukov@aquantia.com>
List-ID: <linux-usb.vger.kernel.org>

SWdvciBSdXNza2lraCA8SWdvci5SdXNza2lraEBhcXVhbnRpYS5jb20+IHdyaXRlczoKCj4+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGRyaXZlcl9pbmZvIGFxYzExMV9pbmZvID0gewo+ICsJLmRlc2Ny
aXB0aW9uCT0gIkFxdWFudGlhIEFRdGlvbiBVU0IgdG8gNUdiRSBDb250cm9sbGVyIiwKPiArfTsK
PiArCj4gKyNkZWZpbmUgQVFDMTExX1VTQl9FVEhfREVWKHZpZCwgcGlkLCB0YWJsZSkgXAo+ICsJ
Lm1hdGNoX2ZsYWdzID0gVVNCX0RFVklDRV9JRF9NQVRDSF9ERVZJQ0UgfCBcCj4gKwkJCVVTQl9E
RVZJQ0VfSURfTUFUQ0hfSU5UX0NMQVNTLCBcCj4gKwlVU0JfREVWSUNFKHZpZCwgcGlkKSwgXAo+
ICsJLmJJbnRlcmZhY2VDbGFzcyA9IFVTQl9DTEFTU19WRU5ET1JfU1BFQywgXAo+ICsJLmRyaXZl
cl9pbmZvID0gKHVuc2lnbmVkIGxvbmcpJnRhYmxlLCBcCj4gK30sIFwKPiAreyBcCj4gKwkubWF0
Y2hfZmxhZ3MgPSBVU0JfREVWSUNFX0lEX01BVENIX0RFVklDRSB8IFwKPiArCQkJVVNCX0RFVklD
RV9JRF9NQVRDSF9JTlRfSU5GTywgXAo+ICsJVVNCX0RFVklDRSh2aWQsIHBpZCksIFwKPiArCS5i
SW50ZXJmYWNlQ2xhc3MgPSBVU0JfQ0xBU1NfQ09NTSwgXAo+ICsJLmJJbnRlcmZhY2VTdWJDbGFz
cyA9IFVTQl9DRENfU1VCQ0xBU1NfRVRIRVJORVQsIFwKPiArCS5iSW50ZXJmYWNlUHJvdG9jb2wg
PSBVU0JfQ0RDX1BST1RPX05PTkUKPiArCgpJcyB0aGUgbWlzc2luZyAuZHJpdmVyX2luZm8gZm9y
IHRoZSBDREMgY2xhc3MgaW50ZW50aW9uYWw/ICBJZiBzbywgdGhlbgp3aHkgaW5jbHVkZSBpdCBh
dCBhbGw/CgoKCkJqw7hybgo=

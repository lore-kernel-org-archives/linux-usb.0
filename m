Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [10/19] usbnet: smsc95xx: Replace smsc95xx_mdio_read() with phy_read()
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-Id: <c4e0a30e-06d8-4f41-d315-312a35858357@gmail.com>
Date: Fri, 4 Jan 2019 19:02:09 +0100
To: Marek Vasut <marex@denx.de>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Nisar Sayed <Nisar.Sayed@microchip.com>, Woojung Huh <Woojung.Huh@microchip.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gMDQuMDEuMjAxOSAxNjo1NywgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+IEkgd29uZGVyLCBpZiBJ
IHVzZSB0aGUgcGh5bGliIGZ1bmN0aW9ucyBpbnN0ZWFkIG9mIHRoZSBhZC1ob2Mgb25lcyBpbgo+
PiB0aGUgTUFDIGRyaXZlciwgaXMgdGhlcmUgc3RpbGwgYSBwcm9ibGVtIHdpdGggc3luY2hyb25p
emF0aW9uID8KPiAKPiBZb3Ugd291bGQgbmVlZCB0byBsb29rIGRlZXAgaW50byBwaHlsaWIuIFdo
ZW4gZG9lcyBpdCByZXNldCB0aGUgUEhZPwo+IENvbmZpZ3VyZSBhdXRvLW5lZywgc2V0dXAgaW50
ZXJydXB0cywgZXRjPyBJdCBsb29rcyBsaWtlIGJvdGggYXJlCj4gZ29pbmcgdG8gZG8gdGhpcywg
c28gaSBleHBlY3QgdGhleSBhcmUgZ29pbmcgdG8gbWVzcyBlYWNoIG90aGVyIHVwLgo+IApNYXJl
aywgSSByZWNlbnRseSB3ZW50IHRocm91Z2ggdGhpcyBleGVyY2lzZSB3aGVuIHN3aXRjaGluZyBy
ODE2OQpkcml2ZXIgdG8gcGh5bGliLiBBcyBBbmRyZXcgZXhwbGFpbmVkOgpGaXJzdCBhZGQgbmVl
ZGVkIGZ1bmN0aW9uYWxpdHkgdG8gdGhlIHJlc3BlY3RpdmUgUEhZIGRyaXZlcihzKSwKdGhlbiB5
b3UgY2FuIHN3aXRjaCB0aGUgbmV0d29yayBkcml2ZXIuCllvdSBjYW4gbG9vayBhdCBmMWU5MTFk
NWQwZGYgKCJyODE2OTogYWRkIGJhc2ljIHBoeWxpYiBzdXBwb3J0IikKcGx1cyByZWxhdGVkIGNo
YW5nZXMsIGFuZCB0byB3aGF0IHdhcyBhZGRlZCB0byB0aGUgUmVhbHRlayBQSFkKZHJpdmVyIG1v
ZHVsZS4K

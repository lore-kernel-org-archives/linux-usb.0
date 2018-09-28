Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] usb: hub: try old enumeration scheme first for high speed devices
From: "Zengtao \(B\)" <prime.zeng@hisilicon.com>
Message-Id: <678F3D1BB717D949B966B68EAEB446ED0CA25F3F@dggemm526-mbx.china.huawei.com>
Date: Fri, 28 Sep 2018 03:24:31 +0000
To: Greg KH <gregkh@linuxfoundation.org>, Roger Quadros <rogerq@ti.com>
Cc: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>, "drinkcat@chromium.org" <drinkcat@chromium.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "drake@endlessm.com" <drake@endlessm.com>, "ravisadineni@chromium.org" <ravisadineni@chromium.org>, "joe@perches.com" <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Marc Zyngier <marc.zyngier@arm.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Thymo van Beers <thymovanbeers@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Rientjes <rientjes@google.com>, Mike Looijmans <mike.looijmans@topic.nl>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgZ3JlZzoNCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNlLCBJIGhhdmUgYXBwbGllZCB0
aGUgdGFncyBhbmQgcmVzZW5kLCBwbGVhc2UgcmVjZWl2ZSBpdCBhbmQgY2hlY2sNCg0KVGh4DQpa
ZW5ndGFvIA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBHcmVnIEtIIFtt
YWlsdG86Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmddDQo+U2VudDogVGh1cnNkYXksIFNlcHRl
bWJlciAyMCwgMjAxOCA2OjM4IFBNDQo+VG86IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUB0aS5jb20+
DQo+Q2M6IFplbmd0YW8gKEIpIDxwcmltZS56ZW5nQGhpc2lsaWNvbi5jb20+OyBzdGVybkByb3ds
YW5kLmhhcnZhcmQuZWR1Ow0KPm1hdGhpYXMubnltYW5AbGludXguaW50ZWwuY29tOyBkcmlua2Nh
dEBjaHJvbWl1bS5vcmc7DQo+ZmVsaXBlLmJhbGJpQGxpbnV4LmludGVsLmNvbTsgZHJha2VAZW5k
bGVzc20uY29tOw0KPnJhdmlzYWRpbmVuaUBjaHJvbWl1bS5vcmc7IGpvZUBwZXJjaGVzLmNvbTsg
Sm9uYXRoYW4gQ29yYmV0DQo+PGNvcmJldEBsd24ubmV0PjsgVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+OyBJbmdvIE1vbG5hcg0KPjxtaW5nb0BrZXJuZWwub3JnPjsgUmFmYWVs
IEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50ZWwuY29tPjsNCj5NYXJjIFp5bmdpZXIg
PG1hcmMuenluZ2llckBhcm0uY29tPjsgS2FpLUhlbmcgRmVuZw0KPjxrYWkuaGVuZy5mZW5nQGNh
bm9uaWNhbC5jb20+OyBUaHltbyB2YW4gQmVlcnMNCj48dGh5bW92YW5iZWVyc0BnbWFpbC5jb20+
OyBGcmVkZXJpYyBXZWlzYmVja2VyDQo+PGZyZWRlcmljQGtlcm5lbC5vcmc+OyBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Ow0KPkRhdmlkIFJpZW50amVzIDxy
aWVudGplc0Bnb29nbGUuY29tPjsgTWlrZSBMb29pam1hbnMNCj48bWlrZS5sb29pam1hbnNAdG9w
aWMubmw+OyBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnOw0KPmxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENI
IHYzXSB1c2I6IGh1YjogdHJ5IG9sZCBlbnVtZXJhdGlvbiBzY2hlbWUgZmlyc3QgZm9yDQo+aGln
aCBzcGVlZCBkZXZpY2VzDQo+DQo+T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMDk6NTU6NDlBTSAr
MDMwMCwgUm9nZXIgUXVhZHJvcyB3cm90ZToNCj4+IE9uIDIwLzA4LzE4IDEzOjA0LCBaZW5nIFRh
byB3cm90ZToNCj4+ID4gVGhlIG5ldyBzY2hlbWUgaXMgcmVxdWlyZWQganVzdCB0byBzdXBwb3J0
IGxlZ2FjeSBsb3cgYW5kIGZ1bGwtc3BlZWQNCj4+ID4gZGV2aWNlcy4gRm9yIGhpZ2ggc3BlZWQg
ZGV2aWNlcywgaXQgd2lsbCBzbG93ZXIgdGhlIGVudW1lcmF0aW9uIHNwZWVkLg0KPj4gPiBTbyBp
biB0aGlzIHBhdGNoIHdlIHRyeSB0aGUgIm9sZCIgZW51bWVyYXRpb24gc2NoZW1lIGZpcnN0IGZv
ciBoaWdoDQo+PiA+IHNwZWVkIGRldmljZXMsIGFuZCB0aGlzIGlzIHdoYXQgV2luZG93cyBkb2Vz
IHNpbmNlIFdpbmRvd3MgOC4NCj4+ID4NCj4+ID4gU2lnbmVkLW9mZi1ieTogWmVuZyBUYW8gPHBy
aW1lLnplbmdAaGlzaWxpY29uLmNvbT4NCj4+DQo+PiBZb3UgbmVlZCB0byBhZGQgQWxhbidzIEFj
ayBoZXJlLiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRvIHJlc2VuZA0KPnRob3VnaC4NCj4+DQo+
PiBSZXZpZXdlZC1ieTogUm9nZXIgUXVhZHJvcyA8cm9nZXJxQHRpLmNvbT4NCj4NCj5QbGVhc2Ug
cmVzZW5kLCBJIG5lZWQgaGlzIGFjayBoZXJlIDopDQo+DQo+dGhhbmtzLA0KPg0KPmdyZWcgay1o
Cg==

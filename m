Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2,4/6] usb: roles: add API to get usb_role_switch by node
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20190315115854.GJ7752@kuha.fi.intel.com>
Date: Fri, 15 Mar 2019 13:58:54 +0200
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Li Jun <jun.li@nxp.com>, Badhri Jagan Sridharan <badhri@google.com>, Min Guo <min.guo@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDU6MTM6MjRQTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdy
b3RlOgo+IEkgZW5jb3VudGVyIGEgYnVpbGQgZXJyb3Igd2hlbiBDT05GSUdfVVNCX1JPTEVfU1dJ
VENIIGlzIG5vdCBlbmFibGVkLAo+IAo+IGRyaXZlcnMvdXNiL210dTMvbXR1M19kci5vOiBJbiBm
dW5jdGlvbiBgc3N1c2Jfcm9sZV9zd19yZWdpc3Rlcic6Cj4gLi9kcml2ZXJzL3VzYi9tdHUzL210
dTNfZHIuYzo0NjA6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8KPiBgdXNiX3JvbGVfc3dpdGNoX3Jl
Z2lzdGVyJwo+IGRyaXZlcnMvdXNiL210dTMvbXR1M19kci5vOiBJbiBmdW5jdGlvbiBgc3N1c2Jf
b3RnX3N3aXRjaF9leGl0JzoKPiAuL2RyaXZlcnMvdXNiL210dTMvbXR1M19kci5jOjQ5MTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0bwo+IGB1c2Jfcm9sZV9zd2l0Y2hfdW5yZWdpc3RlcicKPiAKPiB0
aGUgZm9sbG93aW5nIHBhdGNoIGhhcyBmaXhlZCB0aGUgaXNzdWUsIGJ1dCBzZWVtcyBub3QgZ2V0
IGludG8ga2VybmVsLAo+IFt2MywwOC8xMl0gdXNiOiByb2xlczogQWRkIHVzYiByb2xlIHN3aXRj
aCBub3RpZmllci4KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwODM2NTI1
Lwo+IAo+IFdoYXQgc2hvdWxkIEkgZG8gaWYgSSBhZGQgYSBuZXcgQVBJPyBUaGFua3MKClNvIGlm
IHlvdSBhcmUgYXNraW5nIHNob3VsZCB5b3Ugc3VwcGx5IGR1bW15IGZ1bmN0aW9ucyBmb3IgdGhl
IG5ldyBBUEksCnRoZW4gSSB3b3VsZCBqdXN0IHNheSB0aGF0IGlmIHlvdSBkbyBzbywgeW91IG5l
ZWQgdG8gcHJlcGFyZSB0aGVzZQpwYXRjaGVzIG9uIHRvcCBvZiB0aGF0IHNlcmllcyBmcm9tIFl1
IENoZW4uIEluIGdlbmVyYWwgSSdtIG5vdCBzdXJlIHdlCm5lZWQgZHVtbXkgZnVuY3Rpb25zIHdp
dGggdGhpcyBBUEkuCgpIYW5zLCBjb21tZW50cz8KCgp0aGFua3MsCg==

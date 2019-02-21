Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4,6/6] usb:cdns3 Fix for stuck packets in on-chip OUT buffer.
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Message-Id: <87va1dbokp.fsf@linux.intel.com>
Date: Thu, 21 Feb 2019 09:14:30 +0200
To: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgoocGxlYXNlIGJyZWFrIHlvdXIgZW1haWxzIGF0IDgwLWNvbHVtbnMpCgpQYXdlbCBMYXN6
Y3phayA8cGF3ZWxsQGNhZGVuY2UuY29tPiB3cml0ZXM6Cj4+PiBPbmUgbW9yZSB0aGluZy4gV29y
a2Fyb3VuZCBoYXMgaW1wbGVtZW50ZWQgYWxnb3JpdGhtIHRoYXQgZGVjaWRlIGZvciB3aGljaAo+
Pj4gZW5kcG9pbnQgaXQgc2hvdWxkIGJlIGVuYWJsZWQuICBlLmcgZm9yIGNvbXBvc2l0ZSBkZXZp
Y2UgTVNDK05DTStBQ00gaXQKPj4+IHNob3VsZCB3b3JrIG9ubHkgZm9yIEFDTSBPVVQgZW5kcG9p
bnQuCj4+Pgo+Pgo+PklmIEFDTSBkcml2ZXIgZGlkbid0IHF1ZXVlIHRoZSByZXF1ZXN0IGZvciBB
Q00gT1VUIGVuZHBvaW50LCB3aHkgZG9lcyB0aGUKPj5jb250cm9sbGVyIGFjY2VwdCB0aGUgZGF0
YSBhdCBhbGw/Cj4+Cj4+SSBkaWRuJ3QgdW5kZXJzdGFuZCB3aHkgd2UgbmVlZCBhIHdvcmthcm91
bmQgZm9yIHRoaXMuIEl0IHNob3VsZCBiZSBzdGFuZGFyZAo+PmJlaGF2aW91ciB0byBOQUsgZGF0
YSBpZiBmdW5jdGlvbiBkcml2ZXIgZGlkbid0IHJlcXVlc3QgZm9yIGFsbCBlbmRwb2ludHMuCj4K
PiBZZXMsIEkgYWdyZWUgd2l0aCB5b3UuIENvbnRyb2xsZXIgc2hvdWxkbuKAmXQgYWNjZXB0IHN1
Y2ggcGFja2V0LiBBcyBJIGtub3cgdGhpcwo+IGJlaGF2aW9yIHdpbGwgYmUgZml4ZWQgaW4gUlRM
Lgo+Cj4gQnV0IEkgYXNzdW1lIHRoYXQgc29tZSBvbGRlciB2ZXJzaW9uIG9mIHRoaXMgY29udHJv
bGxlciBhcmUgb25lIHRoZSBtYXJrZXQsCj4gYW5kIGRyaXZlciBzaG91bGQgd29yayBjb3JyZWN0
IHdpdGggdGhlbS4KPgo+IEluIHRoZSBmZWF0dXJlIHRoaXMgd29ya2Fyb3VuZCBjYW4gYmUgbGlt
aXRlZCBvbmx5IHRvIHNlbGVjdGVkIGNvbnRyb2xsZXJzLgo+Cj4gRXZlbiBub3cgSSBhc3N1bWUg
dGhhdCBpdCBjYW4gYmUgZW5hYmxlZC9kaXNhYmxlZCBieSBtb2R1bGUgcGFyYW1ldGVyLgoKbm8g
bW9kdWxlIHBhcmFtZXRlcnMsIHBsZWFzZS4gVXNlIHJldmlzaW9uIGRldGVjdGlvbiBpbiBydW50
aW1lLgo=

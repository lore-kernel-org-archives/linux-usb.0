Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/6] usb:common Separated decoding functions from dwc3 driver.
From: Pawel Laszczak <pawell@cadence.com>
Message-Id: <BYAPR07MB4709469C2D0EBC2D3D7DDF1ADD640@BYAPR07MB4709.namprd07.prod.outlook.com>
Date: Mon, 11 Feb 2019 13:30:41 +0000
To: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

Pgo+UGF3ZWwgTGFzemN6YWsgPHBhd2VsbEBjYWRlbmNlLmNvbT4gd3JpdGVzOgo+Pj4+PiArLyoq
Cj4+Pj4+ICsgKiB1c2JfZGVjb2RlX2N0cmwgLSBSZXR1cm5zIGh1bWFuIHJlYWRhYmxlIHJlcHJl
c2VudGF0aW9uIG9mIGNvbnRyb2wgcmVxdWVzdC4KPj4+Pj4gKyAqIEBzdHI6IGJ1ZmZlciB0byBy
ZXR1cm4gYSBodW1hbi1yZWFkYWJsZSByZXByZXNlbnRhdGlvbiBvZiBjb250cm9sIHJlcXVlc3Qu
Cj4+Pj4+ICsgKiAgICAgICBUaGlzIGJ1ZmZlciBzaG91bGQgaGF2ZSBhYm91dCAyMDAgYnl0ZXMu
Cj4+Pj4KPj4+PiAiYWJvdXQgMjAwIGJ5dGVzIiBpcyBub3QgdmVyeSBzcGVjaWZpYy4KPj4+Pgo+
Pj4+IFBhc3MgaW4gdGhlIGxlbmd0aCBzbyB3ZSBrbm93IHdlIGRvbid0IG92ZXJmbG93IGl0Lgo+
Pj4KPj4+YWdyZWUuCj4+IEkgYWxzbyBhZ3JlZSBhbmQgSSB3aWxsIGFkZCBzdWNoIHBhcmFtZXRl
ci4KPgo+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYmFs
YmkvdXNiLmdpdC9jb21taXQvP2g9bmV4dCZpZD03NzkwYjM1NTZmY2NjNTU1YWU0MjJmMTU3NmU5
N2JmMzRjOGFiOGI2CgpDb29sIDopLiBUaGFua3MuCi0tLQpQYXdlbAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/6] usb:common Separated decoding functions from dwc3 driver.
From: Felipe Balbi <felipe.balbi@linux.intel.com>
Message-Id: <87sgwu5unv.fsf@linux.intel.com>
Date: Mon, 11 Feb 2019 15:20:04 +0200
To: Pawel Laszczak <pawell@cadence.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

SGksCgpQYXdlbCBMYXN6Y3phayA8cGF3ZWxsQGNhZGVuY2UuY29tPiB3cml0ZXM6Cj4+Pj4gKy8q
Kgo+Pj4+ICsgKiB1c2JfZGVjb2RlX2N0cmwgLSBSZXR1cm5zIGh1bWFuIHJlYWRhYmxlIHJlcHJl
c2VudGF0aW9uIG9mIGNvbnRyb2wgcmVxdWVzdC4KPj4+PiArICogQHN0cjogYnVmZmVyIHRvIHJl
dHVybiBhIGh1bWFuLXJlYWRhYmxlIHJlcHJlc2VudGF0aW9uIG9mIGNvbnRyb2wgcmVxdWVzdC4K
Pj4+PiArICogICAgICAgVGhpcyBidWZmZXIgc2hvdWxkIGhhdmUgYWJvdXQgMjAwIGJ5dGVzLgo+
Pj4KPj4+ICJhYm91dCAyMDAgYnl0ZXMiIGlzIG5vdCB2ZXJ5IHNwZWNpZmljLgo+Pj4KPj4+IFBh
c3MgaW4gdGhlIGxlbmd0aCBzbyB3ZSBrbm93IHdlIGRvbid0IG92ZXJmbG93IGl0Lgo+Pgo+PmFn
cmVlLgo+IEkgYWxzbyBhZ3JlZSBhbmQgSSB3aWxsIGFkZCBzdWNoIHBhcmFtZXRlci4gCgpodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9iYWxiaS91c2IuZ2l0
L2NvbW1pdC8/aD1uZXh0JmlkPTc3OTBiMzU1NmZjY2M1NTVhZTQyMmYxNTc2ZTk3YmYzNGM4YWI4
YjYK

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,4/6] usb:common Simplify usb_decode_get_set_descriptor function.
From: Pawel Laszczak <pawell@cadence.com>
Message-Id: <BYAPR07MB4709A3ACFDC56A1B7B145A68DD640@BYAPR07MB4709.namprd07.prod.outlook.com>
Date: Mon, 11 Feb 2019 12:21:01 +0000
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-ID: <linux-usb.vger.kernel.org>

Pk9uIFRodSwgSmFuIDMxLCAyMDE5IGF0IDExOjUyOjMxQU0gKzAwMDAsIFBhd2VsIExhc3pjemFr
IHdyb3RlOgo+PiBQYXRjaCBtb3ZlcyBzd2l0Y2ggcmVzcG9uc2libGUgZm9yIGRlY29kaW5nIGRl
c2NyaXB0b3IgdHlwZQo+PiBvdXRzaWRlIHNucHJpbnRmLiBJdCdzIGxpdHRsZSBpbXByb3ZlcyBj
b2RlIHJlYWRhYmlsaXR5Lgo+Cj5TaG91bGQgdGhhdCBsYXN0IHNlbnRlbmNlIHJlYWQ6ICJJdCBp
bXByb3ZlcyBjb2RlIHJlYWRhYmlsaXR5IGEgbGl0dGxlIj8KPgpZZXMsIGl0IHNob3VsZC4gClRo
YW5rcyAKClBhd2VsCg==

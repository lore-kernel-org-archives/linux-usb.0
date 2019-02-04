Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3,2/6] usb:common Separated decoding functions from dwc3 driver.
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20190204114528.GB28608@kroah.com>
Date: Mon, 4 Feb 2019 12:45:28 +0100
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTE6NTI6MjlBTSArMDAwMCwgUGF3ZWwgTGFzemN6YWsg
d3JvdGU6Cj4gUGF0Y2ggbW92ZXMgc29tZSBkZWNvZGluZyBmdW5jdGlvbnMgZnJvbSBkcml2ZXIv
dXNiL2R3YzMvZGVidWcuaCBkcml2ZXIKPiB0byBkcml2ZXIvdXNiL2NvbW1vbi9kZWJ1Zy5jIGZp
bGUuIFRoZXNlIG1vdmVkIGZ1bmN0aW9ucyBpbmNsdWRlOgo+ICAgICBkd2MzX2RlY29kZV9nZXRf
c3RhdHVzCj4gICAgIGR3YzNfZGVjb2RlX3NldF9jbGVhcl9mZWF0dXJlCj4gICAgIGR3YzNfZGVj
b2RlX3NldF9hZGRyZXNzCj4gICAgIGR3YzNfZGVjb2RlX2dldF9zZXRfZGVzY3JpcHRvcgo+ICAg
ICBkd2MzX2RlY29kZV9nZXRfY29uZmlndXJhdGlvbgo+ICAgICBkd2MzX2RlY29kZV9zZXRfY29u
ZmlndXJhdGlvbgo+ICAgICBkd2MzX2RlY29kZV9nZXRfaW50Zgo+ICAgICBkd2MzX2RlY29kZV9z
ZXRfaW50Zgo+ICAgICBkd2MzX2RlY29kZV9zeW5jaF9mcmFtZQo+ICAgICBkd2MzX2RlY29kZV9z
ZXRfc2VsCj4gICAgIGR3YzNfZGVjb2RlX3NldF9pc29jaF9kZWxheQo+ICAgICBkd2MzX2RlY29k
ZV9jdHJsCj4gCj4gVGhlc2UgZnVuY3Rpb25zIGFyZSB1c2VkIGFsc28gaW4gaW5yb2R1Y2VkIGNk
bnMzIGRyaXZlci4KCi9tZSBoYW5kcyBQYXdlbCBhIHNwZWxsIGNoZWNrZXIgZm9yIHRoZSBjaGFu
Z2Vsb2dzLi4uCg==

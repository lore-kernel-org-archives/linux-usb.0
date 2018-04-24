Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [1/2] usb: typec: tps6598x: handle block reads separately with plain-I2C adapters
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Message-Id: <20180424134520.GA17550@kuha.fi.intel.com>
Date: Tue, 24 Apr 2018 16:45:20 +0300
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, stable@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMDY6MDI6NTZBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKPiBUaGUgY2hpcCBzaG91bGQgcmV0dXJuIHRoZSBudW1iZXIgb2YgYnl0ZXMgaXQgaGFz
IGF2YWlsYWJsZSBhbmQgdGhlbiBOQUsKPiB0aGUgdHJhbnNmZXIuIFRoZSBjaGlwIGRyaXZlciBz
aG91bGQgdGhlbiByZXBvcnQgdGhlIG51bWJlciBvZiBieXRlcyByZWFkCj4gdG8gaXRzIGNhbGxl
ci4gVGhpcyBpcyB3aHkgaTJjX3NtYnVzX3JlYWRfYmxvY2tfZGF0YSgpIGFuZCBmcmllbmRzIHJl
dHVybgo+IG5vdCBqdXN0IDAvLWVycm5vLCBidXQgdGhlIG51bWJlciBvZiBieXRlcyByZWFkLgoK
VGhhbmtzIGZvciB0aGUgaW5mby4KCgpCciwK

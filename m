Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/2] usb: dwc3: drd: Fix lock-up on ID change during system suspend/resume
From: Roger Quadros <rogerq@ti.com>
Message-Id: <557afc49-712d-9e70-7e4a-b7b3e74b7a50@ti.com>
Date: Tue, 23 Jan 2018 14:41:22 +0200
To: Manu Gautam <mgautam@codeaurora.org>, balbi@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SGkgTWFudSwKCk9uIDIzLzAxLzE4IDA1OjQ1LCBNYW51IEdhdXRhbSB3cm90ZToKPiBIaSwKPiAK
PiAKPiBPbiAxLzIyLzIwMTggNjozMSBQTSwgUm9nZXIgUXVhZHJvcyB3cm90ZToKPj4gQWRkaW5n
L3JlbW92aW5nIGhvc3QvZ2FkZ2V0IGNvbnRyb2xsZXIgYmVmb3JlIC5wbV9jb21wbGV0ZSgpCj4+
IGNhdXNlcyBhIGxvY2stdXAuIExldCdzIHByZXZlbnQgYW55IGR1YWwtcm9sZSBzdGF0ZSBjaGFu
Z2UKPj4gYmV0d2VlbiAucG1fcHJlcGFyZSgpIGFuZCAucG1fY29tcGxldGUoKSB0byBmaXggdGhp
cy4KPiAKPiBXaGF0IGtpbmQgb2YgbG9jay11cCBhcmUgeW91IHNlZWluZz8gU29tZSBoYXJkd2Fy
ZSBsb2NrdXAgb3Igc29mdHdhcmUgZGVhZGxvY2s/Cj4gSU1PIHVzaW5nIGEgZnJlZXphYmxlX3dx
IGZvciBkcmRfd29yayBzaG91bGQgYWRkcmVzcyB0aGF0Pwo+IAoKSSB3YXMgc2VlaW5nIGEgc29m
dHdhcmUgZGVhZGxvY2suIGZyZWV6YWJsZV93cSBpcyBhIGdvb2QgaWRlYS4gSSdsbCB0cnkgaXQg
b3V0LgoKPiAKPj4KPHNuaXA+Cg==

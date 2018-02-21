Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v3] Handle vendor defined behavior in tcpci_init, tcpci_set_vconn and export tcpci_irq. More operations can be extended in tcpci_data if needed. According to TCPCI specification, 4.4.5.2 ROLE_CONTROL, TCPC shall not start DRP toggling until subsequently 
From: Greg KH <greg@kroah.com>
Message-Id: <20180221143909.GA29620@kroah.com>
Date: Wed, 21 Feb 2018 15:39:09 +0100
To: ShuFanLee <leechu729@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux@roeck-us.net, shufan_lee@richtek.com, cy_huang@richtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBGZWIgMjEsIDIwMTggYXQgMTA6MzA6MzRQTSArMDgwMCwgU2h1RmFuTGVlIHdyb3Rl
Ogo+IEZyb206IFNodUZhbkxlZSA8c2h1ZmFuX2xlZUByaWNodGVrLmNvbT4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTaHVGYW5MZWUgPHNodWZhbl9sZWVAcmljaHRlay5jb20+CgpTb21ldGhpbmcgd2Vu
dCByZWFsbHkgd3Jvbmcgd2l0aCB5b3VyIHN1YmplY3QgbGluZSA6KAoKUGxlYXNlIGZpeCBhbmQg
dHJ5IGFnYWluLgoKdGhhbmtzLAoKZ3JlZyBrLWgKLS0tClRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGluCnRoZSBib2R5
IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUgbWFqb3Jkb21v
IGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo=

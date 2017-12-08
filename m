Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: USB: hub: Delete an error message for a failed memory allocation in usb_hub_clear_tt_buffer()
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-Id: <ee1e3128-f20c-e0e8-3ed7-eb42c7b57399@users.sourceforge.net>
Date: Fri, 8 Dec 2017 13:00:41 +0100
To: Dan Carpenter <dan.carpenter@oracle.com>, linux-usb@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Alan Stern <stern@rowland.harvard.edu>, Daniel Drake <drake@endlessm.com>, Dmitry Fleytman <dmitry@daynix.com>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Johan Hovold <johan@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>, Peter Chen <peter.chen@nxp.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

PiBHcmVnIG1haW50YWlucyBVU0IgYW5kIGhlJ3MgaGFzIGJsb2NrZWQgTWFya3VzLAoKSG93IGRv
IHlvdSB0aGluayBhYm91dCB0byByZWNvbnNpZGVyIHRoaXMgYmxvY2thZ2U/CgoKPiBiZWNhdXNl
IGhlIG5ldmVyIGxpc3RlbnMgdG8gZmVlZGJhY2sKCkkgYW0gbGlzdGVuaW5nIOKApgoKCj4gYnV0
IGluc3RlYWQganVzdCByZXBzb25kcyB0aGF0IGhlIGhhcyBhIGRpZmZlcmVudCBvcGluaW9uLgoK
SSBjaG9vc2Ugc3VjaCBhIHJlYWN0aW9uIGluIHNvbWUgY2FzZXMuIE15IHJlc3BvbnNlcyBjYW4g
dmFyeS4KCkl0IHNlZW1zIHRoYXQgSSBzaG93IGNoYW5nZSBwb3NzaWJpbGl0aWVzIGZyb20gd2hp
Y2ggY29udHJpYnV0b3JzCmNhbiBnZXQgZ3J1bXB5IChvdmVyIHRpbWUpLgoKUmVnYXJkcywKTWFy
a3VzCi0tLQpUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5z
dWJzY3JpYmUgbGludXgtdXNiIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21v
QHZnZXIua2VybmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJu
ZWwub3JnL21ham9yZG9tby1pbmZvLmh0bWwK

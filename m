Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: chipidea: Fix ULPI on imx51
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-Id: <0f31d801-528e-54ee-f385-b7aa3eef414f@cogentembedded.com>
Date: Thu, 21 Jun 2018 17:12:24 +0300
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@nxp.com>, linux-usb@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
List-ID: <linux-usb.vger.kernel.org>

Pj4+IFRoaXMgcGF0Y2hlcyBjYXVzZXMgYSByZWdyZXNzaW9uIG9uIGEgaW14NTEtYmFiYmFnZSBy
dW5uaW5nIDQuMTgtcmMxOgo+Pj4gSSBnZXQgYSBrZXJuZWwgaGFuZy4KPj4+Cj4+PiBJZiBJIHJl
dmVydCBpdCBvbiB0b3Agb2YgNC4xOC1yYzEsIHRoZW4gaXQgYm9vdHMgZmluZSBhbmQgVVNCIGhv
c3QgaXMKPj4+IGZ1bmN0aW9uYWwuCj4+Pgo+Pj4gSSB1bmRlcnN0YW5kIHRoaXMgcGF0Y2ggZml4
ZXMgYSBrZXJuZWwgaGFuZyBmb3IgeW91LCBzbyB3aGljaCBjb21taXQKPj4+IGlzIHJlc3BvbnNp
YmxlIGZvciB0aGUgaGFuZyB5b3Ugb2JzZXJ2ZT8KPj4+Cj4gCj4gSSBuZXZlciBhc3N1bWVkIGl0
IHdhcyBhIHJlZ3Jlc3Npb24gYW5kIHRoYXQgVVNCIHdvcmtlZCBvbiBSRFUxIGJvYXJkCj4gYmVm
b3JlLCBzbyBJIG5ldmVyIHRyaWVkIHRvIHNlZSBpZiB0aGlzIHdhcyBhIHJlZ3Jlc3Npb24uIEkg
Y2FuIG9ubHkKPiB0ZWxsIHlvdSB0aGF0IGl0IGhhbmdzIGFzIHNvb24gYXMgYW55IFBPUlRTQyBy
ZWdpc3RlcnMgYXJlIGFjY2Vzc2VkLgoKSGFuZyBhdCByZWdpc3RlciBhY2Nlc3MgdXN1YWxseSBt
ZWFucyB0aGF0IG1vZHVsZSB0aGF0IG93bnMgdGhlIHJlZ2lzdGVyCmlzIG5vdCBjbG9ja2VkLgot
LS0KVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGxpc3Q6IHNlbmQgdGhlIGxpbmUgInVuc3Vic2Ny
aWJlIGxpbnV4LXVzYiIgaW4KdGhlIGJvZHkgb2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2Vy
Lmtlcm5lbC5vcmcKTW9yZSBtYWpvcmRvbW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9y
Zy9tYWpvcmRvbW8taW5mby5odG1sCg==

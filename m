Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,53/68] vfs: Convert functionfs to use the new mount API
From: =?utf-8?q?Micha=C5=82_Nazarewicz?= <mina86@mina86.com>
Message-Id: <CA+pa1O16AXPBz0G3JKWcGo-ry4C=q_GgpwRpoR8NmHChzpuFtQ@mail.gmail.com>
Date: Thu, 28 Mar 2019 10:43:16 +0000
To: David Howells <dhowells@redhat.com>
Cc: viro@zeniv.linux.org.uk, Felipe Balbi <balbi@kernel.org>, USB list <linux-usb@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

SSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBuZXcgbW91bnQgQVBJIGJ1dCB0aGUgY29kZSBsb29r
cyByZWFzb25hYmxlIHRvIG1lOgoKQWNrZWQtYnk6IE1pY2hhbCBOYXphcmV3aWN6IDxtaW5hODZA
bWluYTg2LmNvbT4KCk9uIFdlZCwgMjcgTWFyIDIwMTkgYXQgMjM6NDcsIERhdmlkIEhvd2VsbHMg
PGRob3dlbGxzQHJlZGhhdC5jb20+IHdyb3RlOgo+IENvbnZlcnQgdGhlIGZ1bmN0aW9uZnMgZmls
ZXN5c3RlbSB0byB0aGUgbmV3IGludGVybmFsIG1vdW50IEFQSSBhcyB0aGUgb2xkCj4gb25lIHdp
bGwgYmUgb2Jzb2xldGVkIGFuZCByZW1vdmVkLiAgVGhpcyBhbGxvd3MgZ3JlYXRlciBmbGV4aWJp
bGl0eSBpbgo+IGNvbW11bmljYXRpb24gb2YgbW91bnQgcGFyYW1ldGVycyBiZXR3ZWVuIHVzZXJz
cGFjZSwgdGhlIFZGUyBhbmQgdGhlCj4gZmlsZXN5c3RlbS4KPgo+IFNlZSBEb2N1bWVudGF0aW9u
L2ZpbGVzeXN0ZW1zL21vdW50X2FwaS50eHQgZm9yIG1vcmUgaW5mb3JtYXRpb24uCg==

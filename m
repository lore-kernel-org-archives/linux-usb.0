Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: xhci: Add check for invalid byte size error when UAS devices are connected.
From: Sandeep Singh <ssingh1@amd.com>
Message-Id: <4ccf6cbc-cdf6-c6f0-486d-b971837d1c8a@amd.com>
Date: Tue, 25 Sep 2018 14:44:42 +0530
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Sandeep Singh <Sandeep.Singh@amd.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, mathias.nyman@intel.com
Cc: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
List-ID: <linux-usb.vger.kernel.org>

T24gOS8yNC8yMDE4IDY6MzkgUE0sIE1hdGhpYXMgTnltYW4gd3JvdGU6Cj4gT24gMjEuMDkuMjAx
OCAxNjoyMiwgU2FuZGVlcCBTaW5naCB3cm90ZToKPj4gRnJvbTogU2FuZGVlcCBTaW5naCA8c2Fu
ZGVlcC5zaW5naEBhbWQuY29tPgo+Pgo+PiBPYnNlcnZlZCAiVFJCIGNvbXBsZXRpb24gY29kZSAo
MjcpIiBlcnJvciB3aGljaCBjb3JyZXNwb25kcyB0byBTdG9wcGVkIC0KPj4gTGVuZ3RoIEludmFs
aWQgZXJyb3IoeGhjaSBzcGVjIHNlY3Rpb24gNC4xNy40KSB3aGlsZSBjb25uZWN0aW5nIFVTQiB0
bwo+PiBTQVRBIGJyaWRnZS4KPj4KPj4gTG9va3MgbGlrZSB0aGlzIGNhc2Ugd2FzIG5vdCBjb25z
aWRlcmVkIHdoZW4gdGhlIGZvbGxvd2luZyBwYXRjaFsxXSB3YXMKPj4gY29tbWl0dGVkLiBIZW5j
ZSBhZGRpbmcgdGhpcyBuZXcgY2hlY2sgd2hpY2ggY2FuIHByZXZlbnQKPj4gdGhlIGludmFsaWQg
Ynl0ZSBzaXplIGVycm9yLgo+Pgo+PiBbMV0gYWRlMmUzYSB4aGNpOiBoYW5kbGUgdHJhbnNmZXIg
ZXZlbnRzIHdpdGhvdXQgVFJCIHBvaW50ZXIKPj4KPiAKPiBUaGFua3MsIGFkZGluZyB0byBxdWV1
ZS4KPiAKPiBKdXN0IG91dCBvZiBjdXJpb3NpdHksIHdhcyB0aGUgVFJCIHBvaW50ZXIgYml0cyBh
bGwgemVyb2VzCj4gaW4gdGhpcyAgU3RvcHBlZCAtTGVuZ3RoIGludmFsaWQgdHJhbnNmZXIgZXZl
bnQgVFJCPwo+ClllcywgVFJCIHBvaW50ZXIgYml0cyBhbGwgemVyb2VzCgo+IC1NYXRoaWFzCj4g
ClRoYW5rcwpTYW5kZWVwCg==

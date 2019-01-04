Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [RFC,lora-next,5/5] HACK: net: lora: sx130x: Add PicoCell gateway shim for cdc-acm
From: Rob Herring <robh@kernel.org>
Message-Id: <CAL_Jsq+BMOvRLEbD2Eo2D=n446vSubeXV3-FbkBSHjpfL=LYsg@mail.gmail.com>
Date: Fri, 4 Jan 2019 11:07:45 -0600
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-lpwan@lists.infradead.org, "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, "David S. Miller" <davem@davemloft.net>, Oliver Neukum <oneukum@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev <netdev@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gRnJpLCBKYW4gNCwgMjAxOSBhdCA1OjIxIEFNIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJA
c3VzZS5kZT4gd3JvdGU6Cj4KPiBJZ25vcmUgb3VyIGRldmljZSBpbiBjZGMtYWNtIHByb2Jpbmcg
YW5kIGFkZCBhIG5ldyBkcml2ZXIgZm9yIGl0LAo+IGRpc3BhdGNoaW5nIHRvIGNkYy1hY20gZm9y
IHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24uCj4KPiBXQVJOSU5HOiBJdCBpcyBsaWtlbHkgdGhh
dCB0aGlzIFZJRC9QSUQgaXMgaW4gdXNlIGZvciB1bnJlbGF0ZWQgZGV2aWNlcy4KPiBPbmx5IHRo
ZSBQcm9kdWN0IHN0cmluZyBoaW50cyB3aGF0IHRoaXMgcmVhbGx5IGlzIGluIGN1cnJlbnQgdjAu
Mi4xLgo+IFByZXZpb3VzIGNvZGUgdjAuMi4wIHdhcyB1c2luZyBhIFNlbXRlY2ggVklEL1BJRCwg
YnV0IG5vIGNhcmQgc2hpcHBpbmcKPiB3aXRoIHN1Y2ggZmlybXdhcmUgaXMga25vd24gdG8gbWUu
Cj4KPiBXaGlsZSB0aGlzIG1heSBzZWVtIHVub3J0aG9kb3gsIG5vIGludGVybmFscyBvZiB0aGUg
ZHJpdmVyIGFyZSBhY2Nlc3NlZCwKPiBqdXN0IHRoZSBzZXQgb2YgZHJpdmVyIGNhbGxiYWNrcyBp
cyBkdXBsaWNhdGVkIGFzIHNoaW0uCj4KPiBVc2UgdGhpcyBzaGltIGNvbnN0cnVjdCB0byBmYWtl
IERUIG5vZGVzIGZvciBzZXJkZXYgb24gcHJvYmUuCj4gRm9yIHRlc3RpbmcgcHVycG9zZXMgdGhl
c2Ugbm9kZXMgZG8gbm90IGhhdmUgYSBwYXJlbnQgeWV0Lgo+IFRoaXMgcmVzdWx0cyBpbiB0d28g
IkVycm9yIC0yIGNyZWF0aW5nIG9mX25vZGUgbGluayIgd2FybmluZ3Mgb24gcHJvYmUuCgpJdCBs
b29rcyBsaWtlIHRoZSBEVCBpcyBwcmV0dHkgc3RhdGljLiBSYXRoZXIgdGhhbiBjcmVhdGluZyB0
aGUgbm9kZXMKYXQgcnVuLXRpbWUsIGNhbid0IHlvdSBjcmVhdGUgYSBkdHMgZmlsZSBhbmQgYnVp
bGQgdGhhdCBpbnRvIHlvdXIKbW9kdWxlLgoKUm9iCg==

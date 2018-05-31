Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v4] driver core: hold dev's parent lock when needed
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-Id: <CAHp75Ve8RmAcr-nEQaLZug2+x_d8ExJJK2DgEJc+L_60u0vLzw@mail.gmail.com>
Date: Thu, 31 May 2018 21:55:56 +0300
To: Martin Liu <liumartin@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Johan Hovold <johan@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, jenhaochen@google.com
List-ID: <linux-usb.vger.kernel.org>

T24gVGh1LCBNYXkgMzEsIDIwMTggYXQgMTA6MjcgQU0sIE1hcnRpbiBMaXUgPGxpdW1hcnRpbkBn
b29nbGUuY29tPiB3cm90ZToKPiBPbiBUaHUsIE1heSAzMSwgMjAxOCBhdCAwODozMToxOEFNICsw
MjAwLCBHcmVnIEtIIHdyb3RlOgo+PiBPbiBXZWQsIE1heSAzMCwgMjAxOCBhdCAwMToyMTowMlBN
IC0wNDAwLCBBbGFuIFN0ZXJuIHdyb3RlOgo+PiA+IE9uIFRodSwgMzEgTWF5IDIwMTgsIE1hcnRp
biBMaXUgd3JvdGU6Cgo+PiA+IFRoaXMgbG9va3Mgb2theSB0byBtZS4KPj4gPgo+PiA+IEFja2Vk
LWJ5OiBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1Pgo+PiA+Cj4+ID4gR3Jl
ZywgYW55IG1vcmUgY29tbWVudHM/Cj4+Cj4+IExvb2tzIHNhbmUgdG8gbWUuICBNYXJ0aW4sIHRo
YW5rcyBmb3IgYWxsIG9mIHRoZSBjaGFuZ2VzLgoKPiBHcmVhdCB0aGFuayBBbGFuLCBHcmVnIGFu
ZCBBbmR5IGZvciBoZWxwZnVsIGhpbnRzIGFuZCBmZWVkYmFjay4KPiBNYW55IFRoYW5rcyEKCllv
dSBhcmUgd2VsY29tZSEKCkJ0dywgRldJVywKClJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28g
PGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+Cg==

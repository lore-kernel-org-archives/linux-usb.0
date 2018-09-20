Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [crypto-next,11/23] wusb: Remove VLA usage of skcipher
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-Id: <20180920103938.GA14523@kroah.com>
Date: Thu, 20 Sep 2018 12:39:38 +0200
To: Kees Cook <keescook@chromium.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Felipe Balbi <felipe.balbi@linux.intel.com>, Johan Hovold <johan@kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-usb@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Eric Biggers <ebiggers@google.com>, linux-crypto <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDc6MTA6NDhQTSAtMDcwMCwgS2VlcyBDb29rIHdyb3Rl
Ogo+IEluIHRoZSBxdWVzdCB0byByZW1vdmUgYWxsIHN0YWNrIFZMQSB1c2FnZSBmcm9tIHRoZSBr
ZXJuZWxbMV0sIHRoaXMKPiByZXBsYWNlcyBzdHJ1Y3QgY3J5cHRvX3NrY2lwaGVyIGFuZCBTS0NJ
UEhFUl9SRVFVRVNUX09OX1NUQUNLKCkgdXNhZ2UKPiB3aXRoIHN0cnVjdCBjcnlwdG9fc3luY19z
a2NpcGhlciBhbmQgU1lOQ19TS0NJUEhFUl9SRVFVRVNUX09OX1NUQUNLKCksCj4gd2hpY2ggdXNl
cyBhIGZpeGVkIHN0YWNrIHNpemUuCj4gCj4gWzFdIGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3Iv
Q0ErNTVhRnpDRy16Tm1ad1g0QTJGUXBhZGFmTGZFeks2Q0M9cVBYeWRBYWNVMVJxWldBQG1haWwu
Z21haWwuY29tCj4gCj4gQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+Cj4gQ2M6IEZlbGlwZSBCYWxiaSA8ZmVsaXBlLmJhbGJpQGxpbnV4LmludGVsLmNv
bT4KPiBDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IENjOiAiR3VzdGF2byBB
LiBSLiBTaWx2YSIgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4gQ2M6IGxpbnV4LXVzYkB2Z2Vy
Lmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KCkFja2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgo=

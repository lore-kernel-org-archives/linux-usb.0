Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: net: cdc_ncm: use tasklet_init() for tasklet_struct init
From: David Miller <davem@davemloft.net>
Message-Id: <20181011.120642.1884317415368072192.davem@davemloft.net>
Date: Thu, 11 Oct 2018 12:06:42 -0700 (PDT)
To: ben.dooks@codethink.co.uk
Cc: oliver@neukum.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel@lists.codethink.co.uk
List-ID: <linux-usb.vger.kernel.org>

RnJvbTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPgpEYXRlOiBUaHUsIDEx
IE9jdCAyMDE4IDE0OjAzOjMyICswMTAwCgo+IFRoZSB0YXNrbGV0IGluaXRpYWxpc2F0aW9uIHdv
dWxkIGJlIGJldHRlciBkb25lIGJ5IHRhc2tsZXRfaW5pdCgpCj4gaW5zdGVhZCBvZiBhc3N1bWlu
ZyBhbGwgdGhlIGZpZWxkcyBhcmUgaW4gYW4gb2sgc3RhdGUgYnkgZGVmYXVsdC4KPiAKPiBUaGlz
IGRvZXMgbm90IGZpeCBhbnkgYWN0dWFsIGtub3cgYnVnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJl
biBEb29rcyA8YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KCkFwcGxpZWQgdG8gbmV0LW5leHQu
Cg==

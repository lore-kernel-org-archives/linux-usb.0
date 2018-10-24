Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [2/3] net: ethernet: Remove dummy runtime PM callbacks from Renesas drivers
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <ecf01d95-f973-5294-932f-41e2a68decf3@cogentembedded.com>
Date: Wed, 24 Oct 2018 20:44:07 +0300
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-pm@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <linux-usb.vger.kernel.org>

SGVsbG8hCgpPbiAxMC8yNC8yMDE4IDA0OjUxIFBNLCBKYXJra28gTmlrdWxhIHdyb3RlOgoKPiBQ
bGF0Zm9ybSBkcml2ZXJzIGRvbid0IG5lZWQgZHVtbXkgcnVudGltZSBQTSBjYWxsYmFja3MgdGhh
dCBqdXN0IHJldHVybgo+IHN1Y2Nlc3MgaW4gb3JkZXIgdG8gaGF2ZSBydW50aW1lIFBNIGhhcHBl
bmluZy4gVGhpcyBoYXMgY2hhbmdlZCBzaW5jZQo+IGZvbGxvd2luZyBjb21taXRzOgo+IAo+IDA1
YWE1NWRkZGI5ZSAoIlBNIC8gUnVudGltZTogTGVuaWVudCBnZW5lcmljIHJ1bnRpbWUgcG0gY2Fs
bGJhY2tzIikKPiA1NDNmMjUwM2E5NTYgKCJQTSAvIHBsYXRmb3JtX2J1czogQWxsb3cgcnVudGlt
ZSBQTSBieSBkZWZhdWx0IikKPiA4YjMxM2EzOGVjZmYgKCJQTSAvIFBsYXRmb3JtOiBVc2UgZ2Vu
ZXJpYyBydW50aW1lIFBNIGNhbGxiYWNrcyBkaXJlY3RseSIpCgogICBXb3csIHRoZXNlIGFyZSBv
bGQhIDotKQoKPiBTaWduZWQtb2ZmLWJ5OiBKYXJra28gTmlrdWxhIDxqYXJra28ubmlrdWxhQGxp
bnV4LmludGVsLmNvbT4KPiAtLS0KPiBPbmx5IGJ1aWxkIHRlc3RlZC4KCiAgIFNlZW1zIGxvbmcg
b3ZlcmR1ZS4uLgoKWy4uLl0KClJldmlld2VkLWJ5OiBTZXJnZWkgU2h0eWx5b3YgPHNlcmdlaS5z
aHR5bHlvdkBjb2dlbnRlbWJlZGRlZC5jb20+CgpNQlIsIFNlcmdlaQo=

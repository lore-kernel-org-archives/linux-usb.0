Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: tools: usb: usbip: fix fd leak in case of 'fread' failure
From: Shuah Khan <shuah@kernel.org>
Message-Id: <5134a814-510e-a157-07db-9be17d81f674@kernel.org>
Date: Tue, 2 Jan 2018 10:48:57 -0700
To: Elad Wexler <elad.wexler@gmail.com>, valentina.manea.m@gmail.com, Shuah Khan <shuahkh@osg.samsung.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gMTIvMzAvMjAxNyAwOTowMSBBTSwgRWxhZCBXZXhsZXIgd3JvdGU6Cj4gRml4IHBvc3NpYmxl
IHJlc291cmNlIGxlYWs6IGZkCj4gCj4gU2lnbmVkLW9mZi1ieTogRWxhZCBXZXhsZXIgPGVsYWQu
d2V4bGVyQGdtYWlsLmNvbT4KClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBMb29rcyBnb29kIHRvIG1l
LgoKQWNrZWQtYnk6IFNodWFoIEtoYW4gPHNodWFoa2hAb3NnLnNhbXN1bmcuY29tPgoKR3JlZywg
cGxlYXNlIHBpY2sgdGhpcyBwYXRjaCB1cC4KCnRoYW5rcywKLS0gU2h1YWgKLS0tClRvIHVuc3Vi
c2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11
c2IiIGluCnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3Jn
Ck1vcmUgbWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21v
LWluZm8uaHRtbAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usbip: Fix vhci_urb_enqueue() URB null transfer buffer error path
From: Shuah Khan <shuah@kernel.org>
Message-Id: <4b4a2764-257a-6a30-19c0-9eabf66d62c4@kernel.org>
Date: Sun, 20 Jan 2019 12:29:19 -0700
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Shuah Khan <skhan@linuxfoundation.org>, valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, shuah <shuah@kernel.org>
List-ID: <linux-usb.vger.kernel.org>

T24gMS8xOS8xOSA5OjU4IEFNLCBTZXJnZWkgU2h0eWx5b3Ygd3JvdGU6Cj4gSGVsbG8hCj4gCj4g
T24gMDEvMTkvMjAxOSAxMjoyOSBBTSwgU2h1YWggS2hhbiB3cm90ZToKPiAKPj4gRnJvbTogU2h1
YWggS2hhbiA8c2h1YWhAa2VybmVsLm9yZz4KPj4KPj4gRml4IHZoY2lfdXJiX2VucXVldWUoKSB0
byBwcmludCBlcnJvciBhbmQgcmV0dXJuIGVycm9yIGluc3RlYWQgb2YKPj4gZmFpbGluZyB3aXRo
IFdBUk5fT04uCj4gCj4gICAgIEl0J3MgQlVHX09OKCkuCgpUaGFua3MuIEkgd2lsbCBmaXggaXQu
CgotLSBTaHVhaAo=

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: usb: musb: Fix potential NULL dereference
From: "Matwey V. Kornilov" <matwey@sai.msu.ru>
Message-Id: <20190123175142.12604-1-matwey@sai.msu.ru>
Date: Wed, 23 Jan 2019 20:51:42 +0300
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: matwey.kornilov@gmail.com, "Matwey V. Kornilov" <matwey@sai.msu.ru>, "open list:MUSB MULTIPOINT HIGH SPEED
	DUAL-ROLE CONTROLLER" <linux-usb@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

V2UgYXNzaWduICJ1cmItPmhjcHJpdiA9IHFoOyIgYSBmZXcgbGluZXMgZG93bi4gVGhlIHZhbGlk
IHFoIGZvciB0aGUgdXJiIGlzCmhlcC0+aGNwcml2IGluIHRoaXMgY29kZSBwYXRoLgoKRml4ZXM6
IDcxNGJjNWVmM2VkYSAoIm11c2I6IHBvdGVudGlhbCB1c2UgYWZ0ZXIgZnJlZSIpClNpZ25lZC1v
ZmYtYnk6IE1hdHdleSBWLiBLb3JuaWxvdiA8bWF0d2V5QHNhaS5tc3UucnU+Ci0tLQogZHJpdmVy
cy91c2IvbXVzYi9tdXNiX2hvc3QuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL211c2IvbXVzYl9o
b3N0LmMgYi9kcml2ZXJzL3VzYi9tdXNiL211c2JfaG9zdC5jCmluZGV4IGM2MTE4YTk2MmQzNy4u
NmYyNjc3MTY3NjhlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3VzYi9tdXNiL211c2JfaG9zdC5jCisr
KyBiL2RyaXZlcnMvdXNiL211c2IvbXVzYl9ob3N0LmMKQEAgLTIzMzYsNyArMjMzNiw3IEBAIHN0
YXRpYyBpbnQgbXVzYl91cmJfZW5xdWV1ZSgKIAkJICogb2RkLCByYXJlLCBlcnJvciBwcm9uZSwg
YnV0IGxlZ2FsLgogCQkgKi8KIAkJa2ZyZWUocWgpOwotCQlxaCA9IE5VTEw7CisJCXFoID0gaGVw
LT5oY3ByaXY7CiAJCXJldCA9IDA7CiAJfSBlbHNlCiAJCXJldCA9IG11c2Jfc2NoZWR1bGUobXVz
YiwgcWgsCg==

Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [V2] usb: gadget: f_fs: don't free buffer prematurely
From: Josh Gao <jmgao@google.com>
Message-Id: <CAAHfpN_2rUu+kCCgOV+RdqCU5+XRe_c3KkJk6FNv50FG+5_qwg@mail.gmail.com>
Date: Tue, 19 Mar 2019 22:56:54 -0700
To: fei.yang@intel.com
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, Jerry Zhang <zhangjerry@google.com>, andrzej.p@collabora.com, plr.vincent@gmail.com, jingx.shen@intel.com, John Stultz <john.stultz@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-usb.vger.kernel.org>

T24gVHVlLCBNYXIgMTksIDIwMTkgYXQgMTA6MzIgUE0gPGZlaS55YW5nQGludGVsLmNvbT4gd3Jv
dGU6Cj4KPiBGcm9tOiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPgo+Cj4gVGhlIGZvbGxv
d2luZyBrZXJuZWwgcGFuaWMgaGFwcGVucyBkdWUgdG8gdGhlIGlvX2RhdGEgYnVmZmVyIGdldHMg
ZGVhbGxvY2F0ZWQKPiBiZWZvcmUgdGhlIGFzeW5jIGlvIGlzIGNvbXBsZXRlZC4gQWRkIGEgY2hl
Y2sgZm9yIHRoZSBjYXNlIHdoZXJlIGlvX2RhdGEgYnVmZmVyCj4gc2hvdWxkIGJlIGRlYWxsb2Nh
dGVkIGJ5IGZmc191c2VyX2NvcHlfd29ya2VyLgoKSXQgbG9va3MgbGlrZSB0aGlzIGhhcHBlbmVk
IGJlY2F1c2UgZGF0YSBnb3QgcmVuYW1lZCB0byBpb19kYXRhLCB3aGljaCBtYWRlIHRoZQpgZGF0
YSA9IE5VTExgIG1hcmtlZCB3aXRoICJEbyBub3Qga2ZyZWUgdGhlIGJ1ZmZlciBpbiB0aGlzIGZ1
bmN0aW9uIiBub3QgZG8Kd2hhdCBpdCB3YXMgaG9waW5nLiBUaGlzIHNob3VsZCBwcm9iYWJseSBl
aXRoZXIgZGVsZXRlIHRoZSBhc3NpZ25tZW50IGFib3ZlIG9yCmZpeCB0aGUgYXNzaWdubWVudCB0
byByZWZlciB0byBpb19kYXRhPyAoRUlPQ0JRVUVVRUQgcHJlc3VtYWJseSBjYW4ndCBjb21lIGZy
b20KZWxzZXdoZXJlPykK

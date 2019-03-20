Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [v2] USB: serial: mos7720: fix mos_parport refcount imbalance on error path
From: Johan Hovold <johan@kernel.org>
Message-Id: <20190320131842.GG15782@localhost>
Date: Wed, 20 Mar 2019 14:18:42 +0100
To: Lin Yi <teroincn@163.com>
Cc: linux-usb@vger.kernel.org, johan@kernel.org, gregkh@linuxfoundation.org, csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, ljian236@gmail.com, yiqiuping@gmail.com
List-ID: <linux-usb.vger.kernel.org>

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMDc6MDQ6NTZQTSArMDgwMCwgTGluIFlpIHdyb3RlOgo+
IEpvaGFuIHNhaWQgdGhhdCBtb3ZlIHRoZSBrcmVmX2dldCgpIGFuZCBtb3NfcGFycG9ydCBhc3Np
Z25tZW50IHRvIHRoZQo+IGVuZCBvZiB1cmJ0cmFjayBpbml0aWFsaXNhdGlvbiBpcyBhIGJldHRl
ciB3YXksIHNvIG1vdmUgaXQuIGFuZAo+IG1vc19wYXJwb3J0IGRvIG5vdCB1c2VkIHVudGlsIHVy
YnRyYWNrIGluaXRpYWxpc2F0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpbiBZaSA8dGVyb2lu
Y25AMTYzLmNvbT4KPiAtLS0KClRoYW5rcyBmb3IgdGhlIHYyLiBOb3cgYXBwbGllZCB3aXRoIGEg
Rml4ZXMgYW5kIENjLXN0YWJsZSB0YWcgYW5kIGEKc2xpZ2h0bHkgdXBkYXRlZCBjb21taXQgbWVz
c2FnZSBpbiBvcmRlciB0byBtYWtlIGl0IG1vcmUgc2VsZi1jb250YWluZWQ6CgoJaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvam9oYW4vdXNiLXNlcmlhbC5n
aXQvY29tbWl0Lz9oPXVzYi1saW51cyZpZD0yOTA4YjA3NmY1MTk4ZDIzMWRlNjI3MTNjYjJiNjMz
YTNhNGI5NWFjCgpKb2hhbgo=

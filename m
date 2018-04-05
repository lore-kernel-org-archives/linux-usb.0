Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [3/4] usb: gadget: udc: renesas_usb3: should call pm_runtime_enable() before add udc
From: Sasha Levin <Alexander.Levin@microsoft.com>
Message-Id: <DM5PR2101MB1032C33875DEA8725A4F9C09FBBB0@DM5PR2101MB1032.namprd21.prod.outlook.com>
Date: Thu, 5 Apr 2018 01:34:13 +0000
To: Sasha Levin <Alexander.Levin@microsoft.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "balbi@kernel.org" <balbi@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-ID: <linux-usb.vger.kernel.org>

SGkgWW9zaGloaXJvIFNoaW1vZGEuCgpbVGhpcyBpcyBhbiBhdXRvbWF0ZWQgZW1haWxdCgpUaGlz
IGNvbW1pdCBoYXMgYmVlbiBwcm9jZXNzZWQgYmVjYXVzZSBpdCBjb250YWlucyBhICJGaXhlczoi
IHRhZy4KZml4aW5nIGNvbW1pdDogY2YwNmRmM2ZhZTI4IHVzYjogZ2FkZ2V0OiB1ZGM6IHJlbmVz
YXNfdXNiMzogbW92ZSBwbV9ydW50aW1lX3tlbixkaXN9YWJsZSgpLgoKVGhlIGJvdCBoYXMgYWxz
byBkZXRlcm1pbmVkIGl0J3MgcHJvYmFibHkgYSBidWcgZml4aW5nIHBhdGNoLiAoc2NvcmU6IDk4
LjgwOTIpCgpUaGUgYm90IGhhcyB0ZXN0ZWQgdGhlIGZvbGxvd2luZyB0cmVlczogdjQuMTUuMTUs
IAoKdjQuMTUuMTU6IEJ1aWxkIE9LIQotLS0KVGhhbmtzLgpTYXNoYS0tClRvIHVuc3Vic2NyaWJl
IGZyb20gdGhpcyBsaXN0OiBzZW5kIHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC11c2IiIGlu
CnRoZSBib2R5IG9mIGEgbWVzc2FnZSB0byBtYWpvcmRvbW9Admdlci5rZXJuZWwub3JnCk1vcmUg
bWFqb3Jkb21vIGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8u
aHRtbAo=

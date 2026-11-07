Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794011339;
	b=jzBzm8QKqupC19OwVMmf79fWpCw11VT2L0wFu7yvm6G0ekvAuc8ZRcZ56w8ckOVCTi1X
	 ywLIhBI9uhv7BNSqF3eUTkntnLkhY6u3zEOK0bgwS8uv3Z6fyTKVWQmqWMfc3U9pMQ+rf
	 owqsRJKEAftfgj8QacyMTa1dQwCztXL4CiXM9j0yUp18WzAq5VakK/PdTLsqesBVz9ZP9
	 O8U5FEAvkFWID8WCFU952RCEjYznuK+KLTVfDfCGtT4T7LGTV/U6gpjSqOPF1GNNbdfL6
	 31WjfIJ0H/VAyvRSYhRVj+MZTWotLMLSl5Pl9W8oLYIXZfhG3NINT5+LNHEZnAdy94w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=HM5FGXVDbhNGcMxr2xTWi88hh9wuPit93L30PHroLXM=;
	b=wGeYuQGhOat5HNsVCzRai4NGprfdiRHkVARqrap1tkJiuCchr+nwOeTI6ce4kcpwo0zb
	 hnuJ86inhmWRM+rk0Pt+aTFXICzyg4a2mg4fMszUfvur3HuCrFNvSOuP8OSfDyeWSk0vC
	 vJSuIbmsuZTbjjAt2v9oynNcjORGw4MAaSC7sVbgrc2UqbKYSNaeH7d+LXfDRSgJWlyyg
	 e8S+B32fZOY459Ir6YQ2YZJCZkY8G6GRBp9tSPDC18tZTL6uJLWk6N0/ORjqqdgDhK89z
	 Y96o1dtpHvH8iKhEV8pP75CaXvelHyrtLC6yoeAqYwyhQTOuEGseGbXbWVYlWuBEKgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvalmuOI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93496606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93496606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvalmuOI
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91c79f306e9so14413856d6.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 16:28:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794011337; cv=none;
        d=google.com; s=arc-20260327;
        b=Sus+Zg/G68LtaTEm9A6LMIDN6wNCnVq43XadbwmYCKcVHD4LE6s843aBhCxlBSiBqU
         urm4AF/HVwusziahbhedXVAdQPWSXcxWMPr8omTWU3gFcKFXTNNotebHpTtvHrkIu9UB
         3lNQLpPfZGiYVnzZ+JhBUSqdsuAU3vZerLQagzWZ75ADTtCekAGd8WPLu6MZWo415IiI
         RhhqCNN/iHijijf/AUVYiIUAWpZZkj56YsIXcskdO7DSRz8EgPyA1M+ITXY9PlMspyWs
         5dpSxFWD45VWuoZRjTKSCStmZBtbIYpbUa2ho3u2lhWmOVJrCUI5nFOra67cI1d84sa4
         1Yzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HM5FGXVDbhNGcMxr2xTWi88hh9wuPit93L30PHroLXM=;
        fh=5CNGe00SZEiSxeyc8ufOUQGCLViWCgFxWn5jbRqgKCI=;
        b=gzswSkYAZ+owL3bB3wXyCykcx/95/csq53MdfBhENbQOfSXuiyD0KWVbl84cq0DuuR
         noPrImhlNJlvrw90j44rZjECCEGnU1z4NVKxVjO97J+v6dQtzKCrtzCI2n5UlHx1crvS
         HrBPeOZNDn28SeW2xmiu1e+3NdCx7l0i0WK8qsqAvou/4BVfHDXXpBWCeReftX43n5dI
         r5uRYdEE/l4OrB8UBwPvKbu8/Gb/WEVL6sXEqOSBydyImbKIa6gJE4aMqLIk13LBVED/
         WIvYIIwDEr8ID4vQfZdPa1lpAXpRMI9UR5aPVLHhAtkDFmwdcId3HmnUuBVrHyD+wGmP
         aoDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794011337; x=1794616137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HM5FGXVDbhNGcMxr2xTWi88hh9wuPit93L30PHroLXM=;
        b=qvalmuOIP/+E0xJxI2nraV99zem7ycv6RvkKK1hi8hpoTa8vS1n6Qt978ARP5Zk61u
         wwjVLiWIJAusy8cyvl+D4yYZMUDZhEpUfLiVQSVcgByMK5Skir+HmC5kY2DedSxDkO8m
         KShq351jiDrpfK0lutVYLCgfz8futJD7gkrIsHMdeGba6dvUGw4bWC2p17SXa/fDTsvg
         dS3Qj8hQEEJyhHXNvUbiUvf4Yl8aJf2vb8LYKI3VxQzIs2vV8iE0vzq6lS6t/NcnSNdu
         DLR1yOUJADwEYe2JdHJjMcsQqMY6hwpJ8/78QpE5E3+YCfH6hC2xumzdWoXd4Pv/4WEd
         303A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011337; x=1794616137;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HM5FGXVDbhNGcMxr2xTWi88hh9wuPit93L30PHroLXM=;
        b=2gf1nOa7ECFrLH7KT1qHDh8sQGnGZhUrL1UL4myJvNt/WmYcSxiEPSJYSrE1Gw24Ib
         WO6NDPAwwDz/kXxrvB8reGFCkpY3cP4TRH6vL8jA2zwW9xnMxeC9lxq2qqV3t43TVeY5
         w/jKB9MNqY30xQn0dtL6L3cNcJuUJquHzMcmXNqiLFGMaEsPUboU4p2/ZCJc9P4D4fG1
         WUFTfvqyWZM1ZWgY/iIvBTn3XPxuYHLecU5uBaQYViiAnJZKXOMwEu3T1RePlWwWg22b
         uiwwlVDfSNy1TWDad0HkpSxshu2aH9qRoaIJGwJPEpLUfaJkP1P1eKOHQsj93DO1hAFV
         JmUg==
X-Gm-Message-State: APuU4Z/I7Qu0MOTYJOwm/R/O36IIksKFaYbtoxu3eJqn5oi/DQmXmYVD
	9J9oYKeaDDqnAe4Gri3ueWjfCXrBcrpBR52z0qk7PsfAby+NQJ0SiP+CGEXCEq6J0F9N7TzWrhI
	2/sVi0jqLH7jB6c2P4HUTVhYw5GqiHyy1gozFDKM=
X-Gm-Gg: AYBFou34YptQv6QFfFEK1YmXcJwOLxI9LDERmX1J+Mj5mqYeHAnilA/8RkJ7Jc9xXRN
	KjwrEfAbX3Z+W20zLvUtMWhbhlOXLCgep6/drt8PEffe0Mgg4Vysc+s36ccTAxhCaF9M6UFxzvt
	eQLc6omHdd+GqLMoBlX0SlIzi/jr5s/q4XTrSrXYXMS6NkpXqYIgQEdSJFTUQF32RFQumsgrDJ8
	YPg0kyecIoAKlv24a4UiRuLWBcdFbrjshNoZeKnR6xO9ksl7gsJc2MxKJFnSChTw+KAJVYEvfHX
	qfyUp+O2LBygTHe89pqatRNnRnv33kcu83LBgvtr49OAchlS1EDqPtlLTH3bWKV7X7HX7+WtKdn
	4gvrpKJ4zDvAR/g9G1WnErMNCoLmrrK2lLD46282xZ4T4mxiFgK+/D3q8xn/8
X-Received: by 2002:a05:6214:19c9:b0:91e:93eb:5977 with SMTP id
 6a1803df08f44-91ea989b4f8mr59947876d6.35.1794011337390; Fri, 06 Nov 2026
 16:28:57 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Oleksandr Holetsek <lv200583goo@gmail.com>
Date: Sat, 7 Nov 2026 01:28:44 +0100
X-Gm-Features: AclHuK95Lr_BUhk-J_dZHjpRq0a7hix6SehNG4qvvqPO-5VjANIlbxmAxPrk6gs
Message-ID: <CALkonqF8G=LsMzvv_uZQbo4oKRutdqUGFL=7k3St0xFJFJcW5A@mail.gmail.com>
Subject: USB EHCI: microphone capture fails with ENOSPC depending on device
 activation order
To: stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000007e70fa065fa4d0cf"

--0000000000007e70fa065fa4d0cf
Content-Type: text/plain; charset="UTF-8"

Resending in plain text because the mailing list rejected the HTML
version. Apologies for the duplicate.

Dear Alan and USB maintainers,

An AI assistant helped collect diagnostics and draft this email. The physical
tests and observed mouse/microphone behavior above were verified by me.
No proposed fix has been developed or tested.

My FIFINE K669 USB microphone fails to start capture when my wireless mouse
receiver is already connected. Starting microphone capture first, then
connecting the receiver to the same port, allows both devices to work.

System: Arch Linux, 7.2.14-arch1-1, x86_64
Motherboard: Gigabyte H61M-S1
Controller: Intel 6 Series/C200 EHCI [8086:1c26], ehci-pci, 0000:00:1d.0
Internal hub: 8087:0024, single TT (protocol 01), device 2-1
Devices on that hub:
  2-1.1 0bda:8771 Bluetooth
  2-1.2 1d57:fa60 wireless receiver
  2-1.5 0c76:161e microphone
  2-1.6 04b4:6014 HID keyboard device
No external hub is connected.

Observed sequence:
1. With the receiver connected, request microphone capture in pavucontrol.
   The input meter does not respond. The kernel repeatedly logs:
   usb 2-1.5: cannot submit urb 0, error -28: not enough bandwidth
2. Disconnect the receiver and start microphone capture. The meter responds.
3. Reconnect the receiver to its original port while capture remains active.
   Both the mouse and microphone work.

Moving the receiver to the other EHCI controller also avoids the failure.
The original arrangement works on Windows.

I captured debugfs bandwidth allocations in the failing and working states.
In the failing state the FS/LS allocation is 347-362 us/frame; receiver ep84
starts in microframe 2, and microphone audio ep82 is absent.
In the working state the allocation is 513-528 us/frame:
  2-1.5 ep 82: 166 @ 0.2+1 mask f004
  2-1.2 ep 84:  61 @ 0.3+1 mask e008
The corresponding allocation excerpts are attached.

Limitations: I have not tested another kernel, reproduced on an untainted
boot, or established reproducibility across fresh boots. This boot has taint
value 12293 (P,S,O,E), including NVIDIA proprietary/out-of-tree modules;
the reason for S has not been established.

Is this a known EHCI scheduling limitation?

Thank you.
Oleksandr Holetsek

--0000000000007e70fa065fa4d0cf
Content-Type: text/plain; charset="US-ASCII"; name="failed-allocation-excerpt.txt"
Content-Disposition: attachment; filename="failed-allocation-excerpt.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mw5nzc3r2>
X-Attachment-Id: f_mw5nzc3r2

RlMvTFMgYmFuZHdpZHRoIGFsbG9jYXRpb24gKHVzIHBlciBmcmFtZSk6CjM0NyAzNDcgMzQ3IDM0
NyAzNjIgMzQ3IDM0NyAzNDcKRlMvTFMgYnVkZ2V0ICh1cyBwZXIgbWljcm9mcmFtZSksIHR5cGlj
YWwgZnJhbWU6CjEyNSAxMjUgOTcgMCAwIDAgMCAwCjItMS41IGVwIDgzOiAgICAxNSBAICA0LjIr
OCBtYXNrIDcwMDQKMi0xLjYgZXAgODE6ICAgIDE4IEAgIDAuMSsxIG1hc2sgMzgwMgoyLTEuNiBl
cCA4MjogICAgNjEgQCAgMC4xKzEgbWFzayAzODAyCjItMS4xIGVwIDgxOiAgICAyNCBAICAwLjAr
MSBtYXNrIDFjMDEKMi0xLjIgZXAgODE6ICAgIDYxIEAgIDAuMCsxIG1hc2sgMWMwMQoyLTEuMiBl
cCA4MjogICAgNjEgQCAgMC4wKzEgbWFzayAxYzAxCjItMS4yIGVwIDgzOiAgICA2MSBAICAwLjEr
MSBtYXNrIDM4MDIKMi0xLjIgZXAgODQ6ICAgIDYxIEAgIDAuMisxIG1hc2sgNzAwNAo=
--0000000000007e70fa065fa4d0cf
Content-Type: text/plain; charset="US-ASCII"; name="system.txt"
Content-Disposition: attachment; filename="system.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mw5nzc2t0>
X-Attachment-Id: f_mw5nzc2t0

JCB1bmFtZSAtYQpMaW51eCBhcmNoIDcuMi4xNC1hcmNoMS0xICMxIFNNUCBQUkVFTVBUX0RZTkFN
SUMgRnJpLCAzMCBPY3QgMjAyNiAxNDozMjo0MCArMDAwMCB4ODZfNjQgR05VL0xpbnV4CgokIGNh
dCAvcHJvYy92ZXJzaW9uCkxpbnV4IHZlcnNpb24gNy4yLjE0LWFyY2gxLTEgKGxpbnV4QGFyY2hs
aW51eCkgKGdjYyAoR0NDKSAxNi4yLjEgMjAyNjA4MTAsIEdOVSBsZCAoR05VIEJpbnV0aWxzKSAy
LjQ3KSAjMSBTTVAgUFJFRU1QVF9EWU5BTUlDIEZyaSwgMzAgT2N0IDIwMjYgMTQ6MzI6NDAgKzAw
MDAKCiQgcGFjbWFuIC1RIGxpbnV4IHBpcGV3aXJlIHBpcGV3aXJlLXB1bHNlIHdpcmVwbHVtYmVy
CmxpbnV4IDcuMi4xNC5hcmNoMS0xCnBpcGV3aXJlIDE6MS42LjEwLTEKcGlwZXdpcmUtcHVsc2Ug
MToxLjYuMTAtMQp3aXJlcGx1bWJlciAwLjUuMTgtMQoKJCBsc3BjaSAtbm5rIC1zIDAwOjFhLjAK
MDA6MWEuMCBVU0IgY29udHJvbGxlciBbMGMwM106IEludGVsIENvcnBvcmF0aW9uIDYgU2VyaWVz
L0MyMDAgU2VyaWVzIENoaXBzZXQgRmFtaWx5IFVTQiBFbmhhbmNlZCBIb3N0IENvbnRyb2xsZXIg
IzIgWzgwODY6MWMyZF0gKHJldiAwNSkKCVN1YnN5c3RlbTogR2lnYWJ5dGUgVGVjaG5vbG9neSBD
by4sIEx0ZCBEZXZpY2UgWzE0NTg6NTAwNl0KCUtlcm5lbCBkcml2ZXIgaW4gdXNlOiBlaGNpLXBj
aQoJS2VybmVsIG1vZHVsZXM6IGVoY2lfcGNpCgokIGxzcGNpIC1ubmsgLXMgMDA6MWQuMAowMDox
ZC4wIFVTQiBjb250cm9sbGVyIFswYzAzXTogSW50ZWwgQ29ycG9yYXRpb24gNiBTZXJpZXMvQzIw
MCBTZXJpZXMgQ2hpcHNldCBGYW1pbHkgVVNCIEVuaGFuY2VkIEhvc3QgQ29udHJvbGxlciAjMSBb
ODA4NjoxYzI2XSAocmV2IDA1KQoJU3Vic3lzdGVtOiBHaWdhYnl0ZSBUZWNobm9sb2d5IENvLiwg
THRkIERldmljZSBbMTQ1ODo1MDA2XQoJS2VybmVsIGRyaXZlciBpbiB1c2U6IGVoY2ktcGNpCglL
ZXJuZWwgbW9kdWxlczogZWhjaV9wY2kKCmJvYXJkX3ZlbmRvcjogR2lnYWJ5dGUgVGVjaG5vbG9n
eSBDby4sIEx0ZC4KCmJvYXJkX25hbWU6IEg2MU0tUzEKCmJvYXJkX3ZlcnNpb246IHgueAoKYmlv
c192ZW5kb3I6IEFtZXJpY2FuIE1lZ2F0cmVuZHMgSW5jLgoKYmlvc192ZXJzaW9uOiAxMGIKCmJp
b3NfZGF0ZTogMDIvMjUvMjAxNAoKa2VybmVsIHRhaW50OiAxMjI5MwoKVGFpbnQgYml0cyBzZXQ6
IDAgKHByb3ByaWV0YXJ5KSwgMiAob3V0LW9mLXNwZWNpZmljYXRpb24pLCAxMiAob3V0LW9mLXRy
ZWUpLCAxMyAodW5zaWduZWQpLiBOVklESUEgbW9kdWxlcyByZXBvcnQgUE9FOyByZWFzb24gZm9y
IGJpdCAyIG5vdCBlc3RhYmxpc2hlZC4KCkNPTkZJR19VU0JfRUhDSV9IQ0Q9eQpDT05GSUdfVVNC
X0VIQ0lfUk9PVF9IVUJfVFQ9eQpDT05GSUdfVVNCX0VIQ0lfVFRfTkVXU0NIRUQ9eQpDT05GSUdf
VVNCX0VIQ0lfUENJPXkKQ09ORklHX1VTQl9FSENJX0ZTTD1tCkNPTkZJR19VU0JfRUhDSV9IQ0Rf
UExBVEZPUk09bQo=
--0000000000007e70fa065fa4d0cf
Content-Type: text/plain; charset="US-ASCII"; name="kernel-usb-errors.txt"
Content-Disposition: attachment; filename="kernel-usb-errors.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mw5nzc403>
X-Attachment-Id: f_mw5nzc403

Tm92IDA2IDIyOjI0OjI0IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJi
IDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI0OjI1IGFyY2gg
a2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVu
b3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI0OjI2IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNh
bm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2
IDIyOjI0OjI3IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVy
cm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI0OjMyIGFyY2gga2VybmVs
OiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBi
YW5kd2lkdGgKTm92IDA2IDIyOjI2OjU3IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBz
dWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI2
OjU4IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0y
ODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI2OjU5IGFyY2gga2VybmVsOiB1c2Ig
Mi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lk
dGgKTm92IDA2IDIyOjI3OjAwIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQg
dXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI3OjA1IGFy
Y2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90
IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI3OjEwIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6
IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92
IDA2IDIyOjI3OjE1IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAs
IGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI3OjIwIGFyY2gga2Vy
bmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3Vn
aCBiYW5kd2lkdGgKTm92IDA2IDIyOjI3OjI1IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5v
dCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIy
OjI3OjMwIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9y
IC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI3OjMyIGFyY2gga2VybmVsOiB1
c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5k
d2lkdGgKTm92IDA2IDIyOjI3OjM1IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJt
aXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjI3OjQ0
IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODog
bm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQyOjIyIGFyY2gga2VybmVsOiB1c2IgMi0x
LjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgK
Tm92IDA2IDIyOjQyOjIzIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJi
IDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQyOjI0IGFyY2gg
a2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVu
b3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQyOjI1IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNh
bm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2
IDIyOjQzOjMwIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVy
cm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQzOjMxIGFyY2gga2VybmVs
OiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBi
YW5kd2lkdGgKTm92IDA2IDIyOjQzOjMyIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBz
dWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQz
OjMzIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0y
ODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQ3OjQ3IGFyY2gga2VybmVsOiB1c2Ig
Mi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lk
dGgKTm92IDA2IDIyOjQ3OjQ4IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQg
dXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQ3OjQ5IGFy
Y2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90
IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjQ3OjUwIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6
IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92
IDA2IDIyOjUyOjA0IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAs
IGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjA1IGFyY2gga2Vy
bmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3Vn
aCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjA2IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5v
dCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIy
OjUyOjA3IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9y
IC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjEyIGFyY2gga2VybmVsOiB1
c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5k
d2lkdGgKTm92IDA2IDIyOjUyOjM2IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJt
aXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjQx
IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODog
bm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjQ2IGFyY2gga2VybmVsOiB1c2IgMi0x
LjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgK
Tm92IDA2IDIyOjUyOjUxIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJi
IDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjUxIGFyY2gg
a2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVu
b3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjUxIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNh
bm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2
IDIyOjUyOjU0IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVy
cm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUyOjU0IGFyY2gga2VybmVs
OiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBi
YW5kd2lkdGgKTm92IDA2IDIyOjUyOjU2IGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBz
dWJtaXQgdXJiIDAsIGVycm9yIC0yODogbm90IGVub3VnaCBiYW5kd2lkdGgKTm92IDA2IDIyOjUz
OjAxIGFyY2gga2VybmVsOiB1c2IgMi0xLjU6IGNhbm5vdCBzdWJtaXQgdXJiIDAsIGVycm9yIC0y
ODogbm90IGVub3VnaCBiYW5kd2lkdGgK
--0000000000007e70fa065fa4d0cf
Content-Type: text/plain; charset="US-ASCII"; name="working-allocation-excerpt.txt"
Content-Disposition: attachment; filename="working-allocation-excerpt.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mw5nzc3d1>
X-Attachment-Id: f_mw5nzc3d1

RlMvTFMgYmFuZHdpZHRoIGFsbG9jYXRpb24gKHVzIHBlciBmcmFtZSk6CjUxMyA1MTMgNTEzIDUx
MyA1MTMgNTEzIDUyOCA1MTMKRlMvTFMgYnVkZ2V0ICh1cyBwZXIgbWljcm9mcmFtZSksIHR5cGlj
YWwgZnJhbWU6CjEyNSAxMjUgMTI1IDEyNSAxMyAwIDAgMAoyLTEuNiBlcCA4MTogICAgMTggQCAg
MC4xKzEgbWFzayAzODAyCjItMS42IGVwIDgyOiAgICA2MSBAICAwLjErMSBtYXNrIDM4MDIKMi0x
LjEgZXAgODE6ICAgIDI0IEAgIDAuMCsxIG1hc2sgMWMwMQoyLTEuNSBlcCA4MzogICAgMTUgQCAg
Ni4wKzggbWFzayAxYzAxCjItMS41IGVwIDgyOiAgIDE2NiBAICAwLjIrMSBtYXNrIGYwMDQKMi0x
LjIgZXAgODE6ICAgIDYxIEAgIDAuMCsxIG1hc2sgMWMwMQoyLTEuMiBlcCA4MjogICAgNjEgQCAg
MC4wKzEgbWFzayAxYzAxCjItMS4yIGVwIDgzOiAgICA2MSBAICAwLjErMSBtYXNrIDM4MDIKMi0x
LjIgZXAgODQ6ICAgIDYxIEAgIDAuMysxIG1hc2sgZTAwOAo=
--0000000000007e70fa065fa4d0cf--

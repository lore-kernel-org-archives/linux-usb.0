Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520002;
	b=gpRX0TlLCLuI4e0Z0XZ132GfHSFJ1oZaN0RNb+T51l2hcenXSzeW7wDGeQqlz3B4qmU2
	 2eNBhR7GMsqLRYaTBPpxhlY7WzDsLwWGBYpE0lIzJZ9ConG5Ofba5ebXN0e5xCJLK+hJQ
	 LEGn97cjb3hzNzJXLlJq2aF3hcC0EaogbO+Id1CBqo9f1VjM0EQtNCGr60ESLF7fEO1gw
	 jKXw8gmFsGAu6d43Z6ylFJB4mfkTAIHoZyet49YUvYHrjHASuXInq3f0U86znwGcDOvrU
	 WmHh9BX8eqRLMC9aRX/elOEiUK0TspzKZVFUFronsXyBnJ1rZOXMIcCshySZ+0KqTzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520002;
	h=DMARC-Filter:X-Originating-IP:X-Works-Smtp-Source:Received:
	 DKIM-Signature:X-Session-ID:MIME-Version:Message-ID:Date:From:
	 In-Reply-To:References:Importance:To:Cc:Subject:X-Originating-IP:
	 X-Works-Send-Opt:Content-Type:Content-Transfer-Encoding;
	bh=4liDSZC6O8PGJR5EtoBBWb1/do3eriDJ6f0uaDnNs6A=;
	b=ph+PovpQwh6Q5FpqekZaQbnBmsfTvxfa4qDJCVpjb4aSFERY9ZGTVI96RAiHbE+SQT6O
	 rDYJR6+AvUvNBlLw0fcIWT/vLDjeIz07cTchXr0MlRHlFkIfo4CiRKFp92y6HVl4fGfpm
	 frfMBbi85LL9RYnAWhnIYOSq3dEQOrGz++NaFyw21r7dFKnsYqYR4D64hWg8KZSY2/jfC
	 AYQDZwVeZzpT4k6s6FV5FsYS4Z4q4l25vKV/HrVatZLycL+/sgSe6QS1StcsIJeh7vw3E
	 yKTLb3sfJDvPqPxcIPRwviXIfkNEj4hty07cY0HSJzlAauNnQVc2nALfoT/xFPNVZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b="Otoiruw/";
	arc=none smtp.remote-ip=114.111.35.100
Received: from cvsmtppost02.nm.naver.com (cvsmtppost02.nm.naver.com [114.111.35.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727E9606A327
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 18:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 727E9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=Otoiruw/
X-Works-Smtp-Source: f/Y/FAUlFqJCpNm/aAEXWHF0
Received: from nv1s-hmac-real-31 ([10.180.31.91])
  by cvsmtppost02.nm.naver.com with ESMTP id I4VvQCTGR6uDjI1R66fJWw
  for <multiple recipients>;
  Tue, 20 Oct 2026 18:13:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1792519988; bh=4liDSZC6O8PGJR5EtoBBWb1/do3eriDJ6f0uaDnNs6A=;
	h=Message-ID:Date:From:To:Subject:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Otoiruw/v1rqSrufPbdIwhExz0pHqsaGLFJu3B2NG0YXs9HlK+eXSJISw6+50j1ew
	 02yIIEW0F/Hc+CXTfPCBW/gSu0ks2wNkVb2QNu6bMm+RdjWBI35qyZdyKSoNcws8rB
	 R1o9efdNJBzh/ZwnBdjdPXYrY72N9qX+G7eeSUEnkSk38SVTg3WiK5ucODJ0LpoVuO
	 jUg6P94a1mTIvWsSJDPpl1/OZwGjS/5PcyqW5x/WVG/ztF0C/IQL99NeslLhvOVHk8
	 21Utj8iKLL8Uhccb8JACEyZZC7RmFJnFvEoAZ9Y7dJrWxG03GXoQsycCptTLbwzD8C
	 ayIuLjrgaF2dA==
X-Session-ID: 64e5b39724f4da7a6779f7c91e26da4b47ca29e36f706ee48597f65d1d445c69
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <f5323f2896832bc270fce3abb33ada1c@cweb014.nm>
Date: Wed, 21 Oct 2026 03:13:08 +0900
From: =?utf-8?B?7ISx67OR7LCs?= <tjdqudcks0424@naver.com>
In-Reply-To: <ea08392d-dd6c-493a-9e8e-f788bc2cd158@linuxfoundation.org>
References: <20261008134107.265827-1-tjdqudcks0424@naver.com>
	<ea08392d-dd6c-493a-9e8e-f788bc2cd158@linuxfoundation.org>
Importance: normal
To: =?utf-8?B?U2h1YWggS2hhbg==?= <skhan@linuxfoundation.org>,
	<valentina.manea.m@gmail.com>,
	<shuah@kernel.org>
Cc: <linux-usb@vger.kernel.org>
Subject: =?utf-8?B?UmU6IFtQQVRDSF0gdXNiaXA6IGF2b2lkIGRlcmVmZXJlbmNpbmcgYSBtaXNzaW5nIGRldg==?=
	=?utf-8?B?aWNlIGluIHJlY2VpdmUgZXJyb3Jz?=
X-Works-Send-Opt: OPFwpzGdjHmdKHFOMr39Ko3YKHmdjAudFqM9KqMqFxIYkEljxBmwjAg=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU2h1YWgsCgpUaGFuayB5b3UgZm9yIHJldmlld2luZyB0aGlzLgoKSSB2ZXJpZmllZCB0aGUg
Zml4IGluIGEgbmV0d29yay1pc29sYXRlZCB4ODZfNjQgUUVNVSBndWVzdCBhdApmZjQ3NjUyYTRi
NjZjMDY3Yzc2NWE3YWQ0NjRkOTMwYjVhOTM2N2NjLCB1c2luZyBhIEtBU0FOIGtlcm5lbCB3aXRo
CnBhbmljX29uX3dhcm49MSwgb29wcz1wYW5pYyBhbmQgcGFuaWM9MS4KClRoZSBmaXh0dXJlIHJ1
bnMgYXMgUElEIDEgaW4gdGhlIGd1ZXN0IGFuZCB1c2VzIHRoZSBwcm9kdWN0aW9uIFZVREMgcGF0
aC4gSXQKY3JlYXRlcyBhIGNvbmZpZ2ZzIEhJRCBnYWRnZXQgd2l0aCBhIDY0LWJ5dGUgT3V0cHV0
IHJlcG9ydCwgYmluZHMgaXQgdG8KdXNiaXAtdnVkYy4wLCBhdHRhY2hlcyBvbmUgZW5kIG9mIGEg
bG9jYWwgc29ja2V0cGFpciB0aHJvdWdoIHVzYmlwX3NvY2tmZCwgYW5kCnVzZXMgdGhlIG90aGVy
IGVuZCBhcyB0aGUgVVNCL0lQIHBlZXIuIEl0IGRvZXMgbm90IGNhbGwKdl9yZWN2X2NtZF9zdWJt
aXQoKSBvciBhbm90aGVyIGludGVybmFsIFZVREMgaGVscGVyIGRpcmVjdGx5LgoKQWZ0ZXIgZW51
bWVyYXRpb24sIHRoZSBmaXh0dXJlIGZvdW5kIGEgcmVhbCBpbnRlcnJ1cHQtT1VUIGVuZHBvaW50
IGF0IDB4MDMKd2l0aCBhIDY0LWJ5dGUgbWF4aW11bSBwYWNrZXQgc2l6ZS4gVGhlIGZhaWx1cmUg
Y2FzZSBzZW50IGEgQ01EX1NVQk1JVCBoZWFkZXIKYWR2ZXJ0aXNpbmcgYSA2NC1ieXRlIE9VVCBw
YXlsb2FkLCBidXQgc2VudCBub25lIG9mIHRoYXQgcGF5bG9hZCBiZWZvcmUKY2xvc2luZyB0aGUg
dHJhbnNwb3J0LgoKT24gdGhlIHVubW9kaWZpZWQga2VybmVsLCB0aGF0IGNhc2UgcmVwcm9kdWNl
ZCBpbiB0aHJlZSBmcmVzaCBib290cy4gRWFjaCBydW4KcmVwb3J0ZWQgYSBLQVNBTiBOVUxMIHBv
aW50ZXIgZGVyZWZlcmVuY2UgaW4gX19kZXZfcHJpbnRrKCksIHJlYWNoZWQgZnJvbQp1c2JpcF9y
ZWN2X3hidWZmKCksIGFuZCB0aGVuIHBhbmlja2VkIHRoZSBndWVzdC4KCldpdGggdGhlIHBhdGNo
IGFwcGxpZWQsIHRoZSBpZGVudGljYWwgY2FzZSBjb21wbGV0ZWQgYXMgYSBib3VuZGVkIHJlY2Vp
dmUKZXJyb3IgaW4gdGhyZWUgZnJlc2ggYm9vdHMuIFRoZSBrZXJuZWwgcmVtYWluZWQgYWxpdmUs
IHRoZSBmaXh0dXJlIGVzdGFibGlzaGVkCmEgbmV3IFZVREMgdHJhbnNwb3J0LCBhbmQgYSBmb2xs
b3dpbmcgdmFsaWQgNjQtYnl0ZSBpbnRlcnJ1cHQtT1VUIHRyYW5zZmVyCmNvbXBsZXRlZCBzdWNj
ZXNzZnVsbHkuCgpJIGFsc28gcmFuIHR3byBjb250cm9scyBpbiB0aHJlZSBmcmVzaCBib290cyBl
YWNoIG9uIGJvdGgga2VybmVsczoKCiAgLSBhIG5vcm1hbCA2NC1ieXRlIGludGVycnVwdC1PVVQg
dHJhbnNmZXI7CiAgLSBhIG5lYXItbmVnYXRpdmUgNjMtYnl0ZSBpbnRlcnJ1cHQtT1VUIHRyYW5z
ZmVyLgoKQm90aCBjb250cm9scyBjb21wbGV0ZWQgc3VjY2Vzc2Z1bGx5IGluIGFsbCBydW5zLiBU
aGUga2VybmVsIGNvbmZpZ3VyYXRpb24gYW5kCmZpeHR1cmUgd2VyZSB1bmNoYW5nZWQgYmV0d2Vl
biB0aGUgYmFzZWxpbmUgYW5kIGZpeGVkIHJ1bnM7IHRoZSBmaXhlZCBpbWFnZQp3YXMgdGhlIHNh
bWUgYmFzZSBwbHVzIHRoaXMgcGF0Y2guCgpJIGhhdmUgcmV0YWluZWQgdGhlIGZpeHR1cmUgc291
cmNlIGFuZCB0aGUgY29tcGxldGUgc2VyaWFsIGxvZ3MgYW5kIGNhbiBwcm92aWRlCnRoZW0gaWYg
dXNlZnVsLgoKVGhhbmtzLApTdW5nIGJ5ZW9uZ2NoYW4=

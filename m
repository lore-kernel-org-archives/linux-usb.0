Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.205.118.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732828;
	b=299Kz76QaV2k0lWmMGWuHHz19p0o4Wl2/UNk9kz3lrAq91bwfQJS9gT9gkBnYEtQ0gCa
	 1rXOOWuHTD1rxJePEs0tdJWHMaxf6j5eogvnce+ZfCtR5yiG703C0CGpW8Q2Pk8KCB2Eq
	 P3XRIqDuWKGb7aJMrt+J3pzbhbYooiGNHYUs96VEgzNycMslwwOCbeuCTdAEjMxt07Cde
	 5/AdRQuYda7WLbPhAu1AsFxEhVwVVsDNVMJnIopnxJFHAphAX8L6U7U1riTUfy+zfinSt
	 ppqKEQgwniV8Y9LugI+JzMP9iiEuurGVyBVdQwrTZ2R8jGcDNg9RWK+h+a11irqJFyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732828;
	h=DMARC-Filter:DKIM-Signature:X-Sending-Service:Feedback-ID:
	 X-ImprovMX-Server-Id:X-ImprovMX-Session-Id:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AJtKqvXxfKG1QOSyh4hbzHSTjOrqJfm/k5GdfM4uZXk=;
	b=VtjEp/n6K8gmpm/TqgrlS8fSLieHeFvOvpe4PpqlWELmVUjARqmLpe9HTHX4b5BZoGEq
	 Uz/2WCIrOqs7ogwZn54l0CGi+WVSwUBWfyZIgzNUN5N/w6frb4uI82Ib9rgkzbdNxSt1M
	 T0NVl1DGuqCD9+1kJRbhQW7qS1X1h3cq166bpDAOk+TBUVnsmm7L0s4inpL1wIOY2Y2PV
	 2F9/3aAqJwAr53j6m/IORKLWlJdz9cm8mXljDrKr6BmkrI/5BRIC3AFK5Sra5ygUpfrde
	 DoRnYOxg1EKE+aX4h8/bHLxs3ffT/Y1MvGhhqKIdUaxVTXc6MpckYZMqGVnbTCXvLvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=necauq.ua;
	spf=pass smtp.mailfrom=necauq.ua;
	dkim=pass header.d=necauq.ua header.i=@necauq.ua header.a=rsa-sha256 header.s=dkimprovmx2 header.b="cl/JCjuO";
	arc=none smtp.remote-ip=209.205.118.86
Received: from mail9.mxsv1.infra.improvmx.com (mail9.mxsv1.infra.improvmx.com [209.205.118.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F4C606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 19:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F4C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=necauq.ua
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=necauq.ua
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=necauq.ua header.i=@necauq.ua header.a=rsa-sha256 header.s=dkimprovmx2 header.b=cl/JCjuO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=necauq.ua;
 i=@necauq.ua; q=dns/txt; s=dkimprovmx2; t=1793732816; h=date : from :
 to : subject : content-type : feedback-id : message-id;
 bh=AJtKqvXxfKG1QOSyh4hbzHSTjOrqJfm/k5GdfM4uZXk=;
 b=cl/JCjuORiCx/piiSzMvwr6Iu+JUxMScwuhvIa8eRJ7kS4J1j85b5eyp4Mt7Xaf13hgFo
 VvoQjwuGHRCosIIxNBoxxiV9TGVVERw//mFafKGK7BFhIqHX5yNnJqeza3nZVZW8D3hBB+u
 zL6gFhYgmX3jO0QS2kHo8xUqGRDP5zT+Jnrt1O3uH1p2O3KPpneu/hhlvTqdkBHBh1FNIQK
 lL4F1mm/7sX/kypieTgdvEd9/2TvVx4QcL7Zgb/4s1BbXoJnQ+rLTS0LIPe4QPk4UR97V+h
 /GJZBitocxX/UpqsS9ACuZIWIwsZCyXSurHGw19gzsp0rI56yn+jvIW9POSg==
X-Sending-Service: ImprovMX v3.0.0
Feedback-ID: sendsmtp-38567:cust-necauq.ua::improvmx
X-ImprovMX-Server-Id: fa6a4a3
X-ImprovMX-Session-Id:
 75ece4f1-6063-4b01-9487-2796f7c2ec00
Received: from [192.168.1.7] (host-176-36-68-142.b024.la.net.ua.
 [176.36.68.142])
    by smtp.improvmx.com with ESMTPSA (version=TLSv1.3
 cipher=TLS_AES_256_GCM_SHA384 bits=256/256)
    for <linux-usb@vger.kernel.org>;
    Tue, 03 Nov 2026 19:06:56 -0000
Message-ID: <0e499195-2143-4e55-9f90-1040c8d251b2@necauq.ua>
Date: Tue, 3 Nov 2026 21:06:45 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: Gen2 root port links reported as SuperSpeed when port
 capabilities have different PSI tables
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
References: <8a954797-4eb4-44db-b53f-6e83f4b7b03a@necauq.ua>
 <2b7017e3-2a3a-4ddf-8a47-54f85174893a@linux.intel.com>
Content-Language: en-US
From: Anton Bulakh <him@necauq.ua>
In-Reply-To: <2b7017e3-2a3a-4ddf-8a47-54f85174893a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIwMjYtMTEtMDIgMTc6MzU6MjcsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IGNvZGUg
YmVsb3cgc2hvdWxkIGRvIHRoYXQsIGRvZXMgaXQgd29yayBmb3IgeW91Pw0KDQpUaGlzIHdv
cmtlZCBncmVhdCBvbiBteSBzZXR1cCwgb24gNi4xOC41OSArIHlvdXIgcGF0Y2ggdGhhdCBW
TDgyMiBodWIgDQooR2VuMikgc2hvd3MgZm9yIGVhY2ggdGVzdGVkIHBvcnQgKGRtZXNnKToN
Cg0KICAgcG9ydCAxMCAoNC00KTogdXNiIDQtNDogbmV3IFN1cGVyU3BlZWQgUGx1cyBHZW4g
MngxIFVTQiBkZXZpY2UgbnVtYmVyIA0KMiB1c2luZyB4aGNpX2hjZA0KICAgcG9ydCA5ICAo
NC0zKTogdXNiIDQtMzogbmV3IFN1cGVyU3BlZWQgUGx1cyBHZW4gMngxIFVTQiBkZXZpY2Ug
bnVtYmVyIA0KNiB1c2luZyB4aGNpX2hjZA0KICAgcG9ydCA3ICAoNC0xKTogdXNiIDQtMTog
bmV3IFN1cGVyU3BlZWQgVVNCIGRldmljZSBudW1iZXIgOSB1c2luZyB4aGNpX2hjZA0KDQpz
eXNmcyBzcGVlZCBpcyAxMDAwMCBvbiBwb3J0cyA5IGFuZCAxMCwgYW5kIDUwMDAgb24gdGhl
IEdlbjEtb25seSBwb3J0IA0KNywgYXMgZXhwZWN0ZWQuDQoNCk9uIHRoZSBvdGhlciBjb250
cm9sbGVyICgwMDAwOjBiOjAwLjMsIGFsbCBwb3J0cyBHZW4xIG9ubHkpIHRoZSBodWIgDQpz
aG93cyB1cCBhcyBTdXBlclNwZWVkICg1IEdicHMpIG9uIDYtMywgdGhlIHNhbWUgYXMgd2l0
aG91dCB0aGUgcGF0Y2guDQoNClRoZSByb290IGh1YiBCT1Mgb2YgYnVzIDQgbm93IGhhcyAi
U3VibGluayBTcGVlZCBBdHRyaWJ1dGUgY291bnQgNCIgYW5kIA0KIlN1YmxpbmsgU3BlZWQg
SUQgY291bnQgMiIgKElEcyA0IGFuZCA1KS4NCg0KVGhhbmtzLA0KQW50b24NCg0KDQo=

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896366;
	b=ueTiy+3qn2d35jSgdTLvIoylM7KupFlzalBYEKA7y7FX23Tp/fiU9elZxqFLUUe/tiel
	 k2Qmhig//vBgISIXT/D7YogS0zZBA67LTH8GLv7rcEg3ZKqdSNDhibrsUiayd/r3qeGIL
	 Njz4duoNpW+URiDiouaBC6mrVKADBGV3joMqNqIBIHgb7UkXFhM1Bi3ho49AihGgEJPWH
	 BZ3Pr1hdcczz5cWpLgSq+BDYTybZslS4xz14IJQL/j2n7UtC64CVGdZzXE8vDwFNE546g
	 62svDW4uZBXVbDwrmLNatA1jIuwuZR2BU2l+2umS0v3qRc1SKfeXsbd1NN9Fz1qkYQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=d4uIAeI9pE7bf79BRULVqsTB5We4Hv2szuGRJya4Up0=;
	b=EL0GPFoVugAMocq8IR3LgYmfY5KI7hONNMvCo7+SKEadvxPRVIuTkqdwD2Z0p6fqIdBW
	 q3vrZUYx1BAvadTi/Ps4yddkuerrC8zvWqVP049cXRTa5upi3Y4SPm+ypBF7rOSG0F4x9
	 5kXV9EKgwUQupLTxD3+FKD8kJ9MNx8M1DA3f5folL8FaRyO/UOwkJveCOddUYkIbRWquw
	 rm8oeWRcFaVx0VaohLo0PCMJIKZv5/jywoKowJLn74/SxiytACHQO3/qTwkq02G6E4rPb
	 xCRtPYbhjM9HkXTXYtK61dIsFReBqqfaTabVfffK8jHxV5G/uVg9oDgXKEPKVUeAWog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+RCLFZ+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22C1606CBEE
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 16:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B22C1606CBEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+RCLFZ+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17976755e9.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896364; x=1794501164; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d4uIAeI9pE7bf79BRULVqsTB5We4Hv2szuGRJya4Up0=;
        b=L+RCLFZ+XDkVbcrN62FO5f3KVS7QxUn2L4lZN5Aeml1NUIudbAs4Pud79K1BkbmrfK
         WVxGgnqWzfVwdH1Jm/dw9fPG/2DqdKkg0SMy99SSYrbSTAEqm/RLw3oKquOd6jCHea8M
         LAD9hoiqTWZp/815iBMYBZRDKlEkhBgrD07HiStjm+Y11/Db6WRaOyZLVH8HFJIH/Xbs
         /O66mmq9/h1xhqEIFAbVR3i2M3HIQ8iGGic1/G6en8TbyZsbfFvrgbDkZbPVMqpqqHoC
         GpkYub7bOSPO964LhWoj/OVIrX/VKtGzTzdNX7pKKLa5InZyEU68i5cfbkNHNn0qB3wF
         bmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896364; x=1794501164;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4uIAeI9pE7bf79BRULVqsTB5We4Hv2szuGRJya4Up0=;
        b=YjHnNGCJyWr7bCoZKAdtViu8eUv7W2+/Sh0Vj8RKW3q0PuWjI4TeYRo8dzLCjWdkJl
         IQ78Hx0H/rncBoJ4mQHs+1MSx+UDKn/Jy2QQwywnrydH5tqJlj3q+34kE8aa38tUwvmP
         Zh3vZ/1R7SDnFSZu5NzrzP0wy6kJFrRaZMEsyJAxRbuBqnjXFdOzqy9w4i0Hxg99Mbvi
         7P8eheRvz1EUvJCnbLbSOTjEBpS1z77NOLnb5QQozE773/ekGuq5ZqqykeIkRXT1aR/1
         bR8wn6Gj06YWK1KrBp5yRd0HimeW2Ef5pD0PDrCsPOvErnEGEvnOa8cqNOZBoCOpHUPt
         FQVw==
X-Forwarded-Encrypted: i=1; AKwUvBxDYK1X8lqI505mygvTy3zxbN5RT3tNich329/sIt5XGir8l0125HtRl5h7b7f0USo3fX5aQn1npCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M+5Kld68bR6oop7M+bl92/hjZ6oFuHOekn56zMt/VEWc/h+f6
	7HmhJ+7rRG6WreGAa7XgFshNULPkEMQ5TIM0y+R/hSZG4mV9Wt1ni7mC
X-Gm-Gg: AYBFou2O7z8zbmqDnUDPJV+JA0N9f2JS6DXjBH1M5Q++sx3oSkGxB0V8P1CIh9Q1RNx
	p6M9v9bTQePQJsLPKJunzb3x1THqrZkq+t8urdvNhF8ou09OhbFxfEnR3qZu5Bog6ki4VSYVlym
	Hs1mTEtcwSvhn/2BAD2tWhsmijEt4Y5yJvK8dtuwcNdP246XIkW2ryXClGLNi3wGBFbRcinWGQ8
	pZRDCsb7TDiR7yGainpzUEj2WdBiPTKzsimoCfkWM4+YWvsbqlNY+ynVYjmdyfJJDZ4WR8o+xol
	bNK4h3JGztQu5NFFlSYeQxgXkS27ifXmsIvtu9ECAmBOuK6gFxkoBFjepPkH21acZkc7Rnkl2Qi
	SQqkxc1QvkQGlxy2k/R8F5Jjvs6WWmkRxfOtAYH/Seddo4Q8LiJbFVkNKAocHIRh/CV671KX9Be
	7Lf8RZ0odwmL26Sbw1WsyDJ+yL3lJnVOxLR7lpFd2FML9KJSTS/X9fJ2gwocYzld0Y9q0l4vHb3
	FLsBdCKeuaLFZ04Gc74OWJ4Zc9kMj9MhGuqO20VegQRnjsBBeQM0ZC6v4HBfJrVLtRHTNfcj1EO
	GJHi/eqkURFvMeAJJuY2+FmX+PYzitRfO6LxrA5Hmmt5dRt3COA6cFL2GSXrGJ6NkJe24QszRgJ
	RSNz3ZJ2x
X-Received: by 2002:a05:600c:3b87:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ac1709ad56mr464115355e9.13.1793896363894;
        Thu, 05 Nov 2026 08:32:43 -0800 (PST)
Received: from [192.168.1.86] (240.red-79-154-229.dynamicip.rima-tde.net. [79.154.229.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22e1sm89764875e9.14.2026.11.05.08.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:32:43 -0800 (PST)
Message-ID: <0e3689d102abf41b1e788402cc9da354d5c2d969.camel@gmail.com>
Subject: Re: [PATCH 0/3] dma-buf: dma-fence: Remove dma_fence_init64()
From: Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	etnaviv@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	imagination@lists.freedesktop.org, lima@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, virtualization@lists.linux.dev, 
	spice-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.or
Date: Thu, 05 Nov 2026 17:32:42 +0100
In-Reply-To: <20261105113529.1989375-2-phasta@kernel.org>
References: <20261105113529.1989375-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

T24gVGh1LCAyMDI2LTExLTA1IGF0IDEyOjM1ICswMTAwLCBQaGlsaXBwIFN0YW5uZXIgd3JvdGU6
Cj4gV2UgcmVjZW50bHkgaGFkIGEgZGlzY3Vzc2lvbiBhYm91dCByZXdvcmtpbmcgZG1hX2ZlbmNl
IGluaXQgdG8gY2xvc2UKPiBhCj4gcmFjZS13aW5kb3cgWzFdLgo+IAo+IFRoZSBjb21tdW5pdHkg
YWdyZWVtZW50IHNlZW1zIHRvIGhhdmUgYmVlbiB0aGF0IHdlIGNhbiBnZXQgcmlkIG9mCj4gZG1h
X2ZlbmNlX2luaXQ2NCgpLCBzbyBsZXQncyBkbyB0aGF0IGFscmVhZHkuIEluIHRoZSBtZWFudGlt
ZSB3ZSBjYW4KPiBjb250aW51ZSBvdXIgZGlzY3Vzc2lvbnMgcmVnYXJkaW5nIHRoZSByYWNlIGlu
IFsxXS4KPiAKPiBUaGlzIGFsc28gdG91Y2hlcyB0aGUgUnVzdCBkbWFfZmVuY2UsIHdoaWNoIGFj
dHVhbGx5IHNob3VsZCB1c2UgNjQtCj4gYml0Cj4gc2Vxbm9zICh3YXMgZm9yZ290dGVuIHNvIGZh
cikuIFJ1c3QgZmVuY2UgaGFzIG5vIHVzZXJzIGN1cnJlbnRseSwgc28KPiBuZWVkcyBubyBiYWNr
cG9ydGluZywgc28gSSB3b3VsZCBsaWtlIHRvIGFkZHJlc3MgdGhhdCBpbiBhIGRpc3RpbmN0Cj4g
cGF0Y2guCj4gCj4gVGVzdGVkIG9uIE5vdXZlYXUgd2l0aCBhbmQgd2l0aG91dCB0aGUgU0VRTk82
NCBmbGFnLiBOb3V2ZWF1IGFsc28KPiB1c2VzCj4gdGhlIFVTRVIgZmxhZywgc28gSSBob3BlIHdl
J3JlIGZpbmUuCj4gCj4gCj4gUC4KPiAKPiBbMV0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9k
cmktZGV2ZWwvMjAyNjEwMjkwOTU1NDIuMTUyNjc1MC0zLXBoYXN0YUBrZXJuZWwub3JnLwoKTWFr
ZXMgZ29vZCBzZW5zZSB0byBtZS4KRm9yIHRoZSBlbnRpcmUgc2VyaWVzOgoKUmV2aWV3ZWQtYnk6
IFRpbXVyIEtyaXN0w7NmIDx0aW11ci5rcmlzdG9mQGdtYWlsLmNvbT4KCihwcy4gSSBoYWQgdG8g
cmVtb3ZlIHNvbWUgcmVjaXBpZW50cyBmcm9tIHRoaXMgZW1haWwgYmVjYXVzZSB0aGUKb3JpZ2lu
YWwgaGFkIG1vcmUgdGhhbiAxMDAgcmVjaXBpZW50cyBhbmQgZ21haWwgd291bGRuJ3QgbGV0IG1l
IHJlcGx5CnRvIGFsbCBvZiB0aGVtLiBBcG9sb2dpZXMgZm9yIHRoYXQuKQoKPiAKPiAKPiBQaGls
aXBwIFN0YW5uZXIgKDMpOgo+IMKgIGRtYS1idWY6IGRtYS1mZW5jZTogQWRkIGZsYWdzIHBhcmFt
ZXRlciB0byBkbWFfZmVuY2VfaW5pdCgpCj4gwqAgZG1hLWJ1ZjogUG9ydCB1c2VycyBvZiBkbWFf
ZmVuY2VfaW5pdDY0KCkKPiDCoCBkbWEtYnVmOiBkbWEtZmVuY2U6IFJlbW92ZSBkbWFfZmVuY2Vf
aW5pdDY0KCkKPiAKPiDCoGRyaXZlcnMvYWNjZWwvYW1keGRuYS9hbWR4ZG5hX2N0eC5jwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvYWNjZWwvZXRob3N1L2V0aG9zdV9q
b2IuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9hY2NlbC9p
dnB1L2l2cHVfam9iLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+
IMKgZHJpdmVycy9hY2NlbC9yb2NrZXQvcm9ja2V0X2pvYi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2Ut
Y2hhaW4uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQo+IMKgZHJpdmVycy9kbWEt
YnVmL2RtYS1mZW5jZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNTgg
KysrKysrKysrLS0tLS0tLS0KPiAtLQo+IMKgZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS1j
aGFpbi5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2RtYS1idWYvc3Qt
ZG1hLWZlbmNlLXVud3JhcC5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9k
bWEtYnVmL3N0LWRtYS1mZW5jZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4gwqBkcml2ZXJzL2RtYS1idWYvc3QtZG1hLXJlc3YuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2RtYS1idWYvc3dfc3luYy5jwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgLi4uL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2ZlbmNlLmPCoCB8wqAgMiArLQo+IMKgLi4uL2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9ldmljdGlvbl9mZW5jZS5jwqDCoMKgIHzCoCA3ICsrLQo+IMKg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmPCoMKgwqDCoCB8wqAgMiAr
LQo+IMKgLi4uL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdXNlcnFfZmVuY2UuY8KgwqAgfMKg
IDUgKy0KPiDCoC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3RsYl9mZW5jZS5jwqAg
fMKgIDUgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Yy5jwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fd3Jp
dGViYWNrLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJz
L2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dwdS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3R0bV9tb3ZlLmPCoCB8wqAgMiAr
LQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZXF1ZXN0LmPCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zd19mZW5jZV93b3Jr
LmPCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV92bWFfcmVz
b3VyY2UuY8KgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoC4uLi9ncHUvZHJtL2k5MTUvc2VsZnRlc3Rz
L2k5MTVfc3dfZmVuY2UuY8KgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9jY2IuY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1
L2RybS9pbWFnaW5hdGlvbi9wdnJfcXVldWUuY8KgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJp
dmVycy9ncHUvZHJtL2xpbWEvbGltYV9zY2hlZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mZW5jZS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9mZW5jZS5jwqDCoMKgwqDCoMKgIHzCoCA0ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3Rfam9iLmPCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9wYW50aG9yL3BhbnRob3Jfc2NoZWQuY8KgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVy
cy9ncHUvZHJtL3F4bC9xeGxfcmVsZWFzZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mZW5jZS5jwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9mZW5jZS5j
wqDCoMKgwqDCoMKgIHzCoCA0ICstCj4gwqAuLi4vZ3B1L2RybS9zY2hlZHVsZXIvdGVzdHMvbW9j
a19zY2hlZHVsZXIuY8KgIHzCoCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vdHRtL3Rlc3RzL3R0
bV9ib190ZXN0LmPCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoC4uLi9ncHUvZHJtL3R0bS90ZXN0
cy90dG1fYm9fdmFsaWRhdGVfdGVzdC5jwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS92
M2QvdjNkX2ZlbmNlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBk
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9nZW0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2ZlbmNlLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV9mZW5jZS5jwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2ZlbmNlLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfaHdfZmVuY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfb2EuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHJlZW1w
dF9mZW5jZS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3RsYl9pbnZhbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2
ZXJzL2dwdS9ob3N0MXgvZmVuY2UuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAyICstCj4gwqBkcml2ZXJzL2lpby9pbmR1c3RyaWFsaW8tYnVmZmVyLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRyaXZlcnMvdXNiL2dhZGdldC9mdW5jdGlv
bi9mX2ZzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBpbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0
ICsrKy0tCj4gwqBydXN0L2tlcm5lbC9kbWFfYnVmL2RtYV9mZW5jZS5yc8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqA1MiBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25z
KCspLCA5NCBkZWxldGlvbnMoLSkKPiAKPiAKPiBiYXNlLWNvbW1pdDogODI1OGEzNzcwMmI5Yjlj
ZjI3ZjVjMGVhMDc2MjVlM2U2YmQ3NGY1YQo=


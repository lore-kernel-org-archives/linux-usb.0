Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072734;
	b=bcuHQ6n5pxVeRl4eWHZ8avzslsdumusy2DXNhxfFJtpF3AD+pt5xKerGmueocGNi2ykU
	 ZAsYtXHyOvzL4E6GevbnhVjh6uEgmfGu/L+2Z0UZ2jQkz7zqD4JJe+ci7j8bACeP9syCa
	 nDpod6yCyWThnMOal4OklH91gKpuvy9/Dtk1+Zfn5xYNsNtCWeTYHM90OGVoXCTdK1WPv
	 DU0ufHHseEAUjNI+dJNCaaznXBXAqxgrFQ+4IOYhXOJu4rYQULd5H+u5bcr6oofCCHC/b
	 Dc+66+6EF8M/JhVNW8wsUSr+NK4bqjvxVO1Kt61lGLXob18o1p13qARos8onAtedOzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072734;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=n+LVyi43MxsRwsz1nrwE1G07r0INc4jpFn7KaXglckw=;
	b=AllwfPGZcvLgYD2h4UZarTDIlzq+I+AgwnS7TB5DWAxC8WSSHwbD1GAD/LQM6SB82UAR
	 oqzoJS/3b2mhXKZnArqgfZVz5d9UtXH7ioO8pphSigWjnskaCsbBdzS6jP54WgMOzvUUf
	 l0yZSYLc3gpLgRUXmUaNM3yPwdyP6Iy3LZZ4lRLP8FKtbJfs3CZn0Q8HxXhfDnU7PEzfn
	 i+MfesXKJKAzl/g71429uoMIXom6Q1bKJJmfAvjknBvuA84jJSEYca+l0ttSLLVfLTfWF
	 fxlBxMR7y7OcBIlGl6MRR6dqYHxjm6XvTpEPl/HD2mD/Vna31F91xpYoeq69k6BAdhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=mJRWAuQw;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F004606A320;
	Thu, 19 Nov 2026 07:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F004606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=mJRWAuQw
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AJ7IGseC2103056, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795072696; bh=n+LVyi43MxsRwsz1nrwE1G07r0INc4jpFn7KaXglckw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=mJRWAuQwDoiYaOeMcVQfyEoW6nR4WXrnyzB/C49aHSwvvVsQ8pzB4EZVlxPEJmNcw
	 agxBylEBH7If3AHlfnI97RG3iLPO+RvyrX+SvkYj5zfWyIo1RVZhZsRfjXPYzlbHdf
	 /ogwb9UQuUhHSrGk0cqQmqmVo1h1vqhGZbTH/VJm7uBbVBKd1Ow86STKWuNVS57YrK
	 2fmLTOQPaFsPmJggPhzuZGi+rcBC19KAuSc9BciIc6Jbe6tUlgoM7psd+3rGp1HMR6
	 CLsG47vOIlRk+L1vRMkbBzlnAEBlUQdJFmlNnqhTZGnVHr5UJaxgjFT7OKTULxrTSG
	 /IPuIXZNmmWyw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AJ7IGseC2103056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Nov 2026 15:18:16 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:18:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 15:18:16 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Thu, 19 Nov 2026 15:18:16 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: Birger Koblitz <mail@birger-koblitz.de>, Andrew Lunn <andrew@lunn.ch>
CC: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org"
	<kuba@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	nic_swsd <nic_swsd@realtek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "edumazet@google.com" <edumazet@google.com>,
	"bjorn@mork.no" <bjorn@mork.no>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>
Subject: RE: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Thread-Topic: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Thread-Index: AQHdcMMAVp0iERnuiECMnOxwgdqzp7cszWwAgAbBatD//87JAIAAMkyAgAF2UFA=
Date: Thu, 19 Nov 2026 07:18:16 +0000
Message-ID: <b53ecd5dc96f4890956f051959b74e32@realtek.com>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
 <179464851836.2199510.10154643847175029122@kernel.org>
 <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>
 <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
 <2e601d9c-1271-4802-a45c-a16a0d9cfa8d@birger-koblitz.de>
In-Reply-To: <2e601d9c-1271-4802-a45c-a16a0d9cfa8d@birger-koblitz.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

T24gMTkvMTEvMjAyNiAxMjo0MiBwbSwgQmlyZ2VyIEtvYmxpdHogd3JvdGU6DQo+IE9uIDE4LzEx
LzIwMjYgMjo0MiBwbSwgQW5kcmV3IEx1bm4gd3JvdGU6DQo+ID4+IEkgcGxhbiB0byBhZGQgdHdv
IG5ldyBmdW5jdGlvbnMsIHJ0bF9ud2F5X3Jlc3RhcnQoKSBhbmQNCj4gPj4gcnRsODE1Ml9nZXRf
bGlua19rc2V0dGluZ3MsIHRvIHJlcGxhY2UgbWlpX253YXlfcmVzdGFydCgpIGFuZA0KPiBtaWlf
ZXRodG9vbF9nZXRfbGlua19rc2V0dGluZ3MsIHJlc3BlY3RpdmVseS4NCj4gPg0KPiA+IElkZWFs
bHksIHlvdSBzaG91bGQgcG9ydCB0aGlzIGRyaXZlciB0byBwaHlsaW5rLg0KPiA+DQo+ID4gICAg
ICAgIEFuZHJldw0KPiANCj4gSW5kZWVkLCBhbGwgb2YgdGhlIChpbnRlZ3JhdGVkKSBQSFlzIG9u
IHRoZSBhZGFwdGVycyBzdXBwb3JldGVkIGJ5IHI4MTUyIEkNCj4gbG9va2VkIGF0IGFyZSBhbHJl
YWR5IHN1cHBvcnRlZCB1bmRlciBkcml2ZXJzL25ldC9waHkvcmVhbHRlay8gSXQgc2hvdWxkIGJl
DQo+IHN0cmFpZ2h0LWZvcndhcmQgd2l0aCBtYW55IGltbWVkaWF0ZSBiZW5lZml0cy4NCj4gDQo+
IEJpcmdlcg0KDQpJIGFncmVlIHRoYXQgYSBwaHlsaW5rIGNvbnZlcnNpb24gaXMgYSBiZXR0ZXIg
bG9uZy10ZXJtIGRpcmVjdGlvbi4gSSdkIGxpa2UgdG8NCmtlZXAgaXQgb3V0IG9mIHRoaXMgc2Vy
aWVzLiBUaGlzIHNlcmllcyBmaXhlcyBhbmQgY29tcGxldGVzIHRoZSBleGlzdGluZyBSVEw4MTU3
LzU5DQpzdXBwb3J0LiBUaGUgcGh5bGluayBjb252ZXJzaW9uIGlzIGEgbGFyZ2VyIGNoYW5nZS4g
cjgxNTIgaGFzIG5vIE1ESU8gYnVzIGFuZCANCmFjY2Vzc2VzIFBIWSB0aHJvdWdoIE9DUCByZWdp
c3RlcnMsIGFuZCB0aGUgTUFDIGNvZGUgYWxzbyBkb2VzIFBIWSBjb25maWd1cmF0aW9uLA0KZmly
bXdhcmUgcGF0Y2hpbmcsIFVQUyBhbmQgRUVFIGhhbmRsaW5nIHRoYXQgd291bGQgbmVlZCB0byBt
b3ZlIG9yIGNvZXhpc3Qgd2l0aA0KdGhlIHBoeWxpYiBkcml2ZXJzLiBUaGUgdHdvIGhlbHBlcnMg
aGVyZSBhcmUgc2VsZi1jb250YWluZWQgYW5kIHdpbGwgYmUgcmVtb3ZlZCBieQ0KdGhlIHBoeWxp
bmsgcG9ydC4NCg0KQmVzdCBSZWdhcmRzLA0KQ2hpaC1LYWkNCg0K

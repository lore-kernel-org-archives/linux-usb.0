Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414919;
	b=PG64tcP+kBiZQTfhyeM7h51Tl5Scen3D3xYZnutIdgak9T6Kcr81ir1uQv/s9hEHqwH2
	 rjO0eFjBgczQpqNhLIKXHmWAXO5YDzM49Ehedekd28DKz49A+Yf3eY4W/7zrFqpRU3yPV
	 wIRYF82fJKV4fBdhTXRpNjhNSSYQHZIShhekxZO1+VPlqZBYrCqH/3+rvFNnUoypsPFfX
	 bfWx7keew0JMyMlIAWw+/Pf/EEHxGdyTPCMV4NpbrrX0LcUdY7SDVHud5IEQ7pWldYdbW
	 GDHfwYii2Ywb0LWwTlGl+Dl2O9pBtRd5lymToTywovebpt7x13VwvwBIe5K25rLSdoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414919;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=+d4qr2X79fqsMJDZc1izaVEQ0nnQYV4IcwBa4uocRCM=;
	b=XVmyNHwNjmUC/iBBSh2TBjOROvgf859QXbAzMt82RTr+bM7w7rso1WXxbANCABQjMAff
	 j9exrKOL+/c0n8XLYRMgSdzyxGn+CZ1WFHQKeFGAhRd0htICKadGwYhv5209wExowj3qY
	 YGI0FquNCCED2Vk/Kmw7KNRMFVElsfwcV4vuI1V7F7urs5QeyMj6eO5iPYyNqQHxc6Cra
	 OSbvppMyD7tIAXknnR0IpjU3IYzGwWy7Jv6ACQABoif2Dt4gQOf7oAIyHcd4rvJwt5BFS
	 PCjS4XhOtuwrGrpmnAP5DffLxn5IfrTUGJQIQnbikoy7QtmAnYo8ptN2Ab9ORjGH0Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=IejdmIoj;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C138606A31A;
	Mon, 23 Nov 2026 06:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C138606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=IejdmIoj
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AN6L8uK41408110, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795414868; bh=+d4qr2X79fqsMJDZc1izaVEQ0nnQYV4IcwBa4uocRCM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=IejdmIojnUp95r9XAhf1dT3BNrSBmZkAO7IydiqIZEJXsFKToBGSKO6SxQ2pRKMLh
	 T5neFCffh44Xatt897DsT2Gqj7oZyqrR78WYeNqDVAmXwMboCb8PxYaftGAUnItwBd
	 Tgx9uSns5aUSOezFemXels/adWrDA6wRAyEVIUTjiVNcw2VESei97EmrVTyZnPWd+s
	 CzBwzgECtGh8oDCOTjzmHRmJQi4nbN5wIc4yOfeog+WHOrtSGAI6Nos0IkMJgcgF23
	 ugl7AyDXfFXi8meOmGLJ0M3LX7KgVqvxL5jgwck82AM1aLGFXiLZFzLq6505FheWtq
	 ce9bzNQ3jBH1w==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AN6L8uK41408110
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Nov 2026 14:21:08 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 14:21:07 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Mon, 23 Nov 2026 14:21:07 +0800
From: Chih Kai Hsu <hsu.chih.kai@realtek.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Birger Koblitz <mail@birger-koblitz.de>, "netdev-bot+sashiko@kernel.org"
	<netdev-bot+sashiko@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>,
	"kuba@kernel.org" <kuba@kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, nic_swsd <nic_swsd@realtek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"edumazet@google.com" <edumazet@google.com>, "bjorn@mork.no" <bjorn@mork.no>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>
Subject: RE: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Thread-Topic: [PATCH net-next v8 10/11] r8152: add TGPHY register access for
 RTL8157 and RTL8159
Thread-Index: AQHdcMMAVp0iERnuiECMnOxwgdqzp7cszWwAgAbBatD//87JAIAAMkyAgAF2UFD//+4SAIABqmQw///dy4AAmHU3QA==
Date: Mon, 23 Nov 2026 06:21:07 +0000
Message-ID: <48eb7c4258f74bddbd1bbd25cf8aa115@realtek.com>
References: <20261110032416.16968-11-nic_swsd@realtek.com>
 <179464851836.2199510.10154643847175029122@kernel.org>
 <0c6318e175b14ce8b86a957c7c79d5db@realtek.com>
 <cafe3b8f-2b65-41d6-b31d-a1cabbf93720@lunn.ch>
 <2e601d9c-1271-4802-a45c-a16a0d9cfa8d@birger-koblitz.de>
 <b53ecd5dc96f4890956f051959b74e32@realtek.com>
 <1543707c-c121-4c35-8849-c4db1a71fb57@lunn.ch>
 <6a2c635ba56d4deab25a25db9af91c10@realtek.com>
 <78ed468c-798c-44b2-9f97-8645af0f1641@lunn.ch>
In-Reply-To: <78ed468c-798c-44b2-9f97-8645af0f1641@lunn.ch>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 11/20/26 9:22 pm, Andrew wrote:
> >  The root cause there is also that
> > the MII library does not check the errno, so a future patch could make
> > the MII APIs check the mdio_read() return value and propagate the error=
.
>=20
> The MII library is deprecated. It is not maintained. It will not be chang=
ed unless
> it is really broken, and by that i mean it breaks 802.3.

Understood, I won't touch the MII library. read_mii_word() returns 0 to the=
 MII
library when TGPHY fails. That's a BMCR with autoneg disabled, so mii_nway_=
restart()
returns without writing anything. As for -ENODEV, every write that follows =
is blocked
then, so it's also safe. So, I think the current `ret < 0 ? 0 : ret` is eno=
ugh until we
move to phylink.

>=20
> All feature development work should be done on phylink and phylib.
>=20
>         Andrew

Best Regards,
Chih-Kai

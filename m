Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794282757;
	b=RbbECBDYFYePiTG9d+Mj5rTt9BT2fPytP8hgLjtppABScZaqr4Sf3Y7kS16sXO5Bn+fa
	 HalQIQZmu4K0VTYL4y0oGHgL+AUrL1o6GYTmWwPfv1PSY/o97F2dBDHJXCC4ur5J4eK0O
	 5cydgVL8TjnDJRJQj7ZcTH8cYca5MA9nnFymK6U/4em95xeYYZ7RIJ1HBPuGpAg+JJEn0
	 jghX7a0ohGUZsLd8AqS7O3mTxqZP8ebDKuyX5rdU7QZc+tvw+fwIvvEnBJzIMwnQK7xN9
	 eUXRVAtfBV8BpXZ4GEZ5RReHx4h97KSAO5ME0vWjYoqA5XIT31jEB0gG15UNnohqwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794282757;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ow0vQvhjln9LYkfz96UnEhd8JAhecUik7UAljvSYc3Y=;
	b=WjZL1ZrgG+xJHr2SlOeBiTFTwGiNJKoQHzfonTay4sJm53DF1PiMlC6at3MqvMNDh8Hh
	 1VqxDIjZgw7KIVRPsfyINm1lcKcXnkz5VBEs93DdWFeAnm+FokVBnpAauPHkMxeFaMgkE
	 6VDYGdV2+T92imoYKYf27cNepA5ZKpSrK7fTVYtKOPN/RkgVWS+CIl1J6IkuWTrFryTwf
	 xskP4XQXUHG7UApuzzHKuEk4zn4nThurH0Qd1Q9ttw6R6fbBnMvQhvunHS3+1lEBuUaRH
	 Jqfhd93CnVfsrrPyBe3pf16uJhlSp0VyS4kMYdRMkjmXyB41BvUP3qYIeQO2HH/lwww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnOXlptL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF09606A33A
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 03:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnOXlptL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDC01F008A1;
	Tue, 10 Nov 2026 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794282756;
	bh=Ow0vQvhjln9LYkfz96UnEhd8JAhecUik7UAljvSYc3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnOXlptLxJbrtn1x1uDO68COQXzk6kAk/xg5C8VciCTGEyI9szV20uqoUqRr85fa9
	 HottntFHhPLlmPJMFZF4z1smsTqrmWlYVbiRJQWIftU6RtEbFFok9yTkNk75bAYe6b
	 KQeFMzNNP7HvwV6IaTSa64CMPoCaMRNz0wLZ9tx/yDn+cI0t+PiY6l8k6s2LAbKSPH
	 41MkETezHkZFii58kXIobB7GKA52HD2aWT4DOBu9xO3aKOVsAGNilU0wc1E++MX0so
	 gd5wwW11qzoLQ248VqWvG4iX/Al+IIOcvYPPFPkpQzJxAMa2pnlPn4zVEDcyecwF2t
	 Rj98I0KG2H17Q==
Message-ID: <sashiko-outbox-206152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengfei Lv" <lvpengfei20@huawei.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110033038.2882473-1-lvpengfei20@huawei.com>
References: <20261109093935.2634235-1-lvpengfei20@huawei.com>
 <20261110033038.2882473-1-lvpengfei20@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:52:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Per USB 2.0 spec section 5.5.3, the ep0 maxpacket size is fixed for
> all device speeds except full-speed devices, where it can be 8, 16,
> 32, or 64 bytes and can only be determined by reading the device
> descriptor.  During initial enumeration the USB core guesses 64 bytes
> for full-speed devices; after reading the descriptor, the real value
> is stored in udev->ep0.desc.wMaxPacketSize and applied to hardware by
> usb_ep0_reinit().
>=20
> Commit ff33299ec8bb ("USB: core: Fix race by not overwriting
> udev->descriptor in hub_port_init()") guarded the ep0 maxpacket guess
> block with "if (initial)", so on the reset path the guess is skipped
> and the host keeps using the value from the previous enumeration.  If
> a buggy full-speed device responds with one 8-byte packet and NAKs
> all further polling, the HC doesn't recognize a short transfer but
> keeps polling for the rest of the descriptor till unlink, and the
> [ ... ]
> data stage.
>=20
> Fixes: ff33299ec8bb ("USB: core: Fix race by not overwriting udev->descri=
ptor in hub_port_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pengfei Lv <lvpengfei20@huawei.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110033038.2882=
473-1-lvpengfei20@huawei.com?part=3D1


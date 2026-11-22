Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795360729;
	b=bTWrTKFMMM+v2ztR8O2Pcv4WItXgkn3XhAlFhoucjfkiEomU7whHpwzIDR4eVCrVUuJ6
	 fk3g6V83mryTMEmtIPG+ksCmW6MMDT3SRK+uhyg6ps+0cIqw2uiL2oND468gYV2wC5QQI
	 rngfCv0Dv5lxtP7DLT6TVqvFEi+zsBxeiPGQHsHGhjS3AVU0aVgpgszWxTs4JZeuJMJFh
	 fN1jUCHhgT1Q3V+P/J78bKk5OhKPjkJ7/8J9SPum1MBgbm7fIx5CgfkYpeiwSpex5mc7L
	 SlLDSjToxZSD8xJSsVQUCsDoJgG7OTlSduiH36ptSnhbxAgTERhpkSYagvtWkPJ79AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795360729;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RqUHofdxw2W19pTeAlOIbTWWV9aZ/v7GfLMNzE5UmUY=;
	b=hmWz/v3hY2tkQcUcJmJ/qtoILufwfPM3fW93MIPRMFHU5AoRkwicqPN0Hjn9u0oUQfs9
	 dNob6kXwaxQdlJ5kc0kgUxrgm+bVnt0OM9KQ6wVKqRKfujo01YF5m0epEK7G8dlvzwORU
	 GlZ0NF2kp7XpXNQ/BoR+XUs4IaL8We0pcd4mdF2B9SjZcM93D1Hu6rlQPO5uBNovQwiB2
	 mHk2oB6hVb9voharKg0atZA3t2BEKxkGQV00w91tFt7ulzVId3GLykFgfKlCBsIrhenaz
	 IZxytMvmWTrSQpJzkbGJpooyTAiROHsSXhzN1POtksRJr6QUfF9WWrNE22tW+Ds9jVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtU0dRmQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252E606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 15:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtU0dRmQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A2B1F000C6;
	Sun, 22 Nov 2026 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795360728;
	bh=RqUHofdxw2W19pTeAlOIbTWWV9aZ/v7GfLMNzE5UmUY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DtU0dRmQ2hR5cT9E9KcxE18oiKraRV/I2HJNAjDmT6Buaif0UTr6mazSPud0tI/sD
	 VxfrO0PzhkkdKUI1r+spJhRwIPU1UByaaKPbIgdVX1ClJJ+waNTS/EMd7E9y748e71
	 Nt+rLrhWUds+U4ZWP4syX2n85dF1orPF9+7VGKcyVB7vPr7W1WnMJgODDH0eEnCd4m
	 WCkKvtWY2n2N0bedO64Ydl9qROs/yltb5YV4GjPDfh+OIrGl8q8kfQEULDCNdEEbUR
	 8zUiQO7maGZPIMnaM36q9Aj5nnwMdA1VKGNSDJqS8Rc4GIl0ziaN+NHDxKZAvPIO5p
	 Wz7FQl8eaNkRw==
Message-ID: <sashiko-outbox-228037@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: keystone: Fix PHY runtime PM leak on probe
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122-keystone-v1-1-66f8e907685e@gmail.com>
References: <20261122-keystone-v1-1-66f8e907685e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 15:18:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The phy_reset(), phy_init(), and phy_power_on() error paths returned
> without balancing phy_pm_runtime_get_sync(), leaking the PHY runtime PM
> usage count.
>=20
> Route these failures through the common cleanup path so
> phy_pm_runtime_put_sync() is always called.
>=20
> Fixes: 1c11e74e9079 ("usb: dwc3: keystone: Turn on USB3 PHY before contro=
ller")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-keystone-v=
1-1-66f8e907685e@gmail.com?part=3D1

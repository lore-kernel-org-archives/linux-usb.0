Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011813;
	b=icQRCn2TlfpwkvUuh5G01WpH5gG+aLcciylVoIYEtgU1K7kk+tnojBb3uH8OMgHLRUUp
	 q3clWtZ/Fu0qlGho3Wk+JwhwXwTH8VVpLRg+f6LfR01y7G3WfcyOTC1qLiL5bb+xxly4i
	 mnE4CNAgpFUYO0kHPtlAPF8+U/4wETVSaxJPeY5GGO2Kc2kF3RmKRvl1vqDtbgIGDnRbE
	 /Y9t/0iVphUpEQ7St56Lla8uvnTCnB02nLLGdd7YVgHUsqLT3X4Gk3y+/0o5/+kVU9SW1
	 eaqqTGB+4YQzl8iGhIXMdYFGXxfb5vu/wXYBWZTQuD6Q8qEDGzC0yVjtSG9PelwXD8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011813;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tRM65mHRcb7Z6IywFtyNgyTJpKhAmmesD+TrMoefMQI=;
	b=3CgD/iF8SMc1TL9Gz+yNKV8mdqULhzBjvBSgDjP6O2NA1i766d9sFF4ukYkr57h/g5ce
	 88t2mFYKEB5bmRHx4dVa4Wyc2gwmVHtT9w/yKq4+f8NrV32h8UF9blS/syN2O7FvRaadT
	 k57mGqc6hU3pA7qk5pqtwYDWGoo2UBJWg9zo58dEbzapXcJruUa9Cfkg0w07tkmoNEHjm
	 cM6n7e5E2zCUlMxEXvoEZ/M+OzLrSrwhZ7ScYy2ZwCr6QfkJH3ecegnkSpnIN9ABOCm3o
	 1fUGn9u5PL34B06dvXYjn1qPe7xYlNiI/pGCJH+ansie7szPJIIJKKrBLe81gYZ7wXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ur/W0BMy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C6F606A32A
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ur/W0BMy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28AF1F000CA;
	Wed, 18 Nov 2026 14:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011813;
	bh=tRM65mHRcb7Z6IywFtyNgyTJpKhAmmesD+TrMoefMQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ur/W0BMyz3Iv/MjP9dOOFHEo1K0KZKc15zWSmCK6wtYXu+VtOa0uq96lNnkJBPhGT
	 qLmdOmdB59gGN6WBK61lNX9LiMDf45ZRTC7S0X3C3tYaluRj9G5NJQGWT+/NxpjYJV
	 JiI2RzXkqq5zE7/qb6LsYqZ66VIPD4puc7D+4K9amqfrEpwCa4uiq2oW/XcT0I4sQh
	 Q0lZ1Xcn/UL0V9kZtMZtWlauCpA+SxAX9g9dntcxYB4WY/XAx7d3IZsZggk7v9y+KV
	 45nd/FWaW0Zqrj7T5DBTQj5q9OS6UPWfiM7JN6uP3wBiCNVih7qn297QEBb0TtM1pD
	 H6iVe8AHqVByw==
Message-ID: <sashiko-outbox-221195@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: cdns3: fix NULL dereference in
 cdns_host_resume()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guomin chen" <chenguoming88s@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118140513.8281-1-chenguoming88s@gmail.com>
References: <20261118140513.8281-1-chenguoming88s@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:23:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Guoming Chen <chenguoming88s@gmail.com>
>=20
> cdns_host_resume() assumes that the xhci-hcd child device is bound and
> passes platform_get_drvdata() straight to hcd_to_xhci_priv().  That is
> not guaranteed: __cdns_host_init() creates the child with
> platform_device_add(), but the child is only probed once xhci-plat
> registers.  cdns3/ is linked before host/ in drivers/usb/Makefile and
> both are module_init(), so at boot the child stays unbound until
> xhci-plat's initcall runs; when xhci-plat is a module it stays unbound
> until the module is loaded, and it is retried even later when its probe
> returns -EPROBE_DEFER.  Platforms that set
> CDNS3_DEFAULT_PM_RUNTIME_ALLOW (cdns3-imx is the only in-tree user) let
> the controller autosuspend (20 ms), so the parent may already be
> runtime-suspended by the time the child's probe actually runs.
>=20
> [ ... ]
> controller from scratch, and xhci_plat_priv.power_lost is only consumed
> when an already initialized host resumes.
>=20
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to=
 xhci")
> Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118140513.8281=
-1-chenguoming88s@gmail.com?part=3D1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759508;
	b=LWld8Y3OLMhFQAFLzrPF4k6uLqspUxGCS5h4WitnKggtOjN5hkIpAMiDATasP5w8QLlC
	 n2wyDdJSz1wP3E2mSte063Jc9ItIr0KFzWHCe4aD7Qv0hGiZL8ufMNbDc6CRNr8m2lgUw
	 atdP2Hyuu+fob/bi1VU9Ty1uCd1rO6f/X2YvSdV3isDt3fpJs+XkvxkXw3TnH3mYJ3LO/
	 oq7rj+VhFtJNEcloFAbFmZHvpbrOHZ2IVQp08dky4uJGBFzBQ9iQZOHMZvE1CmqCF0mlu
	 UwABRK2/wD/9Y06EMDC4fvuAUcrd7rkiPwcU4gfwlHYuOvTfODDOlIYQnUvTO6hyrzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759508;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZPrL0csk7dFbEV7K0II8powq/oLCszAyE7qk5Jadxh4=;
	b=FB1VcxzMHEKwxnQ6xEkH1r4TCtBSrC8ZFoNqgYJU4oATgXHIAVDaFkRH0lNfQWFCibcJ
	 2fdoD7Y83lnfd5lYhTYi/4aXFHm5OtT2XQc+7I8uODTwwoCl+K7yoag4eK4kWfX+peQIP
	 R+CnaQFvQ3meYMI1y9oqtHl1LMGJmUViU6idf+i02yAei81M/LJPydo+MKeo7yxA7Epau
	 Qodp/D0GHdLYYkIttTC5c6XvWqE8IfEp9p6eBaCvy52h0OIGRh1d4phac0cp1yT21N0HE
	 R8gi1NUOse6meaplrSYEucTWoxtwD7iuzTKhFYq4XBbLaMzrg86k4hyWkuahFGczw0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKfpDoCx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149F606A336
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AKfpDoCx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034C61F00A18;
	Wed,  4 Nov 2026 02:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759508;
	bh=ZPrL0csk7dFbEV7K0II8powq/oLCszAyE7qk5Jadxh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AKfpDoCxi0McJHuNKenaEqwyAR1/u7n1z6Tw/bsmbgPKpWSwVzsrjdJo98zW6cZkJ
	 yBORYpqq0YwHLd/afGVvaBxmS00aTpXeOOlaO6CONIcXzVoPH9/H8L+m0VBn05pys+
	 8UthYoCHlB7HB8S1w7eV5aC5ypnTKJ4UtNnIGQOnA2PtwGk7x5DywhXrSWMN9HhWuD
	 DlReprkrZbNtdfGtm3rO2lZtkU6VHy3GdBnbtkSJWawVtdrL1xgCykECGkXW7lGAGo
	 Rv+VU492+GW16tfRU2I2gNUsyJoZoFTxFTKnpNVcv3xBq/4zJUZnJF7N7BS4Q91zsi
	 HwZRv9bxXBGZA==
Message-ID: <sashiko-outbox-196479@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: musb: mpfs: unregister the generic PHY device on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021522.1468663-1-vulab@iscas.ac.cn>
References: <20261104021522.1468663-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:31:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> mpfs_probe() creates the "usb_phy_generic" platform device with
> usb_phy_generic_register() and keeps it in glue->phy, but mpfs_remove()
> hands the controller's own platform device to
> usb_phy_generic_unregister().  The generic PHY device is therefore never
> unregistered and its reference is leaked, while the controller device,
> which the driver core is in the middle of removing, is torn down a
> second time.
>=20
> Pass glue->phy, as the probe error path already does.
>=20
> Fixes: 7a96b6ea90a4 ("usb: musb: Add support for PolarFire SoC's musb con=
troller")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021522.1468=
663-1-vulab@iscas.ac.cn?part=3D1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012146;
	b=oG5+LL1sn0MQii0r6CxBCQHnPWMu1Db8ZM+vDb9ZQXLYJSf/56Sh5/Ake92Nl05SvX/2
	 6cpwCuyZGV+pufxZYUM19a/nUzgjrFEUjHIzAWquEpHmAUiav7MPTnZp3LR1c5MZtwdHL
	 H/go/RhE5ICA9pBYEETgeh31cPTYcnvM2zNfXJks0YK9TEBeknNoz4n4jRAcGV00Jd6S4
	 uyCR2Y85BXrVkuShZzY8nJPUSeIeppNq2MSth8epJFZcBs701N90u/AsnEvIl0im3lzfI
	 R2jb+EeK/g96CKow46W0Ekaa2j6sZaFEeXn3B+nM9ygyghfiQrfc+8aC1zsKWFaTulQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012146;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c84R4osijOgCBulZtrt2bojmnUbLU6Xb/HVyYB0lUiw=;
	b=mVLMvVeDKut8zmVA2USCvk0u2DI10fCXEMkCfzvDMMbPW586IA1YS2XYZbMvKu/j1TzY
	 64xcuyb+n1BtnlnDUN1ycs6/tOlILGJtw8lAG+15i8d98ImbshR0LuhuKpl+fgQBtFZ+d
	 jnDLJax/ZQpyZAkZHiZRVlIKg18O/HRTP4m2xWGW9e1vz0U2s4xbnoQhfEKULVJ7mUy3S
	 SQJhnyVbUa6uwcVmDjII97RbKox7QjUaoweFl/2MjzpKRug5a+Td09zf5LO+wE2zh6KDt
	 vsFgflSUK0xVNB/gaw2KNYIZ2GFRj4uhlltSMjyipay6H8Do+ITStjC6xywx2q4yYqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKR8RRxL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C97606A33F
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 14:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKR8RRxL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483871F000C4;
	Wed, 18 Nov 2026 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012146;
	bh=c84R4osijOgCBulZtrt2bojmnUbLU6Xb/HVyYB0lUiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SKR8RRxLHyjIgeCE8r2Ymnshefoy5oIviL7z+1HQLl7hCDKgvN3HfvDdzXK1IF6bO
	 oVaijqBTf+47Vv6kkVKcVQFWYMT6bjBrOJ37m+HKrVsQ9/vYZIGTL0MG5PBLjthJwT
	 qiQNcXzlbU9Th8ygjQWob64GjZHVAZ5B/Rgg0ZBYRgl8WOlWCIM4ViCOhQNOBpJxw2
	 tEtz5x7LAlpiorQY9Ax++WKLcHEMR//FsZ4nsKNpJnjhpfGZXFyPiX7lGsxz5w0lbU
	 bUduT+VOCH9USwmWwj5CQkfbgJ2WP7DPvoLnWvWD7rN0i9F2puVVBCD4Vqt9LAM7qU
	 75FCn5OSXcHmQ==
Message-ID: <sashiko-outbox-221206@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: fsl_udc: Fix potential use-after-free
 during removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118-324f82bd41-usb-gadget-1@mail.sdu.edu.cn>
References: <20261118-324f82bd41-usb-gadget-0@mail.sdu.edu.cn>
 <20261118-324f82bd41-usb-gadget-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:29:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_del_gadget_udc() can drop the last gadget device reference and call
> fsl_udc_release(), which frees udc_controller. The remaining remove path
> then dereferences it to release its requests, endpoints and DMA pool.
>=20
> Hold a gadget device reference until this cleanup has finished.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: eab35c4e6d95 ("usb: gadget: fsl_udc_core: let udc-core manage gadg=
et->dev")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-324f82bd41=
-usb-gadget-0@mail.sdu.edu.cn?part=3D1


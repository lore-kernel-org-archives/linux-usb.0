Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782413;
	b=XnYWrUeJKIsFM66mvXrwgjG6H5AuqIdv3tWN0t1/18Epj0mFam0COR6U/U5h/pgGNhZU
	 1oMNCo+z+qEtb1ggCHC0QcVu1RPfsovTEgZvdZEFgUtY5pyEc3NjAV5aPQW3FWh6UAxQ1
	 8u2KAwyFK1tlTm0S365hAY4Avvj2ZSOBAvIo+6nrrk46WuLc6RQbOiW1zKHXz4IGlDGJa
	 /HOM7LGvHvxFQgBrfS1z8hKOS95u+ppgWu/Mu6rTcys/NbRDHOf14ry3kXgay2su6/Dmx
	 fNeOe/3TVqcmlvfnIZSp3muTqNh7MY9y9xdwm8OPUWqBRhgwDiH2ArUzALMc7CCyGJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bVg1RE1zvig+WQ4KXkS6bUt5wXBjTp70gfUsKrMq1h0=;
	b=BBvv1+iH0Jf/jKKJpXlTv0am5lSjYY8jEyC8+K8F+PFl72S3RqQHHwJXPB3mTRNefYWq
	 vJdtq5WlTxqLe0PurMka+p5+Kr0V19pzD3BRreYEIO4F3c3Lhdjq6uo2m6ML6bnb++eWh
	 i7+fbniy8+TgcsiMbAadPOPBQj3Ozk8dptDkzN5QrqI43BTE+8n4ceBM7plXuySP+7Ouk
	 E9PFB7B4BLnVWUgObCr1YZJc2y/xcQ1SnKAIKWaxEDfsozvvUJ+76SsXwgFdLD+1zabbP
	 dDyCqGR4VvgAH+yfUlpvvgCRf/9XGLco5oX1S/f5kL6mLkHf+JNtlXhtrSNDVEXCduA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmhOWN2j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747C0606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 12:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmhOWN2j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45E71F00893;
	Fri, 27 Nov 2026 12:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795782412;
	bh=bVg1RE1zvig+WQ4KXkS6bUt5wXBjTp70gfUsKrMq1h0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bmhOWN2jWTQriLKlTAoWb9EMhP/IRXFM2ZbPOWePx6FnpX0YHCugRLlidnTGBDZq7
	 4yairQvOhbH/+hJI5Nk98AW0TyYPlSd4alj9eFQ+hucLmSvbMunIG+kX5lkrlJNNEk
	 2bTi1rRanHV69Vz8WJonenpdN0xXAFlYbG1tb1TvQuiJtFS2zgovg5qNyyfRdU9pPM
	 9QxJiYUKblFPywjDd8oxTIFz7B82oGBy7sytEFqiD9Z/fLuRHeYrN0KvBjwd/CQh0s
	 8GSy01Vn/vn1bPlVls1Ag/h1FDrXp6RFeFX440sTBu/janYNTBd63M7juWAe1bK+dK
	 09akeZ2fBhpGg==
Message-ID: <sashiko-outbox-237388@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5.10.y-cip] usb: cdns3: gadget: fix state inconsistency
 on gadget init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dickson Wu" <dickson.wu@certik.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com>
References: <20261127-cip-cdns3-510c-v1-1-56e5faa149b9@certik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 12:26:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Yongchao Wu <yongchao.wu@autochips.com>
>=20
> commit c32f8748d70c8fc77676ad92ed76cede17bf2c48 upstream.
>=20
> When cdns3_gadget_start() fails, the DRD hardware is left in gadget mode
> while software state remains INACTIVE, creating hardware/software state
> inconsistency.
>=20
> When switching to host mode via sysfs:
>   echo host > /sys/class/usb_role/13180000.usb-role-switch/role
>=20
> The role state is not set to CDNS_ROLE_STATE_ACTIVE due to the error,
> so cdns_role_stop() skips cleanup because state is still INACTIVE.
> This violates the DRD controller design specification (Figure22),
> which requires returning to idle state before switching roles.
> [ ... ]
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Link: https://patch.msgid.link/20260401001000.5761-1-yongchao.wu@autochip=
s.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> [ adapted to 5.10.y-cip: use gadget.c and cdns3_drd_gadget_off() ]
> Signed-off-by: Dickson Wu <dickson.wu@certik.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-cip-cdns3-=
510c-v1-1-56e5faa149b9@certik.com?part=3D1

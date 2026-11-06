Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974370;
	b=l1u+CtKThZ/zz621etKSfAWcCnxf2zuhD7nsC44vbrCFdpVXRRQIVpnUDEUvwt4Qx4BY
	 BIbDBlDCavA/c3P41KhzQ6zL7HKTV8rZ0ykoqJL/AVHX6/kQZ3GlsGhJlawMwI3dRM9dV
	 T597Fc/RRmhPQHUu2/pITDkhjPcz2rk9sWdjm7vS9/6JEG6/ZR5iVm+jwFutEW3ymgzIt
	 pxLzZw8BMjW8hSKdgJYIWSkyqA7o8k6qYvgdfwdVtxrJv5WbRewTgMkzQHKE7vkKiAQBp
	 rLnr4fVKpJ7+kTUZtu2GFkA+MtEBv4cN9cHLbwC1heh5B/mEVifcTIg8jYz9WT9vmDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mzvrd7348tLMVD+C6Xf3OoKwuTniFduytK0J8FhTA2c=;
	b=wsffYGTp6Y0WPH1UsSKJ6TMoYDHptnqss/Xr9ukpguro1amit/Br+16iGeKxKYX9JqkP
	 HdQu+7bTnaQ0FhD5JtQaxqQIA8KUPsliafiS+Kv6RCkcH3Q+br+Oo9Efv2B5NJN+SUlMr
	 AzG3dsZGuuDhJYCGUOdPECgJP08T26TBLOfqkxJ5U6klpxuZI6C9TPf3hlJPRovAvOxWW
	 rxjZSfMZGiheW1lmwhpPFhAInTuehAiLG6uVlzrGLWhC+PWUzVQcIf36ZRDf8cfM7EEPl
	 8af02dXJ5c8Wu7gD/TIjVnhj9zRaGcfksP8Fn105qwht0Mac8MOd2s6C+qWzbysrMMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fEVjQXlb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10E9606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fEVjQXlb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CE81F0089F;
	Fri,  6 Nov 2026 14:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974369;
	bh=mzvrd7348tLMVD+C6Xf3OoKwuTniFduytK0J8FhTA2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fEVjQXlbzky00LpVWkDkrIiRI4fPsqJ/mWsVVyVr1lQTUPJtbRQEHCrWAw+PgA1W/
	 uGGNwl/JASY2g7UOGfbLf9iyTMDSShyVoRB38SJY7IXu2PVjN+468kXx1o3xsuFTOg
	 hjY0NKHnFu3zxQ4bPLMOtWAERlP1UBAD6MSLCB1khmFziUuyMIOHdwK0hY2WFTot3E
	 3e6Wji86ZIInf/CSLGWq/CF6q/QdVir0qWgdWXM+LuexC5Zn4At59weqGYnQuqvinq
	 kQyUec20exB4Xlskag4pK9SvvTNRD2WotIVrzZIAH9/kRIB6lgTa4YRhSU1jS4Bb34
	 uTy5P9BpUjTPA==
Message-ID: <sashiko-outbox-201549@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: musb: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106133933.1577-3-crofts@kernel.org>
References: <20261106133933.1577-1-crofts@kernel.org>
 <20261106133933.1577-3-crofts@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:12:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] usb: musb: use-after-free in musb_remove() [1]
--

commit 288b4875a2dac2d67d03e8708cdad214c6870682
Author: Joshua Crofts <crofts@kernel.org>

usb: musb: remove redundant pm_runtime_dont_use_autosuspend() calls

This commit removes redundant pm_runtime_dont_use_autosuspend() calls in
musb_init_controller() and musb_remove() since the driver core now handles
this on driver exit.

> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> index 73ac25f53698f..28e59b53fd02f 100644
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c

[ ... ]

> @@ -2644,7 +2643,6 @@ static void musb_remove(struct platform_device *pde=
v)
>  	spin_unlock_irqrestore(&musb->lock, flags);
>  	musb_platform_exit(musb);
> =20
> -	pm_runtime_dont_use_autosuspend(musb->controller);
>  	pm_runtime_put_sync(musb->controller);
>  	pm_runtime_disable(musb->controller);
>  	musb_phy_callback =3D NULL;

[Severity: Critical]
This problem wasn't introduced by this patch, but can calling
musb_platform_exit(musb) before usb_phy_shutdown(musb->xceiv) a few lines
below cause a use-after-free on musb->xceiv [1]?

Platform exit callbacks such as da8xx_musb_exit() call
usb_put_phy(musb->xceiv), which drops the final reference and frees the PHY
before musb_remove() passes musb->xceiv to usb_phy_shutdown():

drivers/usb/musb/musb_core.c:musb_remove() {
	...
	musb_platform_exit(musb);

	pm_runtime_put_sync(musb->controller);
	pm_runtime_disable(musb->controller);
	musb_phy_callback =3D NULL;
	if (musb->dma_controller)
		musb_dma_controller_destroy(musb->dma_controller);
	usb_phy_shutdown(musb->xceiv);
	...
}

[1] https://sashiko.dev/#/bug/linux-d180c2b9-0006-4638-a22b-13df8c201235

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106133933.1577=
-1-crofts@kernel.org?part=3D2

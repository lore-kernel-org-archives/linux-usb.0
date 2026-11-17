Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907809;
	b=hXI5UAK6f7Ba7luIdcd60r4magQ3FOmmHuSYjwS/YR4Pq2a1z3nEv8fs+8kb7arGH6bM
	 531FqVbJyRJlI+9NosL2zNqDEPQ5SooBdMe6mG8C+vP/OJwxPEJkZXpEI0u0P/lWv39qu
	 HntXx+FiVdWMCH4yM86eo5Ql7Uhkkmdt2MohtL0f/P22d32E0RD9TIBLetqjijIzY6X+s
	 cE8eYsQlKrPhgwLJ4PUepRGa9xTuLUO4AvmrWb8lP9svM993bpyQ+bezozEZacIZPAeB9
	 SWzLNKg8lAqpKfRUSrf4hdqB8WO9v+SMZVJhdjPmG5dyVH8s5qpRi8sWxSfs2d8bXWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907809;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YLTN9Ijx3bLJl5lnNRSLFu7WA/C1lNEITVViiJvvzSo=;
	b=GlyKzPH6/+P110bFOU3mRbr0S3XJlH+aehlIi0j5SQLFVPIY+JAcudq7JWI1eP/9t8wm
	 1zrRv/MGYoUJ91eox6RjEvU9O8BjAaz3Hyl9jJW7Vw2PloKOhLfIrt370WxeHW+LELpT5
	 Q2wZlM53JGwiAGq1BjOh3v1BEN34bEjreFQeK8ngtCe+Cqo4/Twuad1dJ/HSZrcpgyxan
	 GuX1wAM3v9mLmiozuRnxe7zYt2oabSwwtaiHfPEybVxKbBvIRNs3IW9XGWPIs/1fynCeQ
	 TuvyrlM0fM+XIdErGS/Xu+L8DCWa0r3XGUTluH4D8xlNbAAZiT06368GoKWvPTVGpXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJCpG87n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6D606A329
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FJCpG87n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594331F000C4;
	Tue, 17 Nov 2026 09:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794907809;
	bh=YLTN9Ijx3bLJl5lnNRSLFu7WA/C1lNEITVViiJvvzSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FJCpG87ngC4oz3OV1lors3tlqQbslxTCHbqKx67Z7gUQ1/5bfYYJNxvuFfaaMTMvB
	 UUzV/gYfj73Aw0EfXEOUk7hp9Pa8mjzgFAiq/Ed/2WjQwzRHVoyCRYOtmSHBeI43n5
	 /y1sknM1/6x0BiVj6BHUHkcPew/eFWGnuluVVr8aYAyrwdPrxHb1qWDKAbstIKbmzB
	 jyPJxnP5UMCqDBvP/sg2LXPDT47HwBQN1vMd6A2Sxpz8ihJ78fdB6EjyeCLodjoguu
	 bTYY43MBt6U5WRdd5Zu8yAfX6oCkG5G8+tJ48cEt+AUshE033VLoU/2ZY1vZQkCETa
	 AUgYKCQqXTCxQ==
Message-ID: <sashiko-outbox-218486@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: phy: generic: request the vbus supply only
 when it is described
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yang Siyuan" <hsyysy@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117091956.12103-1-hsyysy@163.com>
References: <20261117091956.12103-1-hsyysy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 09:30:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: phy: generic: missing Fixes trailer for commit 03e607cbb293
--

commit 56f1331b1fa011c1da842446fa9ad5d7fb41931f
Author: Yang Siyuan <hsyysy@163.com>

> usb: phy: generic: request the vbus supply only when it is described
>
> usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
> regulator. The legacy usb_phy_generic platform device registered by USB
> glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
> up in the dummy-regulator path and the regulator core warns:
>
>   usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
>   exclusive requests (id=3Dvbus)
>
> Only issue the request when the device firmware actually describes a
> vbus-supply, and keep treating -ENODEV as "not present".
>
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

[Severity: Low]
Since this fixes the unconditional devm_regulator_get_exclusive() call,
should the commit message include a Fixes tag?

  Fixes: 03e607cbb293 ("usb: phy: generic: Get the vbus supply")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117091956.1210=
3-1-hsyysy@163.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026622;
	b=Meyo6586r4YrCI2S5oeCqrPduNGmBYbnWwrr6lhveZtCDktlFlWZX6KEhJ3/kPpBkkq2
	 MaJVmx1PyZCiSdo4ucXWyPME9+jCIZBLQ1WBmae8X+Rv79nn0fcHynNkjTUnLRogyRPm/
	 6s2prZYK1LbaLIDGHWczliskx0x5uTKk9/fwXswFuUB2lIVW8YlgoRIlNqvg/++w/XzdE
	 LpwqSybGWHXyvKyp6nEsUeBs2qpwkmuQg+XDGw8hT+nkEyT1092uYuk3ITdE2uiSBO+39
	 LWjyFjKWX00VsIvwxaVcbx1gb0L5OeIx9Bq4GGtNFC4rtyx7Aiv5Wu5TN90iER/spgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026622;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=h3taIn244r0jx2w5qcG/59xg/kRR8gd7SZaT08tgp90=;
	b=XhJtVYWCuh6zYn/Q2iJDLOfbmG6lUDGEkbGj8JbsZgV40guB5uwh2RXBZjGJ4PCOUsZ9
	 KZ17Eeb52l3qYTl4X3YEqWpvCjj25SFfAY8hcG1rPMvXs9X7Z6sZfIzP4JRc9gs9wDuVF
	 L9gS4OoEpFHHDkQbPgW5/8SXceR2ttGo1/qXARtIkIN8qP7yU9l73Mespj4ZrINZtrA8j
	 akQnhmqvUhGgFmHVvBvKpC12/sgWuF1UxRtxnBGMbGKaWgO5ZW/YA+fo1nCX+0DGTo9bU
	 beNQNnZx3PrqtYeYGBOzbUaeo2KrINDX4Cjs14yGUas4OZTnJjJ1qyLf6NixBlW+XkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oyu8fIRr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E0606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oyu8fIRr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828531F01825;
	Mon, 26 Oct 2026 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793026621;
	bh=h3taIn244r0jx2w5qcG/59xg/kRR8gd7SZaT08tgp90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oyu8fIRr6CN6CfpH/VsJ4x1oGkX/1KTHI9zXw83NnKFIRXp91khpp4mgx3aZsVg/X
	 CTTLSP5EgkU1sWq67H7riJmJiPm9md8fFYgPtMDUUou37Vue4Isj2shwszwjp/RQUC
	 eBqWtzEl7/oWdapDPpGp+vxfbTswtdIS1UfpB59IXoOjszEuaIhnUV8LHlrCCgF+hO
	 v+cZN90nu3W1Pkj/yUKc2OXfL1ms/ccMwesF4HqEmJ9HtPVB9zWoqIJwZoPvYeejlB
	 297Kx4lCan76qH2wCuaMDW2UsxjyoSqM2BaLrYFnEJAhLZJ//DEXOIF7sl6r+bPfJ0
	 kdyJbUwU7gVbQ==
Message-ID: <sashiko-outbox-185415@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: phy: generic: request the vbus supply only when it
 is described
Reply-To: sashiko-reviews@lists.linux.dev
To: hsyysy@163.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261026144800.1392738-1-hsyysy@163.com>
References: <20261026144800.1392738-1-hsyysy@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 14:57:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Yang Siyuan <hsyysy@163.com>
>=20
> usb_phy_gen_create_phy() unconditionally asks for an exclusive "vbus"
> regulator. The legacy usb_phy_generic platform device registered by USB
> glue drivers (e.g. sunxi MUSB) has no firmware node, so the lookup ends
> up in the dummy-regulator path and the regulator core warns:
>=20
>   usb_phy_generic usb_phy_generic.1.auto: dummy supplies not allowed for
>   exclusive requests (id=3Dvbus)
>=20
> Only issue the request when the device firmware actually describes a
> vbus-supply, and keep treating -ENODEV as "not present".
>=20
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026144800.1392=
738-1-hsyysy@163.com?part=3D1


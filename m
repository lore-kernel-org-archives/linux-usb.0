Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793925810;
	b=u1i2NurH60gAgjGsx4oYFNNCMyCgKZjGbwWizLgmDDIhjSTE8Fq0FQkC7frFZ1ZTXCnP
	 a3uJNDVofIy0Kx6AJjQgU+to9En/ZBF50IY6yOLcUjQlBjAC7FBPJ35BJ6pPhble7iHkI
	 YhdITXCEfX/QRUlJ2tR2LYfDFDtoCs7rnKVU6BpCLfFaRdm38HNzf1wdhOPOirVvToaJc
	 a6VEO6E6904itCkjEH9LrvnWNOYZ9nNjGL7msbHOQ7P6oCUhzYuv/Qkc1yU7e5drR5QSg
	 lTouVTMUN4L/67Hr2DW1yOPd6svLqDa2H8ErU0RM1/U4QyyDO4buGvsK+Z+lybKDmOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793925810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
	b=CIfj5Ju7RkW1QVeWwFIMmDCUwq6cHes/SMANYwqCkJ1hmAjf7uh2q3MgyftjzQZ09ed0
	 DcY4dMxPNTcVQxc/CejbClLNwUtcslgaZkynHKeaK1pIpRkvtc2NvRd+wH9t0ljlCm83C
	 KjAdpt79+t7uE94Z06kSUGP8ZechAyMpNaryV8lj3d3cMyy5ICzpb5Rz6e0hXxCxnBFGe
	 MXH8GHB8F8+gub1L/V1r3/B98BAL6Z11yDRqqfXM4pSQq7F2K+mKbM0SRpkjSH0aIw57f
	 JK8WPTBVnWHQGCUtkDCCsxOs9g1i4M83nMyYU8KLtbG8SZHMZoyTvSvU2AYRIS8hOxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi3VR8f1;
	arc=fail smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A3606EEB0
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 00:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5A3606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hi3VR8f1
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso10037781fa.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 16:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793925808; cv=none;
        d=google.com; s=arc-20260327;
        b=qYKZHpNu3r/TrKdHDGUeya8zuwNW2z1stRRtXJdmBAa0yTE9wZpiOBbbBXTujUVFmc
         /6UTxKf8TyF1Swp2g+Q7ubiJ3FC4m0D+gO27HbMb11BCnOnDED9IdPAEALZj/mSXqopo
         PkIufHaGZTyYkgrkzRDiINMclItctjHSj980xDbrJss8ykWND6q/JGkL6r2naa6qdZTM
         G/Q69xw+fcR/7uzPBpfwe4ul/XiMbVpqABEOVQxmKgFPtt+Cbm7LVJ0vqk9+rKGtAx0n
         wnGV2WbnfM7ifC8HVFDXLxvXzl5rB0AiYfaVcfB5WUegKaUG4X3wdqlK/OsRR9PQ+w1K
         RCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
        fh=fPfLNPYRYD6A4ZRbF+wfzE5VzH3JdUqwxQNYBMlCHgU=;
        b=K/XoWCAwDQ96AviATUPHmyyX7OvZlKEskUrV3qP1V8gDEttjQQi2TKtCfiHqVKCji9
         QZEyIq30spesLAd88ZQL9UIoB8WCprTLRpGCeqULsYakVDL9yoLkSvx+mRfD1lEc04XK
         zWVVT4EoySY6xNvib7DugvzB2u8H/U28J8vj+FiWckfdPQEWpjgiPrneGS65/0DRLzut
         ZpJSiQgS7dR5SxS7NnHvk1stYsdBiXyWOr8o3zcoxr1MSOYCosoQrd5Sgbjz8vYz1wzR
         0KCuX8jinxv2VzDUUcSwPquD1ooWNnhnUO3QJxYOKyMP9P9Uu+8zJgEilPqbD/DPF36x
         42qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793925808; x=1794530608; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
        b=hi3VR8f19ljxLMo/woOrQIC0BeUowZpIXobmdibAOPuK8DY9d+cDEZHbWIqWZhE8ax
         krsw/pPZV6/lwTgmi0R4CS95+P9GyG021vf1BBxaJ/mEJxesPELhgXG6KgRFSpjzY2J8
         lW/hOrK862rc3REFXgxUnuzxlB0rgs8kGUb5Sv455YgwSm6CRd899yk/UMyh82bFf2O1
         w6X+9XpQYDienE44sme+aKMuw2GODQpPTDdN/dFZnqDG+Cact+CcYlcbYu+cmABH8XFL
         Kqg8Dr3SXndSAXznmUaibxofEixLdLeGSlUvePZGQ26JOh3X9Q1Ak/ImzcGiYtqlQztO
         EbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793925808; x=1794530608;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qjiIc9YUnEoIVWcKqPZO23DxNrAI/hQv4scM2zT69bw=;
        b=Qfu74LINDId2SCBkosxEWCWjHhWaw5XoTjbVO4XFr8KI3wXMdH8Lvv/nP7QfHQQsHh
         BET4gcZ6VokN9u2O6rIdTXqUoVGA++bs0LW5FbJfJtUrDNAayzfQrLRrEFkbTOpM7AbV
         +SvC7vh/GKY2/fTCIDtJ8wpB1QWf4AlX+THz0IKiZERYurkMR5Z6t1VOsoPiv5KQNDCp
         mt41LYZVYRyTe7lEjXPikHSCggn92iMLe+ud+ScYyG7TtXFox4TaO/jRy6F91WFIr4vM
         YMBla5oM/H1LtB6y4gETGgCxWBWl/nxxP4bUvH30Ma1B+PlNk4sY3YLVPE4korGMM4BF
         Go/g==
X-Forwarded-Encrypted: i=1; AKwUvBzbwB3v3Ku5fN8vBB0wLP4KUcybm6zQTULmbzUiNHWnqNOAUUIZ5O2J0ndbVTImANSbMb1GNRGIiMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ELB4IWovgEVEG8A+GvTAO+xeHGdzn8Z8uWGjgfqyi4yJXyW5J
	+VoY2+oBRz0iPaNzmAIO0huk385oOT2CMVb4RlijSqpMLzDNYV30kKSevAi/dz+mLsRq3sSMkjU
	Wt8e4I1G0ntwD+AuR690BhazfxubCi0A=
X-Gm-Gg: AYBFou2Up3LXRJv7Dh9lGdxdXzvRMX43pRKZ1A6sy/2oRzwFOMJS2+RP2Lb7C5TpoHX
	wdpxGpDDgn9aU4cv47NCcZTNFcaC3YmnhgswwnNGNQ5cN43J8K+aEvICcSpwN5+EHsDGcop1j/M
	Pu3FifSUVyov9MX1BWHh6oMtuITIT/byHO9KGUJJjSNfuD0Rb1ogAEZ3wegoGvUsR3JBC7kmXjI
	A2UofBji3SKKbm4gw5LwpJeGYGECwiDPdESZkvkKnoZoGIvPCOV2hMmyU4/SqtEzpWX+geLsEPh
	gz1EjeVciFK8x27Py6zUGrA3NzHy36LiZe/14ufiQkitZIjY/AKYVZBdclGkszIyWjjsoUdRvP6
	xtlWVsMrqirgwvBj4JziYYDDyflDj/IxLxTCWd2ARchhBf8gHzFUKR6igm95/d/lbKcv0V2oR5u
	qLsCMfSy3lr+MeO7ze
X-Received: by 2002:a05:6512:b88:b0:5b8:eb86:7ab with SMTP id
 2adb3069b0e04-5bffa14052emr1230702e87.16.1793925808122; Thu, 05 Nov 2026
 16:43:28 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027032332.1945140-1-liuc63@xiaopeng.com>
In-Reply-To: <20261027032332.1945140-1-liuc63@xiaopeng.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 6 Nov 2026 01:43:15 +0100
X-Gm-Features: AclHuK9dRbLnxECgRD1l46eIc4GQ22vJU4NjcoMmUKgwsiEbNqgmSBWhyJwPnKI
Message-ID: <CA+fCnZfgi_UUsMg4p2iRePACOAR8StQRYhgC9fHETE8Q5n0z5w@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix dangling ep->desc on enable failure
To: Liu Chao <liuc63@xiaopeng.com>
Cc: gregkh@linuxfoundation.org, krishnagopi487@gmail.com, kees@kernel.org, 
	balbi@kernel.org, zhugl3@xiaopeng.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 4:23=E2=80=AFAM Liu Chao <liuc63@xiaopeng.com> wrot=
e:
>
> raw_ioctl_ep_enable() assigns the user-supplied endpoint descriptor
> to ep->ep->desc before calling usb_ep_enable(). If usb_ep_enable()
> fails, or if the subsequent usb_ep_alloc_request() fails, the error
> path frees desc via out_free but leaves ep->ep->desc pointing at the
> freed memory.
>
> The UDC driver may have captured the stale descriptor pointer during
> the partial enable sequence and may dereference it in subsequent
> operations, resulting in a use-after-free.
>
> Clear ep->ep->desc before jumping to out_free on both failure paths
> so the pointer never outlives the descriptor it references.
>
> Fixes: 97df5e5758f7 ("usb: raw-gadget: fix gadget endpoint selection")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 46f343ba4..b52ab3ce7 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -886,6 +886,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, u=
nsigned long value)
>                 if (ret < 0) {
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_enable returned %d\n", ret)=
;
> +                       ep->ep->desc =3D NULL;
>                         goto out_free;
>                 }
>                 ep->req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> @@ -893,6 +894,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, u=
nsigned long value)
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_alloc_request failed\n");
>                         usb_ep_disable(ep->ep);
> +                       ep->ep->desc =3D NULL;
>                         ret =3D -ENOMEM;
>                         goto out_free;
>                 }
> --
> 2.50.1
>

Commit message should ideally mention that the use-after-free is not
actually reachable.

But the clean-up makes sense:

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>

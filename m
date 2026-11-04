Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793782822;
	b=hm60dYi6DCeQpxmRtyoMo37DpG1nsfRcliTNWS0PDGxS/2PCib7e5wqJYKwTyeLwGn9n
	 kaEa/PhADoPqabUtKGcThAiLbF3+EsKHuA9X8xnzU/OtNxcTV1XDZWPTgaeMw0vMMwXSd
	 /jvoPvxx7GaTnRq7r/zoM8MVMzgUEj/wXPFW7LCFLxKwlYsQnTdutPLVxSPDbOJxjADhK
	 BxHV2ZPTCQyW2lCoAYTR1UYXzqHJIMFjvIa6KG3uztAoPmyAlvaQxuyCAne01WiDfjHKj
	 zpcyZvRCRcj+xWbPl4ztHeSD4yDWJshwVoTXMzj4diP19/NLK6xRg/ASXIIEb6yCU2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
	b=myHS/UtYvp0j4n/mckzHkLdWAKLweIMKl250czuuXY6c+wMNPKp2ZSPPYVA30VIUnjZV
	 oVHY4FBg5kjrUA5OOQKHfJEkAFpTauf93EQtQFLq8wySTc5iwP7zjAc6Z4u11MhgpwPYj
	 x6bkIjyflnlnTFaUg9ypYxNOqm34OPJtUfxkXiSjSqYeI/wreCu1D4nwR7iBIiRl1t5Wy
	 wSfVqy88LAjD5SfYo1QxIIPr5/eTr6XILYCqlEXsWSCf/C9psI5nHioTzviKH5+hlfPSs
	 OujAljQhuV/RrYB9eyqeDqc7tvGDzdGZ92Nip0AaEQwuKbAi9ZHUrnM1iglAPDu631w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ivZqyW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C414606A32F
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 09:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C414606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3ivZqyW
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b305e10ac7so4469417b3.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 01:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793782821; cv=none;
        d=google.com; s=arc-20260327;
        b=ojnDEtIGTE9zyl67fHuVM57lEDPS9SrE41mza6CPUqna9zCdwC0Oz7VD/VDLRbIT09
         sDifi0yPE2CzxueGRaZVylRd2UxV5/bLd3Lo1piAnokLRHfrh6e+8j8Pl6O6S6JEgLSQ
         2d4h7C3r1AQEo8oxyPZIVvx243YT1CJKiTb3R5cs2zLaeYVJSefl/TJCMF6aw36LRRVH
         RuXToQsqT7FXUgAJ8VE4VB0a0VAwsIl/VbGAsoEslehpjJMJFHtA4WeiY6tFuQkQXNky
         p/8vievy49zfyI/ff74zwmgOSZUGOaxhuj6xINb6lCY9j5n2Pn0h6xNe3aRoqKBQ2cPH
         6HzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
        fh=Gcx+Ic2nYrjykhnJFjN48PwbGJeRkZIfUmaW23VEa8o=;
        b=jVHe5Tj1JcteSNEtgODnh4MjOkQgbqFEk0f3Ju1HJoGY1F4xwzQAI+wIfJqvS+djOI
         Xb1Y5G2Pr2PCpPLyOcTsMaUiXvi2rYJBYyzOLbnfZs0cOhPjRmr/wxpDO6sHgUosnSFm
         8DL+2uk5QJ7iCrWyPsx4LgeZWTj5WERw+njI1RE88XSun4luqE9s6mKuqtcppCYGJYnS
         8a/IsvRV0gIzdDZ3g3gpwvfZ9WJX9vrn3vmmGcl3zzbv0lUvlsjPULx6YvkeGMpsAX2Y
         cB9RLhmKCfDmFvpCmOw8Wb3UnVdQIKzCYEegvj+/VDXZLRLYJNbkEVXtnez0Ch3uVcYZ
         bbKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793782821; x=1794387621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
        b=k3ivZqyW/i5hsCfSRegBwCk6+sTwnMRe7s8pzYECupWJ8doY2l0NM6dGujR8WERmtz
         Xx8CRdRoPq1VTSAfQ5LZv5eygZustD9uJ2aH41pwzYJ1VN5Y6LBmSXfijcKkJMdEkld3
         NEuh6+e22bGZzRiW1upH4Xj+cmgHIz+zmzx8rItCOxgKE/GKjX7mLA9TVMr2xUTCVkB5
         CMifmp38Yrb5Cr0mrZhReHJdZmrk3G10CtLHe80OUMLuolhPV59MYRlSgcchjf7rlPQb
         LN9LF0W0cFfhhFpd9LlvtmPjEogpw2WfQjzBI2Dl901e0efdGQCQ+RPMLwblaQeApa0y
         c0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782821; x=1794387621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jTRnpEDN+KWb3ei+FUpJVOT/UTcJwtCB9oaH08vzv9M=;
        b=QRVx1smah1KHkkG39MwWeIHcpyQEZPOiQtur3GtPUtY2Pvbh70GC2/NZSjLUKg9Eia
         Uz8mgvmA8Cr5R7btZNIN+uotMxc6XRDfgBngFhxk/agIkh8DKM2uTZEyQryVh55Huxqy
         9ZikeBbDofTj9xil0/mVq03MztV7pSPMJEt1YGH1hAMxqNB5tbs0uKTf1g2WPitiOqTG
         OxJxPq1bhSqK0cxmm6Lnks9W8aS60caUTU6xucTmUdyKK9ho+kvB+N26+jEdM/aX+iCt
         sLT1EsU+oYddBLKqYweSHL+7BCim40+eUtxmCLhkD0lXaHch4PPz76Qyooe9cDscakMB
         4e4w==
X-Forwarded-Encrypted: i=1; AKwUvByaOuNbamDB4zQihq3u1FUTNJ95J0vj67ktKifv/8aKSz0rVS1/QyeM+Ncz2qfUW2EfXEDFoT7w/u0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JYZUZLAji6jKkSr5kc4qJnpLZTAEEdDMO4XZp00D0yskwVwCC
	3rQ+ID5Zq6Frk1VYL0spXqF5Oc3WMX/AB416caYqqvpv2cMHxStZeSnA0CLViAL0LaUPFXaUz/o
	uFDjJ/RxO170qGjImr3L0l9wtHH5929E=
X-Gm-Gg: AYBFou2InwZD2kKpKlWbiCXGjqzLNqaK593DmVn1RLuZrpDXLVchf8nGZn+7LGfrNl0
	DyYmR+LGrBzF3UIk1BaAXgSza8z6kLS9cGae8HvloC1JmEEwYmGBrXn8eGD5nkldnb9+QXe6inR
	UNABm4FIbPcvUzS8AH8WjEQ6UrxFxSDLbz+XmpFPpXc7jl1rlyzqtZik7WJNAoiG9sdrFC8NaxV
	PyvRROmViKpE+hA2kwcjaKOAFeAvU50+b1PmfNsPuJaHdlTTaV5PjPKrnt9OTlX+buf6fJlluZI
	sOwH61bw93FVb+pbo294+3ASDfMYIyA1yPPGDWsJK8oSP07jqHjmrxDd2bpBEHPg0gw1+01XuYS
	6WStfH0DFLlXW3DuC90xbVTC+BcNaJHdMHKyl1M9zfOK8dV6CrNtWiV1hR0x5sMa3lWaL
X-Received: by 2002:a05:690c:f05:b0:8a1:781f:4aa0 with SMTP id
 00721157ae682-8b2b67f1889mr109610237b3.56.1793782820885; Wed, 04 Nov 2026
 01:00:20 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com> <20261102130145.GU158991@black.igk.intel.com>
In-Reply-To: <20261102130145.GU158991@black.igk.intel.com>
From: Diego C N <diego.sure@gmail.com>
Date: Wed, 4 Nov 2026 10:00:08 +0100
X-Gm-Features: AclHuK-KTLDrGi9C8ZMZKwzhArkycX_ZxWgS8iSAY08wiND5eYgccYF5_KZeB0A
Message-ID: <CACPnnOZHhdwOSDhsnG22SyPD1JsrcgM4Y26QYORd=xoUzhXuVw@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/dp_tunnel: Allow BWA when the DP IN adapter does
 not advertise it
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org, 
	Uma Shankar <uma.shankar@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mika Westerberg <westeri@kernel.org>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika,

Oh, I see. Well, thanks anyway for taking time to check this patch and
for answering it.
I'll keep it as my personal patch since it's been working very well
for the past weeks.

On Mon, Nov 2, 2026 at 2:02=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Sat, Oct 31, 2026 at 01:18:18AM +0100, Diego Nogu=C3=AAs via B4 Relay =
wrote:
> > From: Diego Nogu=C3=AAs <diego.sure@gmail.com>
> >
> > On an Alder Lake host (i7-1265U) with a Thunderbolt 4 dock (Dell WD22TB=
4,
> > Goshen Ridge) driving two 4K@60 monitors through two DP tunnels, the
> > monitor whose tunnel is created second is limited to 4K@30. Which monit=
or
> > is affected depends only on the order in which they are powered on.
> >
> > The thunderbolt driver enables the BW allocation mode (BWA) on both DP =
IN
> > adapters: it sets the CM BWA support (DP_USB4_DRIVER_BW_CAPABILITY), a
> > group ID and the estimated BW. The DP IN adapter, however, never sets
> > DP_IN_BW_ALLOCATION_MODE_SUPPORT in DP_TUNNELING_CAPABILITIES (0xe000d
> > reads 0x01), so tunnel_regs_are_valid() rejects the tunnel with:
>
> Alder Lake firmware really does not support this and by forcing it to be
> enabled you may end up in untested code paths and interesting behavior :)
> BWA was only officially supported starting from Meteor Lake.



--=20
Diego C. N.

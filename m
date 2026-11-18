Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991945;
	b=uBPp0t43HxESihnEoeoQ7qYosaWNd7UdOB50yobtyRvE1+uFJmTngqHx13o1i0p5radd
	 bpOMTFYkPR24s2Waytg5Nl7y1q67xemKf1e8CMON3XM7ZpE6j8aFIq+NqzpMZ5MnCKdSm
	 QIMnghD4Qd4k1PJsbm6ghyvOzUsV53wGnnbJLdbtg1HpzUAymKIco+C6uVazi+sPz37ox
	 85hxZ12fQC5uByzkTGSKMprbZ+gZE5Ak6dAhQ5P8v44c+eu2J1IfPM8iRFpRyAXr/aPot
	 sgf+zdSYq+HYaQOY8oQQ8PE9qtKFtcimsolpaJWma3PD4F/HFnj+l0O4E+XLkZZcx2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
	b=UoXNJ0Xi6/KX1eMs+Y/lzZ9LVjSShKOp6tMi1CNfHKP5EDe2uD2oXtkrp80zNMzkNIwq
	 19t0zegizJpBt6vp/PRl+5Q/ALAK1UiniBOcJT9wZQwQuyP4P7XQnikHjDel2ZdpdsQa8
	 qTNDHtsy++IDfIaN8q/C3C56UpCI2fu7dZczQQGAzl20OgFNb90yIJfVPwR19XwL0nNBr
	 rK3dLa0Ur9nAbw6ikSTLdOssQjTf8ITbIq5YYWH0b2uoUoBEy0uraGGpfKbvXM9zseFGj
	 14rCERvuViEjGty1Lr5u1WIS7tsvG6u739IMlOyABHEB4TIaUXouBRFaF9KBImbRg1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5506B606A332
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5506B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so1399491eec.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 00:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991944; cv=none;
        d=google.com; s=arc-20260327;
        b=LheGBJ5I+/6YJKn85UHc+pQJhbXh/OhSjhg9VjM6H92723rKRBllSFpDwA5cL/cEY3
         +uz/kr2hcAz0HHbhVcm2mVSMTqakbk0LeFfNxOtQJkg0EJUA/rajw/6hE/8kmkmtw723
         Ff1m7nGaPSvOYfT20nd9Z6jOoPJNfHgYiGFHpNfU5lOdEyNpp/FUbr1xps4jk3ecmvw0
         6tl+uGRvnEDdrMYwazuZFjHBVxI8Km8xjRqmFCDoMoQrog2T/PSjzUpF3EIgaDxXCLZO
         cGF2HTnbgOBiFq9PtBXjk+jLVnwb3vgM/U6vFvlEcdnhTRaBIDWHl+tHgY+BuJCGR41a
         nqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        fh=2eR010RMXF2yUL/2Zc+FctOu7QmFV7iN69E6xKprgS0=;
        b=J0baMACy2+A+HQlHJjv2PAibkZzmZjX368Ei5ix/wZQHqVijb6N7l0ktffMzS+EySD
         rNq/0GUdoz+EdQudmOIfuImf0/gpfGl5PZSfsisVllUJUVSl3g7tMWvrmrAxaKIwtSjn
         I1ZBwAG+MNJybXMvOVzHeoefTfXhnCZNpihNk9mLr69S5L6zY64z4ZXexqvXM7cH/ohK
         6xcMQsI9oNuww46WRN8LiTu0qNTDJ2bLa11W4BdIP7/vFxGLKxfWCh7MHpcfrWCBLW4c
         8piB39N4JJccKoq9IeZ8Wd+yoRiEaFO5Y8QeAVNGQUvWDooQYPoglLV38kjszUhXHBQV
         ppfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991944; x=1795596744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=GabG479gc7SQtMKk6DUrhHDQXHroIceWLhNoIHp0kZP11T4uJNV4ts4eVR2bGpM5WI
         8Mhz2biSzc/F7bv3izo8A5vZl7wp3vLTa2I2Lqaf+gLsKbgflvS1ReE0JkPH2eXxg/B2
         rBXOpfodZSW3bGHJ2LZPbpNK9baCxzFl9nHtbLFKA838yANCndxu3C3gYthddFNl9nht
         JzVfgWpqrzL15vRDk/jeYU5loe/y9d88sc6QFsJ76e351jUPEoBzazu5kTzlgOsaaxuj
         klgmv9RQuGyOFaPK//yZO6OuIjOMR+Ov2oYOrE8pGUKIUYb5tqnBmPWNbS1qUBzO7VyT
         NUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991944; x=1795596744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=1p8x0e0jiy0XmX5+l3GIqzFpkp5QbAWp/DMdU8u9/49TQmK4kYMHm96JT6LRCaxYp1
         QQjwgyrrmR24F74mMJIPvm0VEtkGAJV0Uq0vIkY98N6kz9fjgD8QQ3GyXrvmrfdOEF/h
         GlZrOlCK8ETZXWQZ4gQiREhUoUF2GLERxdiL1ScsCqOKihIEyT4O/zenFgqPBJoF3V1F
         1AahWqOGCaKP2toVgnuvtbIgmVR3kKwK9UxR7G2N0B19oYkfNQqfoW5EhnIijG7JNPZ+
         PNXPs94MrWbMVjAiwqdgqeREFx7Vg9P7YGMwr1PrGXMWhKPLhsXhwVoo9DjY6wbkrvu6
         M6zg==
X-Forwarded-Encrypted: i=1; AL+hErGpHWbRGJUMD0S1RXHr5KFO3bWBLjcaPhr84ZPkIG9wPM34Tl3R9FJuTpobxo6czT+xhcD7xrv88RQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BRXgJ6zygC1ZCW8HUp2oGVnEMZTYd9JdjutTORK9Dg0+QXPyg
	Jj67UMmfQC3/3zz72q1ml0NQhq95QgooD1PC7GnWiZMGz3MQtA0I72HUK2vfYPanOMd+yD9pWww
	6XH2DbQBlJezpQMmGeeKd+LnModOgKRv8YA==
X-Gm-Gg: AZFdTZfzUzSqQuB/Sa18dHg4km7KY7Yrud/QsFe1gtHha3XTMqEfb76nuBAEy5nmvB6
	+FZsP7rumJKx6tFwrKl20yOYJOpXIHxJ/2ZCconzdI4//tZCL7nl5NI017X469SvATb179Myr7b
	FhHuSmn92CI76bDbZVBQ7/RtGqGU1PRSD0OdXBs2xNrtNrxzhDhow05mVu1vOyMB2qqh0I3+bc4
	T2IWHQY1e5y2nEwn2F2+5MgW+wmqd/0Hskfrk3/jeYw9o8uFdRZO7H2igWIGPfEnp13Q1tpHBRi
	worzMq5DqoE7GGztD/+acyXZE7aYbYusdb55dK73muJPdO8jofcs0SkMjL/tbOZgWjm2lfbFo8f
	WnIakpyaU4aBhSW2qYaaPAUflgyxNSsZQ/cXxhLMACUO5nGzUXnqj3OkpleDyek2J60XtgJQdH9
	KPRpqux5/gxV+mo666+NHaSf+5BVOk1A==
X-Received: by 2002:a05:7300:d210:b0:374:c5cd:42cf with SMTP id
 5a478bee46e88-3828180f712mr2187391eec.35.1794991944368; Wed, 18 Nov 2026
 00:52:24 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004165204.205660-1-clamor95@gmail.com> <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org> <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
 <avxHzF-uiOAhwXIW@orome>
In-Reply-To: <avxHzF-uiOAhwXIW@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 10:52:13 +0200
X-Gm-Features: AclHuK93RBJ02mfDmLX1EGnWRCzqbB375hZf8dudgwlzH98v_5reAPWSy751p0s
Message-ID: <CAPVz0n2h_uzr1MRZWSxUiPwu0=mXjhOwaP6HTFHDRV9DmF4z3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 17 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
0 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 27, 2026 at 10:51:52AM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:29 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > > > Move all Tegra-specific Chipidea devices and their properties into =
a
> > > > dedicated schema file, by analogy with i.MX.
> > >
> > > I don't really see the point given it is only 2 deprecated properties=
.
> > > Maybe those can be removed? Depends if they are deprecated and still
> > > used or deprecated and removed from .dts files years ago.
> > >
> >
> > The ci-hdrc-usb2.yaml schema contains properties that are not
> > applicable to Tegra, and conversely, Tegra-specific properties are not
> > applicable to qcom, nxp, nuvoton, etc.
> >
> > The 'nvidia,needs-double-reset' property is required for Tegra20 and
> > Tegra30, and it is still actively in use, as you can see here [1]. Its
> > marked deprecated state appears to be incorrect, as it should simply
> > be restricted to Tegra20 and Tegra30.
>
> For what it's worth, I looked into this a little bit to find out why
> this is only needed on USB1, whereas USB2 and USB3 don't seem to be
> affected. Turns out that USB1 is a different controller than USB2 and
> USB3 and it has this errata. In retrospect it would've been more correct
> to assign a different compatible string for it and derive the quirks
> from that, but given the ABI stability it's probably not worth
> correcting it at this point.
>
> Thierry

Thank you for the explanation. Having a common schema for many cases
is great, but IMHO mixing different SoCs in a basically SoC specific
schema is not the right approach. Having a dedicated Tegra version
like i.MX has seems beneficial.

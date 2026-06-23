Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A036F3955FE
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 14:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782225352; cv=none; b=i+KIAYJNtIFB0IT6dq9Eqgl74s23MvgWa7zWqRowA0fvWrU7RCUigVzWOC3Hw00TqyuIA6EmG+8R4zywV4Qd+JP8LO10bDhRDoLIs0cYP5Ol7aS6xlbQRq7/BLb6wbwyqAbw8/YeyhPNxQFxtzMYfQlgXUYthvS6UEJ9s5JlcZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782225352; c=relaxed/simple;
	bh=fKy5YnCZhDxCWkfmcmX8SEvo4bn+lLypjOoYVvYBSDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNzF6al29/+dRPdyYl5WZ1KxTF15YMo9qBadMk5BtPAWqvg4zkRbVhz55aosg8bca+qLCnuLI4JistEFSErc0GCkwjN053nWH6kVPxlNFxCWXUHySAlA7WdNdWTOSDnRIUD/4shISe2c9yr9PebAuthiC0kFMZDJ24w85KXAM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=bqqY4zxE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="bqqY4zxE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4908b92904fso81383535e9.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 07:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782225348; x=1782830148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p03/V4N3PaxsAZCpDTVaKukRbxS3xX9UfTKCkcMJvwQ=;
        b=bqqY4zxEpvYf4mVxdM+NTFNqIvNTRJSfwck96w9NaLf5gqIW06u0cFTvDYZBDuqPQk
         yx5tOrcq/qnNt7ZywetVAq6zw//ZPYuLe3hBad74aEUy+6Sjgr4z2Q+p1R9MelC77cSB
         khEnTqMQ84BQKU7oRlkBOiIre0lmt8fR2XLnRPqW4xBRzUUy5fq2WHdQAIUKeG170Z8c
         p1dXhbWyKh3aJuHoVMaPUFKxxLhlXKr6/4Dhf3okaQe9wfkjXAkeEo3KHFeo2Rvqf8sT
         AkuVXOwejHxIXELWcoJNpizf88JN+E9raHobh0YXs17/kXsp858NdfZCeea2X9R8TjCR
         c0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225348; x=1782830148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p03/V4N3PaxsAZCpDTVaKukRbxS3xX9UfTKCkcMJvwQ=;
        b=Cc2LDeEilmOolbPwq0wROp7g2r6w9b9eS/Mm3J5g3vRZLq1H9u5Kh0aLMJkizuwXKx
         EVmDOsWp4x/8tuHCzIy/riqkfWRB6igHMlMS4CTiKCWb3K5yH32Zj1yeNcb77aka2L+x
         Uu/7P0ed96m+uWrNbxKCYqEJij3+pMEeCkQVuJWI2VBi97Xu7iTrjfxz6IeqB8xrr3Cj
         w6vM2qh4lPK/dvQvOa5nsSCKXSOtsWLBq5J6ngApw8Dil4Yxn+mJ1r1EH3/wiFgYpRSc
         TXRBydpH38w1DV62wvRaLLoy/6MH9tlzuNHsWolINEq+0/9SpMJ3jhEjCg+bAZmNZyFU
         WlNw==
X-Forwarded-Encrypted: i=1; AFNElJ8Dcm4HnuXeljkIZfjcxHtrH4Ga+/hIwG1+2yF86at00FzOBp5aOheAf3ix5zogllXZZOYcrDUqbhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVzJV8Ot0zbdxWoYYhWzIcMVRaLZ0AzrQcoRWEIlo2JhQTscc
	ZzsL4oJevN8tp5Yqr7pHjeh4N6q0+LuHXtagpREbAJcf2Xxcc18dCap6OiyEJIP2T3c=
X-Gm-Gg: AfdE7cmDyxcYVWxBB5X9Tlzqqwbsmeb7qXiuPxNt2GQuwiP0q5b6wbhEJ1JbwBsJoYx
	UFQ02TIxLq4sMoWoChV965lb6jszg8EATW/F+p6hOd8Ie1obPVOHVSx6ioi8jCaFRRHvFQ5Q38Q
	tNxMURailExTlKvOmlgu6kGxmRzO23Ev7x/q+hc3H1F1382wlBldcgf+I/lLedMn84AczoYetpu
	1eomx9zNtRPmgVuNKziyxQMDCfnRxHTAutByUXD3giDkA5C7m1vhQi7dd+KVRuG17pkcYBR3y2s
	n5o8irdAsBlZ36E4Xqp44np/U1qsx1niDHko9oBdwAKbqC0Z2U5+/hpMSG7hfrwRqjK+KVod9Ji
	PDl2Zbe8Tl6b4TSSq5oU9IKSB2heC2X6EMBZh2HOyQ0YoCgxnxGsO1dK2gEWnPgawnd7lvoN+Dh
	RjBrPsHIEPKxf/WGKPbzSfGmw+PRWA0kzlA4MGVizjQxgrMlkwXv73yoi93hBNRGReHlGkFyeO9
	zulgIAgwMA7TA==
X-Received: by 2002:a05:600c:81c5:b0:492:4ed1:77cf with SMTP id 5b1f17b1804b1-4925b35338bmr40281835e9.11.1782225348031;
        Tue, 23 Jun 2026 07:35:48 -0700 (PDT)
Received: from localhost (p200300f65f47db0493d7da2f3a2c0dc4.dip0.t-ipconnect.de. [2003:f6:5f47:db04:93d7:da2f:3a2c:dc4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46666788226sm35782076f8f.23.2026.06.23.07.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:35:47 -0700 (PDT)
Date: Tue, 23 Jun 2026 16:35:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 0/3] thunderbold: A few cleanups
Message-ID: <ajqZcKCYphDMIqRn@monoceros>
References: <cover.1781776904.git.u.kleine-koenig@baylibre.com>
 <20260623121746.GD3066@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l34oe6w67l43o6ih"
Content-Disposition: inline
In-Reply-To: <20260623121746.GD3066@black.igk.intel.com>


--l34oe6w67l43o6ih
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/3] thunderbold: A few cleanups
MIME-Version: 1.0

Hello Mika,

On Tue, Jun 23, 2026 at 02:17:46PM +0200, Mika Westerberg wrote:
> On Thu, Jun 18, 2026 at 12:14:49PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Uwe Kleine-K=F6nig (The Capable Hub) (3):
> >   thunderbold: Stop passing matched device ID to .probe()
> >   thunderbold: Assert that a service driver has a probe callback
> >   thunderbold: Drop comma after device id array terminator
>=20
> Fixed the typo "thunderbold" -> "thunderbolt" and applied all to

Oh.

> thunderbolt.git/next. I also took the networking patch, let me know if
> that's not okay (I'm the maintainer of that driver too and it looked fine=
).

Sounds fine to me. So assuming you're not offending the network guys,
that should be ok.

Thanks!
Uwe

--l34oe6w67l43o6ih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo6mcAACgkQj4D7WH0S
/k7T+gf/Xgon2MgxvTPWE6llhCIH/yeCNiL+YW+XDYeJThkZMnsedTRVqwEaSK46
AJk1q5IsrPrZvHr4/S+8hknSgwKwiS8Jwecmn4NjFk/LvU/gKuYqx2eV8q08dJNl
xVkiQWfIiDAExtK4cmixSKiIJIEDK6bj/k3XV1Z+rk8inM7H2eSWLs+6ntqhj+1T
TVPhuVw4RYo0nOyAjsYjj9rPIGk//jdEjoNuyaVwaROm7KcknCu9YKIiBbtimJ7p
3X4y5sHIUOmSG24xqqMxt+xMVyyTNhb+2yLlaFpk45eLm1x4fJoKxxGnwzvWw4mL
sVfl6UCiHFCwX21uyZ24tpQ3NnByOg==
=+gL3
-----END PGP SIGNATURE-----

--l34oe6w67l43o6ih--

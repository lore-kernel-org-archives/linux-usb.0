Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793204427;
	b=4oYh0Nt1fgpjZboZikOyXLRj2ZNGnozcNN5rPpKPwOESpsD2uMBCz8vbrj2d6Cw80v5t
	 Wc39BpOiDbNxEnFjLEByCUr/z6b39rKBsiikde2h7QfCDTNrg29FEqnZTBU+xND7o2YAV
	 zBuT2PMj39cYjErMcXTiK2Ad3xyAbuwcp5dks3NOr+fkTJKfzCxTkh+2iwN9RZGUAX8p3
	 grUzhMXcKG8bB/JjioLddbnhwt3bYhugAnxRyn6TPhl81S9t7vPxenyrc/FSOX4E4Kk11
	 wJM/ZE4DaYVDeJHKwHTc7blcujWM4FNYFNHyt44db23sWgz6vASldwnXz0Phz1a1yDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=FZdcGTA+h9AzAtOd+lzkuRzpxRIrjwh4ypxudX3fFDw=;
	b=cZX1wmJN15xocWgqSRxH32KQ493MvhS4/+UjACdo1hDs3rFHr/Lz/CboAXGeWgCexzcJ
	 asY5bhhFGshOX8zyUoX3Ckt5qLzrnfumEAU5JDWyfLGv0Ykar8P/CKG037SjrYvFkI+Uz
	 RYm7LZo+IhawMIF6bhqNqTOTwz0MEeSwBhcv6RORieZ8SbWo+8SrP7nUNrFvVrbhQvMLc
	 6rirw0tmopjRU1Grfna1k+b8K37k9OB735CRJQX7X/PRi2AcGvzkr0PK3Kz7fGPjoMpZJ
	 WXyuMdMjIvzPiOZaJS9HTl1rX2rI77iD+gLBGLZhVchMP0JaknQB3VFovmVOaGq4oyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkJOWe9L;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9CA606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 16:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E9CA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IkJOWe9L
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso690100a12.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793204427; x=1793809227; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZdcGTA+h9AzAtOd+lzkuRzpxRIrjwh4ypxudX3fFDw=;
        b=IkJOWe9LXiYi6YrZWYxZvByX69tYEA/DXQLsTgxvpkUztYbWU2F9Sc1srt8hZperJY
         +hQ1N5s/eqYMRffh18Gz7oL5caxYc+/ohalRNG/KR179e8czPzyO/Zi/cz6gdaEshlw1
         fmH6wyShcHNqF2gj/2ZFYgb9OL+OBeWjUe1EHGXrsX9AesZ/9rDPoweVF70aGIy1PlfZ
         xzypz6E2+fLrrCGpuSRjjkIFzhIogfVTJQqZHKZXjsMAleWvc1jKnD7GjarrQw0Nat8m
         vsNld7X9rug5nYpAHC4oPewkVF6V63YAI42cVp2QT5xR+pDUUxe5udhEoQQjtWctSeXY
         HGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204427; x=1793809227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZdcGTA+h9AzAtOd+lzkuRzpxRIrjwh4ypxudX3fFDw=;
        b=g5e3Qcj+YJPRKcM2xTV5L0QufcYXrE02dGPbx6nQV8HcgU4trQtE3Q3Bls4yWdZ3Iw
         yxopx+qDxtyQrycxsbRCUiIOaAIAMBIJXEyCrqX2Ir1TdQMgoUfqD6DApJydZuIRtt+o
         wI83rQrDpE8n9dTqJ6AZQDGGol/R7brqkGjOt+bDIDtWLI0Mg4WQbdMr3KKdSMzRrMBA
         9sV1GtJ8XlnnCa9WuQIg4tUCdDgpfWRGu/mrZiG9cynPRs0SAwNdjbb+kiM88l/EJYWW
         chCU3dfGbOTuLJI9Iq1FvdIHRgR2ARsFwr3r1IVay7skXKAqNZj+mI+cihJ5J+/UbR68
         /KGA==
X-Gm-Message-State: AFq9FYJ3F1Rv9hdKIXcqCaSM+I6bb9rXNWpoTEUyejjoPSiH7uJm5zY4
	SY2PeP50bhzuxixAYPXOkZXTa++wILyPwhWIXsSDERyoUoP/CSNaApZipYvUjpa1wg==
X-Gm-Gg: AYBFou2dNdOfK3dFk0vFVI320v+8jVuZ+MANoTmHtOI89AOsTZ7OOv9FQFv7zMiC3WS
	92/oosBCLxF8Q/2vRF1FzHm2wGfOPx0yjGpXkuWghsATzkDxVMIbb2W0h57MJjarLYPWJOwZdWi
	PxozUP84XT1Moa8AktAi4DU3qSZhMk8JbwUxeJCNnAhX6pg8qcGumovQs85GlLQoDy0TeCpg9k4
	xXR6ejjEpybQCc2qNPtVrl0hk8y564V7E4hyvfu350d9rmnSzKGZinVgr2aHHEc5+sPf4T+rcBe
	psFM9OFkN6lHHCFAfo/Q0XykhDitC1o7JjCPbuE26ZKzc56GCCFS2AezT3HC1z5K1dNZukevDrA
	4jbZTp8TTsGAF04ZtLAYiBPdHAE8+XW8q4znI4ngvM/uHWT0xZXs0mYUlWRzxR4WUtJ6uufAx3c
	dHpVF4sKrk/zsycKPeU+RNhIzu4t48HAHwo9GoJusAj8ysqrXLJ1V8yKOtS2hvHqR4+fylcPVVY
	iHmpDrQ5gr2uJPNDzEEMOM8LVEOD9fZUzhDrReT0W3d0RSfAH9OiTNpsn9VKQO4JGeWPdX4f1fa
	tIclDYzhlOtLXZ8C3jTVKK6WOr/1wNHVCbE9vVrc8KHyGv7a7Gcs2N1Lm6y2jRdMfyhsnQ1Zf6Z
	G5XdZjSiTeaqw6z05FALJyn8riLsct575UOsDBOV3bnwMmiMC8wp1xdJ/SqIP0SB3/dU2rykT/U
	oJXKEfNj3P9Q==
X-Received: by 2002:a17:90b:5348:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3ae5822fc89mr2136829a91.31.1793204425804;
        Wed, 28 Oct 2026 09:20:25 -0700 (PDT)
Received: from google.com (129.119.127.34.bc.googleusercontent.com. [34.127.119.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9426ffsm148140a91.7.2026.10.28.09.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:20:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 16:20:18 +0000
From: Benson Leung <bleung@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	stable <stable@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>, akuchynski@chromium.org,
	abhishekpandit@google.com
Subject: Re: [PATCH 13/19] usb: typec: anx7411: zero on-stack alt mode
 descriptors
Message-ID: <auIgwsOrGy21YpEV@google.com>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="prbgZGmxhdo1sNWP"
Content-Disposition: inline
In-Reply-To: <20261027-llm-usb-v1-13-b9751ddb9c7c@linuxfoundation.org>


--prbgZGmxhdo1sNWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 03:57:53PM +0100, Greg Kroah-Hartman wrote:
> From: Josef Bacik <josef@toxicpanda.com>
>=20
> typec_port_register_altmodes() and anx7411_typec_register_altmode() fill a
> struct typec_altmode_desc on the stack member by member: svid, vdo, mode.
> typec_register_altmode() reads three more members:
>=20
>  - inactive: a port alternate mode is registered with active =3D !inactiv=
e.
>    If the byte of stack garbage is not 0, the mode starts disabled and
>    typec_altmode_enter() refuses it with -EPERM until somebody writes to
>    the "active" attribute of the port;
>  - mode_selection: the DisplayPort and Thunderbolt drivers enter the mode
>    on their own only if it is false. For the partner alternate modes of
>    anx7411, garbage there means that the mode is never entered;
>  - roles: decides what supported_roles of the port alternate mode shows.
>=20
> typec_port_register_altmodes() is what tcpm and anx7411 register the
> alternate modes of their ports with.
> CONFIG_INIT_STACK_ALL_ZERO=3Dy hides the problem.
>=20
> Fixes: 183b194d8fb6 ("usb: typec: Make active on port altmode writable")
> Fixes: be727d400066 ("usb: typec: Introduce mode_selection bit")
> Fixes: 7b458a4c5d73 ("usb: typec: Add typec_port_register_altmodes()")
> Cc: stable <stable@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

Adding abhishekpandit@google.com and abhishekpandit@google.com as a FYI.
I think we've run into this class of failure before when we were developing
mode selection.


> ---
>  drivers/usb/typec/anx7411.c | 2 +-
>  drivers/usb/typec/class.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 06c25af094b3..ac122ab3175a 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -552,7 +552,7 @@ static int anx7411_typec_register_altmode(struct anx7=
411_data *ctx,
>  					  int svid, int vdo)
>  {
>  	struct device *dev =3D &ctx->spi_client->dev;
> -	struct typec_altmode_desc desc;
> +	struct typec_altmode_desc desc =3D {};
>  	int err;
>  	int i;
> =20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 54c7810b563b..9d9703c70820 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -2684,7 +2684,7 @@ void typec_port_register_altmodes(struct typec_port=
 *port,
>  	struct typec_altmode **altmodes, size_t n)
>  {
>  	struct fwnode_handle *child;
> -	struct typec_altmode_desc desc;
> +	struct typec_altmode_desc desc =3D {};
>  	struct typec_altmode *alt;
>  	size_t index =3D 0;
>  	u16 svid;
>=20
> --=20
> 2.56.0
>=20

--prbgZGmxhdo1sNWP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCauIgwQAKCRBzbaomhzOw
wvDXAQCijNyaOvUNYvxjFwj4hTq8dNFCv3FIfnTaPq1BCKalkgEAoOTH5PljgX6F
XKdrI7ljHCJrJ1XGW7uTurd6OGKHMw0=
=SMJA
-----END PGP SIGNATURE-----

--prbgZGmxhdo1sNWP--

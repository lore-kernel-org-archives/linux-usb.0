Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303153B6379
	for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 18:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782498892; cv=none; b=Xa5nwth9AaQWSmYZw/cPxjT2eljixxNGQ3PCyXJw7E63LcADNhtFw5Au8SYJEXXA+HZEn380vA8kTIeg3/jKL+E15rnMyEhElnR9ORSJzhKOAmaWVkrZw7Ak7XM5PRTraQlGueYIlbC7B0OLbN4bJ/wm5ESONWRJCs1fQBiD2kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782498892; c=relaxed/simple;
	bh=HsXFrWKylsjUR8QkbKC5E1rheGWyb+lE2Fpdb8ZNRK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ctw+v8Q45mqlMcclm8aQq7P8yT0e/HitXJ/5ukoJrqmNKIUQPbRZmADbxvS5WuGeLZ85fUqx9qIj4VSwQjoPco4P+w3oKh2aj5BPBHTn0P7mn/rNZXVe4OBmuyO5Iuj2ZoTnmPWctxDTlZYX8gQqRwE+2oA0ZHsu3+RCiOP/cSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VD01IgRu; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VD01IgRu"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9505d2ec63so320778a12.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Jun 2026 11:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782498890; x=1783103690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpAp7dCkJcREuL3ly7IDZ5o2Y2xkZ5YJIKhR5PGRiBs=;
        b=VD01IgRubQmmSvne2xk6vpd3c8QuXsdL4n1GN4g7Q0lkJTMmH6v7RQ/4j+kQ0n2wzx
         DdA74bykv6dkqNHH3rwf8yshlUuk6SRmod+U12NP4mhMV0hVC+F8YGM08TL4bLeMZ/vG
         JLO0Lmd0Rw/6SnaS/7cnKWSMqyB9p4ZddShgoZFD/SaCddUUbguJS5GqmMHlLYtj7RTW
         VwoOEpUNuzwfD4SgRTz3+Q8KG4DSEFsEVHCTo/LFs+WWMmsKwV7atxBK9UAQXxlEqXdc
         VF5tUk4cLuWAHKGftJ7pke7gbm1kCFO7sGKMzsSRDcMooZib19Ekb66LLCb84oa24psv
         GOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782498890; x=1783103690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpAp7dCkJcREuL3ly7IDZ5o2Y2xkZ5YJIKhR5PGRiBs=;
        b=A/v/sjgRvFLqj+kcPxiVoD0K0SeVW87MZ+xqfFEc4MnjcVq9MXATnJ9uCZV6IGWtH/
         EowEymj7gCvE6TouzXneJtx3ts+6ALle+qDR2ErbUue5zEYJM6H3iyOszWqn/QpXpJji
         M4LA/uD2zPUE+YJ3rdjT80q39kOr9nArKLhyimc/ejQSkSjNyOnVgf98XK598V7u4AAF
         EKXJV3c52CHHA7Ta9iyNe5v20YTMv8kXW2rjh+RPd1PLV1RkMd+cVgkeo2C4dw3xYwyY
         FIwcoBCx+YdY0RWGAaDja1qXLOlZIP2J1pfhHSDEpZhdmygzad1EyrLH8v40BKyR0Jkx
         k1yw==
X-Forwarded-Encrypted: i=1; AFNElJ9+Lo9cwr9NrCHgM9rcQAYYeP/MfTGBK1lg/ygor8RBXC2OdEjtjZbuu+rTxqLPgrczG+fNNDk2Bos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyjfcDK5pl1kEH7AgPbRqPILP7tSouKlhA3Y5TY/93CyKFFrlM
	1b6g0yqu663j8iSPHXc9nG60eNy87l6vnXpamNqTJRqrLe5F0yYKA684kRbjQsDGgA==
X-Gm-Gg: AfdE7cmFaMBTq1/UpagaFCTzpq1XOzS4gj6HrcL1u7wl5vU3kD9HtbE/h2WnjawkrX2
	uhXvcMdBSQfgwMdiPaY3y9CzlQ7i+uOs68+ZTOiiyhT4HWS1hc4kzR5Zxn0spS/3EC7rC1+t5Q5
	9nQVZOmDhENCnD0qBuSUfWx1UAjEablMqJxDypqb7Hjnjrpv3aHh7NqzRhAw3veqq2xI0TbJd16
	TDzxEMY3/mKVCVoTkXpSM8F9A1StAJWm0uDkxzu7WD/P17ewYvDwTbqWhO8SloN8G6vJuU/PHFF
	2yFdOiFYeOWxqF9nZRs1y+TWrfO9guCHeRcCxmJzhrMwx3+XjpBa/BIE4KQ2+77/fuxb4dajfes
	HAdBVpDifGxWDHNQIQH/ZYWZEBzEOVGRpPHeg3EHh3QDNDMBxGK0bDTQ5Nq0iKnce71WONcW35k
	e4eruI9WkrRH3ShWBlM5cTqvuxCHQQoE19QzXii43MyT9H7dGy
X-Received: by 2002:a05:6a20:6a1c:b0:3bf:6c08:2b29 with SMTP id adf61e73a8af0-3bf6c084ab7mr1187391637.49.1782498889677;
        Fri, 26 Jun 2026 11:34:49 -0700 (PDT)
Received: from google.com (211.37.230.35.bc.googleusercontent.com. [35.230.37.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bc1df037sm3663908a12.17.2026.06.26.11.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:34:48 -0700 (PDT)
Date: Fri, 26 Jun 2026 18:34:45 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: Add helper to check cable altmode
 support
Message-ID: <aj7GRSeN1UrvtGdc@google.com>
References: <20260626142702.1941182-1-akuchynski@chromium.org>
 <20260626142702.1941182-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i4AvthNQDryCFTZA"
Content-Disposition: inline
In-Reply-To: <20260626142702.1941182-2-akuchynski@chromium.org>


--i4AvthNQDryCFTZA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 02:27:00PM +0000, Andrei Kuchynski wrote:
> Introduce typec_cable_altmode_unsupported function to evaluate whether an
> alternate mode is restricted based on the connected cable's properties.
>=20
> Implement validation logic that parses the cable's identity to catch
> incompatible setups early. Alternate modes are restricted over:
>  - cables lacking an identity header
>  - passive cables with USB 2.0 speed
>  - active cables unless they have corresponding plugs
>=20
> The function returns false if the cable is not registered or the identifi=
er
> is not set.
>=20
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> Changes in V3:
> - Extracted core verification logic into a static helper function
> - Added an enum to handle supported, unsupported, and unknown cable states
>=20
>  drivers/usb/typec/class.c | 71 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  1 +
>  2 files changed, 72 insertions(+)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0977581ad1b6e..e9f34eb14ceff 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1429,6 +1429,77 @@ int typec_cable_is_active(struct typec_cable *cabl=
e)
>  }
>  EXPORT_SYMBOL_GPL(typec_cable_is_active);
> =20
> +enum typec_cable_altmode_support {
> +	CABLE_SUPPORT_UNKNOWN,
> +	CABLE_SUPPORTED,
> +	CABLE_NOT_SUPPORTED,
> +};
> +
> +static enum typec_cable_altmode_support
> +typec_cable_check_altmode_support(struct typec_cable *cable,
> +				  struct typec_altmode *alt)
> +{
> +	struct typec_altmode *plug;
> +	u32 speed;
> +
> +	/*
> +	 * Check if the cable has an e-marker, supports modal operation, and the
> +	 * SOP' altmode nodes are created.
> +	 */
> +	plug =3D typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
> +	if (plug) {
> +		typec_altmode_put_plug(plug);
> +		return CABLE_SUPPORTED;
> +	}
> +
> +	/* The identity is not specified */
> +	if (!cable->identity)
> +		return CABLE_SUPPORT_UNKNOWN;
> +
> +	/* Non-e-marked cable */
> +	if (!cable->identity->id_header)
> +		return CABLE_NOT_SUPPORTED;
> +
> +	switch (PD_IDH_PTYPE(cable->identity->id_header)) {
> +	case IDH_PTYPE_PCABLE:
> +		speed =3D VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);
> +		if (speed =3D=3D CABLE_USB2_ONLY)
> +			return CABLE_NOT_SUPPORTED;
> +		return CABLE_SUPPORTED;
> +	case IDH_PTYPE_ACABLE:
> +		/*
> +		 * Active cables must establish an SOP' communication
> +		 * node. Since that check failed at the beginning of
> +		 * this function, this active cable does not support
> +		 * this specific altmode.
> +		 */
> +		return CABLE_NOT_SUPPORTED;
> +	}
> +
> +	return CABLE_SUPPORT_UNKNOWN;
> +}
> +
> +/**
> + * typec_cable_altmode_unsupported - Check if a cable restricts altmode
> + * @alt: The Alternate Mode to evaluate
> + *
> + * Returns true if the connected cable is incapable of handling the altm=
ode.
> + */
> +bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
> +{
> +	enum typec_cable_altmode_support support =3D CABLE_SUPPORT_UNKNOWN;
> +	struct typec_cable *cable;
> +
> +	cable =3D typec_cable_get(typec_altmode2port(alt));
> +	if (cable) {
> +		support =3D typec_cable_check_altmode_support(cable, alt);
> +		typec_cable_put(cable);
> +	}
> +
> +	return support =3D=3D CABLE_NOT_SUPPORTED;
> +}
> +EXPORT_SYMBOL_GPL(typec_cable_altmode_unsupported);
> +
>  /**
>   * typec_cable_set_identity - Report result from Discover Identity comma=
nd
>   * @cable: The cable updated identity values
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index d61ec38216fa9..10a783b738efd 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -337,6 +337,7 @@ void typec_unregister_cable(struct typec_cable *cable=
);
>  struct typec_cable *typec_cable_get(struct typec_port *port);
>  void typec_cable_put(struct typec_cable *cable);
>  int typec_cable_is_active(struct typec_cable *cable);
> +bool typec_cable_altmode_unsupported(struct typec_altmode *alt);
> =20
>  struct typec_plug *typec_register_plug(struct typec_cable *cable,
>  				       struct typec_plug_desc *desc);
> --=20
> 2.55.0.rc0.799.gd6f94ed593-goog
>=20

--i4AvthNQDryCFTZA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaj7GRQAKCRBzbaomhzOw
wohvAQDdvfJkptISrkxfhLFCPgTHI/I1EcQfl7/PLfGypNRE6wEAsdqzUNcLebPd
nkewrX5iIyz/FTQz9HIjcVT5jnJBdQE=
=p99Z
-----END PGP SIGNATURE-----

--i4AvthNQDryCFTZA--

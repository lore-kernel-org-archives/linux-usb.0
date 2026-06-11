Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE74D2ECB
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 18:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203629; cv=none; b=LM4tsLFlZ8vSAxOaeSlZA94g0aspcBBDAJ1Y+uFydhtEOPEYpQetyvR2okSb06lg9iRFrr8wQQ+WOq1NC5SDUQF5uiTCjFyIb2H/WnQgps424VNfEgzLRSLRZo87Y5BqIJYSz8JgCF2CcoIPDF/WcmWvHlk1JvyId0GFffb1OZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203629; c=relaxed/simple;
	bh=dLt7OsOnc5mwrSmGAS2HDkJitY6xNaZfWYNPgYuoliY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpH4LY5Wd/V6XAO/C5TUEvrlXP9I6LZBzhGdgONOliDB5eU7e63y26re6/6tEw8lG6O1I2NW75GUWS3zH0M1c5HBidkSK7hK/s/d/cbdPo5H66F0A0hBssUxXVpf33FLoiotQp1bLaIQFvPIMS9+Z78nqOCczL6eGW/elph4iXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AIa3bzvg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AIa3bzvg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so191121a91.3
        for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 11:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781203628; x=1781808428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PRGvv/iToQI1poP0L7G7CqUvRSR6YjXBarVV8FW4WzM=;
        b=AIa3bzvgDz8kFXR5y6ih6QTTpbo5NdBeRkacY5GIBVFG0xCKD6H79fANAFlRF8qSu4
         OZXr33rQ75TvBnBpTHBEri69xs0Yh9RR+XJ+YBF0gEh2HQ2PugmcZjbJ33TXwRsBuZtv
         okUNGJnYgDq01vprBHu7LMJqpzj/HOe9uLrTG/Ugd2HWpdZBsCHLkMtY9M/ASUGkBsjM
         aDM4kSySSjFQ9CRBPzJ6QFwhzYzcLwxi775tcpt0AqQVdmTKchJVgHOTgACuOyAQAOVn
         A6aP7QJYnkqdtbzj6Is3Mj9gsrfuPBjbYKrwzmBwDLaJK7zwBHwLr7oyFUyCNrR7T3lz
         8s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203628; x=1781808428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRGvv/iToQI1poP0L7G7CqUvRSR6YjXBarVV8FW4WzM=;
        b=P5OGLh7tIr9koYJ0/lip0XOJYaQ28HpnAXN5zJJGkSPwuCLo8whHPJV5yWvu+A8CmP
         gSWCCEKMk0ZrcKD6v0XGtTzE438ieR5LOsyUuOym9uOpcMi/Istcebrn7H2vlsoU7jth
         0U1NieAuRluCWBx5ozFvu0kjhpBB7D7aUX3elPuAiWScuV/wmCpCBdtErfwG4WjdjFU4
         xAVyUecmAodaGtsd19lMYkattUyeduFKOEl6pjPLM9bFKhI+LVd+2GhFSuRo66DQOrYn
         vES1+bla3lCjkvKmao0gd7EtJzbAPLwe/BZ74n3J9utB8drSMMm/cyoM4lO6TdEYn33d
         JqGw==
X-Forwarded-Encrypted: i=1; AFNElJ+LW+2Ihfpo331ozXvsSVM5rEwXGHfWBl4iISxnbvmDpmutBqPQWcT0fTcZkD03XUBbc32qKOgBKAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLrZYL8eTDpipjrAfaDBIFoeefzb4ZhLbhWlOVVdSIJqXuZoId
	xq+yleCZIALwgFkhRDdtx8cJdBLVfZV5ZGyifjBnIzZ8k2DDr48jKcHsPWS+zMKbHw==
X-Gm-Gg: Acq92OEkMq2WCCP29av59wl0i+simr671VUX6eAeGsPRTS5qLcHBG1rLEWFBoMd+2be
	2HzosmJoOEOSbdi3LJvNe+PZM844ZygL80xm41q+Df3r3s1sFywlBmExKIT6TUw85rP8BA10sKk
	VLx7A1biZvjckjLykInvGqAfyc4RQTqagU5RD6WR26pCj3z2JbYbTJL2qAhIndgdIBB6EAXwum1
	dhydhy7dPQHcKQYQ7jtoqjq3fTL5ccKhkx97Fin8/aYV31Ap6rxyG4jaD5TzbdjeJsWiPlHpFCO
	V6CHZiL9VtmyT8DnvJFRxeSfIgee0o7ORp1MkJPWQ+q/XiZW3VRSLVHqpEAvGgX8wtibjyTHzfh
	PJge1C17OiayVhHAipvvvUw4yYTRECOJsXTF+PuVK8nULQHYHM6X3MnpwAu6qeXwvgX9q3XPcu3
	5QVIUwYphsu/XMsAklXm+AQOYd4QM0MSlRrRChn3lcVA5N8WBYhR8ewVK3nJKVmQ==
X-Received: by 2002:a17:90b:2dcb:b0:36d:79c6:1562 with SMTP id 98e67ed59e1d1-377aa88fdb7mr4136207a91.25.1781203627170;
        Thu, 11 Jun 2026 11:47:07 -0700 (PDT)
Received: from google.com (129.119.127.34.bc.googleusercontent.com. [34.127.119.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cd24sm356017765ad.57.2026.06.11.11.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:47:06 -0700 (PDT)
Date: Thu, 11 Jun 2026 18:47:02 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] usb: typec: Add helper to check cable altmode
 support
Message-ID: <aisCpo9Zmdyo_ovx@google.com>
References: <20260611122146.262184-1-akuchynski@chromium.org>
 <20260611122146.262184-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YKzK3RCkfPhtF0jB"
Content-Disposition: inline
In-Reply-To: <20260611122146.262184-2-akuchynski@chromium.org>


--YKzK3RCkfPhtF0jB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 12:21:44PM +0000, Andrei Kuchynski wrote:
> Introduce typec_cable_altmode_unsupported function to evaluate whether an
> alternate mode is restricted based on the connected cable's properties.
>=20
> Implement validation logic that parses the cable's identity to catch
> incompatible setups early. Alternate modes are restricted over:


I think I follow this logic, and it is correct, but it may be harder to
understand for a passing code observer who aren't deeply versed in how USB-C
cables work. I think maybe additional comments on each of these resolution
cases may be helpful.


>  - cables lacking an identity header

Cable lacking an ID Header indicates a non-emarked cable, which in the case
of a detachable C-to-C cable, can only be guaranteed to have USB 2.0 data p=
ath
(D+ and D-).=20

>  - passive cables with USB 2.0 speed

In this case, it's an affirmative confirmation from an e-marked cable
(ID Header present, rest of e-mark present), we are sure it's a USB 2.0-only
cable.

>  - active cables unless they have corresponding plugs

This case is a little bit nuanced. The "corresponding plugs" means that this
cable has an e-marker, supports modal operation, and the SOP' alt mode nodes
are created. You're looking for a 1:1 match based on SVIDs that this cable
has support for the alt mode being queried here. If  yes, then alt mode is
supported. If there's no match, then the alt mode is unsupported.=20


>=20
> The function returns false if the cable is not registered or the identifi=
er
> is not set.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  drivers/usb/typec/class.c | 35 +++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  1 +
>  2 files changed, 36 insertions(+)
>=20
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0977581ad1b6e..f7f1adbaab7e6 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1429,6 +1429,41 @@ int typec_cable_is_active(struct typec_cable *cabl=
e)
>  }
>  EXPORT_SYMBOL_GPL(typec_cable_is_active);
> =20
> +/**
> + * typec_cable_altmode_unsupported - Check if a cable restricts altmode
> + * @alt: The Alternate Mode to evaluate
> + *
> + * Returns true if the connected cable is incapable of handling the altm=
ode.
> + */
> +bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
> +{
> +	struct typec_altmode *plug;
> +	struct typec_cable *cable;
> +	bool unsupported =3D false;
> +
> +	plug =3D typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
> +	if (plug) {

In this case,  we have an affirmative match on alt mode
being queried, so the cable supports this alt mode, which is why you return
false, meaning alt mode is supported.

> +		typec_altmode_put_plug(plug);
> +		return false;
> +	}
> +

Past this point, there is no SOP' alt mode object matching the alt mode.
The only way to return supported is if we find the cable is a passive cable
of at least USB3 Gen 1 or better speed.

> +	cable =3D typec_cable_get(typec_altmode2port(alt));
> +	if (cable && cable->identity) {
> +		const u32 id_header =3D cable->identity->id_header;
> +		const u32 speed =3D VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);
> +
> +		if (!id_header || PD_IDH_PTYPE(id_header) =3D=3D IDH_PTYPE_ACABLE)
> +			unsupported =3D true;
> +		else if (PD_IDH_PTYPE(id_header) =3D=3D IDH_PTYPE_PCABLE)
> +			unsupported =3D (speed =3D=3D CABLE_USB2_ONLY);

This might be a little easier to follow if this was a switch statement on
PD_IDH_PTYPE(id_header) so the reader can see what different behavior is be=
tween
PCABLE and ACABLE.



> +	}
> +	if (cable)
> +		typec_cable_put(cable);
> +
> +	return unsupported;
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
> 2.54.0.1099.g489fc7bff1-goog
>=20
>=20

--YKzK3RCkfPhtF0jB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaisCpgAKCRBzbaomhzOw
wibsAP9a+4n2vOw8yVG0u1sFSnhPyTVhamorQ0mQ4zw/zFkxVAEAto/EZQkEqS6c
fsYBFF2xk6+MWFEAW0pdDOWbH8nVkwM=
=japw
-----END PGP SIGNATURE-----

--YKzK3RCkfPhtF0jB--

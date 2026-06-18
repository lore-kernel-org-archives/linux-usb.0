Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BABA229B12
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 00:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781742189; cv=none; b=m7kjmvUPVHE9PLHRy+hHA0Nfb6sJ4IDgFuhItS1K8ABUQ40wWNXOMHgnViTacCAbJo4ifRo9WhzThNpuOAzU0eRWlC5DHX32uRZqi4ff+eDck5nfsPL8akq8V1QTuNN89Vc+ELW4XkDUnxelTXhEmhOF+lTkFz1e4Gm9pYrauBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781742189; c=relaxed/simple;
	bh=BbRozTqu26VO2dhTueZIIbzTNtNq1g2dj3vfv28wZzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qm+/Kc1Rf3suY8TraVNhnPbjwSZAKembawGcS1QtMxKu93ewZUMztsgsM2U1DvMbNDSkjwUDZVfsjTSlkUVsW4fAYDweVbnLsJ6T5WEf0604BZi4I2M2btNFiYUBeoc+6DZ+CmL+g5H+baZ1NXIcCpht0tdZlziNzq4aYppFOnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m0byTSiY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m0byTSiY"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c6bdb8a8bdso2205435ad.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 17:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781742186; x=1782346986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnSWdPmYlLvglnlJ8/YPpZimMTUfQVBUOmpHrGeFGz4=;
        b=m0byTSiY0GqEMkBnqnGgvwm3ELXnqefdXOLN+zZSFZDROdil9HFTbRkDHmCPSsmqF8
         rt92p9X7ax8XZzgSrZhKlvaTNnfUFm8R8sY28n9vRyP4+EmUV2wSYOXReo+NRdhIbyTg
         W2ZjdCBiRoNRyaa311v9GR6/nY+G9HdzHhTzV21wRw9H9fLmTJJxKJBWJzo6jfW/4yyz
         e8FeylfzjwL2MMw6k87h3XIpCpcV+0qErGlMVDhMEQw8mVIoKrLm3u+Xf1sYsUDQcIBd
         7gLg3lYM2IaBseSptM8UJ6tcWWvwNGAztmYcKiWSiraIdYTDBK1oNz0Kl+Ny6J4ccG+I
         ednQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781742186; x=1782346986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnSWdPmYlLvglnlJ8/YPpZimMTUfQVBUOmpHrGeFGz4=;
        b=EtE8OWxf3UnPU0sa8jSF1C2iKNGLJPPTyP2GWI3e652R7aXhfjL4NWTfFq3s1X1+C3
         cTFtP02tf67XHSp01StcB6MqGCiIbCU3Xa+p2nRv99dhsnIkLX5dh2Z8jhg1jqTef/jV
         nHCFgusYuAhZDvSla6g2LyY6b7gjtcAomc651uRHaZc7JALi6LGRPiVugogixqIIZMRS
         rDUnByQd5HAtxO5hneEibeDZlksfITlEWppxWFlftma/Tt6l/cuIGKKqt65Vno2oQyVq
         HpwL023SO9LPH66i7lnYp8iYyLYrbpsdQzN1Hj+5rMM3XJENss4DBJgIi6QG9zUwhoRM
         0xHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IDXh62+q0S7VTqn4abDYdR/MtH2sqL6iWMFyqm9kWmN2s6B0K76YpP1+wtmVEpv2xmD1KTyF6Afs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywody2vFiu+JK9SkeF00FUSYHEAkPIZg2OUmWei2k0P6Fo4wQFs
	Gqo1gn3UnVVlioFE7PzaI/5SgiCs+43Ck9IvPPd9XTnxeDPq+jIK7Vlv/L0oeAlrUQ==
X-Gm-Gg: AfdE7ckb/ubK8E9k4C0O/gJftHRjf4YzDpgpi8jh50+tS0BDDeBLzJ/eO3hAVAo9v95
	zu7r4MRrDumWeIMOxr9K28WIHprW5qkZsweiPzdBSHV4U4jYVLbecpWQqbG+2lr/DCqU3C0BNwL
	Y0/+K7wqd5+vGS30c24waJg0422y3zvJIYihuCUEsTYUGYDR7LY6AKTcmD084v6v8CZLOBy+RbP
	9aHtICjbJd40HZ4GuIqNuZ0J6d/XrgcDRy2TrmldiAR+A3KS/IeDZTcecqilM0c/CDytf1YW5nc
	QqmGCVEw9+TkJgWZBBxqWbfhIiBuG8EiWXjNIeouWxkGaFvaKdZmdW+P+zSb7oc1PE+pI4ITZRD
	siQMvO0y0ldQoT9gGUn+rFVy3dHv8UYpps0Abl19jrE8uO4G3RY/DoSP2zDq0WsV1xfJaDSBXrq
	XmaDY0Kmk4k3b/2ZR+GSPBYayg+uOhG7bJPea0YNYiHZW+OAGeBTFg2ecl+ds=
X-Received: by 2002:a17:902:e945:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c6bc24a8a6mr58474885ad.27.1781742185890;
        Wed, 17 Jun 2026 17:23:05 -0700 (PDT)
Received: from google.com (211.37.230.35.bc.googleusercontent.com. [35.230.37.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e52c0sm181730345ad.13.2026.06.17.17.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 17:23:04 -0700 (PDT)
Date: Thu, 18 Jun 2026 00:23:01 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] usb: typec: thunderbolt: Check cable altmode
 support
Message-ID: <ajM6ZRwStxPU6HBB@google.com>
References: <20260611122146.262184-1-akuchynski@chromium.org>
 <20260611122146.262184-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9eYec23LMP4Rc8Ax"
Content-Disposition: inline
In-Reply-To: <20260611122146.262184-3-akuchynski@chromium.org>


--9eYec23LMP4Rc8Ax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 12:21:45PM +0000, Andrei Kuchynski wrote:
> Update the probe function to utilize the new
> typec_cable_altmode_unsupported() helper. If the cable doesn't support
> Thunderbolt altmode, don't initialize altmode_ops and prevent altmode
> from being activated.
>=20
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/altmodes/thunderbolt.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec=
/altmodes/thunderbolt.c
> index 32250b94262a9..2eccdddf1b1f4 100644
> --- a/drivers/usb/typec/altmodes/thunderbolt.c
> +++ b/drivers/usb/typec/altmodes/thunderbolt.c
> @@ -284,6 +284,10 @@ static int tbt_altmode_probe(struct typec_altmode *a=
lt)
> =20
>  	alt->desc =3D "Thunderbolt3";
>  	typec_altmode_set_drvdata(alt, tbt);
> +
> +	if (typec_cable_altmode_unsupported(alt))
> +		return 0;
> +
>  	typec_altmode_set_ops(alt, &tbt_altmode_ops);
> =20
>  	if (!alt->mode_selection && tbt_ready(alt)) {
> --=20
> 2.54.0.1099.g489fc7bff1-goog
>=20
>=20

--9eYec23LMP4Rc8Ax
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCajM6ZQAKCRBzbaomhzOw
wrrPAQDwXfkD6ebsQzaDRoh+SN/N7LDBJvwt73nLBysg4zAJGAD/TIJlzlwz51fg
QNboeVUJL9Q8mGvwbTVVL1BGJs8dSw8=
=G0yR
-----END PGP SIGNATURE-----

--9eYec23LMP4Rc8Ax--

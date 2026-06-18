Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EC615E8B
	for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781742138; cv=none; b=M7imXo1Qd0x3f+JEro8/NMTbFHJJN81w+rbonWMd0D0reSVt4AuMI8JoFS2yM25q1u9g5clvg4flbyrULQUp4ugLQRbz+aSzoLHGKaGz/GEac2sENuu+4bai9JsKf090fJAk10YJNz1P923ETWZbWlrVA3Q/Mwgg2GynIm99mA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781742138; c=relaxed/simple;
	bh=SixMGirlMng4LGktkF5cVcWRJJuONy+YaWY/IhZiRQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6enxU2IQsNfMCRQWb3BrWpzLRhSlCKuDIwb9AsAVWfc64iJF9q72kZqvvOTK5Zj18w8/etCxlZMw0OeV+qatKE6KmxXVzyFgY4cwC3+/Dod3m+bX5hVSRgLANsbC/j1ays2/vvsXG0YNV5DorDwObPC2dbnQWGkT5CiouXhUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VE/f5Chf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VE/f5Chf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6bc87f4d5so1461665ad.1
        for <linux-usb@vger.kernel.org>; Wed, 17 Jun 2026 17:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781742137; x=1782346937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lYpPtSh25gsa1457fRyGH7PTPSfn9PqeD4HQ16ouiG4=;
        b=VE/f5Chf8zTIMOW3m0vVj0JTxqcCf/HV+TUY1XeanirPGfQh5LQmRExhzW6Aa6ud64
         25MC8uPR+Y21dgskSjFs87SuxKqJtH82NQYJgxH1zcvdR8TP6vIz7Yz+KjQjSVOYckxd
         S//gjcH7lnNqkouscwAwa+r3vmDye4sC6CkSthW7uBbliughoz8TWRlbZDlwg3sx7wxD
         qG9Ag3zdDTMQhNuZxCCQVBrptftqJt2wXlnaPl0NhE1ppxEB7gOr5fWnt1L9E2jfVCAk
         GIcPUCLC045wkKrzFtIb14/M/Ux5yQV455HyT0cJ40pG/D1YDtXdEMBgq8un/L1URnlf
         FzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781742137; x=1782346937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYpPtSh25gsa1457fRyGH7PTPSfn9PqeD4HQ16ouiG4=;
        b=rIUdgeJVMkKNfxF4fAyVImLM8c3G6FK2maJdwp2jqZi1Fm9TYWl/aw9gCkrw/ZX9/O
         Y4pf0YOcdS1qbejNopfhc/7xytn1uIlOkVJclFx/BYHVhl2VLftaaclogNQwuC97talb
         KcQdKiFr7Tx1GbbNNgl0JrOTkdmbU15XXc1AYw5TYPDuRMLU6lidOzZaO0jKcS7R9/0M
         5f3kMPfuag9byH5h3nn7QF6hMvl/tn930uqUhF2AspP5xH9EKdBnz13hp6JShvRwqi34
         3hOLcNVetI5u1cKBjMC0bZl7lfSMrYwZWZM9nQSN53cZHJUnOuLEVJU1lU0TdNMfbH13
         5nPw==
X-Forwarded-Encrypted: i=1; AFNElJ83ZxdUpNgpvO4qGoP197ReqSdu0EcfwkVs+UM1sbaXOz8EJYsGsUUYlw0S//ZqfIA3wFRzm/4sHrc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2mlEKkbgPRYuPSOHOImmRb6EDlHG4RwSJ2Xg56sg5CgAHscS
	Rf43IyVcSrCAW9cUZiAfxUCQcb7ykPIIc0lILFnrLz01bH+TchsKix8i2tNMkHRhrA==
X-Gm-Gg: AfdE7cn3UN+Ua/jk805E+WA0+bdVUwdd9Dm7YrZTY7ni2WU1mbj1eJXESJ7T3uQKlNI
	oJMApmehkC64p28J3rjokS9wUt0ZXC6zV+xhTFzC8CYAQ4XcixdTQau4HZR284jGTqAzI0BOs/W
	uCZD8JYDX3l5MsNgSUWanaNNVRJrjGSUPMRzosuAgLbTU+2SRMMFC1j6LZLvuZXhmEsmvglnzmB
	VqqFjP88da8p8g1kvFQCGvE9QRlmcrh2XBqh8DZeaSKc+TUuCvM5+bDGDmmd5V9pxoPBioiDbqK
	awRHvh1rbfvi+MuzhEMKSpqm2dJPCzhukjgkBrr7V2loKaEMLEQwX+HfTt/Z1FWg9IUQL86md8s
	BeStMupYJNDnosAlruLQcm1EIktzenKCCNoM2DnyrGPuOQTVImtsCfAVl/R9vkSkVCxVMhQglLO
	ct5bhmhvn5auKr6Nk6zYbdPOANr1j5+Tazgh+jA5aTaQ3jFva7
X-Received: by 2002:a17:903:2f81:b0:2c0:f807:9bf3 with SMTP id d9443c01a7336-2c6bc0a6b2cmr57503465ad.10.1781742135993;
        Wed, 17 Jun 2026 17:22:15 -0700 (PDT)
Received: from google.com (211.37.230.35.bc.googleusercontent.com. [35.230.37.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6be262b06sm33810445ad.77.2026.06.17.17.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 17:22:14 -0700 (PDT)
Date: Thu, 18 Jun 2026 00:22:11 +0000
From: Benson Leung <bleung@google.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] usb: typec: displayport: Check cable altmode
 support
Message-ID: <ajM6M9IuO8WB4DV6@google.com>
References: <20260611122146.262184-1-akuchynski@chromium.org>
 <20260611122146.262184-4-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w+NIav+LPleAVV4B"
Content-Disposition: inline
In-Reply-To: <20260611122146.262184-4-akuchynski@chromium.org>


--w+NIav+LPleAVV4B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 12:21:46PM +0000, Andrei Kuchynski wrote:
> Update the probe function to utilize the new
> typec_cable_altmode_unsupported() helper. If the cable doesn't support
> DisplayPort altmode, don't initialize altmode_ops and prevent altmode
> from being activated.
> A captive cable shouldn't be checked; it may not provide discoverable
> capability information, but it is inherently designed to support the
> device's requirements.
>=20
Thanks for explaining clearly that this unsupported check only makes sense
when the port partner reports it has a receptacle.

> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 263a89c5f3243..5ee33a69b9cf7 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -790,7 +790,6 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	dp->alt =3D alt;
> =20
>  	alt->desc =3D "DisplayPort";
> -	typec_altmode_set_ops(alt, &dp_altmode_ops);
> =20
>  	if (plug) {
>  		plug->desc =3D "Displayport";
> @@ -811,6 +810,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	if (plug)
>  		typec_altmode_set_drvdata(plug, dp);
> =20
> +	if ((alt->vdo & DP_CAP_RECEPTACLE) && typec_cable_altmode_unsupported(a=
lt))
> +		return 0;
> +
> +	typec_altmode_set_ops(alt, &dp_altmode_ops);
>  	if (!alt->mode_selection) {
>  		dp->state =3D plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
>  		schedule_work(&dp->work);
> --=20
> 2.54.0.1099.g489fc7bff1-goog
>=20
>=20

--w+NIav+LPleAVV4B
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCajM6MwAKCRBzbaomhzOw
wsr9AP9xQSpUG/TMARDjBbAUlWcq9HO8Yz1pxyMHOk635LqCbQD/a3ptcA01Tbcb
4Eg5duEszwL9Pd9MzqAceUyjUFFaBgU=
=xYgA
-----END PGP SIGNATURE-----

--w+NIav+LPleAVV4B--

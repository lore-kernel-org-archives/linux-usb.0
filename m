Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A65486637
	for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403395; cv=none; b=t9UyMaFEhm6Sd+B1Un32cdf4KHQYvrm9UYyhkN6anOJ3XQ0EOz4EUFH1+z5FRfQEjHJLTw0fRv/pFw77grQBmCYQmBMflnD24h9BMkgM2V9RtG6RLugjPghrZJv7UhWmVfRYqwoQPxR5n88PjlsDkQs7HE81hoDYiiEPrFBl364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403395; c=relaxed/simple;
	bh=VzPYMqC7uh5dK0C9kMbLAxPkLoYUdT+jrtwBmfYDgpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inOL9NNKa05AFIk/yQI9kOd3ZVhtCORnY3WlSCGVAjKAxXu9+WKHE0pjKpb5JkZ8SPfws851ayFccybyhBxM9pjFwTyqLjstinlS1EwWMn1nmq8Nvkp1PvslHWeEAUH2/X6yAlPXwCUUh9vxdk5tWdVMU6OB6nJ8Kat2RZ1OsxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cPixOSyA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cPixOSyA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso70355ad.0
        for <linux-usb@vger.kernel.org>; Mon, 14 Sep 2026 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789403393; x=1790008193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKHV2WwgwnbPgYuLyfno0u5tkhusyNkx3Q+6kxT2SNI=;
        b=cPixOSyAE7mQoMNnvdc8dCVQGdwnepYFw0o1JNiexDqKwljSM7XD14BEAlKQwVpNUJ
         +ebyUSO+KJ6Gizq2bQ785pH3ylvmYHQU+ozFdWANSjB6B/XxScAX/FGpqncs0Yl0uiS3
         ogpuzET785fHDFfd1fG4uzYIrr9Pq86dSHv6Zw5w5Og3Z9KfIpItORTSM+n7xLuQCzCE
         Lks7ZA+UaQ7eWQjhViAePVqjsTMoTSnBAm5AKwRi9QOBcKP/PUS8nmCl71oco34vL5Od
         P933Ez2/PQR7cpSkcB1uI7Tolv8xa1JcTZIa9Z1dhAvHt/bWNfY+rC+KfJjdC0ogShoj
         8WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403393; x=1790008193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKHV2WwgwnbPgYuLyfno0u5tkhusyNkx3Q+6kxT2SNI=;
        b=rzdkL/Z05uR6oSC5SMHZDuM/CUCwZxX1Isg9Lehi44cnFeRkt2Fvy2wdtJ4tynijwk
         PGKR21yDu7q5GXiGWHuzqwyIbFM4WDSHod+5rCk424/mMvRR+Dm64qwogI8s1LZhxYl6
         sn59Tydk3vxCtt2b4yBGvLrs8kXppPMgtrz4TY+OnRxuwejm+H90YQEaIXnDfx+HN4wz
         IzeDXbeOEdK4pOOXWzM9TK8GEG2sO5nmGF0p2vxi3wciQFN1KPSxjDBc/rpxcHF46UKY
         onPtsDpgeyrdFtMyCOIgh2fEDMFvnuIbG6sVmXllDXsce1qVaIu9/Aypb6xWJ2k9OW+O
         QLwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5qCpecMpT9OCQPJ27526Om5qL64OEXo96WafI4thjWYoP2SoUDqWhQDQLRyrIxxXMTp5oK0sKsKc=@vger.kernel.org
X-Gm-Message-State: AFuF++nri+DUg6ag/jQytcmvdaC2rAV6kf7t53ZEmo3DU1NZv3pu76YW
	FYSHL1nQ0CxAif0s/xNQUIxZBHgi4UbXlz1Mu3qlrEJ8/0J9IgTmrZ9Y0OYCbCN0AQYa1hun0ko
	K7n0OwA==
X-Gm-Gg: AYBFou2cQto83WLSGgF7FywA2aVVk/xJ59IZbazCQ4AvNK4UMJOZw+iC9VPQdCFkuvc
	tBrAr/rwK1lZNZ/pL1AE0tr14zh+fTy7FsBafXg4cXhmorn4a2oXDx41LpR1sHsA3uG+PfLf2Ki
	JBUrzoar7FDXgoPLYruKzSgeRMTIq6JXFJb1AzSSQX9DQO+akN2VGTQWnS73qUb98gOSRDK8801
	TFDsabPg3aAvVEQRChdDvaqEI7Wyxv3cMds7lOwu5YdQdsm8i+1qC3x2QMJvxH0vJ5sK8RYzU7G
	SBS5p4fs2kjdhbInsQOWh1XDGuo4hpzAjOPpSqilTdWbmEIXZJeAfFOgZPpqDjqlHFOb4KCA4zF
	/0trOetfcB+YzFJLfFfGqKqsTi6PGJvivBdPW9Ri9hqe5Bg3IfFROvotyo270WpUtQDOJjsJAvz
	A5gSje5tLjzyub3E4DqhTKvX3CPEaq10SzGCpQrURNOGethWZAfDHeZcDggYLFP6RDRDMvZq98J
	S+znU+eYXAUB6WsnUmpTqKBVf2fjDQfWq/TEA==
X-Received: by 2002:a17:903:120a:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd7655bb26mr1787525ad.21.1789403392149;
        Mon, 14 Sep 2026 09:29:52 -0700 (PDT)
Received: from google.com (236.123.127.34.bc.googleusercontent.com. [34.127.123.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4bab2981sm35942235ad.49.2026.09.14.09.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 09:29:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:29:47 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, bleung@chromium.org,
	gregkh@linuxfoundation.org, akuchynski@chromium.org
Subject: Re: [PATCH] usb: typec: ucsi: displayport: Current CAM OOB index
 fixup
Message-ID: <aqgg-5EYv3VQ4jBX@google.com>
References: <20260911193208.410015-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yJPWLAEjDtr24YBO"
Content-Disposition: inline
In-Reply-To: <20260911193208.410015-1-jthies@google.com>


--yJPWLAEjDtr24YBO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 07:32:08PM +0000, Jameson Thies wrote:
> Update ucsi_displayport_enter() to return invalid error when the PPM
> reports an current alternate mode greater than or equal to
> UCSI_MAX_ALTMODES. While here, remove 0xff current cam assignment on
> failed GET_CURRENT_CAM response.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
> Original patch didn't incorporate reviewer feedback. This is a fixup
> to be amended to:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D04cec690b1fd9d1c4c314b91a10d8c68a3acfe18

You should edit the commit message to use the appropriate "Fixes:" tag.
Follow the instructions here: https://www.kernel.org/doc/html/v4.17/process=
/submitting-patches.html#describe-changes

>=20
>  drivers/usb/typec/ucsi/displayport.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucs=
i/displayport.c
> index 8d2032d0762c..572da7bbd29c 100644
> --- a/drivers/usb/typec/ucsi/displayport.c
> +++ b/drivers/usb/typec/ucsi/displayport.c
> @@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmod=
e *alt, u32 *vdo)
>  	if (ret < 0) {
>  		if (ucsi->version > 0x0100)
>  			goto err_unlock;
> -		cur =3D 0xff;
>  	}
> =20
> -	if (cur < UCSI_MAX_ALTMODES) {
> -		ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0 : -EBUSY;
> +	if (cur !=3D 0xff) {
> +		if (cur < UCSI_MAX_ALTMODES)
> +			ret =3D dp->con->port_altmode[cur] =3D=3D alt ? 0 : -EBUSY;
> +		else
> +			ret =3D -EINVAL;
> +
>  		goto err_unlock;
>  	}
> =20
>=20
> base-commit: ed2050bc671b44b2c948dbd4347cc534d44ccc9f
> --=20
> 2.55.0.1007.g17ff1f9808-goog
>=20

--yJPWLAEjDtr24YBO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaqgg+wAKCRBzbaomhzOw
wqxvAQCQZGPzbf/ZRYp1W/aQBt7t9TimOcbo3dbbEaFddcEJLQEA/mP3bMsx7Pod
C5eeLJdakdnfUg6vRgCSlJFahKIjhAM=
=LEz8
-----END PGP SIGNATURE-----

--yJPWLAEjDtr24YBO--

Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BF3246ED
	for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 21:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787087784; cv=none; b=ZU5XY/hzi8p1EoUKrDTaFfAQf0GN8oUCKEUC7WQ4mpTiNoyOWWw3KyRzQVJ1d3TTizU7b5gek0n5rdIquJCtdbzh70gS482HDcCChQo7242ys5zAQ/CgEwVdJ/nX50O9X7uu3QGIR8abgcp6giNNFet6qtECRJ+IKffaLfsGi6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787087784; c=relaxed/simple;
	bh=7wM9DsKsMoIzwrrkwCbvghqVDiH9iyjjlGgosH6vQEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNEib+9dk0J1wz6Dy2UXj3EjRNXTNNhBKBI8DEBcmyHMvA2gE0aF8HNWlUqstU/jgl45YjdyqwQo5YgJSI11hwoFhNcPvYiBjF95QNodJvxXWFfdHLsSGKzlYmQvQmpThaXS5XWf8xtQmXrMQWV796ooMcTzdbrquLjE4dshJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R6NyA6Gp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R6NyA6Gp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf52d15d88so2288095ad.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2026 14:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787087782; x=1787692582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xNtQcp6EPVcy8qRKN+a9JrKI8GXk1eW9kPm9FdXDU6g=;
        b=R6NyA6GprqI8lJH3jlNFVkjzpP8eKAkZpgv49NySxNw6zAlO/Eqcj1C6pGXz1+m3+O
         Qd7stKKP5K/FNHa305TLE0DMpv4Ipq2XFMPb+A9zSWlYvRp5eh3+2aLtnRf5Ew5pqfu8
         3Drgn1o7xnnnOUa51G0t7NKZ5exk5YRfdXHs+XW5fef1AZbQjimauw9LwTYRbNpIljRk
         WXNhjtKo+FU4Ilhneg/SmebFllIMfI99BlITDmsbR20qeaetS41vVXPSZckN1dNwddgf
         BitxYgX6IKT1v/uLxBHbpGtlguoHqeBr7cVNL+VMC+9xfsZAUTmSVylwZvjkHTg7Gh4B
         J+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787087782; x=1787692582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xNtQcp6EPVcy8qRKN+a9JrKI8GXk1eW9kPm9FdXDU6g=;
        b=f/ZtHvfliHeuJC9h53MugfEZTNIOjf7BJX9BrLghg4CAbNRKANZjRdkmEkvfjRTkNc
         o3zlX2FsPCtqx6zA/bzSGf6d8cKMpbuePINFIq+X4jbR2s7Q2Mr7XQR/2/qmtoUN1h1K
         Z9Lhs7dl1I+i3Yaead7gtsmUdUq95QQJHoq/oxr20QSSJRrF+UknQdkD7dOq1J+gEdjE
         Kv8Ny8Ctrk2JAgoXhylFe1xknw6InqEai9OXv/Yt02kGeim7NghE4DF4ue4bd1Gw9gAY
         IcuPekjV/KCvNoMmcrABl8a1DCHrK7+zQuVms+q7p5jH51mVUv90z6bUlLv3Pt5LtaGz
         lY4A==
X-Forwarded-Encrypted: i=1; AHgh+RpBgSfMEnQck7xlmDBPKxEpIETKGPSnYiqqtNk2vql2cFoB2z8dA2h7G7JFmfIn6CGLxSGKBf3u5tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6qx5cqhuspLkFJXtfn7U7VxwJJzCqQ/vC61lVmFwBSoQBwlMj
	6NqBMb2/m9OAQ/jxO1doBloYz308hyhMRXEErOBRpfXefkORa4tkjuanEQR1XcU7Hw==
X-Gm-Gg: AR+sD10tRwxdnF21MVCKlrFBt5x0Dk8j6rW8xGisVHI419vUscVNpgqr/GSxgZcVAjw
	e9tbH0rbfS9+b0mvK/z7HizMJmxG03brlyTxRGdG4rIWRVbSJ+4um5xcYswVYogNraMq5Ra7mYW
	S5qsZ4ETFCZZtcBwbGULklVcs+knCL8wwHdtmDEIovpA5gmiLbriSyomHxIlvRQNOtxN5XEJzA/
	w4XzgoMPt9+PWfp4c3m6WQHlyn8gdDOVd/4q/8WDTHNYVZB/+ROL1N+N9SPnM9zkcogGhq6zyMq
	pOCpiAnERv/LvNeVMSrhi86Nfobq3ju0c2HeH4Wbn4Ypw4VaIVS8mPJqLsWgeJ/GV8XB7yxFQqp
	NsAqmY1/1x1IiUr/7nGnpkAEPbJNm3liLHEWmuxjjb2tfpMqI09kDOkhfo9ZoHFMbRBPsMC1CON
	o3bCzdSSWvWHA0flaTcS5+AN7T/4yWN8fCWgaF4fxuuOfpitBuKoR+qdRkSRGaFUhWETwGwnJMX
	ME3+CZF2cHax/moZN55erHwtD3KrYLk
X-Received: by 2002:a17:903:2309:b0:2ca:6514:9201 with SMTP id d9443c01a7336-2d5f6bb6a4amr11060385ad.15.1787087781152;
        Tue, 18 Aug 2026 14:16:21 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ef0147sm18499065ad.77.2026.08.18.14.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 14:16:19 -0700 (PDT)
Date: Tue, 18 Aug 2026 21:16:17 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1] usb: typec: ucsi: allow retries of ucsi_resume_work
Message-ID: <aoTLod0A0PHhLw6h@google.com>
References: <20260818205717.1492247-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q7mid4L40iN1KA+y"
Content-Disposition: inline
In-Reply-To: <20260818205717.1492247-1-jthies@google.com>


--q7mid4L40iN1KA+y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 08:57:17PM +0000, Jameson Thies wrote:
> On resume, the UCSI driver will re-enable notifications by sending
> SET_NOTIFICATION_ENABLE. The LPM/PPM may be busy during system
> resume causing SET_NOTIFICATION_ENABLE to fail and preventing the UCSI
> driver from receiving connection status changes.
>=20
> Change resume work to a delayed workqueue to allow retries on failed
> SET_NOTIFICATION_ENABLED commands. Additionally, cancel resume work
> on suspend to prevent pending resume commands from impacting suspend.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
>  drivers/usb/typec/ucsi/ucsi.h |  3 ++-
>  2 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bef3f9b71d71..5c67f0990dd3 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2158,7 +2158,7 @@ static int ucsi_init(struct ucsi *ucsi)
> =20
>  static void ucsi_resume_work(struct work_struct *work)
>  {
> -	struct ucsi *ucsi =3D container_of(work, struct ucsi, resume_work);
> +	struct ucsi *ucsi =3D container_of(to_delayed_work(work), struct ucsi, =
resume_work);
>  	struct ucsi_connector *con;
>  	u64 command;
>  	int ret;
> @@ -2167,6 +2167,11 @@ static void ucsi_resume_work(struct work_struct *w=
ork)
>  	command =3D UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>  	ret =3D ucsi_send_command(ucsi, command, NULL, 0);
>  	if (ret < 0) {
> +		if (++ucsi->resume_retries < 5) {
> +			queue_delayed_work(system_long_wq, &ucsi->resume_work,
> +					   msecs_to_jiffies(500));
> +			return;
> +		}
>  		dev_err(ucsi->dev, "failed to re-enable notifications (%d)\n", ret);
>  		return;
>  	}
> @@ -2187,6 +2192,7 @@ int ucsi_suspend(struct ucsi *ucsi)
>  	 * EC is stopped for suspend; state is re-read on resume.
>  	 */
>  	cancel_delayed_work_sync(&ucsi->work);
> +	cancel_delayed_work_sync(&ucsi->resume_work);
> =20
>  	if (!ucsi->connector)
>  		return 0;
> @@ -2200,8 +2206,10 @@ EXPORT_SYMBOL_GPL(ucsi_suspend);
> =20
>  int ucsi_resume(struct ucsi *ucsi)
>  {
> -	if (ucsi->connector)
> -		queue_work(system_long_wq, &ucsi->resume_work);
> +	if (ucsi->connector) {
> +		ucsi->resume_retries =3D 0;
> +		queue_delayed_work(system_long_wq, &ucsi->resume_work, 0);
> +	}
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(ucsi_resume);
> @@ -2299,7 +2307,7 @@ struct ucsi *ucsi_create(struct device *dev, const =
struct ucsi_operations *ops)
>  	if (!ucsi)
>  		return ERR_PTR(-ENOMEM);
> =20
> -	INIT_WORK(&ucsi->resume_work, ucsi_resume_work);
> +	INIT_DELAYED_WORK(&ucsi->resume_work, ucsi_resume_work);
>  	INIT_DELAYED_WORK(&ucsi->work, ucsi_init_work);
>  	mutex_init(&ucsi->ppm_lock);
>  	init_completion(&ucsi->complete);
> @@ -2365,7 +2373,7 @@ void ucsi_unregister(struct ucsi *ucsi)
> =20
>  	/* Make sure that we are not in the middle of driver initialization */
>  	cancel_delayed_work_sync(&ucsi->work);
> -	cancel_work_sync(&ucsi->resume_work);
> +	cancel_delayed_work_sync(&ucsi->resume_work);
> =20
>  	ucsi_debugfs_unregister(ucsi);
> =20
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index dc594388dcd0..1996f04ed5e6 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -484,7 +484,8 @@ struct ucsi {
>  	struct ucsi_connector *connector;
>  	struct ucsi_debugfs_entry *debugfs;
> =20
> -	struct work_struct resume_work;
> +	struct delayed_work resume_work;
> +	int resume_retries;
>  	struct delayed_work work;
>  	int work_count;
>  #define UCSI_ROLE_SWITCH_RETRY_PER_HZ	10
>=20
> base-commit: bdab5605259ba5d6ff927c1a85cc83eb3ecfdacc
> --=20
> 2.55.0.737.g08866a6d13-goog
>=20

--q7mid4L40iN1KA+y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaoTLoQAKCRBzbaomhzOw
wojrAQCOj1CFk/+d5VX6nRg4egpyj2sWbBVkFVISO4aWL5NlfAEAul17MwasyjmF
5NqYS/0tl6/ungw67bE58CvJWPbeAww=
=l/Zw
-----END PGP SIGNATURE-----

--q7mid4L40iN1KA+y--

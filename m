Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2825C50276
	for <linux-usb@vger.kernel.org>; Sat,  5 Sep 2026 00:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788569427; cv=none; b=HI5QRcMNKnRM3w0I3iXSA7CxTt3gKKHKm76wto0kY5s+MCylWwZmKrU74xXzL8lEUUlD1bspSQu6CeF4o/sS1+MWRtJpZlantjFcJrqDVRIcY3UNrkU74gvkQNSRUFI5NaW6Bm0a4vJP8/P8GO2SAiHmrViwglhkseQCGzo2e+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788569427; c=relaxed/simple;
	bh=/IOJt2nf7V0sd3dSVTFndx95aL9kJKMjt1TwjTpxOUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRtrBYymZFjgI8jOMU8WWkNrOxHhvfY75TupGC9ZBGV68MNY88RS9+rfR1WWfZXMF+duXrMqqDtsS7uM1kWHmI7dGqJ3GQyjz3Vf0WMEY9mx5F3PPWciBD5ciM9YI9RzXXYY2Ghq884zXEgTntjNFkPXb4b4nhHwyTkm5l2eRVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RoiMAuAA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RoiMAuAA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84e27035206so1424904b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 17:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788569424; x=1789174224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twXI+3UtDxubE6k4loreSfwnlDBRjMJNiuXV8S8NXjs=;
        b=RoiMAuAA9CC0u89zFlmfalKGX2fw3CLKLhdf/TXuOW1nUpQrjQuTjAjDugg1Fim1Ie
         F49ZrF9HxyPYhD8P/BaP93z6c8GrihBoukQmQKyyefJJVNCt29K64uAM/h44ABJ0Y8s6
         h/OBanIdcxRdwfWkScBi3qzASQ+IW91HMaVRBoYsjtiIXi6eqbTpjxnpekCyQRi32YNH
         S2UcYTXpbgK7jWKgxQBjvCOHPZKCBxxj627XY1zs8DeCqHAuznPIMRIFH8uisWppyOvc
         nk/92XEsUBE2K8WCwfMqN4/nAUaQlSYJ/sMgfJm42SfdvkrStbYhE3etyZMr6yLrY/54
         qe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788569424; x=1789174224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twXI+3UtDxubE6k4loreSfwnlDBRjMJNiuXV8S8NXjs=;
        b=nZFx7vEnVIPVAkFF0sVG+PdSVyD5Jlm4uXnoFUPBLobH54jFq5VJ7frl7+94mOai3E
         9crd4JlNhxu66xZhcoxuO/T+nk0DpmVpjtEiRJA9k8jptgc5YwmLk0mZisxiliXAYnfz
         q18bf+8zL1jHjUls5qJrlEcH8K1YtIkrpAG5+jI2QJM6PqKpWntvEQ858jj9UFOx2gRM
         Djro1mFqOZN2Cpc1M0w2q2vGvqKUi3tvE1nvV4q1tgmd08Rgv+mhjJFnBtFh/kKqm0ck
         d7QGviq9adRm67NRSPiPvYMv0AYh0MUaZw0RZSIJHRRtkIwbSBWVJ0i525y+A3nrBXOk
         TOjA==
X-Forwarded-Encrypted: i=1; AKwUvBwJBwekfk+wxDVxLYYC7ntzKBDiCHadp2rcktiT1tIpd17svB5eoNv8uzTNrxm4aEB5cO3/xr4UOL4=@vger.kernel.org
X-Gm-Message-State: AFuF++lsTguQrE2QobuYbKj+XUZPuS4EdUT63sQFDxTG+9JWsKs/GDEz
	3KHOSwmb6vS4Qxu9vUa8LNqLQgGPgVm2V5yhpCLLRcE+aDfvXejOrP+OR8WnFM8Zvg==
X-Gm-Gg: AYBFou2dXHEZVYq4Dx1x7QBNzFgn/xtDuoa3jBOw6qNHC4U2S1RdtZvG2734pqOSUkg
	Q/CgbAZmjGZBu3d3fT8k/XLk80s4J+o39xM7WKpRUBBe1QHhRdv9y2iRMNpWzU9qQOt6oKrkOBW
	eKInlmOnWFULcLUhj+6v5HdFIZrF7cZaLS9/IZ9MWRxHdY6Qwl2VoKDPVuekos0dwswwIu2yNSD
	/tfcYJSoG2kuURzfrHE4fpK3M3QyUhE+doS+cJ4R/dFnxw1uBP4kWdQ8jGR69te7MArwL9vBqSP
	PKzPySMQO/QVwzQDkoDPGN+e1uSGv2KpImxHn85mgj5Vpqu0IP/l4wnizMGOgjrhuHh2f/9Nyzg
	eAn9qrxtk0T2XqLolvqEM0t6r0zkk61SzCZGzU95WyIyJfukVEKX5WE7rTjR/h5WXKiOSw+CQZE
	6w4eRuK1po7Tpj9oPwJ1Vmiog1mYF/lgxf4G54NErw9olxj5JAvhvblAeu9BNnWKpmG+La+aOJq
	b2atIRRwIE403tGzf/PYQ==
X-Received: by 2002:a05:6a00:2e83:b0:84f:a82e:d32f with SMTP id d2e1a72fcca58-86167aa9923mr11929585b3a.3.1788569423494;
        Fri, 04 Sep 2026 17:50:23 -0700 (PDT)
Received: from google.com (51.86.127.34.bc.googleusercontent.com. [34.127.86.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153728c37sm1734162b3a.46.2026.09.04.17.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 17:50:22 -0700 (PDT)
Date: Sat, 5 Sep 2026 00:50:18 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	bleung@chromium.org, gregkh@linuxfoundation.org,
	akuchynski@chromium.org, abhishekpandit@chromium.org,
	marco.crivellari@suse.com
Subject: Re: [PATCH v2] usb: typec: ucsi: allow retries of ucsi_resume_work
Message-ID: <aptnSl7OHTFl4qLb@google.com>
References: <20260904234124.2336922-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rW/LfFfldWYEHjoO"
Content-Disposition: inline
In-Reply-To: <20260904234124.2336922-1-jthies@google.com>


--rW/LfFfldWYEHjoO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 11:41:23PM +0000, Jameson Thies wrote:
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
> Changes in v2:
>   - replaced system_long_wq with system_dfl_long_wq
>=20
>  drivers/usb/typec/ucsi/ucsi.c | 18 +++++++++++++-----
>  drivers/usb/typec/ucsi/ucsi.h |  3 ++-
>  2 files changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index bef3f9b71d71..459aab574b29 100644
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
> +			queue_delayed_work(system_dfl_long_wq, &ucsi->resume_work,
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
> +		queue_delayed_work(system_dfl_long_wq, &ucsi->resume_work, 0);
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
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> --=20
> 2.55.0.979.g7e5102b832-goog
>=20

--rW/LfFfldWYEHjoO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaptnSQAKCRBzbaomhzOw
wlFMAP9OWQmQZ3idg3CmGcZAIPVsjhiaXSqxexPmUqTNuGLqXQD/f5J+EXoTaudL
jUD6zo1yJlTwi28MUJnqVaG04CP72AM=
=PyH2
-----END PGP SIGNATURE-----

--rW/LfFfldWYEHjoO--

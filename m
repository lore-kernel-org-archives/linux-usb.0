Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB303CBE80;
	Sun, 18 Oct 2026 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364708; cv=none; b=RGjzrjOR6m+4xyQcuq5T4w7fdikhIGe+UT0OkjYDp0WUXIa4m20Ss68aGCK4E7y+n9+iRO/ly6vK/cZpmQN86JIKyTCNxYIyYYERCxQL1SCerL8IopDcypFamBaxvv0qzP9xqqMf6UTi+HTPYLp+NlGeRtxa53BhB5rj1Uszlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364708; c=relaxed/simple;
	bh=Z6Hwewqpwm1Fei7MVKLUibfyjv8QT9aUSps6F8GdAn8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AO9Dcdy6rDSm7ouzYh9WmbOLSLVIVEuKslV8ArjPoh2P3cqqgOgykThA19961Wu3J3Y8czGN0Mm9oW0BjeRN0WLGhG01EWcTrlXQZ3lDBIdK/7/OumQCiKPXhNh9+OLJim+3B/7WQYu23uYao8aYWlsC1M712Hr5yq3IhVm6I1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEwYnQu1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEwYnQu1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEDB1F000C4;
	Sun, 18 Oct 2026 23:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792364707;
	bh=YV+FENHirwoheCzK+MEle1jjsxWPvq59S17ilTHsNhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kEwYnQu1KDju4NIIAtpMnN55cqYAuY/Vkyc0YB75qTO4fqHlHqTPRxxqtjcvwoZxN
	 rYrs9Zvl43dfMmL/RKaGgT8W7YQFMNhkcoHuPadbFlgZKUbbHQSY7En5m58VSTSE/Z
	 pk2q1Xde0iafT6wb2X9XsOHr9xS+6Xul8xWga6FAhzdAmXVAzLVhcCn+s/Vx9d02Aw
	 j1siLiSSpK08ejvT/LFs2t71spQgko2zxUO+mQSlz/MmCk2/pQ9vBnpyPVhDaXFbGW
	 rFniN4zF3RYwO/zY6CR/zn3un/d1Ag1Qgd/aPiHFAKEy5xucGtslr+2drr4RqJantu
	 aLopCcWJPuQSA==
Message-ID: <sashiko-outbox-176442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: fsa4480: Report switch & mux events to
 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261018225906.1265299-3-val@packett.cool>
References: <20261018225906.1265299-1-val@packett.cool>
 <20261018225906.1265299-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 23:05:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: typec: fsa4480: leak of codec switch and mux in fsa4480_rem=
ove()
--

commit ec3a8ea75d1b120f5c00db8c4658dd7e1e5f7c65
Author: Luca Weiss <luca.weiss@fairphone.com>

usb: typec: fsa4480: Report switch & mux events to codec

This commit updates the fsa4480 driver to acquire a Type-C mux and
orientation switch for the connected audio codec and forward switch and
mux state updates to it. It also enables the SENSE and MIC bits when
entering audio accessory mode.

> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4=
480.c
> index bea0c1deec94d..d992a7e1887c8 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c

[ ... ]

> @@ -287,6 +299,19 @@ static int fsa4480_probe(struct i2c_client *client)
>  		FIELD_GET(FSA4480_DEVICE_ID_REV_ID, val),
>  		FIELD_GET(FSA4480_DEVICE_ID_VENDOR_ID, val));
> =20
> +	/* Get Codec's MUX & Switch devices */
> +	fsa->codec =3D fwnode_typec_mux_get(dev->fwnode);
> +	if (IS_ERR(fsa->codec))
> +		return dev_err_probe(dev, PTR_ERR(fsa->codec),
> +				     "failed to acquire codec mode-switch\n");
> +
> +	fsa->codec_switch =3D fwnode_typec_switch_get(dev->fwnode);
> +	if (IS_ERR(fsa->codec_switch)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(fsa->codec_switch),
> +				    "failed to acquire codec orientation-switch\n");
> +		goto err_put_mux;
> +	}
> +
>  	/* Safe mode */
>  	fsa->cur_enable =3D FSA4480_ENABLE_DEVICE | FSA4480_ENABLE_USB;
>  	fsa->mode =3D TYPEC_STATE_SAFE;
> @@ -310,8 +335,11 @@ static int fsa4480_probe(struct i2c_client *client)
>  	sw_desc.set =3D fsa4480_switch_set;
> =20
>  	fsa->sw =3D typec_switch_register(dev, &sw_desc);
> -	if (IS_ERR(fsa->sw))
> -		return dev_err_probe(dev, PTR_ERR(fsa->sw), "failed to register typec =
switch\n");
> +	if (IS_ERR(fsa->sw)) {
> +		ret =3D dev_err_probe(dev, PTR_ERR(fsa->sw),
> +				    "failed to register typec switch\n");
> +		goto err_put_switch;
> +	}
> =20
>  	mux_desc.drvdata =3D fsa;
>  	mux_desc.fwnode =3D dev_fwnode(dev);
> @@ -319,12 +347,24 @@ static int fsa4480_probe(struct i2c_client *client)
> =20
>  	fsa->mux =3D typec_mux_register(dev, &mux_desc);
>  	if (IS_ERR(fsa->mux)) {
> -		typec_switch_unregister(fsa->sw);
> -		return dev_err_probe(dev, PTR_ERR(fsa->mux), "failed to register typec=
 mux\n");
> +		ret =3D dev_err_probe(dev, PTR_ERR(fsa->mux),
> +				    "failed to register typec mux\n");
> +		goto err_unregister_switch;
>  	}
> =20
>  	i2c_set_clientdata(client, fsa);
>  	return 0;
> +
> +err_unregister_switch:
> +	typec_switch_unregister(fsa->sw);
> +
> +err_put_switch:
> +	typec_switch_put(fsa->codec_switch);
> +
> +err_put_mux:
> +	typec_mux_put(fsa->codec);
> +
> +	return ret;
>  }
> =20
>  static void fsa4480_remove(struct i2c_client *client)

[Severity: Medium]
Does fsa4480_remove() leak fsa->codec_switch and fsa->codec when the
device is unbound or the driver module is unloaded?

In fsa4480_probe(), fwnode_typec_mux_get() and fwnode_typec_switch_get()
allocate the wrapper structures and take device and module references on
the codec provider, which are not managed by devres. While the error path
in fsa4480_probe() cleans them up, fsa4480_remove() still only unregisters
fsa->mux and fsa->sw:

static void fsa4480_remove(struct i2c_client *client)
{
	struct fsa4480 *fsa =3D i2c_get_clientdata(client);

	typec_mux_unregister(fsa->mux);
	typec_switch_unregister(fsa->sw);
}

Should fsa4480_remove() also call typec_switch_put(fsa->codec_switch) and
typec_mux_put(fsa->codec)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018225906.1265=
299-1-val@packett.cool?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486653;
	b=D2CLUsrXSwCfSgIiMhBcga9LcWf2wslttbT6Ic8GI3zhns933xRLQvGE7ES5lAMlmWC4
	 QlxxkZYICJRjv5yludmk+cgR66NONukjxfsI++MgaZ797xYDpCrx506+FhUn2zQhoEzkT
	 Tea2Qkog7CBOJ4VEO6PEYuvNb4YMdp/gurIg9AGIHPMdArKsIqng51Xu0IAPLhp3zvJk4
	 nOBR3PXfjy2D0600BTNGtd+CdNgIWZLJbBVvO9d1z5A8MO7B1xPdzh13AYvYFsqNzMF+I
	 dVUnt4P9orAihDWWGbZqKtgwWuBGE9ulv6u5jm7xmMEq26EQRd4zCV+wOs+opZjGWLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486653;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Xlb4s9/rePL26Nwqp4jBAJIgwIt84T5GQJxKlbgDZOE=;
	b=Z8Kc98+VYPApyBHdSgkjgVbY9kQxpNhGn556z08gQT+QbNd2YkVaiLYBPKp5sRQNvGfz
	 yThmFkci5aR7uo98RBFPwFjF3bIU99rWffUlioMsZ7DKHN6i1L2x3KR3O8K042ClbDuWh
	 DzwprdqmuvqrnfRPlWKw7FpaeU4COY0gvKdL4jO9JGOUJLAcGDePmdlqq0QCRqSTZdqvR
	 J8sFbFr1s3LMx1Qkn4N4gZcd/6HP5pc90DYYYS0ojf5D6I0YgNdJN9q2C2bqFr5tszqsd
	 37RLxfLCSDW9u2+uTh0jUg0+GTnoKbvtcMpU+xYTInw1eOTg+Nrp7iQLVjZWoSPh84Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HzUYhKbM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CE2606A327;
	Tue, 20 Oct 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HzUYhKbM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFB21F000CA;
	Tue, 20 Oct 2026 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792486653;
	bh=Xlb4s9/rePL26Nwqp4jBAJIgwIt84T5GQJxKlbgDZOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzUYhKbMWHmTIq4CkV94LoAcYqlgctyuj/B7QTA29ePGT/QG12S8oAxAluk8iB9CC
	 oc7EWtXq62SJjld0d5rRWvuicGnspVNN0RgqIDYcZpDPL0F2Nd+VpEJ3m3z+jjF6J3
	 LjM+jVyGoNotmWT+NAHgZ8Jq2bj+GHwemgE1Ds7QigLQCC44JjbEB+qbbBQaRiMBDH
	 eKFsvC6dSWAIfh3wKI/YyUrwNVbfeZO7s3hNbUcgiLcge5vtIJBMrUd08lVLjM3RZB
	 XUbIKI0I6e5LwFHfGrNSqM5juZHHkQLhjY3AslJuAG+Z/mpQEsVsEs/fFs19cJU0LM
	 mrTlcfTCdR3pw==
Message-ID: <sashiko-outbox-178658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: fsa4480: Report switch & mux events
 to codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Val Packett" <val@packett.cool>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020081343.1507986-3-val@packett.cool>
References: <20261020081343.1507986-1-val@packett.cool>
 <20261020081343.1507986-3-val@packett.cool>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:57:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: typec: fsa4480: use-after-free in fsa4480_remove() due to tea=
rdown order
--

commit 75fde299467e8267560849403da73d3c9962ad9c
Author: Luca Weiss <luca.weiss@fairphone.com>

usb: typec: fsa4480: Report switch & mux events to codec

This patch updates the FSA4480 driver to acquire a downstream Type-C mux
and orientation switch for the audio codec and forward mux and orientation
events to it. It also enables the SENSE and MIC bits when entering audio
accessory mode.

> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4=
480.c
> index bea0c1deec94d..93faa81d08797 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c

[ ... ]

> @@ -319,18 +347,33 @@ static int fsa4480_probe(struct i2c_client *client)
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
>  {
>  	struct fsa4480 *fsa =3D i2c_get_clientdata(client);
> =20
> +	typec_mux_put(fsa->codec);
> +	typec_switch_put(fsa->codec_switch);
> +
>  	typec_mux_unregister(fsa->mux);
>  	typec_switch_unregister(fsa->sw);
>  }

[Severity: High]
Can releasing fsa->codec and fsa->codec_switch before unregistering
fsa->mux and fsa->sw cause a use-after-free in fsa4480_mux_set() or
fsa4480_switch_set()?

In drivers/usb/typec/mux.c, both typec_mux_put() and typec_switch_put()
drop their underlying device and module references and immediately call
kfree() on the handle:

drivers/usb/typec/mux.c:typec_mux_put() {
	...
	for (i =3D 0; i < mux->num_mux_devs; i++) {
		mux_dev =3D mux->mux_devs[i];
		module_put(mux_dev->dev.parent->driver->owner);
		put_device(&mux_dev->dev);
	}
	kfree(mux);
}

Because fsa->mux and fsa->sw are still registered when typec_mux_put()
and typec_switch_put() are called in fsa4480_remove(), a concurrent call
to fsa4480_mux_set() or fsa4480_switch_set() during removal will pass the
freed fsa->codec or fsa->codec_switch pointer to typec_mux_set() or
typec_switch_set().

Should fsa4480_remove() unregister fsa->mux and fsa->sw before calling
typec_switch_put() and typec_mux_put(), matching the reverse order used
in the error unwind path of fsa4480_probe()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020081343.1507=
986-1-val@packett.cool?part=3D2

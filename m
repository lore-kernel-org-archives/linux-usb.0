Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671382;
	b=0cRASiCVOKpX/l27nlJ24oWkXdVcuylEoBh4ukBTyqik4G3j4Z3/UDZyBJYWx+/s/zU6
	 oNbe8hsvO694y74XLyGSO05WIj3YodPcE5Ssjn94q2wf/iVP5Z6FeB8/jlZ0sKxwmyK5h
	 URvW7xg74v6LDU27xFE4VVHlp9/dmQV95pgeTUP8JfL3mjgvGGcYr6BdDzCK3vV8708a1
	 ThE60vYoBRZOLMk7s3zXoX4YkoChe6J+/U7Kata4spZg18SgKCN7ndgte/ar1EOpuCc8M
	 nFZKfdEOrCz8IiOTHEQnb3Ypite8FOmUZ/kVqwZI/kG0mWwCQcUY7yp81rlKsWq5COQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dCXc+2aX19vXK6MY4biwL0HIH+hZ0IyNs8Cz2CJQj7U=;
	b=3WhEuRDxg2x1SkwnTTHeHuqc7Udk3TkZpUShKWBmfGitwoctSRErLN7Yx7Gav/PJtxAE
	 bg7mQK7Qx1x3M994oOHOuzrWNc+zJMlhIEw0WVsJ2QHFdASgDyY9h/6TIRluhm0E6esH7
	 wqHY22yGz0Cg3pV2vndtvEKzrk1eKuMxk1i8wNzY7NVe2FEntIQms0dqUuECPRYFu3aqM
	 iuYLIMR0wohYBOs5WXJ8d4NJbC0+jhLh4rmGup+wU6H5uetnO9M2rp1P5EqZ/8qAUQNlr
	 HtvFgMrfxp/dDQKooDY2ud64bahx2/RlfzhUwVp9MsCjiOttGnq1sgKnHz/AsjWtZeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K03h+xhY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB44606A327;
	Sat, 14 Nov 2026 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K03h+xhY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4EC41F000C4;
	Sat, 14 Nov 2026 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671382;
	bh=dCXc+2aX19vXK6MY4biwL0HIH+hZ0IyNs8Cz2CJQj7U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K03h+xhYMeGUUagIkMl0m2gz/AV8cOz0LOiQ5fpP5qwEl19tjbTUPCdP2yj6Khukt
	 zIIsLYCXJtDwxIJIs7G4mywFqgM/nS7v6AY+BPIZMJ10fVa53UD2nn6K2/+WrncQI1
	 Fkii8D+6c/h7E+Jpw1geU2OKUYSWIjh4KVzQ5rRLrqu1f7Epb4eahlnb3Jx4vOmkak
	 Z1lwQPkmgSbR/lnctBPg9HHOVChkhkVuqlIn609akkT4YPOM+A957dYJJA6GkIAgqp
	 HgI3BYwTtBHO0G9GbCh8Z1U6NrCtGPz8D6xy+g6mFnuz0aa9xtIEhdDX+V6R32p7IH
	 SqkT7qMmubl1w==
Message-ID: <sashiko-outbox-214730@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: misc: qcom_eud: set the TCSR check register
 before enabling on QCM2290
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Opaniuk" <igor.opaniuk@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114-qcm2290-eud-v1-2-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-2-b6157b817377@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:49:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: misc: qcom_eud: tcsr_check left set when EUD_EN2 write
  fails
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] usb: misc: qcom_eud: missing state update in enable_store()
  [1]
--

commit c35f742b781c2fbb7146624bfd77bf246348e228
Author: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290

This commit adds support for an optional third memory resource for the
TCSR check register on QCM2290 and writes to it via qcom_scm_io_writel()
when enabling and disabling the EUD.

> diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
> index 73f9fac22e19a..217f6c1791f01 100644
> --- a/drivers/usb/misc/qcom_eud.c
> +++ b/drivers/usb/misc/qcom_eud.c

[ ... ]

> @@ -46,6 +47,16 @@ static int enable_eud(struct eud_chip *priv)
>  {
>  	int ret;
> =20
> +	/*
> +	 * On QCM2290 the boot firmware sets the TCSR check register before
> +	 * EUD_EN2; without it the mode manager ignores the enable.
> +	 */
> +	if (priv->tcsr_check) {
> +		ret =3D qcom_scm_io_writel(priv->tcsr_check, 1);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
>  	if (ret)
>  		return ret;

[Severity: Medium]
Does this leave priv->tcsr_check set to 1 when the write to
EUD_REG_EUD_EN2 fails?

On non-debug TF-A builds, the write to priv->tcsr_check succeeds while the
write to EUD_REG_EUD_EN2 is rejected.  When enable_store() calls
disable_eud() to roll back after enable_eud() fails, disable_eud() also
writes to EUD_REG_EUD_EN2 first and returns on error before clearing
priv->tcsr_check:

drivers/usb/misc/qcom_eud.c:disable_eud() {
	ret =3D qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 0);
	if (ret)
		return ret;

	if (priv->tcsr_check)
		qcom_scm_io_writel(priv->tcsr_check, 0);
    ...
}

As a result, the TCSR check register remains set to 1 even though enabling
the EUD failed.

> @@ -65,6 +76,9 @@ static int disable_eud(struct eud_chip *priv)
>  	if (ret)
>  		return ret;
> =20
> +	if (priv->tcsr_check)
> +		qcom_scm_io_writel(priv->tcsr_check, 0);
> +
>  	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
>  	return 0;
>  }

[Severity: Medium]
This problem wasn't introduced by this patch, but does enable_store()
leave chip->enabled stuck as true [1] after disable_eud() succeeds?

drivers/usb/misc/qcom_eud.c:enable_store() {
    ...
	if (enable) {
		ret =3D enable_eud(chip);
		if (!ret)
			chip->enabled =3D enable;
		else
			disable_eud(chip);

	} else {
		ret =3D disable_eud(chip);
	}
    ...
}

Because the disable branch never clears chip->enabled, subsequent reads of
the enable sysfs attribute still report 1 after the EUD has been disabled.

[1] https://sashiko.dev/#/bug/linux-99d39974-0e5d-4e78-9df1-4c5cd22f0990

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-qcm2290-eu=
d-v1-0-b6157b817377@oss.qualcomm.com?part=3D2

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570947;
	b=Ie1jqIz6aFKcvovO8/gDjZ6mzKdnucusnfCEI5Covlm4hOVCDrDwtOxljIiDmQvPMrQ5
	 JWoxD3aAPz/VyeRs21z8Rw2h4MZeBrOXIiKaCxTzHiA2eu8/UjroUSxYqbmveNedgFhWl
	 zTIltrhz5WlMNYRM+KEd3qbNq3OKRVgPk18xRP3mDAUbKE1q6fJq2uTfgl/Hj/BTs+uKb
	 VYlzTudVikMoVsy7WA8GcQ5GLiH9XGFytLZYJFRvhq51ZI7B4HuwZtThbaPHP7qE6VsJ2
	 KjqPzXZ3Xf4VTLvYkIZLv5IEEKtgNSfO6YU2Vz3heg37vqsAv/4zS5Tnt7P/eTU3+Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570947;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EuR/QaSl1Xyys2HojvhA977TlypGGESfsTvuwqGQhNc=;
	b=YgcWiCktXdDj8iZuyWyZa35VdCAKwJpSpZY/cJVR5vAz2Jd3s7jPNU8l5u0wvt2q+7RA
	 OUW70T17+tdE+NSblQzhAq6mZEyUB1DCXofszvUvO6z5x35X/HdPo23GAQlf0kUGOYRYt
	 CoFRo43tOsin+Uie5TEVro5pLxf64je+MzcXryQbQNnHhzQAFAFlW4t32AlskV88dHts6
	 JvzwTTfmPm50c6w9eNuf4gHMtw0w15382BkPClN6mrlEmcskq1W7tlrGxa6a9b9v/C48v
	 TGqQQFRCvo+XNs2gIHdC007DU0V6knpbfD5iqywHKS5N0y4NEcQ0gJZmZK0W+/cKVOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHmvPI8+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D035606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHmvPI8+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6AB81F000CC;
	Wed, 21 Oct 2026 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792570947;
	bh=EuR/QaSl1Xyys2HojvhA977TlypGGESfsTvuwqGQhNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hHmvPI8+XBkkkCuMlum+id7mKcDF5QdvL16oQy85aguaIwCpwOAvBR72Akqy4FRZ4
	 EPBqLYS8+xSL5nV14cTgMuitC8azf8kNLUVwbj1uGBPzYjQ9RDfg7ZU/xsuL9yDNJM
	 CGZZhrBaT12gjfMO+sIqt2zlx2mv7DbHuTPBO+aJV/YMhNjQMJJ6OftnpUV3Cnd8Vm
	 HllZA00s41xK5bkBS1Q0sFXHOtzgSUrt3FYUubyeYCGQsZZ3xkzTwylqBJI+VtRtb6
	 Ac4Zaq8naR1puxWISefC5DNSVBXmG/EiAqaMYKi9wsyfZ5DSWMBOouwr1DTKuEUr6u
	 s1guT266BMS5A==
Message-ID: <sashiko-outbox-179958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb-storage: option_ms: bound probe-time bulk
 transfers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Yongjun" <jun85566@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021081616.89976-1-jun85566@gmail.com>
References: <20261021081616.89976-1-jun85566@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 08:22:26 +0000
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
- [Low] usb-storage: option_ms: undeclared helper usb_stor_bulk_transfer_bu=
f_timeout()
--

commit 67810d8c99cea0179f022bfe478460be6b644ac8
Author: Lee Yongjun <jun85566@gmail.com>

usb-storage: option_ms: bound probe-time bulk transfers

This commit replaces the bulk transfer calls in option_rezero() and
option_inquiry() with usb_stor_bulk_transfer_buf_timeout() to bound probe-t=
ime
transfers to 5 seconds. As noted in the patch commentary, this change depen=
ds
on an unmerged series from Hongyu Xie that introduces the timeout helper.

> diff --git a/drivers/usb/storage/option_ms.c b/drivers/usb/storage/option=
_ms.c
> index 7c0b05a365543..d844fcaaf3fc6 100644
> --- a/drivers/usb/storage/option_ms.c
> +++ b/drivers/usb/storage/option_ms.c

[ ... ]

> @@ -44,9 +46,9 @@ static int option_rezero(struct us_data *us)
>  		return USB_STOR_TRANSPORT_ERROR;
> =20
>  	memcpy(buffer, rezero_msg, sizeof(rezero_msg));
> -	result =3D usb_stor_bulk_transfer_buf(us,
> -			us->send_bulk_pipe,
> -			buffer, sizeof(rezero_msg), NULL);
> +	result =3D usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
> +						    buffer, sizeof(rezero_msg), NULL,
> +						    OPTION_MS_PROBE_TIMEOUT);
>  	if (result !=3D USB_STOR_XFER_GOOD) {
>  		result =3D USB_STOR_XFER_ERROR;
>  		goto out;
> @@ -56,14 +58,14 @@ static int option_rezero(struct us_data *us)
>  	 * Some of the devices need to be asked for a response, but we don't
>  	 * care what that response is.
>  	 */
> -	usb_stor_bulk_transfer_buf(us,
> -			us->recv_bulk_pipe,
> -			buffer, RESPONSE_LEN, NULL);
> +	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
> +					   buffer, RESPONSE_LEN, NULL,
> +					   OPTION_MS_PROBE_TIMEOUT);
> =20
>  	/* Read the CSW */
> -	usb_stor_bulk_transfer_buf(us,
> -			us->recv_bulk_pipe,
> -			buffer, 13, NULL);
> +	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
> +					   buffer, 13, NULL,
> +					   OPTION_MS_PROBE_TIMEOUT);
> =20
>  	result =3D USB_STOR_XFER_GOOD;
> =20
> @@ -90,17 +92,17 @@ static int option_inquiry(struct us_data *us)
>  		return USB_STOR_TRANSPORT_ERROR;
> =20
>  	memcpy(buffer, inquiry_msg, sizeof(inquiry_msg));
> -	result =3D usb_stor_bulk_transfer_buf(us,
> -			us->send_bulk_pipe,
> -			buffer, sizeof(inquiry_msg), NULL);
> +	result =3D usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
> +						    buffer, sizeof(inquiry_msg), NULL,
> +						    OPTION_MS_PROBE_TIMEOUT);
>  	if (result !=3D USB_STOR_XFER_GOOD) {
>  		result =3D USB_STOR_XFER_ERROR;
>  		goto out;
>  	}
> =20
> -	result =3D usb_stor_bulk_transfer_buf(us,
> -			us->recv_bulk_pipe,
> -			buffer, 0x24, NULL);
> +	result =3D usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
> +						    buffer, 0x24, NULL,
> +						    OPTION_MS_PROBE_TIMEOUT);
>  	if (result !=3D USB_STOR_XFER_GOOD) {
>  		result =3D USB_STOR_XFER_ERROR;
>  		goto out;
> @@ -112,9 +114,9 @@ static int option_inquiry(struct us_data *us)
>  		result =3D memcmp(buffer+8, "ZCOPTION", 8);
> =20
>  	/* Read the CSW */
> -	usb_stor_bulk_transfer_buf(us,
> -			us->recv_bulk_pipe,
> -			buffer, 13, NULL);
> +	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
> +					   buffer, 13, NULL,
> +					   OPTION_MS_PROBE_TIMEOUT);
> =20
>  out:
>  	kfree(buffer);

[Severity: Low]
Does building drivers/usb/storage/option_ms.c with CONFIG_USB_STORAGE enabl=
ed
fail here with an implicit function declaration error?

In drivers/usb/storage/option_ms.c, option_rezero() and option_inquiry() ca=
ll
usb_stor_bulk_transfer_buf_timeout(), but drivers/usb/storage/transport.h o=
nly
declares usb_stor_bulk_transfer_buf():

    extern int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int =
pipe,
                    void *buf, unsigned int length, unsigned int *act_len);

and usb_stor_bulk_transfer_buf_timeout() is not yet defined in
drivers/usb/storage/transport.c because the prerequisite patch series is not
present in the tree.

([1] https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/)

([1] Note: this patch mentions a dependency below "---" on Hongyu Xie's
pending series, which may explain why usb_stor_bulk_transfer_buf_timeout()
is missing in this tree.)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021081616.8997=
6-1-jun85566@gmail.com?part=3D1

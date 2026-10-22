Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691095;
	b=PncoSn0RpcZPrOWuJu2E6tGFdiyTeoc0R85z3g9+xN0VA/a/byEgrIk1dlQiTEEQmGBt
	 3OM87JPxWswP+c9WkNYFeKG0rU8T683Qe5Z38jcW2qJoBtJmgD6kN29buif+aoK9Rbpnr
	 K5Xe4hmqbT6lX2J7pWhGhbmiSJjcKZxlNkHOuc6VuZ5UFOda+aDOZ+1upOEfeie/t69mP
	 zRPiT13jOFaksNWoRAc4SYUYOyzGoeO4hy55mDHQAjpJS+Y30ChZPkN/jVFFQTC9GU0BA
	 ynL+2GQl63YUtfgG0/qsH7pVquy2vrakKq3NF77vfbpG2thtjI2mdr7llmMqpR1RG0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691095;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kBzGOesIkIRhRQYvEgriWnby3scq4LCwp25gotrOsOA=;
	b=qxOZWjIqmqDeTyFNlLD3tMF4ctwRNWexkAFAE5vRlei1kibDbDqmaxJGDQ9yJ6O9rV5Z
	 gDC/Krgr+ZXN1ysbD4oki1GHpbbHCe57NTLFWWjVVYxkgyvrJDnq82INZeQ3xTCUUSoJm
	 5e2+F4rImQUEIXBFd8cK9NcKee/aEIiCaZcrDm34xIWqA3qGHW3fDk0CXFNGzXmuNVbtQ
	 RNYnHzJkHAFgq01wq+Q64cnVvw0euisSmVzGIp0GsU4Fy9OiW4BxgChmTNaJi4CT5mchE
	 cH/jYSNc8tHL+yzH0s2ztYFAtD4WsA1YGVDFWrEyFdtNvOWuwDV8vrsHOZ/LuzEassw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cs94lMa6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99027606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 17:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cs94lMa6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F721F01825;
	Thu, 22 Oct 2026 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691095;
	bh=kBzGOesIkIRhRQYvEgriWnby3scq4LCwp25gotrOsOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cs94lMa6ZDC1qGYlj9RjthdVZQZyHinYLpY+n+iLWkUfDuIWW6lShI2ZNccwXRrt9
	 7iyrd65qsFrCQSAPOVTzolEFrLua3CvP92Qiu5sBwptztlBnm8sVhh8l1i50qQLJ8g
	 SNvNoXiYoQ8e/iL/U3C89XSEXNdkVTdk/fIe7ObmSFzo3BZxDj6J3thDcp9HtVxx4Q
	 RpTkMAdPxYCmi+W75qGJU53uySvNT9+0O6y1ajcIPG0WLaSD1879yFtCZLHyFjfcra
	 XRgqYY3ylpX6G/nCfhL8KrZCQZPCC+CRwgvyJ0CsL1zAVXneK8ru0YYbBPJ2f3lrGp
	 aCRZRwoetSWDA==
Message-ID: <sashiko-outbox-181883@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 4/4] power: supply: qcom_battmgr: Allow charger
 changes to wake up the system
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladyslav Tymoshchuk" <tvlad744@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022173225.58-1-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
 <20261022173225.58-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 17:44:54 +0000
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
- [Medium] power: supply: qcom_battmgr: broken wakeup filter on SC8280XP an=
d X1E80100
--

commit 40893dd1782d4c214a14dd6e1c7eba74c6b54afb
Author: Vladyslav Tymoshchuk <tvlad744@gmail.com>

power: supply: qcom_battmgr: Allow charger changes to wake up the system

This commit marks the qcom_battmgr device as wakeup-capable and registers a
wakeup filter with pmic_glink so that USB and wireless charger property
notifications can wake the system when wakeup is enabled in sysfs.

> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/q=
com_battmgr.c
> index 636d6f6acecc5..7a783a3a320d5 100644
> --- a/drivers/power/supply/qcom_battmgr.c
> +++ b/drivers/power/supply/qcom_battmgr.c
[ ... ]
> @@ -1596,6 +1597,20 @@ static void qcom_battmgr_sm8350_callback(struct qc=
om_battmgr *battmgr,
>  	complete(&battmgr->ack);
>  }
> =20
> +static bool qcom_battmgr_is_charger_notification(const void *data, size_=
t len, void *priv)
> +{
> +	const struct qcom_battmgr_message *msg =3D data;
> +	unsigned int notification;
> +
> +	if (le32_to_cpu(msg->hdr.opcode) !=3D BATTMGR_NOTIFICATION ||
> +	    len !=3D sizeof(msg->hdr) + sizeof(msg->notification))
> +		return false;
> +
> +	notification =3D le32_to_cpu(msg->notification) & 0xff;
> +
> +	return notification =3D=3D NOTIF_USB_PROPERTY || notification =3D=3D NO=
TIF_WLS_PROPERTY;
> +}
> +
>  static void qcom_battmgr_callback(const void *data, size_t len, void *pr=
iv)
>  {
>  	const struct pmic_glink_hdr *hdr =3D data;
> @@ -1750,6 +1765,10 @@ static int qcom_battmgr_probe(struct auxiliary_dev=
ice *adev,
>  	if (IS_ERR(battmgr->client))
>  		return PTR_ERR(battmgr->client);
> =20
> +	device_set_wakeup_capable(dev, true);
> +	pmic_glink_client_set_wakeup_filter(battmgr->client,
> +					    qcom_battmgr_is_charger_notification);
> +
>  	pmic_glink_client_register(battmgr->client);
> =20
>  	return 0;

[Severity: Medium]
Does wakeup work on sc8280xp and x1e80100 variants with this filter?

In drivers/power/supply/qcom_battmgr.c, qcom_battmgr_probe() unconditionally
marks the device as wakeup-capable and sets the wakeup filter to
qcom_battmgr_is_charger_notification() for all variants. However,
qcom_battmgr_is_charger_notification() only accepts:

	return notification =3D=3D NOTIF_USB_PROPERTY || notification =3D=3D NOTIF=
_WLS_PROPERTY;

which belong exclusively to the sm8350 and sm8550 property-get protocol.

As noted in the comment above qcom_battmgr_sc8280xp_set_online():

/*
 * The charger supplies' online state comes from the battery status respons=
e,
 * and the firmware sends no notification of its own when it changes, so
 * announce the change here. A supply that is not registered yet announces =
its
 * state when it is.
 */

On sc8280xp and x1e80100 platforms, the firmware only sends battery
notifications rather than dedicated charger property notifications when AC,
USB, or wireless charger online state changes. When userspace enables
power/wakeup on those platforms and a charger is plugged in or unplugged
while suspended, the call chain:

pmic_glink_rpmsg_callback() ->
  pmic_glink_is_wakeup_event() ->
    qcom_battmgr_is_charger_notification()

will reject every incoming notification, making wakeup a no-op despite being
advertised in sysfs.

Should device_set_wakeup_capable() and pmic_glink_client_set_wakeup_filter()
only be called on the sm8350 and sm8550 variants, or is a different wakeup
condition needed for sc8280xp and x1e80100?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022164151.592-=
1-tvlad744@gmail.com?part=3D4

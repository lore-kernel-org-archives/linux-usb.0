Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076964;
	b=qiLA2IpUjCoUZ0O+yY7ZriEUf5GdMvsSCrcK5+/2q5u2zRjO8Gcp8bQQucR0cL/T+MEe
	 DBu9Te5yXh7dWAXebluOkoBm22ngcu8LaKHQYwB6Iqcd6c7AvWoIBLjs+1OwZcd28k2Kv
	 r22iuYB8PrlTsDUa3vyJgeNJIkx50oLebNXXqgp/GKDX/oyIK4SvpDaxsB03ScOyUHc5T
	 oAZ4f0juTlQYEE5LcD2b2VEobg0rNcFhA1uBEDKx7gi+ydmN1GZvwbe5LmFWK/xIPeNP/
	 V4cdVJaE56ONZl+PxLXHcC98VnnhJMu6TPNJeHrdZ2uK2h96HmmMZEwXcK7WL9Ng8WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8ZLmMngp0EjtySLi9KFQCNJi2UZYYSH/Y61LMRuB9OE=;
	b=MKN8kRd2m29uIv+xyHJiXlRK3QSGSKEPagtmzKlK+qDKw0OYfBTrZ7J1MmfM92a6nMxj
	 iTDg9kS5uu0NPsCVwp7oMxi3c9z+nUB13QoaEZKQ8d0OtMtRQFlkQIhxqbIUySb9Dvk+7
	 SPumhftDs3FaSkqedPawBZtlc6hBEvOH8sUNIWhuk6g0jlrrTJiqo/36dfDIKTVYy5xag
	 cx6wtQU7y9FoAmiMDYea2l3S95GDgcj5x62w+dGisMujMYU9havq1D4wkgHR2ETPV+eJB
	 KoSusvI2yJPXj/y5/pHq/mPwBiAZwZrnydYPcoEKbfdmJ1385qlJiU7RiWJQv/k+qYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQ+GjhTU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB660A2603
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQ+GjhTU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB32A1F000CD;
	Thu, 19 Nov 2026 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795076963;
	bh=8ZLmMngp0EjtySLi9KFQCNJi2UZYYSH/Y61LMRuB9OE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CQ+GjhTUXC9mZgc1MH86/1cqnmDLsEXPJAJ5g/LFHjuz+ZBwKwC9DcjxjxFVV1cMW
	 7QneqMMIYNS+hh81kPzkglee0xRrj6cLv37pM0PyQSiQarQxiQkzVIFzs77LKbjV6P
	 8w17LRHWN/ZkKZcxPjt4cm8GMn/7RMPmOvqaZXA3sd9Q+q6VKfmA/nmJdCrG6wIxHo
	 D2hQm5WZD6ktBlcEo4utC/S9P/gTvZ/phcgDYbgqVrhcwg0HqDZnN6JP8QynZG6+BW
	 rRjTdlok9kJVtGlpiUJnp4cNv29XDFbZzoQ7gE+eFEbpN39Hyc+HH9a3/U5gyLQ622
	 w5TnX1ZaTzeMw==
Message-ID: <sashiko-outbox-222670@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: phy: twl6030-usb: disable usb3v3 before releasing
 it
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wang Haoran" <wanghr2026@mail.zgclab.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <1795076108884-14-6a4060a6@mail.zgclab.edu.cn>
References: <1795076108884-14-6a4060a6@mail.zgclab.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:29:23 +0000
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
- [Medium] usb: phy: twl6030-usb: unbalanced regulator_enable() and
  boolean asleep state
--

commit b6e0cbcd5a82c4c16825ea0e177dbacfb07f951d
Author: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>

usb: phy: twl6030-usb: disable usb3v3 before releasing it

This commit disables the usb3v3 regulator in twl6030_usb_remove() and the
twl6030_usb_probe() error path when twl->asleep is non-zero before calling
regulator_put().

> diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6=
030-usb.c
> index 9bfcb2c1dfd0e..6a53417ecad4f 100644
> --- a/drivers/usb/phy/phy-twl6030-usb.c
> +++ b/drivers/usb/phy/phy-twl6030-usb.c
> @@ -403,6 +403,8 @@ static int twl6030_usb_probe(struct platform_device *=
pdev)
>  err_free_irq1:
>  	free_irq(twl->irq1, twl);
>  err_put_regulator:
> +	if (twl->asleep)
> +		regulator_disable(twl->usb3v3);
>  	regulator_put(twl->usb3v3);
> =20
>  	return status;
> @@ -419,6 +421,8 @@ static void twl6030_usb_remove(struct platform_device=
 *pdev)
>  			REG_INT_MSK_STS_C);
>  	free_irq(twl->irq1, twl);
>  	free_irq(twl->irq2, twl);
> +	if (twl->asleep)
> +		regulator_disable(twl->usb3v3);
>  	regulator_put(twl->usb3v3);
>  	cancel_work_sync(&twl->set_vbus_work);
>  }

[Severity: Medium]
Can a single regulator_disable(twl->usb3v3) guarded by the boolean
twl->asleep still leave twl->usb3v3 unbalanced on teardown?

Both twl6030_usb_irq() and twl6030_usbotg_irq() call
regulator_enable(twl->usb3v3) without checking !twl->asleep, and set
twl->asleep =3D 1 even when regulator_enable() fails:

drivers/usb/phy/phy-twl6030-usb.c:twl6030_usbotg_irq() {
    ...
	if (hw_state & STS_USB_ID) {
		ret =3D regulator_enable(twl->usb3v3);
		if (ret)
			dev_err(twl->dev, "Failed to enable usb3v3\n");

		twl->asleep =3D 1;
    ...
}

Because twl6030_usb_probe() enables the PMIC interrupts and also schedules
twl6030_status_work() to invoke both IRQ handlers 1 HZ later (and
twl6030_usbotg_irq() never disables usb3v3 when STS_USB_ID clears), any
ID-ground or VBUS interrupt firing before twl6030_status_work() runs
increments enable_count to 2 or more while twl->asleep stays 1, so the
single regulator_disable() in twl6030_usb_remove() still triggers
WARN_ON(regulator->enable_count) in _regulator_put() and leaves the rail
enabled. Conversely, if regulator_enable() fails, twl->asleep is still set
to 1, causing the new regulator_disable() on teardown to warn on an
unbalanced disable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1795076108884-14-6a=
4060a6@mail.zgclab.edu.cn?part=3D1

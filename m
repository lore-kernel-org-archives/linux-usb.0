Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145843;
	b=Xy2sufdyC7AWMxohZlzZ3fFlTk9X1vFJQVCIxE0xE2jFNcSyEQfM1icYtM7aGUBv5IrE
	 fOCDx0pmo6ub/6GEOmEzmqCaqKdfnFHfixjJiPgpXZbJxr6GQrqKsDwvYgipu6AXqnx0H
	 QmW7E88j14hnb44F7vWwdkXTbL8LoAUOI/4NAUkm4J+cEVz6DAQEQcGiL94yQiJ6DclrN
	 5ijk1gXfV5SMYDz6vjqgPH1H1hP6GwQrVF+SC9IpS6GVSGU+oubY2OxhthIWuvy64z351
	 CC75q77F/WTzzgSOZwa6r+T8GNW21OPIpqaCVKIchXBn0fjRuWkfDj6j4/VE5aq+eqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145843;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VjQf/6t3QpR1GaKUFn4pMp+azt3f1UNhlNRA6UX/wpw=;
	b=yeGnBjjEJorxstPUsBd4+AyWbXY4Rph+p7DYPX7PaYPVNY6hAGChocsuHSRv1sUya6M+
	 N82F6deRGbVpKU4ICnOIIu60A47wgzODzwdUK58zzeZlhVjYI0wcg8dGrjKzzUIfL3wH1
	 T8l2JcvWmjdUFXc/oo++tuJD8gtEmhBk0dHtLOxTm1KDwIzefKARGPU2apdhgHV6zsjOW
	 0pLomL7JkxOHWvRyrbLJyxWvVOs/PeeiI4t3G0ohhk62vXh8vmynerMDCzSscniddGv7e
	 1tQSO2agBXmYOdau5ZLNlU8434YrU+bITDUQOWg1yS7MgHT8hCVYhc0z3Q7DAa4IkCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEGZY9+u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F357F606A31C
	for <linux-usb@vger.kernel.org>; Sun,  8 Nov 2026 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEGZY9+u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E681F0089F;
	Sun,  8 Nov 2026 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794145842;
	bh=VjQf/6t3QpR1GaKUFn4pMp+azt3f1UNhlNRA6UX/wpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cEGZY9+uZHdZsbuf4lnba8YXjsNKzYNBVGQWOlyBS46ymQ3Jx+2UUTtZh2mW1Vxd5
	 3uiQHXSkMgGTXkWwe1awvMESml9u7eMqlHz6+9l9eKxbdL+8CfWAInTrBBqYuvIZAw
	 fbIKAdSG/KZEo2U1w36b0isk0LXGuzXonXtF2s9v/IlBa9ArcySbOFqhjYCJSxDN1C
	 iU5DeLXB4ecRJPQNXX7bBX0f/SF0qXockKnAMdD5zMm0hfjer9HJYCCR5DwYNLiE3G
	 nUO7OFTAwOpp3mK8wWjVgS/DaUUlCBEwBfnFXaCtkqQzDlAm7IWOgGbjxGO7H+vEew
	 kfJ/zCaazi8zQ==
Message-ID: <sashiko-outbox-203786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: phy: cancel charger work in usb_remove_phy() to
 avoid use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: hyunjungg <hj351016@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261108134001.536207-1-hj351016@gmail.com>
References: <20261108134001.536207-1-hj351016@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 13:50:41 +0000
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
- [Medium] usb: phy: chg_work re-queued after cancel_work_sync() in
  usb_remove_phy()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] usb: phy: use-after-free in usb_get_phy() [1]
--

commit 4a4ffa5316b9cec2015871ada70b2fe24ed654b1
Author: Hyunjung Ko <hj351016@gmail.com>

usb: phy: cancel charger work in usb_remove_phy() to avoid use-after-free

This commit calls cancel_work_sync(&x->chg_work) in usb_remove_phy() after
removing the PHY from phy_list so pending charger notification work finishes
before the usb_phy is freed.

> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 5a9b9353f343d..caae74988fd95 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -731,6 +731,15 @@ void usb_remove_phy(struct usb_phy *x)
>  	if (x)
>  		list_del(&x->head);
>  	spin_unlock_irqrestore(&phy_lock, flags);
> +
> +	/*
> +	 * The charger-notify work, scheduled from usb_phy_set_charger_*()
> +	 * and the charger-type detection, dereferences the usb_phy. The PHY
> +	 * is now off the lookup list, so no new work can be queued; drain any
> +	 * work still pending before the caller frees the usb_phy.
> +	 */
> +	if (x)
> +		cancel_work_sync(&x->chg_work);
>  }

[Severity: Medium]
Can x->chg_work still be re-queued after cancel_work_sync(&x->chg_work)
returns?

Removing x from phy_list does not stop extcon charger notifications,
because usb_add_extcon() registers x->type_nb on x->edev via
devm_extcon_register_notifier(), and usb_phy_get_charger_type() obtains
the struct usb_phy with container_of(nb, struct usb_phy, type_nb) rather
than looking it up in phy_list:

drivers/usb/phy/phy.c:usb_phy_get_charger_type() {
	struct usb_phy *usb_phy =3D container_of(nb, struct usb_phy, type_nb);

	__usb_phy_get_charger_type(usb_phy);
	return NOTIFY_OK;
}

PHY drivers call usb_remove_phy() from their .remove() callback before
devres_release_all() unregisters x->type_nb (and fsl_otg_remove() calls
kfree(fsl_otg_dev) immediately after usb_remove_phy()):

CPU0                              CPU1
fsl_otg_remove()
  usb_remove_phy(&fsl_otg_dev->phy)
    list_del(&x->head)
    cancel_work_sync(&x->chg_work)
                                  usb_phy_get_charger_type()
                                    __usb_phy_get_charger_type()
                                      schedule_work(&usb_phy->chg_work)
  kfree(fsl_otg_dev)
                                  usb_phy_notify_charger_work()
                                    usb_phy->chg_state ... <-- use-after-fr=
ee

Unregistering the extcon notifiers in usb_remove_phy() before calling
cancel_work_sync(&x->chg_work) would prevent extcon events from
re-scheduling the work.

[Severity: Critical]
This problem wasn't introduced by this patch, but can a consumer holding a
reference from usb_get_phy() [1] still trigger a use-after-free on
struct usb_phy when the PHY provider unbinds?

usb_get_phy() pins phy->dev with get_device(phy->dev) under phy_lock:

drivers/usb/phy/phy.c:usb_get_phy() {
	...
	phy =3D __usb_find_phy(&phy_list, type);
	if (IS_ERR(phy) || !try_module_get(phy->dev->driver->owner)) {
		...
		goto err0;
	}

	get_device(phy->dev);
}

However, most PHY drivers allocate the structure embedding struct usb_phy
with devm_kzalloc() during probe.  When the provider driver unbinds,
usb_remove_phy() removes the PHY from phy_list and devres_release_all()
frees the devm-allocated struct usb_phy even though the consumer still
holds get_device(phy->dev).  Any later call by that consumer (such as
usb_phy_set_charger_current(), PHY callbacks, or usb_put_phy()) then
dereferences freed memory.

[1] https://sashiko.dev/#/bug/linux-7f476623-2458-498a-85ca-75ee73ec5f0c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108134001.5362=
07-1-hj351016@gmail.com?part=3D1

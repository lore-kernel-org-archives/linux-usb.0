Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527283;
	b=AZ2D01BLhFGOoDa2WTtmGeCIkbA6J7SlbU2eTIwAWf39UFzCx4MwxSVM+0FhDpy8b0s/
	 16QJkR5286LwC/XezyIU/X5M5yIjju/5z/aS8xe9u6cEaAivJS0MOPwg0TgOY6tTC2wOF
	 +Xk/wCADQqCwHP52Ol7cO7pu2k4H68Uiqdpb1RnnKyQlizWGyKihZc7rraLAsQatVLFAh
	 1c6FThkMIk2b2WXZcxEXwjGWSCatOo/a9G/hFxIS9z1KIPLthmI+m+vYsrV0gY+JXRrEu
	 ulp9fBeXBO2+6VUbkpvt03pZCGxsE8k1D3fk9DGj6DIuDaK3YtAbDqH6/ohCmFSFEdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527283;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qzRr83t2l8gwBhcS4PCTDkEzvbq1+EXVlNFdmk4KAQQ=;
	b=3cFcyMBJeVsb3z1vCRHY1Y+QhZjmudcH4cLvKboRpUm1Rk6CEiMkLfdwmKNdeJvPPdvp
	 MXO33Dk9vXstVi/Q9/5uV/IM/PfQuzuE593OfnLepW8B61rR4dgldN4KlGnf2xPn+lST1
	 M/Fr3axtuLEmV9NncrBvJM7aWkLERcQwHfIKYo+72iiBKQk0gq1usZPbr35AJvbOxfthj
	 iJgx+WOZVXJqcmxCyY0q2VUa/uNQ28dLlo33ZCk/NpPhu3ReyRtIirVFdwxMvzEJo0Wjn
	 G2vlhsZEkpkkvK1pESmdVuxrwMNB2Njn0RFGSzWYnmHkgPmehOy0MBVOYEN0ZQXmkgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDV1UJl6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C12606A31E;
	Tue, 24 Nov 2026 13:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XDV1UJl6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB4F1F000CF;
	Tue, 24 Nov 2026 13:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795527283;
	bh=qzRr83t2l8gwBhcS4PCTDkEzvbq1+EXVlNFdmk4KAQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XDV1UJl6iaGv9ibizQMoOm3pWhEOpFvNpa0DCA5cuAU3N9zWUfArZUc3exlDe9ixA
	 6VpM9JSDsZ7T9klWYpi8Z5wzFfaKaZtb2+KHFUR4ZIb7p8TaFr9a4HEeEdY3FVKh9+
	 X3X+b0aIUD3x86dzn+uGU2m44NoZzfkgW6ggTD6YVsNgB62t8OPwoXmhXR4lgU8/8m
	 fBjCXVLNYBws1aNSVycoIBC+PNpOHlguHOVeb2Tf9DpziSlr/cKjdvQUye5J8b7LAf
	 Ofg9TFlNA8A0uidaQo5dtUdOqtu178D7XBeDntGEsu2Ugcsl6+3z6/Swwmo/VK/KA7
	 BNUCHNr3axkxg==
Message-ID: <sashiko-outbox-231224@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-axiado-ax3000-usb-device-controller-v6-6-b991f9b27111@axiado.com>
References: <20261124-axiado-ax3000-usb-device-controller-v6-0-b991f9b27111@axiado.com>
 <20261124-axiado-ax3000-usb-device-controller-v6-6-b991f9b27111@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 13:34:42 +0000
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
- [Medium] usb: gadget: udc: crg: premature suspend during stop in
  crg_udc_suspend()
--

commit b4599496ea6732d81644faa7d639b33738f4ec72
Author: Petar Stepanovic <pstepanovic@axiado.com>

usb: gadget: udc: crg: Add core driver and build integration

This commit adds the core probe, remove, power management, interrupt, and
controller recovery paths for the Axiado AX3000/AX3005 UDC driver, and
integrates it into Kconfig and Makefile.

> diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadg=
et/udc/crg/crg-udc-core.c
> new file mode 100644
> index 0000000000000..4b5c28da74975
> --- /dev/null
> +++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
[ ... ]
> +static int crg_udc_suspend(struct device *dev)
> +{
> +	struct crg_gadget_dev *crg_udc =3D dev_get_drvdata(dev);
> +	unsigned long flags;
> +	bool notify_disconnect;
> +	int i, ret;
> +
> +	spin_lock_irqsave(&crg_udc->udc_lock, flags);
> +	if (crg_udc->controller_recovering || crg_udc->shutting_down ||
> +	    crg_udc->external_reset_pending ||
> +	    crg_udc->endpoint_recovery_pending ||
> +	    (crg_udc->hw_reset_asserted && !crg_udc->gadget_stopping)) {
> +		ret =3D -EBUSY;
> +		goto unlock;
> +	}
> +	if (crg_udc->gadget_stopping) {
> +		ret =3D crg_udc->hw_dma_armed ? -EBUSY : 0;
> +		if (!ret)
> +			crg_udc->suspended =3D true;
> +		goto unlock;
> +	}

[Severity: Medium]
Can crg_udc_suspend() mark the device suspended and return 0 while
crg_udc_stop_gadget(), request DMA mapping, or completion callbacks are
still in progress?

When crg_udc->gadget_stopping is true, this fast path only checks
crg_udc->hw_dma_armed before setting crg_udc->suspended and
crg_udc->suspend_complete.  If crg_udc_stop_gadget() sets
crg_udc->gadget_stopping while crg_udc_recover() -> crg_udc_reset() has
dropped udc_lock, crg_udc_recover() clears hw_dma_armed and
controller_recovering and sets controller_faulted =3D true before
crg_udc_stop_gadget() finishes draining IRQ, workers, queueing, and
gadget_callbacks_active:

CPU0                              CPU1
crg_udc_recover()
  crg_udc_reset()
    unlock(&crg_udc->udc_lock)
                                  crg_udc_stop_gadget()
                                    crg_udc->gadget_stopping =3D true
                                    unlock(&crg_udc->udc_lock)
                                    synchronize_irq() / cancel_work
    lock(&crg_udc->udc_lock)
    crg_udc->hw_dma_armed =3D false
  crg_udc->controller_faulted =3D true
  crg_udc_recovery_end()
  unlock(&crg_udc->udc_lock)
                                  crg_udc_suspend() (on CPU2)
                                    /* gadget_stopping && !hw_dma_armed */
                                    crg_udc->suspended =3D true
                                    crg_udc->suspend_complete =3D true
                                    return 0;  <-- premature suspend
                                  lock(&crg_udc->udc_lock)
                                  /* sees suspend_complete, skips
                                     crg_udc_finish_gadget_stop() */

Because suspend_complete is set and hw_dma_armed is already false, both
crg_udc_stop_gadget() and crg_udc_resume() skip
crg_udc_finish_gadget_stop(), leaving controller_faulted set and VBUS
detection enabled.  The same fast path can also run after
crg_udc_finish_gadget_stop() while crg_udc_stop_gadget() is still waiting
for crg_udc->gadget_callbacks_active to drain.

Returning -EBUSY from crg_udc_suspend() while crg_udc_stop_gadget() is
active (or whenever gadget_callbacks_active, queueing, or
controller_faulted is set) would avoid completing suspend mid-teardown.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-axiado-ax3=
000-usb-device-controller-v6-0-b991f9b27111@axiado.com?part=3D6

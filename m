Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561271;
	b=4QsVAj+9FK12xLr/KIo/cgmQ58GU5clQfC2uzIHOIpkYIveJIWOMdR84MMjXENrEOOph
	 99n8vy7TJ8EZg0L7g12Hd888JlTNlw7BqO2Utiv9qXObVFd2+U5j+OoAp0ilQisaBPBmm
	 aCk2yRwaGJW4kgQGpnYGYJMNu/RxmoEyHWUMx9x1F5UMDBxuGPp1X4n+BErY0pnetMVr2
	 Kr0yvxFO6icJNZ/7VJJZtkkrIN62LcwQnEYhF5f2lCgUVdQFMPmPhkfePf9m45RS8o8Ti
	 NojvDDXh38TWrUsJggweqFG7gIhoU+LyoJ8gqOH5iOvY5l9cM2RwaCiMkqPFAfX9V1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2BLaVp+jhlkzexo/udSMnjCZ1x39LhW7yEem9IcRFtU=;
	b=Rs/9dldgjINuKY6p/IlvQkhrNq05oOEPgbvW+IJN4mpPZOB+sm7xoq/+pp9H6i+0XdPl
	 k2gsJJNlRjRsqNKg0Eq9qfFuROxrhSl+b6/+h7MDy0kF4aEBwsyVlv8A+0UYNP5y4NFtP
	 boEGmMcncu149HEUYIXQ5gl9ST2wuaCmIVN06SINX3YqtaR5mme3UqMNFZ+NZZWPz1K7D
	 bz+f3gl/k+qBI4LcNNauT9DsRVWNQs+C/oc7lNUer1hGU8vVbCa4butCOm0LAwFmkg2Ak
	 Cb6FB5RXqBuzYvIAN+CXza6jRMtCmB7gLg5j9zVHvxI8gSTji/BnkwE8TmAaLLuKj1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f1SNB44/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B20606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1SNB44/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75EC1F000C4;
	Fri, 13 Nov 2026 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794561270;
	bh=2BLaVp+jhlkzexo/udSMnjCZ1x39LhW7yEem9IcRFtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f1SNB44/SeXG1gO+iYWeZtLxlzNd39eaQeJsHIE4kWqlWGhWrymCJ0SDfW5TgH6WE
	 ESKsyC+qu7CeXfbpPRJOPYmMeNtEcmTjx0LXP2paoCfxplCAu4GwUh7R5PPtYkXWO8
	 KziRICo1ZNmA4ZZ5n+6V5XyP7Ypuy3RWlWdN2k/C8wt2cbq5eKthcXIUPpR+F/7ewx
	 fyjL0tQ26yqmXOKWaUf8odUgXok+StpPkEbkE4rHKlAJkiQbAeCQqf6NUXej6cPVWm
	 3NTpk9iyw/KmsPEj/kCYVXrD5HbJOgt7sshfGPZeUnhv9uQJnmVvZVBPMhp5+PnNqV
	 /WGIiX/AdmfIQ==
Message-ID: <sashiko-outbox-212527@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] usb: typec: tcpci: acknowledge masked alerts and
 quiesce the IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113084928.211885-1-shunsheng1218@gmail.com>
References: <20261113084928.211885-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:14:30 +0000
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
- [Medium] usb: typec: tcpci: race in tcpci_irq() with
  tcpci_quiesce_alerts() skips alert ack
--

commit b4f078603381d8a805defdf53c50acdc29717943
Author: Yaohan Li <shunsheng1218@gmail.com>

usb: typec: tcpci: acknowledge masked alerts and quiesce the IRQ

This commit acknowledges all non-RX_STATUS alert bits before filtering
against the software alert_mask, and quiesces and synchronizes the IRQ
during teardown and probe error cleanup before unregistering the TCPM
port.

> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index c6165466c54b6..b11c30e67055f 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c

[ ... ]

> @@ -648,10 +650,21 @@ static bool tcpci_attempt_vconn_swap_discovery(stru=
ct tcpc_dev *tcpc)
>  	return false;
>  }
> =20
> +static void tcpci_quiesce_alerts(struct tcpci *tcpci)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&tcpci->alert_mask_lock, flags);
> +	tcpci->alerts_quiesced =3D true;
> +	WRITE_ONCE(tcpci->alert_mask, 0);
> +	spin_unlock_irqrestore(&tcpci->alert_mask_lock, flags);
> +}

[ ... ]

> @@ -710,29 +723,60 @@ static int tcpci_init(struct tcpc_dev *tcpc)

[ ... ]

>  irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  {
> -	u16 status;
> +	u16 status =3D 0;
>  	int ret;
> -	int irq_ret;
> +	int irq_ret =3D 0;
>  	unsigned int raw;
> =20
> -	tcpci_read16(tcpci, TCPC_ALERT, &status);
> -	irq_ret =3D status & tcpci->alert_mask;
> +	/*
> +	 * During teardown, acknowledge a latched alert without dispatching
> +	 * it to TCPM.  A level-triggered Alert# must not keep retriggering
> +	 * after the software mask was cleared or the hardware mask write
> +	 * failed; the port may already be going away.
> +	 */
> +	if (READ_ONCE(tcpci->alerts_quiesced)) {
> +		ret =3D tcpci_read16(tcpci, TCPC_ALERT, &status);
> +		if (ret < 0)
> +			return IRQ_NONE;
> +		if (status) {
> +			ret =3D tcpci_write16(tcpci, TCPC_ALERT, status);
> +			if (ret < 0)
> +				return IRQ_HANDLED;
> +			irq_ret =3D 1;
> +		}
> +		return IRQ_RETVAL(irq_ret);
> +	}
> +
> +	if (!READ_ONCE(tcpci->alert_mask))
> +		return IRQ_NONE;
> =20
> -process_status:
>  	/*
> -	 * Clear alert status for everything except RX_STATUS, which shouldn't
> -	 * be cleared until we have successfully retrieved message.
> +	 * Acknowledge every non-RX_STATUS bit from the raw alert value, not
> +	 * only the bits enabled in the software mask.  Some controllers
> +	 * enable additional alerts in TCPC_ALERT_MASK (for example RT1711H
> +	 * enables FAULT and RX_BUF_OVF); dropping those bits before the
> +	 * write would leave a level-triggered Alert# asserted.  RX_STATUS is
> +	 * cleared only after the message has been read successfully.
>  	 */
> +	tcpci_read16(tcpci, TCPC_ALERT, &status);
>  	if (status & ~TCPC_ALERT_RX_STATUS)
>  		tcpci_write16(tcpci, TCPC_ALERT,
>  			      status & ~TCPC_ALERT_RX_STATUS);
> +	irq_ret =3D status;
> +
> +	status &=3D READ_ONCE(tcpci->alert_mask);
> +
> +process_status:

[ ... ]

> @@ -806,8 +850,13 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
> =20
>  	tcpci_read16(tcpci, TCPC_ALERT, &status);
> +	if (status & ~TCPC_ALERT_RX_STATUS)
> +		tcpci_write16(tcpci, TCPC_ALERT,
> +			      status & ~TCPC_ALERT_RX_STATUS);
> +	irq_ret |=3D status;
> =20
> -	if (status & tcpci->alert_mask)
> +	status &=3D READ_ONCE(tcpci->alert_mask);
> +	if (status)
>  		goto process_status;
> =20
>  	return IRQ_RETVAL(irq_ret);

[Severity: Medium]
Can tcpci_irq() race with tcpci_quiesce_alerts() and return without
acknowledging TCPC_ALERT?

CPU0                              CPU1
tcpci_irq()
  READ_ONCE(tcpci->alerts_quiesced)
    -> false
                                  tcpci_remove()
                                    tcpci_quiesce_alerts()
                                      tcpci->alerts_quiesced =3D true;
                                      WRITE_ONCE(tcpci->alert_mask, 0);
  if (!READ_ONCE(tcpci->alert_mask))
    return IRQ_NONE;              <-- skips TCPC_ALERT read and ack

Because tcpci_irq() reads tcpci->alerts_quiesced and tcpci->alert_mask
in separate unlocked steps, a concurrent tcpci_quiesce_alerts() can zero
tcpci->alert_mask after the quiesced check has already passed.

A second window exists just below and in the loop tail before jumping to
process_status: if tcpci_irq() reads TCPC_ALERT with TCPC_ALERT_RX_STATUS
set, the upfront write clears only status & ~TCPC_ALERT_RX_STATUS, and if
tcpci_quiesce_alerts() zeroes tcpci->alert_mask before
status &=3D READ_ONCE(tcpci->alert_mask), TCPC_ALERT_RX_STATUS is masked
out and never cleared in the RX handler.  Similarly, if tcpci_init()
fails before publishing tcpci->alert_mask (tcpm_init() ignores the
return value of port->tcpc->init()), tcpci->alert_mask remains 0 and
tcpci_irq() returns IRQ_NONE without acknowledging hardware alerts on
subdrivers such as tcpci_rt1711h that program TCPC_ALERT_MASK
independently.  In all of these cases, a latched alert can keep a
level-triggered Alert# line asserted and cause an interrupt storm or
spurious IRQ disablement.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113084928.2118=
85-1-shunsheng1218@gmail.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473794;
	b=GRu+R324mLb18XZmgXl4uTc19NtJA3t5J5xp79zANEWrj1brTw3wVvq2sBNCSiKWbUhP
	 GaCjxV/q2tGlTr0dvU3k27JfkXqg6zGdymYpUmuP4tcXbGZcjxaTWibAD02+wUYnJceZr
	 0Spef6g8GAn+EpQA6AEpNHIEioQvQmPQWYI7aPFGWn9OnPA//Dft1yELVKRfsvT8r2YDu
	 LMIw+HHG43ShcDpZq3kY6Z6SM1tZgQm5ScEWZZ3Rz/NFm6sek6oZIqfblSwnGX6Ynbuyv
	 W0nv67jlb9feRyazZ0MU7n7Fclyy/m7A71no6lDpybm4R/vT7wbyRBOL5mURUrp1P6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473794;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EIYSUe+Z+0vLhmfm/Kaq1WZp8c/G1lQwzyJ1tUJollI=;
	b=ZzAwj/JvxnP6etEoBJuN/un3tnyAMB3vfVIyKA8//YJq2w9+QgRwHdE7JUam7uO5oaYl
	 BwZ9x0qow2m/v3Ptjo39uh20sEp/QFXkpTbvM1hQ9hkAyJhHYuVTL1SXXeUJ+aZF1y8Ez
	 QKQ9luRiEjx47Mexn7mvbEupYDrCISCTuICH06ovlOXxAExt3kH7Ammm9JuHTAuWfSWJ/
	 j5b+xkHGxb3JI2B1bGlgREFZHyes+Qz4Y5SqfC2wKgVMVr/Erd0tJh6omP48RGeE/IYr4
	 IRkls58MzWAXcwfP7Gqtaf0u04piKPfn5xrf3KHjnD537n9EIYIxOwCF7HTnhjTcTaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAlyZqU5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B29606A893
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAlyZqU5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D90E1F00A05;
	Thu, 12 Nov 2026 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473794;
	bh=EIYSUe+Z+0vLhmfm/Kaq1WZp8c/G1lQwzyJ1tUJollI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CAlyZqU5PerTcRJaXLVItUg9zehttYuZ2frKDJIkf2RMjM0YJ84VBAT3pm+YIhQFP
	 mmhVejrKEMGWdL2EUe1/Va6xfkrnUDL+g+xhOjGLcyyE+ZqmqJdyeii+A500hTPHtN
	 v6637DUvIq6ZnF0Ygvu5BlhtLbq62w01CkQgOuRW7403riODq6IepUF3ER+Fe6Rorn
	 IBsXI7W5WGQwc+l5GrTt2PPerOnOICev/YqhAbBe4TqsPMJ3+PCPa+W0wu4z/z1h+3
	 5nPTURpfeIyWTHs0q5UH5KQ5Hh55/ie4oh2kW7MIuCMpOFD8dpRh35W/O/Bg1tmuMj
	 usI/gtZhdP0Vw==
Message-ID: <sashiko-outbox-210802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: typec: tcpci: filter masked alerts and quiesce
 the IRQ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112084014.2564834-1-shunsheng1218@gmail.com>
References: <20261112084014.2564834-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:56:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] usb: typec: tcpci: masking status before clearing TCPC_ALERT
  causes IRQ storm
- [Medium] usb: typec: tcpci: zeroing alert_mask before hardware mask
  write causes IRQ storm
--

commit 3b5f8c5cf280be1359b54eb345cc21c55eeb3247
Author: Yaohan Li <shunsheng1218@gmail.com>

usb: typec: tcpci: filter masked alerts and quiesce the IRQ

This commit filters TCPC_ALERT status bits with tcpci->alert_mask in
tcpci_irq() and adds an alerts_quiesced state and synchronize_irq() calls
to quiesce interrupts before unregistering the TCPM port on removal and
probe failure.

> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index c6165466c54b6..d413ebca75da2 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c

[ ... ]

> @@ -722,8 +738,12 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  	int irq_ret;
>  	unsigned int raw;
> =20
> +	if (!READ_ONCE(tcpci->alert_mask))
> +		return IRQ_NONE;
> +
>  	tcpci_read16(tcpci, TCPC_ALERT, &status);
> -	irq_ret =3D status & tcpci->alert_mask;
> +	status &=3D READ_ONCE(tcpci->alert_mask);
> +	irq_ret =3D status;
> =20
>  process_status:
>  	/*

[Severity: High]
Can masking status with tcpci->alert_mask before writing TCPC_ALERT leave
hardware-enabled alerts latched and cause a level-triggered IRQ storm?

tcpci_init() never sets TCPC_ALERT_RX_BUF_OVF, TCPC_ALERT_FAULT or
TCPC_ALERT_VBUS_DISCNCT in tcpci->alert_mask, but vendor drivers that
delegate interrupt handling to tcpci_irq() unmask those bits in hardware:

drivers/usb/typec/tcpm/tcpci_rt1711h.c:rt1711h_probe() {
    ...
	const u16 alert_mask =3D TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED |
			       TCPC_ALERT_TX_FAILED | TCPC_ALERT_RX_HARD_RST |
			       TCPC_ALERT_RX_STATUS | TCPC_ALERT_POWER_STATUS |
			       TCPC_ALERT_CC_STATUS | TCPC_ALERT_RX_BUF_OVF |
			       TCPC_ALERT_FAULT;
    ...
	ret =3D rt1711h_write16(chip, TCPC_ALERT_MASK, alert_mask);
}

Previously, tcpci_write16(tcpci, TCPC_ALERT, status & ~TCPC_ALERT_RX_STATUS)
cleared any latched bit read from TCPC_ALERT.  With status masked by
tcpci->alert_mask first (and again after the re-read at the bottom of
tcpci_irq()), TCPC_ALERT_FAULT or TCPC_ALERT_RX_BUF_OVF is never written
back to TCPC_ALERT, so the active-low Alert# line stays asserted while
tcpci_irq() repeatedly returns IRQ_NONE until the spurious IRQ detector
disables the interrupt line.

[ ... ]

> @@ -988,10 +1013,19 @@ static void tcpci_remove(struct i2c_client *client)
>  	struct tcpci_chip *chip =3D i2c_get_clientdata(client);
>  	int err;
> =20
> -	/* Disable chip interrupts before unregistering port */
> +	/*
> +	 * The port's kthread worker is destroyed by tcpci_unregister_port()
> +	 * below, while the threaded IRQ handler can still queue work on it.
> +	 * Publish a zero software mask first: tcpci_irq() then ignores any
> +	 * alert that is still latched, or asserted again on a shared IRQ,
> +	 * even if the hardware mask write fails.  synchronize_irq() waits
> +	 * for handlers that already read the old mask.
> +	 */
> +	tcpci_quiesce_alerts(chip->tcpci);
>  	err =3D tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
>  	if (err < 0)
>  		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
> +	synchronize_irq(client->irq);
> =20
>  	tcpci_unregister_port(chip->tcpci);
>  }

[Severity: Medium]
Can zeroing tcpci->alert_mask before masking TCPC_ALERT_MASK in hardware
trigger an unhandled IRQ storm if an alert fires during the I2C write?

CPU0                              irq/client->irq (SCHED_FIFO)
tcpci_remove()
  tcpci_quiesce_alerts()
    tcpci->alert_mask =3D 0
  tcpci_write16(..., TCPC_ALERT_MASK, 0)
    <blocks on I2C transfer>
                                  <Alert# asserted low>
                                  _tcpci_irq()
                                    tcpci_irq()
                                      if (!READ_ONCE(tcpci->alert_mask))
                                        return IRQ_NONE;
                                  irq_finalize_oneshot()
                                    <unmasks level-low IRQ line>
                                  <Alert# re-fires immediately>  <-- IRQ st=
orm

While tcpci_write16() sleeps waiting for the I2C transfer, hardware
interrupts are still enabled in TCPC_ALERT_MASK.  Because tcpci_irq() now
returns IRQ_NONE immediately without sleeping on I2C or clearing
TCPC_ALERT, irq_finalize_oneshot() unmasks the level-triggered line with
Alert# still asserted low, spinning in the real-time IRQ thread until the
I2C write finishes or the spurious IRQ detector disables the shared IRQ.
Should TCPC_ALERT_MASK be cleared in hardware before calling
tcpci_quiesce_alerts()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112084014.2564=
834-1-shunsheng1218@gmail.com?part=3D1

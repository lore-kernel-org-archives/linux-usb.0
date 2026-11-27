Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777261;
	b=CmtEGexplow+9En3Zc0wL+O5rYAX2FBGHCDlq3SeEyve4M3Bl4mS8zjGBlbXtgkaVOdR
	 ET8xq4AtyzmxT/AuETsFiEIgfhtcOMUO9XZh+Wyi6gH17f82eBAdfLbYRx6dHvPSqJTBc
	 VQnnOikK+Jzhk3FLaiP7qbVX+OGUo+2egTXWhxq0XKmyN4c/zRVn+WGNOfkz/g+dh2NVe
	 /R9vKFJ7EqFUgNnOlwweIa32wmClGMdxolq4e96Z5H4kmu6mkBBXR07/T3BOOVnTB1Rrl
	 sB4BiLhofdr2jsdnlxQudWNm/p2r2U3W7c+zTGBD4tQ4mHYA10wi9BFRCLWlDzcKN/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777261;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=O96dyV9ASRiU2oVGDg0b4o6aHS0l7WULOvnt5qH0fCA=;
	b=fqU2Mop0DO41QK4HEtfEoyO9qZ62aVuDElNbQvJhmB4+xKAULBruHQxbASF2138Owc+I
	 Sj8k4evFCIRRV9PPChNSy3S+NYUFzeNPbEN05M5vITQMPGLQ/G0vVaO1uFrac7GY5rZke
	 sZyU3rKTlh1Nig367wPqG5MfnnIk+JqbTt4ky5h+7ImYefZrABTGAHcFYeH0rGBdwbjxJ
	 ehZ32ALHX3iHS+8nhZ7CmngfrvHRldeWJEREv566OBBDWqiphYY8lABhxKlYIgynLBJ13
	 FD91+z0z1FdpSNjT0mGoJASPTa2dp38OqZ/+/E4Lt0fsL+kFck4MmHPvUpfaGtRR1pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgRcr8ND;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACEA606A32C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgRcr8ND
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AA01F000C1;
	Fri, 27 Nov 2026 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777261;
	bh=O96dyV9ASRiU2oVGDg0b4o6aHS0l7WULOvnt5qH0fCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgRcr8NDJFEkQHCm3QHZMCaBSkuMqE7nszxP/rR0aa2tmImJ+C2W5UCwG1aenIRL5
	 e7OQTNuqOdw9iS44fWYXx/eTFdj7ltzr4He4SCnFkU7sqlPOG8BgnvTZWHRRzGp0f2
	 bghU1uprfd+sLa7ujPmlzSX3aHLo9/3TdRbKWq15oi5szomq5umrAOUewMiz+rBwin
	 w2rXCMRvrl6dEROk5gDYCJ2zIFlS79xJYfD95mmVX80U2IuO3Hu5/x/Sc8mBqnO05f
	 st9yA2YN5VN8yc2VmENlWdXu+2h22jB6YuYa3ziLlF4xO/OIYp2EQTmjMEeG7t34XH
	 0+QuAc0KM547w==
Message-ID: <sashiko-outbox-237201@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/6] usb: typec: fusb302: Acknowledge
 Get_Source_Cap_Extended from the driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fusb302-getsourcecap-v2-5-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
 <20261127-fusb302-getsourcecap-v2-5-6770eb1e7945@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:01:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] usb: typec: fusb302: CRC_CHK drain in fusb302_irq_handle()
  runs before TX end
- [Medium] usb: typec: fusb302: unacknowledged message passed to
  tcpm_pd_receive()
- [Medium] usb: typec: fusb302: rx_recheck wakes IRQ thread after
  synchronize_irq()
- [Medium] usb: typec: fusb302: irq_wake_thread() is a no-op on nested
  threaded IRQs
- [Low] usb: typec: fusb302: fusb302_pd_check_ack() saves masked
  interrupt bits
--

commit dc7071ade05719019e8a6d55a3f3fc80613971c7
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: fusb302: Acknowledge Get_Source_Cap_Extended from the driver

This commit sends a software GoodCRC from the driver upon receiving a PD 3.0
Get_Source_Cap_Extended message, which the PD 2.0 FUSB302 hardware mistakes
for a GoodCRC and leaves unacknowledged.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index aa0e4dbe31dbd..c98a74fc7a2ac 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c

[ ... ]

> @@ -1531,10 +1559,110 @@ static int fusb302_pd_reset(struct fusb302_chip =
*chip)
>  				    FUSB_REG_RESET_PD_RESET);
>  }
> =20
> +static void fusb302_pd_tx_complete(struct fusb302_chip *chip,
> +				   enum tcpm_transmit_status status)
> +{
> +	chip->tx_pending =3D false;
> +	tcpm_pd_transmit_complete(chip->tcpm_port, status);
> +}
> +
> +/*
> + * See whether a GoodCRC the driver sent collided before releasing chip-=
>lock:
> + * by the next interrupt, TCPM may have started a transmission, and the
> + * COLLISION would then be reported against it. The chip sets COLLISION =
when
> + * TXON finds CC busy, so it is there to see by now. Keep the other bits=
, which
> + * reading the register clears, pending for fusb302_irq_handle().
> + */
> +static int fusb302_pd_check_ack(struct fusb302_chip *chip)
> +{
> +	u8 interrupt;
> +	int ret;
> +
> +	/* Left set on an error, for fusb302_irq_handle() to tell COLLISION */
> +	ret =3D fusb302_i2c_read(chip, FUSB_REG_INTERRUPT, &interrupt);
> +	if (ret < 0)
> +		return ret;
> +	chip->ack_check =3D false;
> +	if (interrupt & FUSB_REG_INTERRUPT_COLLISION)
> +		fusb302_log(chip, "GoodCRC sent by the driver collided");
> +	chip->pending_interrupt |=3D interrupt & ~FUSB_REG_INTERRUPT_COLLISION;
> +
> +	return 0;
> +}

[Severity: Low]
Does fusb302_pd_check_ack() leave masked status bits such as
FUSB_REG_INTERRUPT_ACTIVITY set in chip->pending_interrupt?

The FUSB302 latches FUSB_REG_INTERRUPT_ACTIVITY in FUSB_REG_INTERRUPT on CC
activity even when masked in FUSB_REG_MASK, including from the GoodCRC
transmission itself.  Because chip->pending_interrupt is then always
non-zero after a driver-sent GoodCRC, fusb302_irq_handle() will loop through
its "goto again" path and perform four extra I2C register reads every time,
and fusb302_pd_check_ack_async() will always wake the IRQ thread.

> +
> +/*
> + * As fusb302_pd_check_ack(), outside the IRQ thread: reading INTERRUPT =
clears
> + * the flags that raise the IRQ, so have the IRQ thread handle what it r=
ead
> + */
> +static void fusb302_pd_check_ack_async(struct fusb302_chip *chip)
> +{
> +	if (!chip->ack_check || fusb302_pd_check_ack(chip) < 0)
> +		return;
> +	if (chip->pending_interrupt)
> +		irq_wake_thread(chip->gpio_int_n_irq, chip);
> +}

[Severity: Medium]
Can chip->pending_interrupt be stranded when chip->gpio_int_n_irq is behind
an I2C GPIO expander?

Interrupts behind a sleeping GPIO expander are registered as nested threaded
IRQs (IRQ_NESTED_THREAD), where irqaction->thread is NULL and handlers run =
on
the parent controller's thread.  irq_wake_thread() does nothing when
action->thread is NULL:

kernel/irq/manage.c:irq_wake_thread() {
    ...
	for_each_action_of_desc(desc, action) {
		if (action->dev_id =3D=3D dev_id) {
			if (action->thread)
				__irq_wake_thread(desc, action);
			break;
		}
	}
}

Since fusb302_pd_check_ack() has already read and cleared FUSB_REG_INTERRUPT
in the chip, INT_N deasserts and the events saved in chip->pending_interrupt
will not be processed until an unrelated interrupt fires.

> +
> +/*
> + * TCPM waits for the outcome of its last transmission, unless it gave u=
p after
> + * PD_T_TCPC_TX_TIMEOUT, which it does without telling the driver
> + */
> +static bool fusb302_pd_tx_waiting(struct fusb302_chip *chip)
> +{
> +	return chip->tx_pending &&
> +	       ktime_ms_delta(ktime_get(), chip->tx_start) <
> +	       PD_T_TCPC_TX_TIMEOUT;
> +}
> +
> +/*
> + * The chip only decodes the low four bits of the message type, so it mi=
stakes
> + * Get_Source_Cap_Extended (0x11) for a GoodCRC (0x1): it neither acknow=
ledges
> + * it nor raises GCRCSENT, only CRC_CHK, yet still queues it in the RX F=
IFO.
> + * Send the GoodCRC from here once the message checks out. It goes out w=
ell
> + * after 195us (tTransmit), but the partner retries with the same Messag=
eID and
> + * usually accepts it then, rather than soft reset over and over.
> + */
> +static void fusb302_pd_rx_ack(struct fusb302_chip *chip)
> +{
> +	u16 header =3D get_unaligned_le16(chip->rx_buf + 1);
> +	struct pd_message ack =3D {};
> +	int ret;
> +
> +	if (chip->rx_discard || chip->rx_acked || pd_header_cnt(header) ||
> +	    pd_header_type(header) !=3D PD_CTRL_GET_SOURCE_CAP_EXT ||
> +	    (chip->rx_buf[0] & FUSB302_RX_TKN_MASK) =3D=3D FUSB302_RX_TKN_SOP1)
> +		return;
> +	chip->rx_acked =3D true;
> +
> +	/*
> +	 * The outcome of a GoodCRC sent now would pass for that of the
> +	 * transmission TCPM waits for, so leave the partner to retry then
> +	 */
> +	if (fusb302_pd_tx_waiting(chip)) {
> +		fusb302_log(chip, "not acknowledging PD message, TX pending");
> +		return;
> +	}
> +
> +	/*
> +	 * The chip's own GoodCRCs go out as revision 2.0. As it decodes only
> +	 * the low four bits of the message type, it treats any GoodCRC it
> +	 * sends as one that needs no GoodCRC in return, so it sends this one
> +	 * once, without retries or RETRYFAIL, whatever the retry count is.
> + */
> +	ack.header =3D PD_HEADER_LE(PD_CTRL_GOOD_CRC, chip->pwr_role,
> +				  chip->data_role, PD_REV20,
> +				  pd_header_msgid(header), 0);
> +	ret =3D fusb302_pd_send_message(chip, TCPC_TX_SOP, &ack);
> +	if (ret >=3D 0)
> +		chip->ack_check =3D true;
> +	else
> +		fusb302_log(chip, "cannot acknowledge PD message, ret=3D%d", ret);
> +}

[ ... ]

> @@ -1680,6 +1808,8 @@ static int fusb302_pd_read_message(struct fusb302_c=
hip *chip)
>  		dropped++;
>  	}
> =20
> +	/* The CRC checks out: acknowledge it, should the chip not have */
> +	fusb302_pd_rx_ack(chip);
>  	chip->rx_resync =3D false;
>  	token =3D chip->rx_buf[0];
>  	memcpy(&msg, chip->rx_buf + 1, len - 5);

[Severity: Medium]
When fusb302_pd_rx_ack() withholds the GoodCRC because
fusb302_pd_tx_waiting(chip) is true (or fusb302_pd_send_message() fails),
does fusb302_pd_read_message() still pass the unacknowledged
Get_Source_Cap_Extended message to tcpm_pd_receive()?

Delivering the unacknowledged message causes tcpm_pd_rx_handler() to record
its MessageID in port->rx_msgid and start transmitting a reply (setting
chip->tx_pending =3D true again), while any later acknowledged retry from t=
he
partner with the same MessageID will be dropped by TCPM as a duplicate.

[ ... ]

> @@ -1847,6 +1977,7 @@ static void fusb302_pd_rx_recheck_work(struct work_=
struct *work)
>  		if (ret < 0)
>  			fusb302_log(chip, "cannot read in PD message, ret=3D%d",
>  				    ret);
> +		fusb302_pd_check_ack_async(chip);
>  	}
>  	mutex_unlock(&chip->lock);
>  }

[Severity: Medium]
Can fusb302_pd_rx_recheck_work() wake the IRQ thread after synchronize_irq()
in fusb302_pm_suspend() has already returned?

drivers/usb/typec/tcpm/fusb302.c:fusb302_pm_suspend() {
    ...
	/* Let an IRQ being handled finish before the bus suspends */
	synchronize_irq(chip->gpio_int_n_irq);
	/* No RX FIFO recheck may run until the bus is back either */
	cancel_delayed_work_sync(&chip->rx_recheck);
	return 0;
}

CPU0                              CPU1 (kworker)
fusb302_pm_suspend()
  chip->irq_suspended =3D true
  synchronize_irq(...)
                                  fusb302_pd_rx_recheck_work()
                                    fusb302_pd_rx_drain()
                                    fusb302_pd_check_ack_async()
                                      irq_wake_thread(...)
  cancel_delayed_work_sync(...)
  return 0
                                  fusb302_irq_intn()  <-- runs during suspe=
nd

Because cancel_delayed_work_sync(&chip->rx_recheck) runs after
synchronize_irq(), fusb302_pm_suspend() can return while the newly woken IRQ
thread is still pending or running.

[ ... ]

> @@ -2014,6 +2151,22 @@ static void fusb302_irq_handle(struct fusb302_chip=
 *chip)
>  	chip->pending_interrupt =3D 0;
>  	chip->pending_interrupta =3D 0;
>  	chip->pending_interruptb =3D 0;
> +
> +	/*
> +	 * A message the chip didn't acknowledge raises CRC_CHK alone: read it
> +	 * out first thing, as its GoodCRC is past due already. Those that came
> +	 * before PD was on, which nothing acknowledged, were dropped then.
> +	 */
> +	if (chip->pd_rx_on && (interrupt & FUSB_REG_INTERRUPT_CRC_CHK) &&
> +	    !(interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) &&
> +	    !(interruptb & FUSB_REG_INTERRUPTB_GCRCSENT)) {
> +		/* Still handle the other events then */
> +		ret =3D fusb302_pd_rx_drain(chip);
> +		if (ret < 0)
> +			fusb302_log(chip,
> +				    "cannot read in PD message, ret=3D%d", ret);
> +	}

[ ... ]

> @@ -2061,14 +2214,19 @@ static void fusb302_irq_handle(struct fusb302_chi=
p *chip)
>  		}
>  	}
> =20
> +	/* Not for TCPM if it came from a GoodCRC the driver sent */
>  	if (interrupt & FUSB_REG_INTERRUPT_COLLISION) {
>  		fusb302_log(chip, "IRQ: PD collision");
> -		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_FAILED);
> +		if (chip->ack_check)
> +			chip->ack_check =3D false;
> +		else if (chip->tx_pending)
> +			fusb302_pd_tx_complete(chip, TCPC_TX_FAILED);
>  	}
> =20
>  	if (interrupta & FUSB_REG_INTERRUPTA_RETRYFAIL) {
>  		fusb302_log(chip, "IRQ: PD retry failed");
> -		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_FAILED);
> +		if (chip->tx_pending)
> +			fusb302_pd_tx_complete(chip, TCPC_TX_FAILED);
>  	}

[Severity: Medium]
Does draining the RX FIFO on FUSB_REG_INTERRUPT_CRC_CHK before handling
FUSB_REG_INTERRUPT_COLLISION and FUSB_REG_INTERRUPTA_RETRYFAIL from the same
interrupt snapshot mix up TX state before and after the drain?

If TCPM's transmission fails with COLLISION or RETRYFAIL in the same
interrupt snapshot as an incoming Get_Source_Cap_Extended, chip->tx_pending
has not been cleared yet when fusb302_pd_rx_drain() runs, so
fusb302_pd_rx_ack() sees fusb302_pd_tx_waiting(chip) as true and skips
sending the GoodCRC.

Conversely, if fusb302_pd_rx_ack() sends a GoodCRC during the CRC_CHK drain
and sets chip->ack_check =3D true while the earlier interrupt snapshot alre=
ady
had FUSB_REG_INTERRUPT_COLLISION set, the COLLISION handler below will clear
the new chip->ack_check against that older COLLISION bit, skipping both any
chip->tx_pending failure report and the done-path fusb302_pd_check_ack()
call for the newly sent GoodCRC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fusb302-ge=
tsourcecap-v2-0-6770eb1e7945@flipper.net?part=3D5

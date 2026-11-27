Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778752;
	b=jMATqZ8yClQ2PoylUJZtwG+lZgtRG4Dk8m4vsuyeAYUxxDbTES4mjwZ37HIFQnALopyE
	 wFYbDX4jcZkP92H0YWepoAc0kRUud1cojyJCSJUSX8UNKed0yqMPmfJmowqhb+jx2SCvq
	 F5OLtE2pmdgC2bSnkjU3cMy/nQ5YQTSijZVRKD6bIR0dojLWeNar9AfZ6t8uUaQvf3vXZ
	 Fm4/yjrsGGdH/IISKbRWHo24WY/H1cLqcn+C8WDlgifKJsXFp+9/CBdVtCijTXkNbfvhp
	 wDR8N1tPiRRmSEhpaSdcLFcQwtAS6+eXG6IzBpNCjGUfmkf4VhKwzhETA60y4tvaW/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778752;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EdrFh9ujQ1JT6o2dOchUybfgnow7OCprZ4dxSe/3wyk=;
	b=x+7hs1j5a1GfMoMeZ5e6Ho6fIycBcCEr9x56k2toxFh2AX9p5mSA6ny0QIvopr7BHVbv
	 9SHo2c3LDUqbHqCDUH70JJv1nvM6N/jkomaDlKPc4fuYSE8QqHNTwSDt3R5MLQ2ufynYc
	 9WV+s0Srilulkn7r+5F4uTUxBH43IZnE+nwOM/iFZXe0yXW0eHKeZrqkpzWZylLnW/g1H
	 ajVo5rBJXgreA986TEm0GMhHimKmhpTDLrzNmaFINkT/0RPTDHkEK6GhxW5vAmt0wyCyT
	 vu7JMBwpKDnn0Fqp9zUZvFgjUlUL9cBr0WlDM+Xu6+M+0PnMofLm4cD222mjMpxrXpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2AqSQ13;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087CF606A6B3
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2AqSQ13
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600F11F0089B;
	Fri, 27 Nov 2026 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795778751;
	bh=EdrFh9ujQ1JT6o2dOchUybfgnow7OCprZ4dxSe/3wyk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T2AqSQ13rcj5UKmlpA4eO1FLPwmKjJf4Uj/MwGAYxzHtYO9aesEG4ruMb7+WwZhgD
	 eoq6F7K9uLBD4ZeLdXRDh3AsLSrxkqekrLVvMGSAoAfJw07F4y21H5QyoKjmCztUHM
	 GQvw2LJ6Souo9ZNcpazisTjY7kW8duAGX6le+BSwYKt1/8HBjmh+sn6q5yKU5tpN7q
	 t8i8bil+dpagHiQG9BC34+oOeh3jzy8K4MtRZUQYFio5HR1BZQFxFiX2Y7K4hkzF7B
	 Kun0xzs29TBoo1U7aXiJkas4PjMJfLm8vPh9PNSuEJIljcm0RGyFrDxIRJsh2/gwRD
	 u3IWVeeV/uE/Q==
Message-ID: <sashiko-outbox-237237@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] usb: typec: fusb302: Acknowledge
 Get_Source_Cap_Extended in time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fusb302-getsourcecap-v2-6-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
 <20261127-fusb302-getsourcecap-v2-6-6770eb1e7945@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:25:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [Medium] usb: typec: fusb302: zero header byte dropped in
  fusb302_pd_rx_keep()
- [Medium] usb: typec: fusb302: missing rx_resync on error in
  fusb302_pd_rx_fast_ack()
- [Medium] usb: typec: fusb302: stale COLLISION clears ack_check in
  fusb302_irq_handle()
- [Medium] usb: typec: fusb302: defeated GoodCRC staging on role changes
  and retries
- [Medium] usb: typec: fusb302: stranded rx_buf and resync over-read in
  fast ack
- [Medium] usb: typec: fusb302: popped FIFO bytes lost in
  fusb302_pd_rx_fast_ack()
- [Medium] usb: typec: fusb302: unacknowledged message after collision
  in fusb302_pd_rx_fast_ack()
--

commit 4f7e49c60c6f94fddba0ebcedb0518c433748be5
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: fusb302: Acknowledge Get_Source_Cap_Extended in time

This commit pre-stages the next expected GoodCRC in the FUSB302 TX FIFO and
reads STATUS0, STATUS1, INTERRUPT and the head of the RX FIFO at the start
of the interrupt handler so Get_Source_Cap_Extended can be acknowledged
before its CRC finishes arriving.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index c98a74fc7a2ac..bdba2169ec0fa 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
[ ... ]
> @@ -1707,6 +1803,50 @@ static int fusb302_pd_rx_find(struct fusb302_chip =
*chip)
>  	return 0;
>  }
> =20
> +/*
> + * Append n header bytes that fusb302_pd_rx_fast_ack() read from the FIF=
O while
> + * a packet may have been landing to rx_buf. Reading an empty FIFO retur=
ns 0
> + * and takes nothing, so real bytes may come interleaved with such zeros=
. As
> + * neither the token nor header byte[0], which holds the message type, i=
s ever
> + * 0, the real bytes are the non-zero ones. The only exception is header
> + * byte[1], which holds the power role or cable plug bit and is non-zero=
 from
> + * a source or a cable plug, but may be 0 from a sink: leave that case t=
o the
> + * CRC, see fusb302_pd_rx_resolve_h1().
> + */
> +static void fusb302_pd_rx_keep(struct fusb302_chip *chip, const u8 *fifo,
> +			       int n)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < n; i++) {
> +		if (fifo[i])
> +			chip->rx_buf[chip->rx_len++] =3D fifo[i];
> +		else if (chip->rx_len =3D=3D 2 && chip->pwr_role =3D=3D TYPEC_SOURCE &&
> +			 (chip->rx_buf[0] & FUSB302_RX_TKN_MASK) =3D=3D
> +			 FUSB302_RX_TKN_SOP)
> +			chip->rx_h1_unsure =3D true;
> +	}
> +}

[Severity: Medium]
Can checking chip->pwr_role =3D=3D TYPEC_SOURCE here drop a valid zero seco=
nd
header byte during a Power Role Swap or Fast Role Swap?

During PR_Swap and FR_Swap, both partners transiently operate with power
role TYPEC_SINK while exchanging PS_RDY and its GoodCRC: the initial source
calls tcpm_set_pwr_role(port, TYPEC_SINK) before sending PS_RDY, and the
initial sink stays TYPEC_SINK until after it receives PS_RDY and applies
VBUS.  If PS_RDY or GoodCRC carries MessageID 0, its second header byte is
0x00 while chip->pwr_role is TYPEC_SINK.  When fusb302_pd_rx_fast_ack()
sees FUSB_REG_STATUS0_ACTIVITY set (including while the chip is still
transmitting its own automatic GoodCRC to PS_RDY), fusb302_pd_rx_keep()
discards that 0x00 byte without setting chip->rx_h1_unsure, and the loop in
fusb302_pd_rx_fast_ack() then consumes the first CRC byte as header
byte[1], causing the message to fail CRC verification and aborting the role
swap.

[ ... ]
> @@ -1834,12 +1986,14 @@ static int fusb302_pd_read_message(struct fusb302=
_chip *chip)
>  	 * TX_SUCCESS and GCRCSENT events out of order on occasion, so we need
>  	 * to check the message type to ensure correct reporting to TCPM.
>  	 */
> -	if (!len && pd_header_type_le(msg.header) =3D=3D PD_CTRL_GOOD_CRC)
> +	if (!len && pd_header_type_le(msg.header) =3D=3D PD_CTRL_GOOD_CRC) {
>  		fusb302_pd_tx_complete(chip, TCPC_TX_SUCCESS);
> -	else if ((token & FUSB302_RX_TKN_MASK) =3D=3D FUSB302_RX_TKN_SOP1)
> +	} else if ((token & FUSB302_RX_TKN_MASK) =3D=3D FUSB302_RX_TKN_SOP1) {
>  		tcpm_pd_receive(chip->tcpm_port, &msg, TCPC_TX_SOP_PRIME);
> -	else
> +	} else {
> +		chip->rx_last_msgid =3D pd_header_msgid_le(msg.header);
>  		tcpm_pd_receive(chip->tcpm_port, &msg, TCPC_TX_SOP);
> +	}

[Severity: Medium]
Does advancing chip->rx_last_msgid here even when Get_Source_Cap_Extended
went unacknowledged or its GoodCRC was delayed defeat GoodCRC staging for
the partner's retry?

If fusb302_pd_rx_ack() skipped sending GoodCRC because
fusb302_pd_tx_waiting(chip) was true, or if a Sink's
Get_Source_Cap_Extended with MessageID 0 had to wait for its CRC via
chip->rx_h1_unsure, updating chip->rx_last_msgid to M causes
fusb302_pd_stage_ack() to stage (M + 1) & 7 instead of M.  When the partner
retries with MessageID M, chip->staged_msgid does not match and
fusb302_pd_rx_ack() falls back to flushing the TX FIFO and writing the full
GoodCRC over I2C.  Similarly, tcpm_set_roles() calls
fusb302_pd_unstage_ack() without re-staging a GoodCRC for the new roles,
and tcpm_set_pd_rx() turns on PD RX without calling fusb302_pd_stage_ack(),
leaving the first message after a role change or PD RX start without a
staged GoodCRC.

[ ... ]
> @@ -2120,6 +2335,75 @@ static int fusb302_read_interrupts(struct fusb302_=
chip *chip, u8 *status0)
>  	return ret;
>  }
> =20
> +static void fusb302_pd_rx_fast_ack(struct fusb302_chip *chip)
> +{
> +	u8 regs[6];
> +	int ret, n, tries;
> +
> +	if (!chip->pd_rx_on)
> +		return;
> +
> +	if (!chip->rx_len) {
> +		ret =3D fusb302_i2c_block_read(chip, FUSB_REG_STATUS0,
> +					     sizeof(regs), regs);
> +		if (ret < 0)
> +			return;
> +		chip->pending_interrupt |=3D regs[2];
> +		/* With ACTIVITY clear, the token is over 250us away */
> +		if (regs[0] & FUSB_REG_STATUS0_ACTIVITY) {
> +			fusb302_pd_rx_keep(chip, regs + 3, 3);
> +		} else if (!(regs[1] & FUSB_REG_STATUS1_RX_EMPTY)) {
> +			memcpy(chip->rx_buf, regs + 3, 3);
> +			chip->rx_len =3D 3;
> +		}

[Severity: Medium]
Can discarding regs[3..5] when ACTIVITY is clear in regs[0] and RX_EMPTY is
set in regs[1] drop the token and first header byte of an arriving packet?

At 300 kbps BMC signaling, the 64-bit preamble and 20-bit SOP token take
280 us.  On a 100 kHz I2C bus (90 us per byte), or on a 400 kHz bus when
the I2C controller stretches or delays between bytes, more than 280 us
elapses between latching regs[0] and clocking out regs[4..5] from
FUSB_REG_FIFOS.  If a packet begins on CC right after regs[0] is latched,
its SOP token and first header byte arrive in the RX FIFO in time to be
popped into regs[4..5], where neither branch runs and the bytes are lost
even though the hardware still sends an automatic GoodCRC.  Passing regs +
3 to fusb302_pd_rx_keep() whenever RX_EMPTY is set would drop 0x00 bytes
from an empty FIFO while keeping any newly landed header bytes.

> +		if (chip->rx_len && !fusb302_pd_rx_is_token(chip->rx_buf[0]))
> +			chip->rx_resync =3D true;
> +	}

[Severity: Medium]
What happens if a non-RX interrupt runs fusb302_pd_rx_fast_ack() while a
packet is still landing on CC?

When an interrupt such as BC_LVL, VBUSOK or COLLISION fires during an
incoming frame, fusb302_pd_rx_fast_ack() pops 1 to 3 bytes into
chip->rx_buf, but fusb302_irq_handle() only calls fusb302_pd_rx_drain()
when CRC_CHK, TX_SUCCESS or GCRCSENT is set.  If the frame has not raised
one of those interrupts yet (or later fails its hardware CRC check or is
cut short by a collision), fusb302_irq_handle() exits with chip->rx_len > 0
and no rx_recheck scheduled.  On the next interrupt,
fusb302_pd_rx_fast_ack() sees chip->rx_len !=3D 0, skips the STATUS0..FIFOS
read, and splices the next packet onto the stale bytes in chip->rx_buf with
chip->rx_resync still false.  In addition, when chip->rx_resync is already
true on entry and RX_EMPTY is clear with ACTIVITY clear, memcpy() copies 3
bytes unconditionally instead of reading 1 byte at a time like
fusb302_pd_rx_read(), pulling bogus 0x00 bytes from a 1- or 2-byte FIFO
tail into chip->rx_buf.

> +	/*
> +	 * A read that catches the header as it lands gets only part of it,
> +	 * and the rest comes in within tens of microseconds: read the rest,
> +	 * but no further, as fusb302_pd_rx_keep() can only tell what zeros
> +	 * in the header mean. The packet is still landing then, so skip the
> +	 * status registers.
> +	 */
> +	for (tries =3D 0; tries < 2; tries++) {
> +		n =3D 3 - chip->rx_len;
> +		if (!chip->rx_len || n <=3D 0 || chip->rx_resync ||
> +		    chip->rx_h1_unsure)
> +			break;
> +		ret =3D fusb302_i2c_block_read(chip, FUSB_REG_FIFOS, n, regs);
> +		if (ret < 0)
> +			return;

[Severity: Medium]
Should a failed fusb302_i2c_block_read() here (and on the 6-byte read from
FUSB_REG_STATUS0 above) set chip->rx_resync =3D true before returning, as
fusb302_pd_rx_read() does?

If the I2C block read fails partway through or returns a short read after
reaching FUSB_REG_FIFOS, some bytes may already have left the hardware RX
FIFO while chip->rx_resync remains false, leaving subsequent multi-byte
reads in fusb302_pd_read_message() out of step with the FIFO.

> +		fusb302_pd_rx_keep(chip, regs, n);
> +	}
> +
> +	if (chip->rx_len >=3D 3 && !chip->rx_resync)
> +		fusb302_pd_rx_ack(chip);
> +}

[Severity: Medium]
When fusb302_pd_rx_fast_ack() calls fusb302_pd_rx_ack() while the packet is
still landing on CC, won't FUSB302_TKN_TXON collide with the incoming CRC
and EOP?

When the second header byte enters the RX FIFO, the 4-byte CRC and EOP (45
bits, or 150 us at 300 kbps) are still active on CC, whereas writing the
single byte FUSB302_TKN_TXON over a 400 kHz I2C bus takes about 73 us.  If
TXON reaches the chip while CC is still busy (either with the tail of the
message or with a partner retry), the chip aborts the transmission and
raises FUSB_REG_INTERRUPT_COLLISION.  Because fusb302_pd_rx_ack() has
already set chip->rx_acked =3D true and the collision paths never clear it,
fusb302_pd_read_message() will not re-send the GoodCRC once CC goes idle,
yet still advances chip->rx_last_msgid and passes the unacknowledged
message to tcpm_pd_receive().

> +
>  static void fusb302_irq_handle(struct fusb302_chip *chip)
>  {
>  	int ret =3D 0;
> @@ -2134,6 +2418,7 @@ static void fusb302_irq_handle(struct fusb302_chip =
*chip)
>  	bool intr_comp_chng;
> =20
>  	mutex_lock(&chip->lock);
> +	fusb302_pd_rx_fast_ack(chip);
>  again:

[Severity: Medium]
Can a COLLISION from a GoodCRC sent in fusb302_pd_rx_fast_ack() clear
chip->ack_check for a second GoodCRC sent later in fusb302_pd_rx_drain()?

If a GoodCRC sent by fusb302_pd_rx_fast_ack() collides on CC,
fusb302_read_interrupts() latches FUSB_REG_INTERRUPT_COLLISION into
interrupt along with FUSB_REG_INTERRUPT_CRC_CHK.  The CRC_CHK branch then
runs fusb302_pd_rx_drain() before the COLLISION branch is reached; if
fusb302_pd_rx_drain() reads a queued retry and sends a new GoodCRC, it sets
chip->ack_check =3D true for that second GoodCRC.  When execution reaches t=
he
FUSB_REG_INTERRUPT_COLLISION check further down in fusb302_irq_handle(),
the stale COLLISION bit from the first GoodCRC clears chip->ack_check =3D
false, so fusb302_pd_check_ack() is skipped at the done label and any
collision on the second GoodCRC is left pending in hardware to fail TCPM's
next transmission.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fusb302-ge=
tsourcecap-v2-0-6770eb1e7945@flipper.net?part=3D6

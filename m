Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624062;
	b=PVpgIpuZ2re7yysyAqxKkCKgGcXkNC2TTZMaZkMAtqUm9XPJ2gPRglR0rJZNiFVREPHR
	 FPVMcpj+MxOLW5KO08GeI1tcbAj4Q5BnlezIADpUha4/Xw6D7gmTPobBPUT3l2nwzJLOh
	 5ZyG42Jzh1MDNwKTZzCk9KNt90XpKgg/Z1qDU2ZTzHNCxVQk3SnzPCuf67fjqIvhLZPr/
	 CZYA/lLYLko10jsYJJ9w8NyI6HWLNADdQOjX0Mfmt0r3hCBvLTrM+CC4GDGzJhmDAEg8Z
	 0yzLdaCz666777ponriE7IBCFhN4ArGRIDgcYXmUuqQleUcSFAoqnKSh9npqLkjKgHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624062;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3dXd/LbmAAqoXoD8z4G4WyfY9yVJWKsS1hfRcuX7bkA=;
	b=EpKRDOvMPxas/Xeh5SMjqEsaPdbQwLFmz4EfM3wCeIDlxn5qizVEJez+H7Vep1nhe+FA
	 aWW4T2MC/aYW2Fz4ntTLLf1UKvEx6wwbFFA+72oyK9A1zZRgA6QdeiuaWsB/XVXdNtpQH
	 P6yBMpBX3veF23V4ffp66vG0GryeyW/fTc7syjwqk1tdEouyPrySIVf+SThIqFgjNin1D
	 fuOelWbzVTOhjZVH7H9TRe2nq42hzLuqiejGBlz0hgdpcLN+yb+G5VIRRIDNb35fUy1GF
	 lL5W2HHdIYw3J0t/UpG6JkrE5b/szbwVXs5o5dbyacR0iuPKKoHxYmbrD5e30EClvqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jg22vPWb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F5606A327
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jg22vPWb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63AE61F00A1D;
	Mon,  2 Nov 2026 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793624061;
	bh=3dXd/LbmAAqoXoD8z4G4WyfY9yVJWKsS1hfRcuX7bkA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jg22vPWbup5UinvRya29Hpk8zORrxQ+vqE9uuoPWJy6WWdsAGoXcm+gf7LlsCgdUT
	 vI7BUACN26xRZnolBIm0D7p5T1rqmKLvMPmNVXNyuXXehgcmKnHPT5q737sKz3OZPH
	 k3epe0cW2TAZX87WwN0XL3j0zgtCktKdmb87Rr89RDzQE8WMclWqSFXhmV/SHhc24O
	 dwN07cH24hkLnGO+15/MZ/L24+7UFZZTlQaVgLPVoRNyfpTCjF+XESUJ6SOrkQZlel
	 NNg+42lZLEFIoqlpxm65i7wa5In74U0NfOeGRFlF8LHoLs2Jk9B2bI5OB8k4z2bbLh
	 zBAu6x8CHPOIw==
Message-ID: <sashiko-outbox-193448@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Drain the RX FIFO on each PD
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net>
References: <20261102-fusb302-drain-rxfifo-v1-1-bd9b232ab345@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 12:54:20 +0000
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
- [High] usb: typec: fusb302: unacknowledged messages passed to tcpm_pd_rec=
eive()
--

commit c6b027a56fce877cc0a50df66b78e46a0dbd88cb
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: fusb302: Drain the RX FIFO on each PD interrupt

This commit adds fusb302_pd_read_messages() to drain all messages from the
80-byte RX FIFO on each TX_SUCCESS or GCRCSENT interrupt until
FUSB_REG_STATUS1_RX_EMPTY is set. This prevents the driver from falling one
message behind when the hardware queues unacknowledged messages without
raising an interrupt or when multiple messages arrive in quick succession.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 3319f6a2b0c9b..6841db172e117 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1481,6 +1481,36 @@ static int fusb302_pd_read_message(struct fusb302_=
chip *chip,
>  	return ret;
>  }
> =20
> +/* The 80-byte RX FIFO holds at most 11 messages without data objects */
> +#define FUSB302_RX_FIFO_MAX_MSGS	11
> +
> +static int fusb302_pd_read_messages(struct fusb302_chip *chip)
> +{
> +	struct pd_message pd_msg;
> +	u8 status1;
> +	int ret;
> +	int i;
> +
> +	/*
> +	 * Drain the whole RX FIFO rather than one message per interrupt:
> +	 * messages the chip does not acknowledge raise no interrupt, and
> +	 * reading one message per event would then leave every later read
> +	 * returning the message queued before the one that raised it.
> +	 */
> +	for (i =3D 0; i < FUSB302_RX_FIFO_MAX_MSGS; i++) {
> +		ret =3D fusb302_i2c_read(chip, FUSB_REG_STATUS1, &status1);
> +		if (ret < 0)
> +			return ret;
> +		if (status1 & FUSB_REG_STATUS1_RX_EMPTY)
> +			return 0;
> +		ret =3D fusb302_pd_read_message(chip, &pd_msg);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: High]
When a PD 3.0 partner sends PD_CTRL_GET_SOURCE_CAP_EXT (type 17, 0x11, with
len =3D=3D 0), the FUSB302 hardware decodes only the low four bits of the m=
essage
type (0x11 & 0xf =3D=3D PD_CTRL_GOOD_CRC) and places the message and its re=
tries
into the RX FIFO without sending a GoodCRC on the CC line or raising an
interrupt.

After those retries time out, the partner sends PD_CTRL_SOFT_RESET, which t=
he
FUSB302 acknowledges with GoodCRC, raising FUSB_REG_INTERRUPTB_GCRCSENT. Wh=
en
fusb302_irq_work() -> fusb302_pd_read_messages() drains the RX FIFO, it cal=
ls
fusb302_pd_read_message() for the unacknowledged PD_CTRL_GET_SOURCE_CAP_EXT
queued ahead of PD_CTRL_SOFT_RESET:

drivers/usb/typec/tcpm/fusb302.c:fusb302_pd_read_message() {
    ...
	if ((!len) && (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GOOD_CRC))
		tcpm_pd_transmit_complete(chip->tcpm_port, TCPC_TX_SUCCESS);
	else
		tcpm_pd_receive(chip->tcpm_port, msg, TCPC_TX_SOP);
    ...
}

Because pd_header_type_le(msg->header) checks all five bits,
fusb302_pd_read_message() forwards the unacknowledged
PD_CTRL_GET_SOURCE_CAP_EXT to tcpm_pd_receive().

In tcpm_pd_rx_handler() -> tcpm_pd_ctrl_request() -> tcpm_pd_handle_msg() ->
tcpm_queue_message(), TCPM updates port->rx_msgid and sets
port->queued_message =3D PD_MSG_CTRL_NOT_SUPP:

drivers/usb/typec/tcpm/tcpm.c:tcpm_pd_ctrl_request() {
    ...
	case PD_CTRL_GET_SOURCE_CAP_EXT:
	case PD_CTRL_GET_STATUS:
	case PD_CTRL_FR_SWAP:
	case PD_CTRL_GET_PPS_STATUS:
	case PD_CTRL_GET_COUNTRY_CODES:
		/* Currently not supported */
		tcpm_pd_handle_msg(port,
				   port->negotiated_rev < PD_REV30 ?
				   PD_MSG_CTRL_REJECT :
				   PD_MSG_CTRL_NOT_SUPP,
				   NONE_AMS);
		break;
    ...
}

When the subsequent PD_CTRL_SOFT_RESET is processed, tcpm_pd_ctrl_request()
calls tcpm_set_state(port, SOFT_RESET, 0) without clearing
port->queued_message. Then, in tcpm_state_machine_work(), TCPM sends the
queued PD_MSG_CTRL_NOT_SUPP before run_state_machine() runs the SOFT_RESET
state to send PD_CTRL_ACCEPT:

drivers/usb/typec/tcpm/tcpm.c:tcpm_state_machine_work() {
    ...
	if (port->queued_message && tcpm_send_queued_message(port))
		goto done;
    ...
}

Doesn't forwarding unacknowledged control messages (where !len and the low
four bits of the type equal PD_CTRL_GOOD_CRC, but the full type is not
PD_CTRL_GOOD_CRC) to tcpm_pd_receive() cause TCPM to transmit a spurious
PD_CTRL_NOT_SUPP on the wire while the partner is waiting for PD_CTRL_ACCEPT
in response to its Soft_Reset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-fusb302-dr=
ain-rxfifo-v1-1-bd9b232ab345@flipper.net?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625630;
	b=gL0rJxOVpv43kjPgqbk+yUE+BHQMqGJwvWnjwvrKNJA0TITtBTEsM8TyD58ACtSA6w1q
	 S8rO+j4ZzePYcQvB59gCR+OJMF7q+tqF1HYC6OcT+QS5Th2cYC54BmctQ1+tgQnreNQeQ
	 1M+yWVLo6CBHsf+pnCD842Dtqoj9O7QS6bPXrvdC/umdwmrPXRGZomyQjeWoYIGudmfv4
	 FI3KN4jKBHEMBGR1VRPpzID8CJWdzmN+nJsuyC+9mvucYzszizIF+9V8P0VE0DbtAfc8P
	 w4UoRclryZUQt9MAyeeJem2bzilQtzv3aBiXH/xlEvRXH9y6xYSIMnRyxrp91EuUSog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625630;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aG4K5CzoJiDhL6EdhySG83yYaYUz/z0dqijOls/yFAA=;
	b=fWZzm8Jfmwd0dCM9Vl2Pxyi5/ybcHKLn8cNf2yLVNNBpCHghDr0Hzm0MW1jNqtXgKqwk
	 Qmu2h6GJF2FsspiH6IYVpNHncIFWQUdz+HzJt+C1GHJ6e7hcr8F2WbSrDu2KqelSwaPZd
	 TWN5L4zSXY2MJYC2nG8iVxmrRCqQwdBYi4I3MlGkxBf9jevQuKfG2mSUbLtsbkDRYwGrW
	 tq88KlsKmRPVdjtvgbLbKyBe+aiXJfJOarJTjaFtVWosELMGJkQZKCLIFI2NSKlUh2Sk/
	 c2OUkihnOQTInivuJaSXXrc/BB9eTNSXLBKqghrtEQ/9+C8MNi8j8aEL8b8QRWk736A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3StqGq7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E3C606A324
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y3StqGq7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA8C1F00A16;
	Mon,  2 Nov 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793625629;
	bh=aG4K5CzoJiDhL6EdhySG83yYaYUz/z0dqijOls/yFAA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y3StqGq7RTed0nfpFVl6/YFPll73PDfWVsGy6aplBKzAgBDM7xJdYRwQWk2de94GT
	 YHzK8oMXq0r4XDcePDL0Hzdp9O+L8G7TbtE5+NKCw2G9biYJlicadi+uqWHCXKjiM3
	 VgFUsLV3VWanZcn7W+z3gx4ABr5pnglYg2JQCxEXWy8spJJSeOwTVvABsCt+lXv4qv
	 3ITGCgKWjY3sRMVmavfKCSkQvkNgXEEdg1L5pR/9QjJAjb454J/MZkuPGsB/se1QOA
	 a0QeQp3zNYVPz+G7Le5DsQAIDzD6u2/UarlWEnQotbskUr+8ygofiAfNZmjfvQVgj0
	 vT8Jp34ugOJ4A==
Message-ID: <sashiko-outbox-193478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Drop unacknowledged
 Get_Source_Cap_Extended
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net>
References: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 13:20:28 +0000
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
- [High] usb: typec: fusb302: incomplete RX FIFO drain in fusb302_pd_read_m=
essage()
--

commit 2a38943c4db3b547e9d3ad8f9cba90c33a8b3dfa
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: fusb302: Drop unacknowledged Get_Source_Cap_Extended

This commit drops Get_Source_Cap_Extended messages read from the FUSB302 RX
FIFO in fusb302_pd_read_message() because the hardware mistakes them for
GoodCRC messages and queues them in the FIFO without sending a GoodCRC or
raising an interrupt.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index 3319f6a2b0c9b..96dc48250d6a6 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1463,6 +1463,19 @@ static int fusb302_pd_read_message(struct fusb302_=
chip *chip,
>  	fusb302_log(chip, "PD message header: %x", msg->header);
>  	fusb302_log(chip, "PD message len: %d", len);
> =20
> +	/*
> +	 * The chip only decodes the low four bits of the message type, so it
> +	 * mistakes Get_Source_Cap_Extended (17) for a GoodCRC (1): it neither
> +	 * acknowledges it nor raises GCRCSENT, yet still queues it in the RX
> +	 * FIFO. Without a GoodCRC the partner never considers it delivered and
> +	 * will retry and then soft reset, so it must not be answered.
> +	 */
> +	if ((!len) &&
> +	    (pd_header_type_le(msg->header) =3D=3D PD_CTRL_GET_SOURCE_CAP_EXT))=
 {
> +		fusb302_log(chip, "dropping unacknowledged PD message");
> +		return ret;
> +	}

[Severity: High]
When fusb302_pd_read_message() drops a PD_CTRL_GET_SOURCE_CAP_EXT message a=
nd
returns early here, doesn't that leave any retried copies and the actual
interrupt-triggering PD message unread in FUSB_REG_FIFOS?

Because the FUSB302 does not raise an interrupt when it queues
PD_CTRL_GET_SOURCE_CAP_EXT, the partner will retry it (queueing up to 3 cop=
ies
in FUSB_REG_FIFOS in PD 3.0) before sending a follow-up message such as
Soft_Reset that finally raises FUSB_REG_INTERRUPTB_GCRCSENT (or a GoodCRC f=
or
a local transmission that raises FUSB_REG_INTERRUPTA_TX_SUCCESS).

In drivers/usb/typec/tcpm/fusb302.c, fusb302_irq_work() clears the interrupt
status registers on read and only calls fusb302_pd_read_message() once for
that event:

	if (interrupta & FUSB_REG_INTERRUPTA_TX_SUCCESS) {
		fusb302_log(chip, "IRQ: PD tx success");
		ret =3D fusb302_pd_read_message(chip, &pd_msg);
		...
	}
	...
	if (interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) {
		fusb302_log(chip, "IRQ: PD sent good CRC");
		ret =3D fusb302_pd_read_message(chip, &pd_msg);
		...
	}

If fusb302_pd_read_message() returns after popping only the first
PD_CTRL_GET_SOURCE_CAP_EXT frame, the remaining retries and the message that
actually triggered GCRCSENT or TX_SUCCESS stay behind in the RX FIFO and are
not delivered to TCPM on this interrupt.

Should fusb302_pd_read_message() loop back to read the next message from
FUSB_REG_FIFOS whenever it drops an unacknowledged PD_CTRL_GET_SOURCE_CAP_E=
XT
message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-fusb302-ge=
tsourcecap-v1-1-26b5bfea4b2b@flipper.net?part=3D1

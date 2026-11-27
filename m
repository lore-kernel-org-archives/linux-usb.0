Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777120;
	b=oO3mwFNZ7C90/BhtrxH0qNfcwiyZGGXUpCYx51vFqps6o7WnCef0MHgLOE18RRs+w6Rr
	 3/BTK9HtCcmw1SdabJeJzbvU+A10e8VU5YKSp6J8fX75EaonX2mfLNkBGHLUt0ofvDX50
	 /XudHwwvnN+LP/xfGe4m7GTTHWJaNM8X1DcuvCLloLpFSV5671OlERPyILPxLKyhbLXth
	 qPEPtWwaX/2/HU7FizVYpzdi13TF3ym2PL3R9cr9Zn3zoJXw7DVEFSBjyqLVIO7Oo0Ds4
	 4YoqP5+K1/zuy/cRqoAzyMXwWIq8nd7vOmQr9GZsiXk89saAZxfosIt4iXYuNFwCSgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777120;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=was75uis0IqQNU9GKTvSm4fYO1CTRnsUCBvR/QAgI38=;
	b=EUSnPrkTyG9TDB7g1YkXyrQyIf/jja/mjSsgvtrXmNBTy5cmXzK1qByTFmmLJHqUF9je
	 bmWZttoVamVO7t3NSVSUswcMqfmKJClMdsuFT1zcfyfhTXClOC9NSQJtfKCe3jtDxSHjg
	 rRAHQX/+VmZ6B2aBn3VEX7vSIWZsx7NH61dIleFftI6lgGuqgtH2bkcD4/cFyWMaALadE
	 KW3e2AQHrpWVoKsoywkGbJj987jQlh45fesaZpdmsEmJL/BbEg5S3rSPWz4ivo6tFryvb
	 rj0haCXy63t89Tw3Uuwo52HEVb/BO37yH+iFixoy+TOxgWJs1SyTiOPy/KeQ6BnARnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xs1Y5B14;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829C606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xs1Y5B14
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E641F000C1;
	Fri, 27 Nov 2026 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777120;
	bh=was75uis0IqQNU9GKTvSm4fYO1CTRnsUCBvR/QAgI38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xs1Y5B14AXsLAsgGLkK4tWL99Dl8mEMAPvSNtJXWcbfhyYCfowjgK3mwHLRpZPoBH
	 UMyI2pf9GnWOwF6hDJlSLOeTO26hKm6eNjkhoJKi07Ca5MHqLX1XfQOf3B/eu7KvP9
	 muQaD7wJmBhm9PPKdgiMmUBsGpVp8cIXpZQfCcNtkjqgPpOR/Xt9uujATrG1URQGU0
	 5kH/z19Ft/f7oUqYSMKaaspPBt+LBmjhu9NyoRIPspJaF/S/7JO06nQuhzTs8GBqoE
	 GhWgkcxAeNw66OZV2/oAGFxh/2fowWbBmZa/EnXNSqPX8XHlLrSq9+BZqR7ImdUNHG
	 pbmLBGhCfH3LA==
Message-ID: <sashiko-outbox-237193@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] usb: typec: fusb302: Drain the RX FIFO on each
 PD interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fusb302-getsourcecap-v2-2-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
 <20261127-fusb302-getsourcecap-v2-2-6770eb1e7945@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 10:58:39 +0000
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
- [Medium] usb: typec: fusb302: rx_rechecks not reset after limit or PD
  RX reset
--

commit ab0193ce52aa6488faeed15cd71aecb910a1816e
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: fusb302: Drain the RX FIFO on each PD interrupt

This commit drains the RX FIFO on each PD interrupt while waiting for CC
to go idle before reading each message, scheduling a delayed recheck if
CC stays busy.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index d2d0e8ffc3080..d57f9ae6621d6 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
[ ... ]
> @@ -1693,6 +1700,141 @@ static int fusb302_pd_read_message(struct fusb302=
_chip *chip)
[ ... ]
> +/* About 200ms of CC staying busy, longer than any PD traffic but noise =
*/
> +#define FUSB302_CC_BUSY_RECHECKS	50
> +
> +/*
> + * Drain the RX FIFO, and if it may not be empty, look again shortly aft=
er: a
> + * packet the chip does not acknowledge raises no interrupt for it to be=
 read
> + * on. Leave CC that stays busy for longer to the next interrupt, rather=
 than
> + * keep the I2C bus and chip->lock busy with it.
> + */
> +static int fusb302_pd_rx_drain(struct fusb302_chip *chip)
> +{
> +	int ret;
> +
> +	ret =3D fusb302_pd_read_messages(chip);
> +	if (ret <=3D 0) {
> +		chip->rx_rechecks =3D 0;
> +		return ret;
> +	}
> +	if (chip->rx_rechecks++ < FUSB302_CC_BUSY_RECHECKS)
> +		mod_delayed_work(chip->wq, &chip->rx_recheck,
> +				 usecs_to_jiffies(FUSB302_CC_BUSY_MAX_US));
> +	else
> +		fusb302_log(chip, "CC stays busy, RX FIFO left for the next interrupt"=
);
> +
> +	return 0;
> +}

[Severity: Medium]
Does chip->rx_rechecks remain past FUSB302_CC_BUSY_RECHECKS once the
recheck limit is hit?

chip->rx_rechecks is only reset to 0 when fusb302_pd_read_messages()
returns <=3D 0, and is not reset in the else branch, on a new interrupt, or
in fusb302_pd_rx_reset().  Once 50 rechecks expire, a later PD interrupt
(even after a Hard Reset or FIFO flush) that reads a message and then sees
CC busy with a follow-up packet returns 1 from fusb302_pd_read_messages(),
sees chip->rx_rechecks >=3D 51, and gives up immediately without scheduling
chip->rx_recheck, leaving unacknowledged messages stuck in the RX FIFO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fusb302-ge=
tsourcecap-v2-0-6770eb1e7945@flipper.net?part=3D2

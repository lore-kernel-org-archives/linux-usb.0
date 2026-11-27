Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777226;
	b=R8meaX6NBV93DTXOV5WH1OkPQqqK7nWYszLwR/h/Wmw9AQ9ehAOGhaTwr5bZIWCs9+q8
	 7zQWvywnX6K6M+mydeRJ/ADTmwFK26GAClW793FX65wuScqHi6ZCkNeOa23iXb09L7DoS
	 OLVHFrd22YGVas+SW9t/gQJhVrEEnmhlGP8Mz+6dy6Tz1Y6g1kEnB5iVW8CWY9qpjMcoc
	 n+F18Q7sB+f96EiGjPKVicNmS3kdZNkqItJNnEc/4KDovjqUDSKeWR15T0Vyp5IijAEKR
	 BGWWb6QOONYCJ8qAWM7S/b2l77JLtXxz1JLn+fAt9XmRuk0K9D6oJG+3RwzxEAQT6rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777226;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sp5Gnyy38F/zx7vt+y+rlR2k6lPmseA/uBDBcWGGwnw=;
	b=qBLzv/JK4p8nWDrPVMQ0TR90AImcqnrd8gKR3v+gVjFksfXnT0Z+yKCsEdYqAiJ5Ib+y
	 axf5ArT+wuTanFPKOjJygfZPtWlfcx+4FbjOBkViorMfUcD4oXA6UjWBDvt9UTe5X7xaY
	 XnCOW36VCOTqWnTZh8CIJm7s42zmB8msR41AC2hhkqZHBYpfy7q+vjTlz0Tm2Kmd7i6NO
	 GVuwT6kHZg9lCYuTr9+FaOyelkO4X+FBIm03EMsO2AhFxwK5UfAiYkjwsjjCson3cagCO
	 mAnHcfIbpL2BwVynMDix/nt03TvJ2seUEF38+x3Jjjudq5k7GAQ2PO7m0LZVNjSixkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mX54gFj5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DA9606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mX54gFj5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3441F000C1;
	Fri, 27 Nov 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777225;
	bh=Sp5Gnyy38F/zx7vt+y+rlR2k6lPmseA/uBDBcWGGwnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mX54gFj5qqdNd5Zdg7W1Qgj4/hZYEMtzZUmvP7C6kg582KNoYmxjrwiiXwrARS8lD
	 4sOE76GOxoCR4qwTXhC+5mruoiisvjW3KeFWQhUFuIRW1nTK/sOOY7LPb//eJLSrFq
	 kNqrrT5E9LcxiURgxk5My3D7jgwg/V2KqcE0OPxmptTCXnxlgkXpNxd9uQyFkMqDKx
	 eJOmS05hRoA+qU4h8w1PpdiIw2A+GMGoMsUVvLEw5TRApiWojRbktKRDR+wp/Mv1Ic
	 c81v9sDoDvYtxEv4cu3GxipdufD0JYcGSTU2tvYOOX49/Dao104j7hGJXL1QTQUn5J
	 6N6KKwfAs6CYA==
Message-ID: <sashiko-outbox-237197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] usb: typec: fusb302: Read out the RX FIFO rather
 than flush it as PD RX goes on
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127-fusb302-getsourcecap-v2-3-6770eb1e7945@flipper.net>
References: <20261127-fusb302-getsourcecap-v2-0-6770eb1e7945@flipper.net>
 <20261127-fusb302-getsourcecap-v2-3-6770eb1e7945@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:00:25 +0000
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
- [Medium] usb: typec: fusb302: RX FIFO flush of acked messages in
  fusb302_pd_rx_start()
- [Medium] usb: typec: fusb302: single message discard in
  fusb302_pd_rx_start() misclassifies packets
--

commit 54397075ee71cab92e4ff1f9f4be91c84e562300
Author: Alexey Charkov <alchark@flipper.net>

usb: typec: fusb302: Read out the RX FIFO rather than flush it as PD RX goe=
s on

This commit drains and drops unacknowledged packets from the RX FIFO when
turning PD RX on instead of flushing it, and checks GCRCSENT after enabling
automatic GoodCRC generation to determine whether an in-flight packet was
acknowledged.

> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fu=
sb302.c
> index d57f9ae6621d6..5cf1b78e7669b 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
[ ... ]
> @@ -1835,6 +1847,102 @@ static void fusb302_pd_rx_recheck_work(struct wor=
k_struct *work)
>  	mutex_unlock(&chip->lock);
>  }
> =20
> +/* Tries at reading out the RX FIFO, before turning PD RX on */
> +#define FUSB302_RX_DISCARD_TRIES	4
> +
> +/*
> + * Turn automatic GoodCRCs on, and keep messages that came in before fro=
m TCPM:
> + * the partner, failing to deliver one, keeps its MessageID for the next=
, which
> + * TCPM would then drop as a retry. Read them out rather than flush the =
FIFO,
> + * which would cut short a packet coming in, so that the chip may acknow=
ledge
> + * it and leave the rest of it behind. A packet on CC as GoodCRCs come o=
n goes
> + * to TCPM only if it gets one.
> + */
> +static int fusb302_pd_rx_start(struct fusb302_chip *chip)
> +{
[ ... ]
> +	/*
> +	 * Only the packet that was on CC as GoodCRCs came on can have gone
> +	 * without one, if it is in the FIFO by now: whatever lands after it
> +	 * got a GoodCRC from the chip
> +	 */
> +	chip->rx_discard =3D !(status1 & FUSB_REG_STATUS1_RX_EMPTY) &&
> +			   !(interruptb & FUSB_REG_INTERRUPTB_GCRCSENT);
> +	if (chip->rx_discard) {
> +		ret =3D fusb302_pd_read_message(chip);
> +		chip->rx_discard =3D false;
> +		if (ret < 0)
> +			goto out;
> +	}

[Severity: Medium]
Can calling fusb302_pd_read_message() once here misclassify packets when
GCRCSENT is not set?

When !(status1 & FUSB_REG_STATUS1_RX_EMPTY) &&
!(interruptb & FUSB_REG_INTERRUPTB_GCRCSENT) holds, none of the data
currently in the RX FIFO was acknowledged.  However, if those bytes are a
cut-short fragment (for example, after the fallback fusb302_pd_rx_flush()
above) or fail the CRC check, fusb302_pd_read_message() stays in its
resync loop reading from the live FIFO until it finds a valid message or
the FIFO runs dry:

drivers/usb/typec/tcpm/fusb302.c:fusb302_pd_read_message() {
    ...
		if (fusb302_pd_rx_crc_ok(chip, 0, len))
			break;
		if (!chip->rx_resync)
			fusb302_log(chip, "PD message failed CRC check, header: %x",
				    get_unaligned_le16(chip->rx_buf + 1));
		chip->rx_resync =3D true;
		fusb302_pd_rx_drop(chip, 1);
		dropped++;
	}
    ...
}

If a new packet arrives while those I2C reads are in progress, the chip
acknowledges it with a GoodCRC (since AUTO_GCRC is already on), and
fusb302_pd_read_message() consumes and drops that acknowledged message.
Conversely, if I2C or scheduling latency between exiting the initial
discard loop and setting AUTO_GCRC allowed two unacknowledged packets into
the FIFO, discarding only one message leaves the second unacknowledged
message to be passed to TCPM.  Either case desynchronizes MessageID
tracking with the partner.

> +	ret =3D fusb302_pd_read_messages(chip);
> +out:
> +	if (ret > 0) {
> +		/*
> +		 * CC stayed busy with GoodCRCs on, so which packets in the FIFO
> +		 * the chip acknowledged is unknown: flush them all
> +		 */
> +		fusb302_log(chip, "CC busy as PD RX went on, flushing RX FIFO");
> +		ret =3D fusb302_pd_rx_flush(chip);
> +		fusb302_pd_rx_reset(chip, true);
> +	}
> +	/* TCPM then treats PD RX as off */
> +	if (ret < 0 && gcrc_on)
> +		fusb302_pd_set_auto_goodcrc(chip, false);
> +	chip->rx_discard =3D false;
> +
> +	return ret;
> +}

[Severity: Medium]
Does calling fusb302_pd_read_messages() instead of fusb302_pd_rx_drain() at
the end of fusb302_pd_rx_start() flush packets that the chip has already
acknowledged?

By the time execution reaches this call, AUTO_GCRC is enabled and any
unacknowledged packet that was on CC during the transition has already been
handled.  If CC is now busy with a new incoming packet (or
FUSB302_RX_FIFO_MAX_MSGS messages were read), fusb302_pd_read_messages()
returns 1 and the out: block flushes the RX FIFO instead of scheduling
chip->rx_recheck.  Because the chip has already sent (or will send) a
GoodCRC for those packets, the partner considers them delivered and will
not retry them.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-fusb302-ge=
tsourcecap-v2-0-6770eb1e7945@flipper.net?part=3D3

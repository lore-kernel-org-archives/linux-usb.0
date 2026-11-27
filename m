Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771054;
	b=UaZCpAn6kFL4GhmjZSWn3jqBF7DRHkF7FfTbL1h7EtUtNqW8lKVS+VhQMVSeRpVvs2Hl
	 5UcJEe63/AajRojqzeyvnPwDsZi0TvFpv/+7ymd//Eo7prqOMx1TdMgvDwcyrqMHC0555
	 OwKwgkPIpR9s1pZJW2kDFS8D6LW877rjNVLpPPhHzgem6LFm8A5nq3gTDVhVtdWsVBDGZ
	 LjGYBn0tWdCnnolLoHEgrJRWfDTsP8Go9WppnCMwZSW5C1i+oBcBe7+LCO1tdoi7ZO74v
	 Ve+oF0cbeEnM99qmKKt2mWPNX/74msR3520RxVBVa8BHL4Jm47AliTalKvwNFVWOqvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771054;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+afXA1YAYSzozO0tvLjFFw/kt0mY47cOJVZ/Vk+7Hyo=;
	b=RXf+d49OIgs24POLcAZtDcydrmL6bVXtPRFPBbvtTUxHm5367zH7wkUF6Q5sBO5XbxK4
	 ariA66i8x8CwMElxT+7o5EpIuQj+5O04gv2vduMWtj1IL9BTPyblgxL30owTE/NfS1Ssv
	 Q5v2Ni8lRfSN8ue87gAIrsG+fMwx9Zt8/5EMZS+PvixCZ6IPAyb48qryRFerc4xZi8r/d
	 9vEWAWEB0cv0dFN0msLpA0mYqwlikKa/75cYq1bwm2C3aZMNplJLo/yYRnZp159LB80eI
	 BiBsPXwhmA08b/NDC6FPJtk9rXkifd0tsBcVPJpacbdw2dMORXbJkt8lCch5ycn4Sww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPbujweB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A4C606A331
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kPbujweB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BFB1F00923;
	Fri, 27 Nov 2026 09:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771054;
	bh=+afXA1YAYSzozO0tvLjFFw/kt0mY47cOJVZ/Vk+7Hyo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kPbujweBWdZiGo5dfiK15x3G3TzcY6ohZJ02JZ5gYsBgktdKr/MjcX2ry4peOZMUe
	 S3Y7fyq99cmAGndrAN14i51BZZksopvVpvbnb0mddihFdMhdiNiIEtRLiOJnTScPT7
	 eO6Y7dzgpSaCPdBc9hv4DKWX1DvkDHzq1biESZGDGzjrQUflscXZq3JvmLymhAoilq
	 cATdWnD4vhkSlK5WBPgBMYZ/GY1TRWg/I5Gz/JP67a9kjF9DdCDwpJKi4WpAH4dNiC
	 QQIFHe9PiBk9oRLBFPciRO5SWsN9aP11cHcL1MGcAHCJyMpJJaufpJT/B8de0tzPMb
	 ULwklNC7N7kPg==
Message-ID: <sashiko-outbox-236958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v2 3/3] usb: core: Close residual anchor
 read-to-lock window with RCU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179577008559.23588.16952362934102548601@kylinos.cn>
References: <179577006613.23588.1120308700542393912@kylinos.cn>
 <179577008559.23588.16952362934102548601@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 09:17:33 +0000
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
- [Medium] usb: core: unconditional synchronize_rcu() in anchor wait and
  drain helpers
--

commit 196ab1faf05f61727494005dc79df8a5473ad6cb
Author: Hongyu Xie <xiehongyu1@kylinos.cn>

usb: core: Close residual anchor read-to-lock window with RCU

This commit protects lockless urb->anchor reads with RCU and adds a
synchronize_rcu() grace-period wait to the return paths of
usb_wait_anchor_empty_timeout(), usb_kill_anchored_urbs(),
usb_poison_anchored_urbs(), and usb_scuttle_anchored_urbs().

> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 174dc42c95c14..d7528bd45d11e 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c

[ ... ]

> @@ -903,11 +1000,47 @@ void usb_kill_anchored_urbs(struct usb_anchor *anc=
hor)
>  			usb_put_urb(victim);
>  			spin_lock_irq(&anchor->lock);
>  		}
> -		surely_empty =3D __usb_anchor_check_wakeup(anchor);
> +
> +		if (__usb_anchor_check_wakeup(anchor)) {
> +			spin_unlock_irq(&anchor->lock);
> +			/*
> +			 * One grace period before declaring the anchor
> +			 * unused and returning: a thread that has read
> +			 * urb->anchor but has not yet acquired anchor->lock
> +			 * must not touch the anchor after the caller frees
> +			 * it.  Nothing in this path may touch the anchor
> +			 * after this point.
> +			 */
> +			synchronize_rcu();
> +			return;
> +		}

[ ... ]

> @@ -1016,29 +1181,59 @@ void usb_anchor_resume_wakeups(struct usb_anchor =
*anchor)
>  int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
>  				  unsigned int timeout)
>  {
> +	unsigned long deadline =3D jiffies + msecs_to_jiffies(timeout);
> +	long ret;

[ ... ]

> -	return wait_event_timeout(anchor->wait,
> -				  usb_anchor_check_wakeup(anchor),
> -				  msecs_to_jiffies(timeout));
> +	ret =3D wait_event_timeout(anchor->wait,
> +				 usb_anchor_check_wakeup(anchor),
> +				 max_t(long, (long)(deadline - jiffies), 0));
> +	if (!ret)
> +		return 0;
> +
> +	/* Same lifetime exit as the teardown drains. */
> +	synchronize_rcu();
> +	return 1;
>  }

[Severity: Medium]
Does waiting for an unconditional synchronize_rcu() on every successful
usb_wait_anchor_empty_timeout() and anchor drain call regress runtime I/O
paths that wait on persistent anchors without freeing them?

For example, zd1211rw calls usb_wait_anchor_empty_timeout() in
zd_usb_iowrite16v_async_end() at the end of every register write batch:

drivers/net/wireless/zydas/zd1211rw/zd_usb.c:zd_usb_iowrite16v_async_end() {
    ...
	if (timeout)
		timeout =3D usb_wait_anchor_empty_timeout(&usb->submitted_cmds,
							timeout);
    ...
}

A single Wi-Fi channel switch in zd_chip_set_channel() issues 15 to 20
sequential register write batches under chip->mutex, turning
sub-millisecond USB transfers into 15 to 20 sequential RCU grace-period
stalls per channel hop during scanning.  Drivers that stop multiple
persistent anchors in a loop or sequence (such as hiface_pcm_stream_stop()
waiting on 8 anchors on every ALSA stream stop/prepare, or
usbtmc_generic_read() and btusb_stop_traffic() draining already-empty
anchors) also pay sequential grace periods even when no URBs were
anchored.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179577006613.23588.=
1120308700542393912@kylinos.cn?part=3D3

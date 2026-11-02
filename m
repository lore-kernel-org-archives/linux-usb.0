Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639446;
	b=Lax0+l2wmtmH8EI6stGcU9k54SvX1UanyVfplljhSR25JnH22Y8XbhpaVTNW0sLnDh0a
	 f59cO1gbKYTeNEoGOOraVYUV2b5164y0ZpW1MD0IBHF3n617cQgtrAqn5GkUrZ+MuVAy8
	 zOMpxNAhYbRjgre/hogII23RIgXQ5ajveBZTxdIm0VNqYLaGv1rXw1i49xenIdus5dkvE
	 cxPUFCk/NB89SHabaEfHLreoOiHKrx2TAgx7MrFXQK2uisF/fYpqsk0h1+MJy5E/w+0Ix
	 SwW8XqTbIOWwZasshhoYwU5rbIMW9c3MxSKUsFPQDODMFCizI3u3p/z7m5kEwzo/tFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639446;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d+zkDWun6gXDs5xJcPR1zTjqdbrRYOmb1bF8apsaEi4=;
	b=a2yN434j2qDO2EKsmMpDgQflrO1IqAxEshKKDF45nbF5X4C/FIMyLec40U8sB+3cSZxU
	 2W6o0hNPtgZ/+VWtTRc7Ufay/vkHtoWRckfdEuUTt09+1GOa1xvA28iRPgMjYCdKo9nC1
	 ksrwXdwcF4ExKaoKUjMqMtQerolR7p4egYfs+7iNZbDTm5EybMhCMz1Rdt6Bb57C0JMDz
	 M0Y+a6MW51P2ikexc8Z65s7M8r3gxRX91/rNaJWtVoqKqVmB9dyj2fdVKV7ja/RswQQYT
	 5OQRZDvfBhcnxvDqnEXkQhfbnybDYFaC9SCSeh7N5j6rtPLr/6Qc/ulLh6E+9ujKkjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwPSoml3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0966C606A919
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 17:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwPSoml3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBD31F00A18;
	Mon,  2 Nov 2026 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639445;
	bh=d+zkDWun6gXDs5xJcPR1zTjqdbrRYOmb1bF8apsaEi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VwPSoml3QD6gaTHYlqeLQFc34cqbqqyEJfWjs6CT0yoUVMbDEILeNq+kjfElaXNtI
	 Gfl4Fmu3wlYCFqcWLeVRS9v+plaL2jbrE+w9CMrz1wq80XNigdPI2jMZ3gn+DlwoR4
	 U1ziiIPo68IbyeiJvhJBdstOIrhP6PjwYA1QSLNYTCc6zJK+fabtVgzBRToFX+uv2t
	 9icmo8m4qzQHyVmmCdsY918I3Q9lPv1WTqwHhYfJAo/jAFfSnayBYMAuH9QxZNi55m
	 kYCbzx9GNB1I+O8oax2P2XsBqYcwAvc9///ZBgYJoiuS1hfsufFwbTsKka2GRZfKUG
	 BiyPbkvgYWI1A==
Message-ID: <sashiko-outbox-193807@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Brue" <ryanbrue.dev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
References: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 17:10:45 +0000
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
- [High] usb: mtu3: spin_lock_bh() in mtu3_irq() leaves hardirqs enabled in=
 callbacks
--

commit 153a59750e6c0f99e7e0b96dbcf13012e52f3fc8
Author: Ryan Brue <ryanbrue.dev@gmail.com>

usb: mtu3: don't run gadget completion callbacks with interrupts disabled

This commit changes mtu3_irq() in drivers/usb/mtu3/mtu3_core.c to acquire
and release mtu->lock using spin_lock_bh() and spin_unlock_bh() instead of
spin_lock_irqsave() and spin_unlock_irqrestore() so that softirqs are
disabled when gadget completion callbacks invoke netif_rx().

> diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> index a40bf5bad2d5d..ed0e426645fd6 100644
> --- a/drivers/usb/mtu3/mtu3_core.c
> +++ b/drivers/usb/mtu3/mtu3_core.c
> @@ -790,10 +790,9 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *m=
tu)
>  static irqreturn_t mtu3_irq(int irq, void *data)
>  {
>  	struct mtu3 *mtu =3D (struct mtu3 *)data;
> -	unsigned long flags;
>  	u32 level1;
> =20
> -	spin_lock_irqsave(&mtu->lock, flags);
> +	spin_lock_bh(&mtu->lock);
> =20
>  	/* U3D_LV1ISR is RU */
>  	level1 =3D mtu3_readl(mtu->mac_base, U3D_LV1ISR);
> @@ -814,7 +813,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
>  	if (level1 & QMU_INTR)
>  		mtu3_qmu_isr(mtu);
> =20
> -	spin_unlock_irqrestore(&mtu->lock, flags);
> +	spin_unlock_bh(&mtu->lock);

[Severity: High]
Does replacing spin_lock_irqsave() with spin_lock_bh() in mtu3_irq() break
the USB gadget completion contract and risk a hardirq deadlock?

When mtu3_irq() invokes mtu3_qmu_isr() or mtu3_ep0_isr() ->
mtu3_req_complete() (as well as forward_to_driver(),
mtu3_gadget_disconnect(), mtu3_gadget_suspend(), or mtu3_gadget_resume() in
drivers/usb/mtu3/mtu3_gadget.c), those helpers release mtu->lock with a
plain spin_unlock():

drivers/usb/mtu3/mtu3_gadget.c:mtu3_req_complete() {
	...
	spin_unlock(&mtu->lock);
	usb_gadget_giveback_request(&mep->ep, req);
	spin_lock(&mtu->lock);
	...
}

Because mtu3_irq() now only holds spin_lock_bh(&mtu->lock), dropping
mtu->lock with spin_unlock() leaves hardware interrupts enabled across
usb_gadget_giveback_request() and the gadget driver callbacks.

However, the struct usb_request kerneldoc in include/linux/usb/gadget.h
requires completion callbacks to be called with hardware interrupts
disabled:

include/linux/usb/gadget.h:
 * @complete: Function called when request completes, so this request and
 *	its buffer may be re-used.  The function will always be called with
 *	interrupts disabled, and it must not sleep.

Gadget function drivers rely on this guarantee and take hardirq-unsafe
locks with plain spin_lock() inside their callbacks. For example, in
drivers/usb/gadget/function/u_serial.c, gs_console_complete_out(),
gs_console_connect(), and gs_console_disconnect() acquire cons->lock with a
plain spin_lock():

drivers/usb/gadget/function/u_serial.c:gs_console_complete_out() {
	...
	default:
		spin_lock(&cons->lock);
		req->length =3D 0;
		schedule_work(&cons->work);
		spin_unlock(&cons->lock);
		break;
	}
}

Meanwhile, gs_console_write() is a console write callback that can be
invoked from any hardirq via printk() and acquires cons->lock with
spin_lock_irqsave(). Running completion or setup callbacks with hardware
interrupts enabled causes a lockdep inconsistent lock state splat and
deadlocks if a hardware interrupt on the same CPU calls printk() while
cons->lock is held. Similarly, u_audio_iso_complete() in
drivers/usb/gadget/function/u_audio.c calls snd_pcm_stream_lock() assuming
hardware interrupts are disabled.

In addition, mtu->lock itself can be acquired from hardirq context via
usb_ep_queue() -> mtu3_gadget_queue() when f_midi2 is driven by the ALSA
sequencer hrtimer backend (snd_hrtimer_callback() -> snd_timer_interrupt()
-> snd_seq_timer_interrupt() -> snd_seq_check_queue() ->
seq_ump_process_event() -> snd_rawmidi_kernel_write() ->
f_midi2_ump_trigger() -> process_ump_transmit() -> usb_ep_queue()), and
other callers of mtu3_req_complete() such as mtu3_gadget_ep_disable(),
mtu3_gadget_dequeue(), and mtu3_gadget_stop() still hold
spin_lock_irqsave(&mtu->lock, flags).

The commit message notes that dwc3 fixed the same issue in commit
84918a89d6ef ("usb: dwc3: gadget: Let the interrupt handler disable bottom
halves."), but dwc3 kept spin_lock_irqsave() and wrapped it with
local_bh_disable() and local_bh_enable():

drivers/usb/dwc3/gadget.c:dwc3_thread_interrupt() {
	unsigned long flags;
	irqreturn_t ret =3D IRQ_NONE;
	int i;

	local_bh_disable();
	spin_lock_irqsave(&dwc->lock, flags);
	ret =3D dwc3_process_event_buf(evt);
	spin_unlock_irqrestore(&dwc->lock, flags);
	local_bh_enable();

	return ret;
}

In net/core/dev.c, netif_rx() checks:

	need_bh_off =3D !(hardirq_count() | softirq_count());

When local_bh_disable() is held around spin_lock_irqsave() and
spin_unlock_irqrestore() (as done in dwc3, cdns3, and cdnsp),
softirq_count() is non-zero so netif_rx() does not call
local_bh_disable()/local_bh_enable() while hardware interrupts remain
disabled across usb_gadget_giveback_request(), and local_bh_enable() runs
pending softirqs after spin_unlock_irqrestore() re-enables hardware
interrupts.

Should mtu3_irq() wrap spin_lock_irqsave() and spin_unlock_irqrestore()
with local_bh_disable() and local_bh_enable() instead of using
spin_lock_bh()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-usb-mtu3-g=
adget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com?part=3D1

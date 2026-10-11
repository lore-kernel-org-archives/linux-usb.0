Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885DA175D53
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 07:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791704009; cv=none; b=aKAPZfyyItttWzqNw1qknZDJmeOBLrumewiqKahfxr/lFHnbs3GbwCLYnA6Jl5OoGQE5NnrIv2Tov4VP1ePJ6cliMU7K/4ATOnbkhRJsYx/nZjgQMBs5xY4fu9KGRCKgBCfP3+Dxz89ctz/BEHp6qRzV6Mnf+toaAbuacfBe2bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791704009; c=relaxed/simple;
	bh=CheoF9/AdgVekbXhWoqk2b/EU1tctIhyTUoj6jnOFYI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=q33V8lC7sZc8fAQGq6CjfzDpDlkizj4Z9OZhZfZPBQoNraPQQjwFUVxcVbGrSMtfFepoA4/Eqogr5L2YQ37NvmzWbkY5Nm3FG9lieay3oWbk71BmSowm86q4WfO0IsN0A9QM8ojO0aurFeodR0m//YCafnNKNeAcfD4anbUKUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhu9+dB/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhu9+dB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E328C1F0089B;
	Sun, 11 Oct 2026 07:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791704008;
	bh=Kcy7UoKw8xIqIZGE/j72rix8LozPp2g9ZA4MoZTQWoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jhu9+dB/eC7A8eUWyvYfjvnahhv0e7uR1L5F7Vn5iPXcipL5eO/rI04SmWp/9H0+h
	 IObkBv4sBzFn2yiBVObWIRSzY+iYtMUO2iv54VKH3o/xdoXJI4qKfqNPRc91KVFH4X
	 cMC1YrWBNNk3cyuS6RdmEf/mE/RuduOKyFVl7eSF/o7WYR3CvdIyQI0p3Ax813Z5rv
	 2Zsc7cYBZUWUspDAj9nKDKObsbW2Vo6gXmgAFgHLZb1L/xlcNMSANvARELWgXItQrj
	 QD6NUBn++ZYVev5+TNYnbDLviVAaR2oKndgLGfbeJKzCOe64Wa9m1pA0ldpRgn0WU2
	 UBhHYnTsBEceQ==
Message-ID: <sashiko-outbox-167106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND] usb: octeon-hcd: keep SOF interrupts while a
 periodic pipe is due
Reply-To: sashiko-reviews@lists.linux.dev
To: "Orgad Shaneh" <orgads@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261011072236.2381546-1-orgads@gmail.com>
References: <20261011072236.2381546-1-orgads@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 07:33:27 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: octeon-hcd: periodic pipe starvation due to bypassed due_now =
evaluation
- [High] usb: octeon-hcd: control/bulk split transfers stall with SOF disab=
led
--

commit ba5443b476ec252047a7c43f65661c3131a5d94c
Author: Orgad Shaneh <orgads@gmail.com>

usb: octeon-hcd: keep SOF interrupts while a periodic pipe is due

This commit modifies cvmx_usb_schedule() to track when a periodic pipe is
due but not yet started, setting a due_now flag. This flag is used to keep
SOF interrupts enabled instead of sleeping on an hrtimer, ensuring due pipes
are retried promptly.

Link: https://lore.kernel.org/all/20260915081724.25637-1-orgads@gmail.com/

> diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
> index 256e459ff6d8d..197e04317a264 100644
> --- a/drivers/usb/host/octeon-hcd.c
> +++ b/drivers/usb/host/octeon-hcd.c
> @@ -1964,12 +1965,23 @@ static void cvmx_usb_schedule(struct octeon_hcd *=
usb, int is_sof)
>  	 */
>  	need_sof =3D 0;
>  	min_due =3D ~0ull;
> +	due_now =3D false;
>  	for (ttype =3D CVMX_USB_TRANSFER_CONTROL;
>  	     ttype <=3D CVMX_USB_TRANSFER_INTERRUPT; ttype++) {
>  		list_for_each_entry(pipe, &usb->active_pipes[ttype], node) {
> -			if (pipe->next_tx_frame > usb->frame_number &&
> -			    pipe->next_tx_frame < min_due)
> +			if (pipe->next_tx_frame <=3D usb->frame_number) {
> +				/*
> +				 * A periodic pipe that is due but was not
> +				 * started - no idle channel, or its split
> +				 * window is closed - is only retried from a
> +				 * SOF, so do not sleep past it.
> +				 */
> +				if (ttype =3D=3D CVMX_USB_TRANSFER_ISOCHRONOUS ||
> +				    ttype =3D=3D CVMX_USB_TRANSFER_INTERRUPT)
> +					due_now =3D true;

[Severity: High]
Can this explicit exclusion of control and bulk pipes cause SPLIT COMPLETE
transactions to stall indefinitely if SOF interrupts are disabled?

If a low/full-speed device is connected via a high-speed hub using split
transactions, a control or bulk transfer initiates a START SPLIT and
completes with an ACK. The hardware channel is disabled and the transaction
advances to CVMX_USB_STAGE_NON_CONTROL_SPLIT_COMPLETE, but its
next_tx_frame is not advanced.

The pipe must wait until usb->frame_number reaches split_sc_frame:

cvmx_usb_find_ready_pipe() {
    ...
    ((pipe->split_sc_frame =3D=3D -1) ||
     ((((int)current_frame - pipe->split_sc_frame) & 0x7f) < 0x40)) &&
    ...
}

Since control and bulk pipes skip setting due_now and their next_tx_frame
remains in the past (so they don't update min_due), need_sof will be 0 if
no other periodic pipes are active. Does this mean usb->frame_number stops
updating, permanently stalling the pipe until an unrelated interrupt fires?

> +			} else if (pipe->next_tx_frame < min_due) {
>  				min_due =3D pipe->next_tx_frame;
> +			}
>  		}
>  	}
>  	if (min_due !=3D ~0ull) {

[Severity: High]
Will the due_now flag be completely ignored if there are only due pipes
and no future periodic deadlines exist?

In the loop above, if a pipe is due (pipe->next_tx_frame <=3D usb->frame_nu=
mber),
due_now is set to true but min_due is not updated.

If there are no other active periodic pipes with a future deadline, min_due
remains ~0ull. The code then completely bypasses this entire if
(min_due !=3D ~0ull) block.

As a result, need_sof remains 0 and the timer is not armed. Since periodic
pipes are only retried when is_sof is true, does this result in a permanent
starvation of the unstarted due periodic pipes?

> @@ -1983,7 +1995,7 @@ static void cvmx_usb_schedule(struct octeon_hcd *us=
b, int is_sof)
>  		 * a few frames. Stay well below the 16383-frame wrap of
>  		 * HFNUM. One (micro)frame is 125us in high-speed mode.
>  		 */
> -		if (delta <=3D 4 || delta > 8000)
> +		if (due_now || delta <=3D 4 || delta > 8000)
>  			need_sof =3D 1;
>  		else
>  			hrtimer_start(&usb->sof_timer,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011072236.2381=
546-1-orgads@gmail.com?part=3D1

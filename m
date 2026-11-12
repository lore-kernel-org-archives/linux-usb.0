Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484337;
	b=dEzvkmXYC5acqSAhcLv73npVcvxFz5pDjAW1hPzt+wz9gGbXfJ/jXVaRHfz+iblvBajJ
	 /zRU2DZchjHP9PgoM5xaEJqCeaDfBtxYmmxXCZFEyxGxbSpYwFnfNxHlcXs05p689fLOH
	 JHa5/bJ1c7dUKW34V7I+YDkqc49/zO8WGp1ptbBsPj0FU/YgJAfq1RUsgrT1SlQw1jjDW
	 TJhMOOhap5FGMalbfl8x+7dSBdtETfJcDNtbHTcN+VaSEBq9oToVmWzEd1Dpi+vvvWUTk
	 rzyRgyuxKOmZ4J6AnJihqv16mb8aKulGu6d2KVybpEZIID1H9mUWPlNSGwYBmNZIMwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484337;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9XV8FpYGHkuN9kU8E15MIyniAdGSXn2wb1dKFaXSQJU=;
	b=mttBWF4+xao1kM0wjI199rvc85zczkIa5uloQcyw3AHtFIzDzJujX1xhK1h9BPab3H1n
	 R4euZv23TqDCvv53Bc+Gj6QB2NRxOKcAcPufFoyZ5EZinNgAgLdl7SsWX7gp382pITpPp
	 TS95+ERzrUAi+d5MpIu7MqqEBA97D6iHC0I6/urLVYQqIuD4rN0WsC01DFxx/x+SuGWHP
	 idH6tXUsG/cSRd6A+tkwonT7E/wL6anfOQ+9fVgdzNGfSuDklqCxxUY7OY9/sWU342lxj
	 BTbzBa7n0LjRpu9DPw3IR+e8dnEeoFQyM4Zj0klbFZrrtKK/k+cn22BjneC+7rsbF8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngd0tz8d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B7606A321
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ngd0tz8d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0211F00A05;
	Thu, 12 Nov 2026 11:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484337;
	bh=9XV8FpYGHkuN9kU8E15MIyniAdGSXn2wb1dKFaXSQJU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngd0tz8d4JQNYyHTdYUphRyEtVJT6Bv83zq0ywiu4TVtjRFaZcXPV0rz+ziTSdto2
	 H3KmZabAFcBjAbCOGyvMjOREfqktcAmR74+hBYEYmdsBC09T6jdcWSuoMMbMSq7rsD
	 hNYDUOfscQ/xQMhHhBHsro2pqDTsBy60PUaqUNURgTBZ9llmZeGs4FM8Vtmba0OSAj
	 RAjUS74mhIVVHrkZupRssfutQAYwa5MdxPFCmvOXJii0cTHRQ8za+TpSkFpXbR16re
	 tQCuw8LhTBePT8aJAmkJYThG2X9k7884WAcKse23FDDJ9/KmYgVEAqWazS03F9t4dY
	 QdYcHNRVq/lfA==
Message-ID: <sashiko-outbox-211049@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacob Procee" <sn125164@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112113005.16418-1-sn125164@gmail.com>
References: <20261112113005.16418-1-sn125164@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:52:16 +0000
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
- [Medium] usb: typec: tipd: inconsistent workqueues for update_work in
  cd321x_resume()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] usb: typec: tps6598x: I2C read before reset deassertion in
  tps6598x_resume() [1]
--

commit 3f767c8b869e9b28074b970a42e30b2e13b93a10
Author: Jacob Procee <sn125164@gmail.com>

usb: typec: tipd: cd321x: replay the plug on resume

This commit adds a resume callback for CD321x that marks the plug status as
changed and queues update_work on system_freezable_wq when a partner is
connected.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 02539378ffeda..2ec3801245329 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c

[ ... ]

> @@ -911,6 +912,21 @@ static int cd321x_connect(struct tps6598x *tps, u32 =
status)
>  	return 0;
>  }
> =20
> +static void cd321x_resume(struct tps6598x *tps)
> +{
> +	struct cd321x *cd321x =3D container_of(tps, struct cd321x, tps);
> +
> +	guard(mutex)(&tps->lock);
> +
> +	if (IS_ERR_OR_NULL(tps->partner))
> +		return;
> +
> +	cd321x->update_status.status_changed |=3D TPS_STATUS_PLUG_PRESENT;
> +	cancel_delayed_work(&cd321x->update_work);
> +	queue_delayed_work(system_freezable_wq, &cd321x->update_work,
> +			   msecs_to_jiffies(CD321X_DEBOUNCE_DELAY_MS));
> +}
> +
>  static irqreturn_t cd321x_interrupt(int irq, void *data)
>  {
>  	struct tps6598x *tps =3D data;

[Severity: Medium]
Can cd321x->update_work still run before all devices have resumed because
cd321x_connect() queues it on system_percpu_wq via schedule_delayed_work()?

CPU0                              CPU1 (system_percpu_wq)
tps6598x_resume()
  cd321x_resume()
    guard(mutex)(&tps->lock)
    status_changed |=3D ...
    cancel_delayed_work(...)
                                  cd321x_update_work()
                                    guard(mutex)(&tps->lock)
    queue_delayed_work(
      system_freezable_wq, ...)
  /* unlocks tps->lock */
                                    st =3D cd321x->update_status;
                                    status_changed =3D 0;  <-- runs before =
thaw

Because system_percpu_wq is not frozen during suspend and tps6598x_suspend()
does not cancel cd321x->update_work, an in-flight worker from
cd321x_connect() can already be waiting on tps->lock while cd321x_resume()
runs.  cancel_delayed_work() then returns false, and once cd321x_resume()
releases tps->lock, the system_percpu_wq worker consumes
TPS_STATUS_PLUG_PRESENT, clears status_changed, and runs the replug sequence
before devices have finished resuming, leaving the later system_freezable_wq
run with status_changed =3D=3D 0.

In addition, device IRQs are already enabled when cd321x_resume() runs, so a
subsequent cd321x_interrupt() -> cd321x_connect() will cancel the work on
system_freezable_wq and re-queue it on the unfrozen system_percpu_wq.
Queueing the same work_struct on two different workqueues also breaks
workqueue non-reentrancy in __queue_work() across CPUs.

Should cd321x_connect() queue cd321x->update_work on system_freezable_wq as
well?

> @@ -2014,6 +2030,9 @@ static int __maybe_unused tps6598x_resume(struct de=
vice *dev)
>  		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
>  				   msecs_to_jiffies(POLL_INTERVAL));
> =20
> +	if (tps->data->resume)
> +		tps->data->resume(tps);
> +
>  	return 0;
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can tps6598x_resume()
leave the controller permanently held in hardware reset [1]?

When tps->reset is configured and tps->wakeup is false, tps6598x_suspend()
asserts the reset GPIO, but tps6598x_resume() performs an I2C read via
tps6598x_check_mode() before deasserting tps->reset:

drivers/usb/typec/tipd/core.c:tps6598x_resume() {
	...
	ret =3D tps6598x_check_mode(tps);
	if (ret < 0)
		return ret;
	...
	if (tps->wakeup) {
		disable_irq_wake(client->irq);
		enable_irq(client->irq);
	} else if (tps->reset) {
		gpiod_set_value_cansleep(tps->reset, 0);
		msleep(TPS_SETUP_MS);
	}
	...
}

Because the controller is still held in reset, tps6598x_check_mode() fails
over I2C and returns early before gpiod_set_value_cansleep(tps->reset, 0)
can release the reset line, leaving the device disabled.

[1] https://sashiko.dev/#/bug/linux-4e731139-ebc0-453a-8f82-785e6a0e3cdc

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112113005.1641=
8-1-sn125164@gmail.com?part=3D1

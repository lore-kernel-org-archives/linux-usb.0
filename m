Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544749;
	b=BaAQI9LqC28vCi+IHqks/gTCoxuILnG/W0xU2P2OPS1bZl7b4up2TDtxIgI2unNIuGQ0
	 L2Flf0y+fB1ZOMiXXsxJsp8IhuB4s1q9h1nYLp3Dk/rq7y85eaL4eCbI7y/i0UfRbgyQs
	 LQ3FDZ4EK9T3obfaOPzrptzfETskPE1yAz9miP9+oC3gRMg8hnv/Tjn/TmPmC5GaHsI5A
	 fHm68aafEce6HFhOXojeFfWD5YEf9y2Oad3WgKiRg3JFT+TyDAJU+iN1gV49PLBPDwiNT
	 ivkZEF2NShuyRCZjNdh7fJg6v3FO7B739jP8z/NrZtgbkUv158elUWn2f9ov3Tv1q7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544749;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WscpVR3z+qRf0LNYkBAdxpxDqTcLLq7IKGvaG6IvztE=;
	b=XnFOHASY0NnxkC4vNfCBpMz+sjy83jhsHx1HjbTkSOWNh9ykQV5X9YI4K/awDtD4f/n7
	 2WE2KRGmrKuenD5Pu8wKuS1syX4tSt4X6N2Vbpii+wz5omFjXIIN/XSF1vgObwnZpoZ5u
	 n7VdG/OvkacTEL8RgGFtdfE1qQS4aDGbYzwEIC3rnXOgrzz0Q3F/sSYcDflJdgT6ApnUS
	 sBBaXIq+q8RofbDP5HVTYb0g79xoTETlMXP3OSDsqY/vx3d2ijuotm0ysJmcW5H0Duxm+
	 cJO5UtGH8ozWVWoY3UIK5pTIWZ6UyJeuvh9ftzIzpJbmhFafBmpfEctsytbYubnInqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcWCbCzw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266D5606A31C
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 01:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KcWCbCzw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB4E1F000C9;
	Wed, 21 Oct 2026 01:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544748;
	bh=WscpVR3z+qRf0LNYkBAdxpxDqTcLLq7IKGvaG6IvztE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KcWCbCzwpfBb57yolhheXRnL6294NB/TBzGiXgQDhEzJzI67i8t+hW6Q3ofiOGIuu
	 23O2BXDqI7P+y5JlmV/x7eJcK0cT1XEJ2g0lmcG0SFylYrM2nstOAJqpGZmBbbNLbc
	 cLATcnA47KpU+QwVRrgPxevBAs/FbZEImbqPVuX1IhHsVNq0f4Rb71N+SjHho7W/8j
	 ecvcR405D6eg+tSIgztuItZfLS5ThEJE1F3EqzAtRsPgehDPCMgNm5lKxarbX6dql+
	 beqksDi4IZ427FJEW5rl3kGho05A7KcJnBreO+wivsYeYgKdFzZpa4TgCTHus2bBHV
	 bImmq6zmPc/oQ==
Message-ID: <sashiko-outbox-179659@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] usb: dwc3: gadget: Recover from End Transfer
 timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <7523e9a11303a33acd0b92a092fb0e8218d509d2.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
 <7523e9a11303a33acd0b92a092fb0e8218d509d2.1792542945.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 01:05:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] usb: dwc3: gadget: __dwc3_stop_active_transfer() re-arms work =
on exit
- [High] usb: dwc3: dwc3_err_recovery_work() skips reset on soft_disconnect=
() timeout
- [High] usb: dwc3: gadget: race between dwc3_err_recovery_work() and suspe=
nd
- [High] usb: dwc3: gadget: race between dwc3_err_recovery_work() and threa=
ded IRQ
- [Medium] usb: dwc3: gadget: __dwc3_gadget_start() clears DWC3_EP_ENABLED =
on active eps
--

commit d30e9ae79405a29ae6e289723c7c0106f74fcf1a
Author: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

usb: dwc3: gadget: Recover from End Transfer timeout

This commit schedules controller error recovery via
dwc3_schedule_err_recovery() when an End Transfer command times out in
__dwc3_stop_active_transfer().

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index a8f12e583a0f4..a76f669a796c2 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
[ ... ]
> @@ -1818,6 +1820,9 @@ static int __dwc3_stop_active_transfer(struct dwc3_=
ep *dep, bool force, bool int
>  		dev_err_ratelimited(dep->dwc->dev,
>  				"end transfer failed: %d\n", ret);
> =20
> +	if (ret =3D=3D -ETIMEDOUT && dep->dwc->err_state =3D=3D DWC3_ERR_NONE)
> +		dwc3_schedule_err_recovery(dep->dwc);
> +
>  	dep->resource_index =3D 0;
> =20
>  	if (!interrupt || (ret && ret !=3D -ETIMEDOUT))

[Severity: Critical]
Can __dwc3_stop_active_transfer() re-schedule dwc->err_recovery_work during
teardown after cancel_work_sync() has already run in dwc3_gadget_exit()?

In drivers/usb/dwc3/gadget.c, dwc3_gadget_exit() cancels err_recovery_work
and destroys connect_mutex before tearing down the gadget and freeing
endpoints:

	cancel_work_sync(&dwc->err_recovery_work);
	mutex_destroy(&dwc->connect_mutex);
	dwc3_enable_susphy(dwc, true);
	usb_del_gadget(dwc->gadget);
	dwc3_gadget_free_endpoints(dwc);

Between cancel_work_sync() and the completion of usb_del_gadget() and
dwc3_gadget_free_endpoints(), __dwc3_stop_active_transfer() can still be
called with interrupt set to true and time out in dwc3_send_gadget_ep_cmd():

- usb_del_gadget() -> gadget_unbind_driver() invokes the gadget driver
  unbind callback, which calls usb_ep_disable() -> dwc3_gadget_ep_disable()
  -> __dwc3_gadget_ep_disable() -> dwc3_remove_requests() ->
  dwc3_stop_active_transfer() -> __dwc3_stop_active_transfer().

- Until usb_del_gadget() stops the gadget and frees dwc->irq_gadget,
  dwc3_thread_interrupt() can still invoke __dwc3_stop_active_transfer().

- Until dwc3_gadget_free_endpoints() cancels dep->nostream_work,
  dwc3_nostream_work() can still call dwc3_stop_active_transfer() ->
  __dwc3_stop_active_transfer().

If dwc3_send_gadget_ep_cmd() times out on any of those paths while in the
setup phase, wouldn't __dwc3_stop_active_transfer() re-queue
dwc->err_recovery_work after cancel_work_sync(), causing
dwc3_err_recovery_work() to lock the destroyed dwc->connect_mutex and access
freed dwc->eps[], dwc->gadget, and struct dwc3?

[Severity: High]
When an End Transfer command times out in __dwc3_stop_active_transfer() and
does not complete in hardware, will dwc3_err_recovery_work() actually reach
the soft reset in dwc3_gadget_soft_connect()?

In drivers/usb/dwc3/gadget.c, __dwc3_stop_active_transfer() schedules
dwc3_err_recovery_work() and sets the end transfer pending flag while leavi=
ng
the transfer started flag set:

	if (!interrupt || (ret && ret !=3D -ETIMEDOUT))
		dep->flags &=3D ~DWC3_EP_TRANSFER_STARTED;
	else
		dep->flags |=3D DWC3_EP_END_TRANSFER_PENDING;

When dwc3_err_recovery_work() runs, it calls dwc3_gadget_soft_disconnect()
first and aborts recovery if that fails:

	ret =3D dwc3_gadget_soft_disconnect(dwc);

	dwc3_disconnect_gadget_sleepable(dwc);

	if (ret)
		goto err_unrecoverable;

Inside dwc3_gadget_soft_disconnect() -> dwc3_stop_active_transfers() ->
dwc3_remove_requests() -> dwc3_stop_active_transfer(), the endpoint is
skipped because the end transfer pending flag is set:

	if (!(dep->flags & DWC3_EP_TRANSFER_STARTED) ||
	    (dep->flags & DWC3_EP_END_TRANSFER_PENDING))
		return;

Then dwc3_gadget_soft_disconnect() calls dwc3_gadget_run_stop(dwc, false) to
clear run/stop and poll for the controller halt bit. Because the controller
cannot halt while an active transfer's End Transfer command remains
incomplete in hardware, dwc3_gadget_run_stop() times out as well.

Unlike dwc3_gadget_suspend(), which calls dwc3_gadget_soft_connect() ->
dwc3_core_soft_reset() when dwc3_gadget_soft_disconnect() fails:

	ret =3D dwc3_gadget_soft_disconnect(dwc);
	if (ret && dwc->softconnect) {
		dwc3_gadget_soft_connect(dwc);
		return -EAGAIN;
	}

doesn't dwc3_err_recovery_work() jump straight to err_unrecoverable without
ever resetting the controller?

[Severity: High]
Could scheduling dwc->err_recovery_work from __dwc3_stop_active_transfer()
race with system or runtime suspend and access registers after
dwc3_core_exit() has disabled clocks and asserted reset?

In drivers/usb/dwc3/core.c, dwc3_suspend_common() suspends the gadget and
calls dwc3_core_exit():

	case DWC3_GCTL_PRTCAP_DEVICE:
		if (pm_runtime_suspended(dwc->dev))
			break;
		ret =3D dwc3_gadget_suspend(dwc);
		if (ret)
			return ret;
		synchronize_irq(dwc->irq_gadget);
		dwc3_core_exit(dwc);
		break;

During dwc3_gadget_suspend() -> dwc3_gadget_soft_disconnect() ->
dwc3_stop_active_transfers() -> dwc3_remove_requests() ->
dwc3_stop_active_transfer() -> __dwc3_stop_active_transfer(), an End Transf=
er
timeout will now schedule dwc->err_recovery_work, while
dwc3_stop_active_transfers() ignores the error. Similarly, during
dwc3_gadget_disconnect_interrupt(), dwc->connected is set to false, endpoint
disable in dwc3_disconnect_gadget() can time out in
__dwc3_stop_active_transfer() and schedule dwc->err_recovery_work while
releasing per-request runtime power management references, and
pm_request_idle(dwc->dev) is called.

Since dwc3_suspend_common() does not cancel dwc->err_recovery_work before
dwc3_core_exit(), and dwc3_err_recovery_work() in drivers/usb/dwc3/gadget.c
does not acquire a runtime power management reference before calling
dwc3_gadget_soft_disconnect() and dwc3_gadget_soft_connect(), what prevents
dwc3_err_recovery_work() from accessing controller registers while clocks a=
re
disabled and reset is asserted?

[Severity: High]
How is dwc3_err_recovery_work() synchronized against dwc3_thread_interrupt()
when __dwc3_stop_active_transfer() schedules recovery from inside the
threaded interrupt handler?

Previously, dwc3_schedule_err_recovery() was only called from the hardirq
handler dwc3_check_event_buf() when waking dwc3_thread_interrupt() was
skipped. With this change, __dwc3_stop_active_transfer() can call
dwc3_schedule_err_recovery() from inside dwc3_thread_interrupt() ->
dwc3_process_event_buf(), both directly from endpoint event handlers and
while dwc->lock is dropped for gadget callbacks such as dwc3_reset_gadget(),
dwc3_disconnect_gadget(), or dwc3_ep0_delegate_req() -> usb_ep_disable().

In drivers/usb/dwc3/gadget.c, dwc3_err_recovery_work() executes
dwc3_gadget_soft_disconnect() and dwc3_disconnect_gadget_sleepable() before
calling synchronize_irq(dwc->irq_gadget):

	ret =3D dwc3_gadget_soft_disconnect(dwc);

	dwc3_disconnect_gadget_sleepable(dwc);

	if (ret)
		goto err_unrecoverable;

	if (dwc->softconnect) {
		u32 count;
		synchronize_irq(dwc->irq_gadget);

When dwc3_thread_interrupt() drops dwc->lock (for example in
dwc3_gadget_giveback() or during an in-flight gadget driver callback), can't
dwc3_err_recovery_work() concurrently halt the controller in
dwc3_gadget_soft_disconnect(), invoke the gadget disconnect callback in
dwc3_disconnect_gadget_sleepable(), and then have dwc3_thread_interrupt()
re-acquire dwc->lock and overwrite controller state (such as
dwc3_gadget_reset_interrupt() setting dwc->connected =3D true after
dwc3_reset_gadget())?

[Severity: Medium]
When dwc3_err_recovery_work() or dwc3_gadget_suspend() calls
dwc3_gadget_soft_connect() -> __dwc3_gadget_start() while non-control
endpoints are still enabled in the gadget layer, doesn't clearing the endpo=
int
enabled flag in __dwc3_gadget_start() desynchronize dep->flags from
dep->endpoint.enabled?

In drivers/usb/dwc3/gadget.c, __dwc3_gadget_start() masks dep->flags on all
non-control endpoints:

	for (epnum =3D 2; epnum < dwc->num_eps; epnum++) {
		dep =3D dwc->eps[epnum];
		if (!dep)
			continue;

		dep->flags &=3D (DWC3_EP_TXFIFO_RESIZED |
			       DWC3_EP_RESOURCE_ALLOCATED);
	}

In dwc3_gadget_suspend(), dwc3_gadget_soft_connect() is called on
soft-disconnect failure without calling dwc3_disconnect_gadget_sleepable(),
and in dwc3_err_recovery_work(), dwc3_gadget_soft_connect() runs immediately
after dwc3_disconnect_gadget_sleepable() even if a function driver defers
usb_ep_disable() to a worker thread or userspace. When usb_ep_disable() is
subsequently called while dep->endpoint.enabled is still true, won't
dwc3_gadget_ep_disable() hit dev_WARN_ONCE() and return early without runni=
ng
__dwc3_gadget_ep_disable():

	if (dev_WARN_ONCE(dwc->dev, !(dep->flags & DWC3_EP_ENABLED),
					"%s is already disabled\n",
					dep->name))
		return 0;

leaving endpoint state such as dep->endpoint.desc uncleaned?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792542945.gi=
t.Thinh.Nguyen@synopsys.com?part=3D7

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075931;
	b=kF3X8Qkf13BnSe1HS6SnLnYJHfCOH1leqYNgYpd8ZYKpp6Q8U9rKc2FW1Hyvt7ssHIv/
	 il0CFTHDCCzXivnhka/xEz2aw1PEjM6YS94rzRBgbYAkg56FSKQffac81NoXBY4JpN60x
	 Jp8Pmrd8NG3ubF6W6ZK/cg/jchre63jF0tVA0Y9SNaM2yaH0ttQ1xhbZE68d2wzEuAkUb
	 8jaS/Ny3vMrozkOpKqiuFwKRRJLl5e8Ccu6Ggvg/oUJmePMtk91sJXapq8UPoSvZhnDdj
	 qBZwxXQgZB7bujA//R6drko+WLkZglsPxeC5gzAoF+Ce5Jt41ujesMCeq+fFsuo0E3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075931;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WVvne+OJVqRVAIFW1nMStj1Guz07PVDhAvl2dM7niRI=;
	b=t9D9fgNGXP/KZH3c1mm+R9K2lK+JFtXqpvuqlB+pEMoiiowjA8cTtjozqiHyNBWOzV17
	 i+Q90timNwvpY86+lbplWK4cPXUpPr2LKF4ybFQsqzX87nHmDd4H6nSjywJsdiJR7nC0N
	 l3kwc1uSGWgp5bMx2IIUtQpcwv1P2JWwlqRH6BVRaVqKrW7OtR3QPzeLDATl5gYuuPc07
	 AkS+861vElu9KWqPrIWGO3rMOY9QR1DOajUccJg89EbeQW2rZk+5Ou2WJhZBTLi3sIp41
	 YZbG/UJXQNg1VUI6LJdxTkrXpvcI11IwmoFNP+TS+XoEf5zh53J3EuROzFV48EwRf5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEfqvMJr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E428C606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IEfqvMJr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A401F000C4;
	Thu, 19 Nov 2026 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795075930;
	bh=WVvne+OJVqRVAIFW1nMStj1Guz07PVDhAvl2dM7niRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IEfqvMJrNdRC8KqEx8TdYCHg5dSDbLvq1b9mnWoOJby13Lad4ugZhIkeMTjiBgtdH
	 nEH8PJBBmfoA3fve24k1IxUOc6ZVWhvqFllZMRVf6lDTgStVf7ssSVzhuscPO7zMCW
	 rO7JiEl+3UzMop0FDQaY8fHn7HfamUhNj9dQUyFlN3fwz1Yawz5Qc2houy1x5P2Mv8
	 P48cB5ijadUamB/wF5ewYnynE0ZZk6qqBXbkScdF7XhZPCsH1meQgLXueh/UB9K7Zi
	 6tqno/2aRrZ/YQ3upgm4L1GnKqXsedF2PIlv2WORXHYOJrz0C+RKr/Gf8Qlrvuq9Oq
	 A09IKGfnWKiJw==
Message-ID: <sashiko-outbox-222648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] thunderbolt: cancel the queued control requests on
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119075557.3399335-1-shunsheng1218@gmail.com>
References: <20261119075557.3399335-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:12:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] thunderbolt: stack UAF on completion in tb_cfg_request_sync()
  on cancel race
- [Medium] thunderbolt: leak of tb_cfg_request in
  __tb_xdomain_response() on cancel
- [Medium] thunderbolt: tb_cfg_request_set_error() overwrites completed
  request result
- [Low] thunderbolt: kernel-doc warnings in tb_ctl_submit_enter() and
  structs
- [Low] thunderbolt: missing Fixes trailer for commit d7f781bfdbf4
--

commit 1583cf6e85652051b8456562f0d075e282549f62
Author: Yaohan Li <shunsheng1218@gmail.com>

> thunderbolt: cancel the queued control requests on teardown
>
> tb_domain_remove() stops the control channel but nothing cancels the
> requests still in its queue.  Their completion work is already scheduled
> and the queue itself holds a reference, so tb_ctl_free() releases the
> channel, the rings and the frame pool while that work is still pending.
>
> Splice the queue instead, cancel the work and complete the callback data
> with -ENOTCONN.  The reference the queue held is taken before the request
> becomes unprotected, so a completion that runs in the meantime cannot
> free it under the loop.  The terminal error is published once under a
> small lock, because a request can be canceled by its owner and by the
> teardown at the same time: the value is written before the flag that
> announces it, so a canceler that loses the race never reads a stale
> result.
>
> A synchronous request waits on a completion that it passes as the
> callback data, and a canceled request never runs its callback.  It
> installs that same completion as its cancel hook so the teardown wakes
> it, guarded by a one-shot flag because the owner and the teardown can
> both reach it.
>
> Two windows have to be covered and one counter cannot cover both.  The
> first is the request that has been admitted and queued but has not been
> handed to the TX ring yet: the teardown cancels it, but the submitter
> still dereferences the channel to send it.  The second is the synchronous
> user that keeps using the channel after the send, through the wait, the
> timeout and the cancel, and the teardown can run in between.  Every user
> is therefore registered on the channel with two counters, both taken
> under request_queue_lock - the lock tb_ctl_stop() uses to clear @running,
> so no user can appear once the channel has been stopped.  @submitting
> covers the first window, and the rings are not stopped before it drops to
> zero; @sync_users covers the second, and tb_ctl_cancel_requests() waits
> for it before the channel may be freed.
>
> tb_domain_add() calls tb_ctl_cancel_requests() on its error path as
> well: a failing driver_ready() or start() leaves requests behind and that
> domain is released without tb_domain_remove().
>
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

[Severity: Low]
This fixes a teardown use-after-free when queued requests are left in
ctl->request_queue.  Should this include:

  Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reli=
able")

> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index 965988b18608f..58d0c68510131 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c

[ ... ]

> @@ -546,12 +554,76 @@ static void tb_cfg_request_work(struct work_struct =
*work)
>   *
>   * Return: %0 on success, negative errno otherwise.
>   */
> +/*
> + * Admission for everything that uses the channel.  tb_ctl_stop() clears
> + * @running under @request_queue_lock, so taking the same lock here is w=
hat
> + * makes the waits below complete: once the channel has been stopped no =
new
> + * user can appear.
> + *
> + * @submitting covers a request from the moment it is admitted until it =
has
> + * been handed to the TX ring.  Such a request is already queued, so the
> + * teardown cancels it, but it still dereferences @ctl in tb_ctl_tx() an=
d the
> + * rings must not be stopped under it.
> + *
> + * @sync_users covers the longer window of a synchronous request, which =
keeps
> + * using @ctl after the send has completed: it waits, possibly times out=
 and
> + * then cancels the request.
> + */
> +static int tb_ctl_submit_enter(struct tb_ctl *ctl)

[Severity: Low]
Inserting tb_ctl_submit_enter() and the other static helpers here separates
the tb_cfg_request() kernel-doc block above from tb_cfg_request(), causing
scripts/kernel-doc warnings on W=3D1 builds.

[ ... ]

> +/*
> + * If @callback did not get a chance to run then the owner of
> + * @callback_data did not get a chance to release it either.  The hook r=
uns
> + * at most once: a request can be canceled by its owner and by
> + * tb_ctl_cancel_requests() and the data it releases (or the completion =
it
> + * wakes) must not be touched twice.
> + */
> +static void tb_cfg_request_release_callback_data(struct tb_cfg_request *=
req)
> +{
> +	if (req->cancel && !test_bit(TB_CFG_REQUEST_COMPLETED, &req->flags) &&
> +	    !test_and_set_bit(TB_CFG_REQUEST_CANCEL_HANDLED, &req->flags))
> +		req->cancel(req->callback_data);
> +}
> +
> +/*
> + * The terminal error is published once.  A request can be canceled by i=
ts
> + * owner after a timeout and by tb_ctl_cancel_requests() at the same tim=
e;
> + * the error is written before the flag that announces it, both under
> + * @result_lock, so a canceler that loses the race never observes the fl=
ag
> + * before the value it guards.
> + */
> +static void tb_cfg_request_set_error(struct tb_cfg_request *req, int err)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&req->result_lock, flags);
> +	if (!test_bit(TB_CFG_REQUEST_ERROR_SET, &req->flags)) {
> +		req->result.err =3D err;
> +		set_bit(TB_CFG_REQUEST_ERROR_SET, &req->flags);
> +	}
> +	spin_unlock_irqrestore(&req->result_lock, flags);
> +}

[Severity: Medium]
Can tb_cfg_request_set_error() overwrite req->result.err on a request that
has already completed?

Normal completion in req->copy() sets req->result without setting
TB_CFG_REQUEST_ERROR_SET, and tb_cfg_request_work() runs req->callback()
before tb_cfg_request_dequeue() takes ctl->request_queue_lock.  If
tb_ctl_cancel_requests() splices ctl->request_queue in that window, both
sides race after tb_cfg_request_work() finishes:

CPU0                                  CPU1
tb_cfg_request_work()
  req->callback(&done)
    complete(&done)
  set_bit(TB_CFG_REQUEST_COMPLETED)
                                      tb_ctl_cancel_requests()
                                        lock(&ctl->request_queue_lock)
                                        /* splices req onto requests */
                                        unlock(&ctl->request_queue_lock)
  tb_cfg_request_dequeue(req)
                                        cancel_work_sync(&req->work)
                                        tb_cfg_request_set_error(req,
                                                                 -ENOTCONN)
                                          req->result.err =3D -ENOTCONN
tb_cfg_request_sync()
  flush_work(&req->work)
  res =3D req->result  <-- data race / false -ENOTCONN

Unlike tb_cfg_request_release_callback_data(), tb_cfg_request_set_error()
does not check TB_CFG_REQUEST_COMPLETED.

[ ... ]

> @@ -621,18 +729,41 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_=
ctl *ctl,
>  	DECLARE_COMPLETION_ONSTACK(done);
>  	int ret;
> =20
> -	ret =3D tb_cfg_request(ctl, req, tb_cfg_request_complete, &done);
> +	/*
> +	 * A user that times out goes on to call tb_cfg_request_cancel(), which
> +	 * dereferences @ctl.  Register so that the channel is not freed under
> +	 * it.
> +	 */
> +	ret =3D tb_ctl_sync_enter(ctl);
>  	if (ret) {
>  		res.err =3D ret;
>  		return res;
>  	}
> =20
> +	/*
> +	 * A synchronous request is completed by its callback, so the same
> +	 * function serves as the cancel hook: a teardown that cancels the
> +	 * request then wakes the waiter instead of leaving it to its timeout
> +	 * with the control channel already gone.
> +	 */
> +	req->cancel =3D tb_cfg_request_complete;
> +
> +	ret =3D tb_cfg_request(ctl, req, tb_cfg_request_complete, &done);
> +	if (ret) {
> +		res.err =3D ret;
> +		goto out;
> +	}
> +
>  	if (!wait_for_completion_timeout(&done, timeout))
>  		tb_cfg_request_cancel(req, -ETIMEDOUT);
> =20
>  	flush_work(&req->work);
> =20
> -	return req->result;
> +	res =3D req->result;
> +out:
> +	tb_ctl_sync_exit(ctl);
> +
> +	return res;
>  }

[Severity: High]
Can tb_ctl_cancel_requests() call complete(&done) after
tb_cfg_request_sync() has already timed out and returned?

test_and_set_bit(TB_CFG_REQUEST_CANCEL_HANDLED, &req->flags) in
tb_cfg_request_release_callback_data() ensures req->cancel() is entered only
once, but the losing caller returns immediately without waiting for the
winning caller to finish req->cancel(req->callback_data):

CPU0                                  CPU1
tb_cfg_request_sync()                 tb_ctl_cancel_requests()
  wait_for_completion_timeout(&done)
  /* times out */
                                        tb_cfg_request_release_callback_dat=
a()
                                          !test_and_set_bit(...CANCEL_HANDL=
ED)
                                          /* wins */
  tb_cfg_request_cancel(req, ...)
    tb_cfg_request_release_callback_data()
      !test_and_set_bit(...CANCEL_HANDLED)
      /* loses, returns immediately */
  flush_work(&req->work)
  tb_ctl_sync_exit(ctl)
  return res;  /* pops done */
                                          req->cancel(&done)
                                            complete(&done)
                                              <-- stack use-after-free

flush_work(&req->work) does not serialize against req->cancel() because
tb_ctl_cancel_requests() calls tb_cfg_request_release_callback_data()
directly, and wait_event(ctl->idle_wait, !READ_ONCE(ctl->sync_users)) in
tb_ctl_cancel_requests() runs only after the cancellation loop finishes.

> diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
> index db1646eb4fd0b..8ebfdef35f2f4 100644
> --- a/drivers/thunderbolt/ctl.h
> +++ b/drivers/thunderbolt/ctl.h

[ ... ]

> @@ -89,6 +92,9 @@ struct tb_cfg_request {
>  	bool (*copy)(struct tb_cfg_request *req, const struct ctl_pkg *pkg);
>  	void (*callback)(void *callback_data);
>  	void *callback_data;
> +	void (*cancel)(void *callback_data);
> +	/* serializes the publication of the terminal error */
> +	spinlock_t result_lock;
>  	unsigned long flags;
>  	struct work_struct work;
>  	struct tb_cfg_result result;

[Severity: Low]
struct tb_cfg_request has a kernel-doc comment above it, but @result_lock is
not documented there (and @stopped is similarly missing from struct icm's
kernel-doc comment in drivers/thunderbolt/icm.c).

> diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> index a295a5e6cc9cb..1e6ab9ca55f43 100644
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c

[ ... ]

> @@ -2280,6 +2297,7 @@ static int icm_usb4_switch_nvm_authenticate(struct =
tb *tb, u64 route)
> =20
>  	req->match =3D icm_match;
>  	req->copy =3D icm_copy;
> +	req->cancel =3D icm_usb4_switch_nvm_auth_cancel;
>  	req->request =3D &auth->request;
>  	req->request_size =3D sizeof(auth->request);
>  	req->request_type =3D TB_CFG_PKG_ICM_CMD;

[Severity: Medium]
Does __tb_xdomain_response() need a req->cancel hook as well so its
struct tb_cfg_request is not leaked when canceled on teardown?

In drivers/thunderbolt/xdomain.c, __tb_xdomain_response() transfers its
initial req reference to response_ready() once tb_cfg_request() succeeds:

drivers/thunderbolt/xdomain.c:__tb_xdomain_response() {
	...
	ret =3D tb_cfg_request(ctl, req, response_ready, req);
	if (ret)
		tb_cfg_request_put(req);

	return ret;
}

Because req->response is NULL, tb_cfg_request() enqueues req (taking a
second reference for ctl->request_queue) and schedules req->work.  If
tb_ctl_cancel_requests() runs before tb_cfg_request_work() executes,
cancel_work_sync(&req->work) prevents response_ready() from running and
tb_ctl_cancel_requests() drops only the queue's reference, leaking req with
kref =3D=3D 1 unless req->cancel =3D response_ready is also set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119075557.3399=
335-1-shunsheng1218@gmail.com?part=3D1

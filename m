Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088634;
	b=vSJyUEPU5JXnlK4zxzGk6mV6sB6Z58gmatF66+c9ejvFsulTBdBDo8gXmhQEgncp92e8
	 ol/R6ydyuufP31qmWiNIA38qhn++7+Y++i9Dtv6spN3okxkxuRNZ8XDOrCHIx40l129+c
	 l9lfp3uOqdnFKpB3k7wO5XAqrJEs9pavt412fzKe2umXgRSCFYoMuGV4p4LGc0vju785J
	 Xf4kewfs7gudcSh3WbUMuSreCu1Sjko6g/CQOFL3rIqnMZzryXY/W0uAL6UHUiez22LW/
	 uNNXOQCipud7/ptKuiYt1SEKRt+zV33dx9hhb+aVCN/3zGRQZ2VAMrAN8lYPJc69mAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088634;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aMYB4c/xjWcdBiIqxSHcSvE31eNAyfhvdHcLvs1p04Y=;
	b=dU1uxG92hjEBBkcsWXMWIoWz4xSSMI6x4W75x7JU84nrhwSt8UYtqmdVz4EfZ1tbURQ/
	 YNzA0I/8VBheJH6tIQ84O9+292zqpFcpegXKLu3fsudDgkawDKLvgn3q8ffYurRxPxnJC
	 mjEoTFSce12KRFf+59X1c0OtXeWmY3JRVytwkLG1HW7kOkWlNm5rvOUQ4cI1eQJdAs0I/
	 2dANkadfWFgUAXHt5S5wjoNTvXZSIoz3Jkx0NDYKJaoSMiyNgexhpDJLVlWSy9fIHEYOb
	 OuJm2qXE+EJqebmbhhlVw467rpej+LQHYFCeI4DRF0O/O/DlBSGhnbFRomt7c+Kj/ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5qqCMwh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF4606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O5qqCMwh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690FD1F000C4;
	Thu, 19 Nov 2026 11:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795088633;
	bh=aMYB4c/xjWcdBiIqxSHcSvE31eNAyfhvdHcLvs1p04Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5qqCMwhqPPnf0+7SbqUB3Jg6AX9XY9/9Myhbe2pyOpyZuBk2Y8DXVQU4laDRszB2
	 Iwe64/NrWHmpyxCThrhMNuwQBUPt+vvI+aqJWBNPIjAgpmR0TIPHh5VvBPVU5UTXhJ
	 +QErS+29EY8xZZDC9z5I4zr1A+sE4p5TaOAzr3z47Wk7jRg/bs8PwcNJYnSfEHMQTI
	 +xwpUnHvzZHh7771NRY8gLxMOWLoVsyxKJ8CR0JA05cb+VReeO4V73097Xt34NGNlM
	 aLFRIi8sa8y40UlqjcgmqYtbrwdw/5NLPh6pzrdn1xNYdvrGBijFWThSpr7pZp+6JT
	 6FaKN3W08K/og==
Message-ID: <sashiko-outbox-223054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v2] thunderbolt: cancel the queued control requests
 on teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yaohan Li" <shunsheng1218@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119111907.3616041-1-shunsheng1218@gmail.com>
References: <20261119075557.3399335-1-shunsheng1218@gmail.com>
 <20261119111907.3616041-1-shunsheng1218@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:43:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] thunderbolt: use-after-free race in tb_ctl_sync_exit() and
  tb_ctl_submit_exit()
- [Medium] thunderbolt: timeout race in tb_cfg_request_sync() bypasses
  sync_users drain
- [Medium] thunderbolt: unhandled -ENOTCONN in tb_cfg_read() and
  tb_cfg_write() hits WARN
- [Medium] thunderbolt: spurious dev_WARN and unlocked queue check in
  tb_ctl_stop()
--

commit 7ad987d4a0cdf2650a891259a5534997151f16c9
Author: Yaohan Li <shunsheng1218@gmail.com>

thunderbolt: cancel the queued control requests on teardown

This commit adds tb_ctl_cancel_requests() and request tracking counters to
cancel queued control requests and wait for active submitters and
synchronous users before freeing the control channel on teardown.

> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index 965988b18608f..5ff0e04b8265c 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c

[ ... ]

> @@ -528,12 +534,73 @@ static void tb_cfg_request_work(struct work_struct =
*work)
>  	tb_cfg_request_dequeue(req);
>  }
> =20
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
> +{
> +	int ret =3D 0;
> +
> +	mutex_lock(&ctl->request_queue_lock);
> +	if (ctl->running)
> +		ctl->submitting++;
> +	else
> +		ret =3D -ENOTCONN;
> +	mutex_unlock(&ctl->request_queue_lock);
> +
> +	return ret;
> +}
> +
> +static void tb_ctl_submit_exit(struct tb_ctl *ctl)
> +{
> +	mutex_lock(&ctl->request_queue_lock);
> +	ctl->submitting--;
> +	wake_up_all(&ctl->idle_wait);
> +	mutex_unlock(&ctl->request_queue_lock);
> +}
> +
> +static int tb_ctl_sync_enter(struct tb_ctl *ctl)
> +{
> +	int ret =3D 0;
> +
> +	mutex_lock(&ctl->request_queue_lock);
> +	if (ctl->running)
> +		ctl->sync_users++;
> +	else
> +		ret =3D -ENOTCONN;
> +	mutex_unlock(&ctl->request_queue_lock);
> +
> +	return ret;
> +}
> +
> +static void tb_ctl_sync_exit(struct tb_ctl *ctl)
> +{
> +	mutex_lock(&ctl->request_queue_lock);
> +	ctl->sync_users--;
> +	wake_up_all(&ctl->idle_wait);
> +	mutex_unlock(&ctl->request_queue_lock);
> +}

[Severity: Medium]
Can tb_ctl_sync_exit() and tb_ctl_submit_exit() touch ctl after it has
been freed?

wait_event() in tb_ctl_cancel_requests() (and tb_ctl_stop()) tests
!READ_ONCE(ctl->sync_users) without taking ctl->request_queue_lock, and
neither tb_ctl_cancel_requests() nor tb_ctl_free() acquires
ctl->request_queue_lock afterwards:

CPU0                                  CPU1
tb_ctl_sync_exit(ctl)
  mutex_lock(&ctl->request_queue_lock)
  ctl->sync_users--; // becomes 0
                                      tb_ctl_cancel_requests(ctl)
                                        wait_event(..., !ctl->sync_users)
                                      ...
                                      tb_ctl_free(ctl)
                                        kfree(ctl)
  wake_up_all(&ctl->idle_wait)
  mutex_unlock(&ctl->request_queue_lock)  <-- use-after-free

Acquiring and releasing ctl->request_queue_lock after wait_event() in
tb_ctl_stop() and tb_ctl_cancel_requests() would ensure the exiting thread
has finished unlocking before teardown proceeds.

[ ... ]

> @@ -621,18 +742,50 @@ struct tb_cfg_result tb_cfg_request_sync(struct tb_=
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
> +	/*
> +	 * A teardown can cancel the request on another thread and run the
> +	 * hook above while this one is already returning.  Taking the same
> +	 * lock waits for that invocation, and clearing the hook keeps it away
> +	 * from @done once this function returns.
> +	 */
> +	mutex_lock(&req->cancel_lock);
> +	res =3D req->result;
> +	req->cancel =3D NULL;
> +	mutex_unlock(&req->cancel_lock);
> +out:
> +	tb_ctl_sync_exit(ctl);
> +
> +	return res;
>  }

[Severity: Medium]
Can a timeout racing with teardown let callers of tb_cfg_request_sync()
dereference ctl after ctl->sync_users has already dropped to zero?

CPU0                                  CPU1
tb_cfg_read()
  tb_cfg_read_raw()
    tb_cfg_request_sync(ctl, ...)
      wait_for_completion_timeout()
                                      tb_ctl_stop(ctl)
                                        ctl->running =3D false
      tb_cfg_request_cancel(..., -ETIMEDOUT)
        tb_cfg_request_set_error(..., -ETIMEDOUT)
                                      tb_ctl_cancel_requests(ctl)
                                        tb_cfg_request_finish_cancel(..., -=
ENOTCONN)
      tb_ctl_sync_exit(ctl)
        ctl->sync_users--; // 0
                                        wait_event(..., !ctl->sync_users)
                                      ...
                                      tb_ctl_free(ctl)
                                        kfree(ctl)
    usleep_range(10, 100)
    tb_cfg_request_sync(ctl, ...)  <-- use-after-free

Because tb_cfg_request_set_error() keeps the first error written,
req->result.err stays -ETIMEDOUT even though ctl->running is already
false.  Once tb_ctl_sync_exit() drops ctl->sync_users to 0,
tb_ctl_cancel_requests() finishes while tb_cfg_read_raw() (or
tb_cfg_write_raw() / icm_request()) sleeps in its retry loop and then
dereferences ctl again in tb_cfg_request_sync() and tb_ctl_warn().

> @@ -753,15 +910,73 @@ void tb_ctl_stop(struct tb_ctl *ctl)
>  	ctl->running =3D false;
>  	mutex_unlock(&ctl->request_queue_lock);
> =20
> +	/*
> +	 * A request that passed the admission check is between the queue and
> +	 * the TX ring and still hands its packet to the ring, so wait for it
> +	 * before the rings are stopped.
> +	 */
> +	wait_event(ctl->idle_wait, !READ_ONCE(ctl->submitting));
> +
>  	tb_ring_stop(ctl->rx);
>  	tb_ring_stop(ctl->tx);
> =20
>  	if (!list_empty(&ctl->request_queue))
>  		tb_ctl_WARN(ctl, "dangling request in request_queue\n");
> -	INIT_LIST_HEAD(&ctl->request_queue);
>  	tb_ctl_dbg(ctl, "control channel stopped\n");
>  }

[Severity: Medium]
Does tb_ctl_stop() now trigger a dev_WARN backtrace whenever a request is
left in ctl->request_queue for tb_ctl_cancel_requests() to cancel?

tb_domain_add() and tb_domain_remove() call tb_ctl_stop() before
tb_ctl_cancel_requests(), so any request still queued at teardown hits
tb_ctl_WARN() here before tb_ctl_cancel_requests() can run.  In addition,
list_empty(&ctl->request_queue) is checked without holding
ctl->request_queue_lock while completion work or a timeout can still be
dequeuing requests in tb_cfg_request_dequeue().

> +void tb_ctl_cancel_requests(struct tb_ctl *ctl)
> +{
> +	struct tb_cfg_request *req, *n;
> +	LIST_HEAD(requests);
> +
> +	mutex_lock(&ctl->request_queue_lock);
> +	list_for_each_entry_safe(req, n, &ctl->request_queue, list) {
> +		/*
> +		 * Take a reference and drop the one held by the queue while
> +		 * the request is still protected by the lock.  The requests
> +		 * are canceled outside of it and their completion work may
> +		 * run in the meantime: without the extra reference it could
> +		 * drop the last one and free the request under us.
> +		 */
> +		tb_cfg_request_get(req);
> +		set_bit(TB_CFG_REQUEST_CANCELED, &req->flags);
> +		clear_bit(TB_CFG_REQUEST_ACTIVE, &req->flags);
> +		list_del_init(&req->list);
> +		list_add_tail(&req->list, &requests);
> +		tb_cfg_request_put(req);
> +	}
> +	mutex_unlock(&ctl->request_queue_lock);
> +
> +	list_for_each_entry_safe(req, n, &requests, list) {
> +		cancel_work_sync(&req->work);
> +		list_del_init(&req->list);
> +		tb_cfg_request_finish_cancel(req, -ENOTCONN);
> +		tb_cfg_request_put(req);
> +	}

[Severity: Medium]
Does canceling or rejecting a synchronous config read or write with
-ENOTCONN trigger a WARN() in tb_cfg_read() and tb_cfg_write()?

When a tb_cfg_read() or tb_cfg_write() call running outside tb->lock (such
as tb_xdp_handle_request() -> tb_port_read()) is canceled here or rejected
by tb_ctl_sync_enter() after tb_ctl_stop(), tb_cfg_read_raw() and
tb_cfg_write_raw() return res.err =3D -ENOTCONN, which falls into the
default branch in tb_cfg_read() and tb_cfg_write():

drivers/thunderbolt/ctl.c:tb_cfg_read() {
    ...
	switch (res.err) {
	case 0:
		return 0;

	case 1:
		tb_cfg_print_error(ctl, route, &res);
		return -EIO;

	case -ETIMEDOUT:
		tb_ctl_warn(ctl, "%llx: timeout reading config space %u from %#x\n",
			    route, space, offset);
		break;

	default:
		WARN(1, "tb_cfg_read: %d\n", res.err);
		break;
	}
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119111907.3616=
041-1-shunsheng1218@gmail.com?part=3D1

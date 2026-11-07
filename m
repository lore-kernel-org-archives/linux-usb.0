Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794051035;
	b=3xGTQHn2yubtKBHYk4VVCzxOJScSmtOTAu6vE+HcRi6+g6xzKyjqGZxGf6olHze3sNMd
	 +MyzQmzQx720rAyU698LRuWLcF2KaLbS7zAHKVROAbMETgjVwXZE6Jc4I34MhIruIWbby
	 U8kdr0VdUzD0dBqy5jvYoLhcsJF4h+jX4q7faP8subrhdqNc26lZhCYwj0CLxEjhnxZP9
	 +ItbT9m5RA9sjtfO3M80aBpVAWSX6jdnWkGb/QJRFclotQOs6ov5aoNrpZsPs1uNYpTTf
	 qbXPf9rh6ZqeJbAVoTwd6nKA0p5oYGFPzYd5B26S19yRuU4rR3S8uqr7kRuRLn421Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794051035;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pJyM1XIU6GqxTxB09EUGAZb2dsxjHbSFzoTtvzaUkDQ=;
	b=k8l9h4RntqIktnAX7NPXObKMK38IIzjmo3UQQEWM2djl8C33FOVbxoNLNH958V85+WRn
	 SEE0z0ibrKdpnLRoykDdaZE5RUNwH1jYUJMB0K7QWWAWRThnbt0ScOdzoWW3d1DtYD3jN
	 wp8QkN9cdTgX/43rtOcjXtpjqV4ruUc+Rd8SIQ5LA5W3L0jKkHCMRg9HGwSVHdtsJ+bYR
	 MSbZ/AO6bVJtsLomBNUfbxwcLh4EoCmpMY2qBRtwqg11BnoqFSgglPvR2RQ6OvG4WJIh7
	 sjvDE5ldxz6XUW0ifxfK1ivqEEpEtMcUDRH4mh4VWJgSJ6slxAumgr67kBVl5uZ6vjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj8hb50f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C5606A330
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 11:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj8hb50f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D011F0089F;
	Sat,  7 Nov 2026 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794051035;
	bh=pJyM1XIU6GqxTxB09EUGAZb2dsxjHbSFzoTtvzaUkDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oj8hb50fdSbX4kcDo6OmjvNBLM8vdZD0Zo7PEfyQeUGRgcafg62Ji5IMGcV/ENaEv
	 yUeDKH7BJYLdM8kChlo7i+KH5aQX2fF0EnhuhjGQbW5R7Vm8T8Dxz1V5DiENJfXE73
	 E9kGrxBzoGQ0cx6qF8Ep3/8gVDuekCg4zg97mp7a/yraKszC/lHQOOzuhby7chYahe
	 Hb2epJ4RInpPWraOSgU9Bj97tTzDlvCGpJf/Etz0NFqRGrmJcNDvpnarEvKSmyZun0
	 +x7bLx0Gx7D9RwObp/pZbxkZL+NVwDllQKZOkxWom24sFlzPD9St+6xUxxuRkliAtj
	 Sgti/0NGZxgXQ==
Message-ID: <sashiko-outbox-202856@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: musb: gadget: don't flush a waiting RX packet
 when queueing a request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elvira Khabirova" <lineprinter0@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107105505.6554-1-lineprinter0@gmail.com>
References: <20261107105505.6554-1-lineprinter0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 11:30:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] usb: musb: gadget: overlapping musb_g_giveback() calls wedge
  ep->busy
- [High] usb: musb: gadget: race and ordering bug in
  musb_gadget_disable() for rx_kick
- [Medium] usb: musb: gadget: lost rx_kick across system suspend and
  resume
--

commit cef9b9e2278bf856fd53af421c899c0ae67866b7
Author: Elvira Khabirova <lineprinter0@gmail.com>

usb: musb: gadget: don't flush a waiting RX packet when queueing a request

This commit replaces the RX FIFO flush in musb_ep_restart() with a
system_bh_wq work item that invokes musb_g_rx(), and defers RX processing
via ep->rx_kick_deferred while ep->busy is set.

> diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadge=
t.c
> index 016d3f3fc1e05..c71c60efe5106 100644
> --- a/drivers/usb/musb/musb_gadget.c
> +++ b/drivers/usb/musb/musb_gadget.c
> @@ -148,6 +148,21 @@ __acquires(ep->musb->lock)
>  	usb_gadget_giveback_request(&req->ep->end_point, &req->request);
>  	spin_lock(&musb->lock);
>  	ep->busy =3D busy;
> +
> +	if (!ep->busy && ep->rx_kick_deferred) {
> +		ep->rx_kick_deferred =3D false;
> +		if (!queue_work(system_bh_wq, &ep->rx_kick))
> +			pm_runtime_put_noidle(musb->controller);
> +	}
> +}

[Severity: High]
Can overlapping musb_g_giveback() calls finish out of LIFO order and leave
ep->busy permanently stuck at 1?

musb_g_giveback() saves ep->busy in a stack variable, sets ep->busy =3D 1,
and drops musb->lock around usb_gadget_giveback_request().  With RX
givebacks running in system_bh_wq, a second giveback on the same endpoint
(for example via musb_gadget_dequeue(), which enters musb_g_giveback()
when musb_ep->busy is set) can overlap on another CPU:

CPU0                              CPU1
musb_g_rx_kick()
  musb_g_rx()
    musb_g_giveback()
      busy =3D ep->busy; // 0
      ep->busy =3D 1;
      spin_unlock(&musb->lock)
      usb_gadget_giveback_request()
                                  musb_gadget_dequeue()
                                    spin_lock_irqsave(&musb->lock, ...)
                                    musb_g_giveback()
                                      busy =3D ep->busy; // 1
                                      ep->busy =3D 1;
                                      spin_unlock(&musb->lock)
                                      usb_gadget_giveback_request()
      spin_lock(&musb->lock)
      ep->busy =3D 0;
      queue_work(..., &ep->rx_kick)
      spin_unlock(&musb->lock)
                                      spin_lock(&musb->lock)
                                      ep->busy =3D 1;  <-- stuck at 1

First, CPU0 clears ep->busy to 0 and schedules ep->rx_kick while CPU1 is
still in usb_gadget_giveback_request().  Second, when CPU1 finishes, it
writes its saved busy =3D 1 back to ep->busy.  After that, every subsequent
musb_g_rx(), musb_g_rx_kick(), and musb_gadget_queue() call sees
ep->busy =3D=3D 1 and defers work forever, wedging the endpoint and leaking
the runtime PM reference taken by musb_g_defer_rx_kick().

Making ep->busy an active giveback counter (incremented before dropping
musb->lock and decremented after re-acquiring it) would ensure ep->busy
only reaches 0 when the last giveback completes.

[ ... ]

> @@ -1111,6 +1137,12 @@ static int musb_gadget_disable(struct usb_ep *ep)
> =20
>  	/* abort all pending DMA and requests */
>  	nuke(musb_ep, -ESHUTDOWN);
> +	if (cancel_work(&musb_ep->rx_kick))
> +		pm_runtime_put_autosuspend(musb->controller);
> +	if (musb_ep->rx_kick_deferred) {
> +		musb_ep->rx_kick_deferred =3D false;
> +		pm_runtime_put_autosuspend(musb->controller);
> +	}
> =20
>  	musb_ep->desc =3D NULL;
>  	musb_ep->end_point.desc =3D NULL;

[Severity: High]
Can musb_g_rx_kick() run while nuke() drops musb->lock or after the
endpoint is re-enabled?

Because musb_ep->desc is cleared after nuke(), musb->lock is dropped
inside nuke() -> musb_g_giveback() while musb_ep->desc is still non-NULL.
If an earlier giveback on another CPU finishes during that window, it
restores ep->busy =3D 0 and queues ep->rx_kick, allowing musb_g_rx_kick() ->
musb_g_rx() -> rxstate() to run after nuke() has already freed
musb_ep->dma.

In addition, cancel_work() is non-synchronous:

CPU0                              CPU1
                                  <softirq>
                                  musb_g_rx_kick()
                                    // waiting for musb->lock
musb_gadget_disable()
  spin_lock_irqsave(&musb->lock, ...)
  cancel_work(&musb_ep->rx_kick) // false
  musb_ep->desc =3D NULL;
  spin_unlock_irqrestore(&musb->lock, ...)
musb_gadget_enable()
  spin_lock_irqsave(&musb->lock, ...)
  musb_ep->desc =3D desc;
  musb_ep->busy =3D 0;
  spin_unlock_irqrestore(&musb->lock, ...)
                                    spin_lock_irqsave(&musb->lock, ...)
                                    if (!musb_ep->desc || ...) // false
                                    musb_g_rx()  <-- stale kick runs

Clearing musb_ep->desc and musb_ep->end_point.desc before calling nuke()
prevents musb_g_rx_kick() and musb_gadget_queue() from acting on the
endpoint while nuke() drops musb->lock, and prevented stale kicks will see
the updated state if musb_gadget_enable() also cancels any pending
rx_kick.

[ ... ]

> @@ -1810,6 +1881,36 @@ void musb_gadget_cleanup(struct musb *musb)
> =20
>  	cancel_delayed_work_sync(&musb->gadget_work);
>  	usb_del_gadget_udc(&musb->g);
> +
> +	musb_gadget_disable_rx_kicks(musb);
> +}
> +
> +static void musb_g_disable_rx_kick(struct musb *musb, struct musb_ep *mu=
sb_ep)
> +{
> +	if (musb_ep->rx_kick.func && disable_work_sync(&musb_ep->rx_kick))
> +		pm_runtime_put_noidle(musb->controller);
> +}
> +
> +void musb_gadget_disable_rx_kicks(struct musb *musb)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
> +		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_in);
> +		musb_g_disable_rx_kick(musb, &musb->endpoints[i].ep_out);
> +	}
> +}
> +
> +void musb_gadget_enable_rx_kicks(struct musb *musb)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < musb->nr_endpoints; i++) {
> +		if (musb->endpoints[i].ep_in.rx_kick.func)
> +			enable_work(&musb->endpoints[i].ep_in.rx_kick);
> +		if (musb->endpoints[i].ep_out.rx_kick.func)
> +			enable_work(&musb->endpoints[i].ep_out.rx_kick);
> +	}
>  }

[Severity: Medium]
Does musb_gadget_disable_rx_kicks() lose a pending or deferred rx_kick
across system suspend and resume?

If ep->rx_kick is pending when musb_suspend() calls disable_work_sync(),
the work item is cancelled and its runtime PM reference is dropped, or if
musb_g_rx_kick() is currently in musb_g_giveback() with
ep->rx_kick_deferred set, disable_work_sync() marks ep->rx_kick disabled
before waiting for completion so queue_work() in musb_g_giveback() fails.
On resume, musb_gadget_enable_rx_kicks() only calls enable_work(), which
does not re-queue the cancelled work.  When the USB session is preserved
across suspend/resume (such as with MUSB_PRESERVE_SESSION or standby),
MUSB_RXCSR_RXPKTRDY remains set in hardware with no interrupt to
re-trigger it, stalling RX on the endpoint.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107105505.6554=
-1-lineprinter0@gmail.com?part=3D1

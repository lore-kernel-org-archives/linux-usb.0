Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792691745;
	b=KVnR8oUiUmHPFj/0destsABYIL/Hn8+GYfzpO6WdE6LcjnuLeXkr1AjpBaGn+87dT9Yd
	 4bR9vkVzu54Gh/5WXY1VqAbY//TQoglwlWaXat6wCkl/rxNsU4mB0MKA+zUiRS6uPsxdA
	 qPgAVqBg1CAw2CIFLfJ8wTmRJKvNam/5zlqyPK57Xs1+VarIsa8n68fZZr64v7ZVL0A6u
	 TqTuNp/jBhDDzJ6ICvnIfRGOgmMJAnoiQc/EWDm/T9kFtrcU4QW7yLTmy3i+FrE5+NC0B
	 bacX3ojb5kQy8lJdBH7QjSYLrn0ArxzJFC7CzmHD9pGvT3zpcn6Oo5oqVNQZZKqB5IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792691745;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KjGf7OsZBejgmPvwT8zLu5A7UBqJzs2vz/1IDZM/ap8=;
	b=HWAHmQlDLjmWVW3ewdmRdFWsNh8BpSkmfseH4iAtQlgKCLeAqQWvalRDCPIdmuy8hWD1
	 rKq/d2myUftqqcz+ZTSkbpmVFsjqt//GtoL7cxNbsBWpMVbXcsR/9PTmcQ8Crx9zesAHI
	 v7Hv4xdXL2Khjyx82Z1QqmwwKSA4RpXPdZ2C7rPQG2Ih6tnF0jVVH6ePPrhh23n69NH77
	 UaCXixERHKlrCklvxEAiyCVVoqRBqeyrh2xvInhxExTOi2MvyN/KRcq6z5X/RLcHRBuu1
	 C+yQaNiRaH/sR97SeNov23/rSDn99IxhJRDusTxuOuc2wGeSSsQHODOBYv0yQVot8+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqpA5nvh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D4C606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 17:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqpA5nvh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639791F01825;
	Thu, 22 Oct 2026 17:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792691744;
	bh=KjGf7OsZBejgmPvwT8zLu5A7UBqJzs2vz/1IDZM/ap8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dqpA5nvhvXc8maiX2iDO8kJPjs4roQYu6Oxkc3c2kFiJEE/SJ3sBRPUascf32TSOZ
	 GLn2+fi7dvJ4qYv7EOCDB/mL2otX9lMg2JND2Z7+xmcHrOC4lZIhXtY2U3Lxm0oPL+
	 ZmogMWlDU/IsX1rK3uoV9Nm2fw24aAKHOckQd1l0i6j1+dhNJr18UnUsmOiJ4AYAP/
	 bsiBgBstnhF7pUAanK/4FyP3inYZ2tLMpSMPbaRkTjccBss6IMrMBVJSRHg8Fs7aVV
	 3JqqIuH+VKJt2rXfaWUl+sbvyQxuFtSW48OvMuMw6OOtPBgIG1wVW69s4MUPUU6kP7
	 3FHzjnGKYGqrg==
Message-ID: <sashiko-outbox-181896@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/4] soc: qcom: pmic_glink: Report wakeup events on
 behalf of clients
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladyslav Tymoshchuk" <tvlad744@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022164151.592-3-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
 <20261022164151.592-3-tvlad744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 17:55:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] soc: qcom: pmic_glink: premature wakeup relax in pmic_glink_disp=
atch()
- [Medium] soc: qcom: pmic_glink: client wakeup source clobbered on overlap=
ping events
--

commit 8f440750750801ffa1527cda60138e403b071b3e
Author: Vladyslav Tymoshchuk <tvlad744@gmail.com>

soc: qcom: pmic_glink: Report wakeup events on behalf of clients

This commit adds wakeup event reporting to pmic_glink on behalf of client
devices when notifications arrive, with optional per-client wakeup filterin=
g.
When notifications are deferred during system sleep, it keeps the client
device's wakeup source active until the deferred notifications are dispatch=
ed
or dropped.

> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 748b335be6ef7..c629df8009e68 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c

[ ... ]

> @@ -166,6 +216,15 @@ int pmic_glink_send(struct pmic_glink_client *client=
, void *data, size_t len)
>  }
>  EXPORT_SYMBOL_GPL(pmic_glink_send);
> =20
> +static bool pmic_glink_is_wakeup_event(struct pmic_glink_client *client,
> +				       const void *data, size_t len)
> +{
> +	if (!device_may_wakeup(client->dev))
> +		return false;
> +
> +	return !client->wakeup_filter || client->wakeup_filter(data, len, clien=
t->priv);
> +}
> +
>  static void pmic_glink_dispatch(struct pmic_glink *pg, const void *data,=
 size_t len)
>  {
>  	const struct pmic_glink_hdr *hdr =3D data;
> @@ -174,8 +233,12 @@ static void pmic_glink_dispatch(struct pmic_glink *p=
g, const void *data, size_t
> =20
>  	spin_lock_irqsave(&pg->client_lock, flags);
>  	list_for_each_entry(client, &pg->clients, node) {
> -		if (client->id =3D=3D le32_to_cpu(hdr->owner))
> -			client->cb(data, len, client->priv);
> +		if (client->id !=3D le32_to_cpu(hdr->owner))
> +			continue;
> +
> +		/* From here on, the client keeps the system awake if it needs to */
> +		pmic_glink_client_relax(client);
> +		client->cb(data, len, client->priv);
>  	}
>  	spin_unlock_irqrestore(&pg->client_lock, flags);
>  }

[Severity: Medium]
Can pmic_glink_dispatch() in drivers/soc/qcom/pmic_glink.c prematurely
deactivate client->dev's wakeup source while a wakeup notification for that
client is still queued in pg->deferred?

Because deferred wakeup retention is tracked with a single per-client boole=
an
client->stay_awake in pmic_glink_rpmsg_callback(), pmic_glink_dispatch()
unconditionally clears client->stay_awake and calls pm_relax(client->dev) on
the first message dispatched to that client.

If a client uses pmic_glink_client_set_wakeup_filter() and receives a
non-wakeup notification during system sleep followed by a wakeup notificati=
on
before resume, both are queued in FIFO order in pg->deferred and
client->stay_awake is set to true. When pmic_glink_deliver_work() drains
pg->deferred:

drivers/soc/qcom/pmic_glink.c:pmic_glink_deliver_work() {
	for (;;) {
		spin_lock_irqsave(&pg->defer_lock, flags);
		msg =3D list_first_entry_or_null(&pg->deferred, ...);
		...
		list_del(&msg->node);
		pg->num_deferred--;
		spin_unlock_irqrestore(&pg->defer_lock, flags);

		pmic_glink_dispatch(pg, msg->data, msg->len);
		kfree(msg);
	}
}

the earlier non-wakeup notification is dispatched first. That call runs
pmic_glink_client_relax(client) -> pm_relax(client->dev) before invoking
client->cb(). Since the first message is not a wakeup event, the client
callback will not re-activate client->dev's wakeup source, leaving the wake=
up
source inactive while the wakeup notification is still waiting in
pg->deferred.

The same premature relax happens if two wakeup notifications for the same
client are queued in pg->deferred, or if a new wakeup notification arrives =
in
pmic_glink_rpmsg_callback() after pmic_glink_deliver_work() drops
pg->defer_lock for an earlier message (while pg->defer is still true) and
before pmic_glink_dispatch() acquires pg->client_lock. Wouldn't this allow
autosleep or a suspend started via /sys/power/wakeup_count to put the system
back to sleep before the client has seen the pending wakeup notification?

> @@ -235,8 +298,11 @@ static void pmic_glink_drop_deferred(struct pmic_gli=
nk *pg)
>  static int pmic_glink_rpmsg_callback(struct rpmsg_device *rpdev, void *d=
ata,
>  				     int len, void *priv, u32 addr)
>  {
> +	struct pmic_glink_client *client;
>  	struct pmic_glink_hdr *hdr;
>  	struct pmic_glink *pg =3D dev_get_drvdata(&rpdev->dev);
> +	bool notification, deferred;
> +	unsigned long flags;
> =20
>  	if (len < sizeof(*hdr)) {
>  		dev_warn(pg->dev, "ignoring truncated message\n");
> @@ -246,11 +312,30 @@ static int pmic_glink_rpmsg_callback(struct rpmsg_d=
evice *rpdev, void *data,
>  	hdr =3D data;
> =20
>  	/* The sender of a request is waiting for the response */
> -	if (le32_to_cpu(hdr->type) !=3D PMIC_GLINK_REQ_RESP &&
> -	    pmic_glink_defer(pg, data, len))
> -		return 0;
> +	notification =3D le32_to_cpu(hdr->type) !=3D PMIC_GLINK_REQ_RESP;
> +
> +	/* Defer under client_lock, to set stay_awake before it is delivered */
> +	spin_lock_irqsave(&pg->client_lock, flags);
> +	deferred =3D notification && pmic_glink_defer(pg, data, len);
> +	list_for_each_entry(client, &pg->clients, node) {
> +		if (client->id !=3D le32_to_cpu(hdr->owner))
> +			continue;
> +
> +		if (deferred) {
> +			if (pmic_glink_is_wakeup_event(client, data, len)) {
> +				pm_stay_awake(client->dev);
> +				pm_system_wakeup();
> +				client->stay_awake =3D true;
> +			}
> +			continue;
> +		}
> +
> +		if (notification && pmic_glink_is_wakeup_event(client, data, len))
> +			pm_wakeup_hard_event(client->dev);
> =20
> -	pmic_glink_dispatch(pg, data, len);
> +		client->cb(data, len, client->priv);
> +	}
> +	spin_unlock_irqrestore(&pg->client_lock, flags);
> =20
>  	return 0;
>  }

[Severity: Medium]
What happens if a client keeps client->dev's wakeup source active from
client->cb(), as described in the commit message, and another notification
arrives for the same client before the client relaxes its wakeup source?

In drivers/base/power/wakeup.c, struct wakeup_source is not reference-count=
ed.
When pmic_glink_rpmsg_callback() in drivers/soc/qcom/pmic_glink.c calls
pm_wakeup_hard_event(client->dev) for a non-deferred wakeup notification, it
invokes pm_wakeup_dev_event(client->dev, 0, true) ->
pm_wakeup_ws_event(ws, 0, true):

drivers/base/power/wakeup.c:pm_wakeup_ws_event() {
	...
	wakeup_source_report_event(ws, hard);

	if (!msec) {
		wakeup_source_deactivate(ws);
		goto unlock;
	}
	...
}

Because msec is 0, pm_wakeup_ws_event() unconditionally calls
wakeup_source_deactivate(ws) before client->cb() is called, which deactivat=
es
client->dev->power.wakeup and cancels its timer if the client was already
holding it active from an earlier callback (for example via
pm_stay_awake(client->dev) or pm_wakeup_event(client->dev, msec)).

Similarly, in pmic_glink_deliver_work() in drivers/soc/qcom/pmic_glink.c:

drivers/soc/qcom/pmic_glink.c:pmic_glink_deliver_work() {
	for (;;) {
		spin_lock_irqsave(&pg->defer_lock, flags);
		msg =3D list_first_entry_or_null(&pg->deferred, ...);
		if (!msg) {
			pg->defer =3D false;
			dropped =3D pg->num_dropped;
			pg->num_dropped =3D 0;
			spin_unlock_irqrestore(&pg->defer_lock, flags);
			break;
		}
		...
		spin_unlock_irqrestore(&pg->defer_lock, flags);

		pmic_glink_dispatch(pg, msg->data, msg->len);
		kfree(msg);
	}

	/* Release the clients whose notifications were dropped */
	spin_lock_irqsave(&pg->client_lock, flags);
	list_for_each_entry(client, &pg->clients, node)
		pmic_glink_client_relax(client);
	spin_unlock_irqrestore(&pg->client_lock, flags);
}

if client->cb() activates client->dev's wakeup source during
pmic_glink_dispatch(), and a new wakeup notification arrives while pg->defer
is still true, pmic_glink_rpmsg_callback() calls pm_stay_awake(client->dev)
and sets client->stay_awake =3D true; the subsequent pmic_glink_client_rela=
x()
then calls pm_relax(client->dev) and deactivates the wakeup source held by =
the
client. Also, between setting pg->defer =3D false and acquiring pg->client_=
lock
for the post-loop pmic_glink_client_relax() pass, a client with
client->stay_awake set from a dropped notification can receive a non-deferr=
ed
notification in pmic_glink_rpmsg_callback(), activate its wakeup source in
client->cb(), and then immediately have it relaxed by the post-loop
pmic_glink_client_relax() call.

Could pmic_glink use its own wakeup_source (or otherwise avoid calling
pm_wakeup_hard_event() and pm_relax() on client->dev while the client owns
it) so that pmic_glink and the client driver do not clobber the same
non-refcounted wakeup source?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022164151.592-=
1-tvlad744@gmail.com?part=3D2

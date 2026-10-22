Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692215;
	b=zh2/+u5XOejCfrrahcaB90CKSHyhxMcS4eQhAzGjQ18VnCO0bCzzL+k3knzXrhMi5nWY
	 IPJWsCUQn7WPprt3zcT2FLzGGUN0p3d/+yhBayXCi/5isVK0VQm0dEJYfxIbo6LKyX7OP
	 EjWxG7EkNsJEdt8p+kMTDOoeaRDeUgQPuq0e7M1q0P5d5SFj5aGRn7GEwSVmm4dUt5TnA
	 ysltN7ZZkb4rzjHG1zh+kGZFLElUqKbgpYOg7VKaZ4K60ZDbJuqZnUM50U6omf2d6SFdF
	 7QvaCKjCGgDJe2+aqbCU+RgO21DvzlrNqyhNOiUbgATMRWVwt67Kdt8QSlohHMyWAYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692215;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=14WjTagRVG96HvUs9DGj5AXFV5bwPENUsEFHhBB8VkM=;
	b=ZT1g6BoxHXid104uH4KmnaG7iwSHtdxeedlbFZU9X2Fagix6r271hd28KO864ChKW6cc
	 GFNWhG0nX7jz1ZT7Y5th2cQ51jMi6l3v588FG8OZnswVOaWxmnxrlz4BX0nkBybmysJla
	 Vsf/Hz9tiPFIve3gv1EdqJv/SP0xZyD90w3wo68w8y6QuysB+Hqms0uhUaBbXSEL3X7aH
	 OrIj4fvedTqvBtDjiTO3blIdYHH5PfBtYs4USzXs6nfGeWIvXJJumLNAdERjYR44Jis7/
	 ry8eFPOrD6j0pCHxKxq66eVRJuQF6XdKKRiXpR4LqTAYRbD0NLY2yKb6Rkb2CczLM4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPNEiQ+h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA6606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 18:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPNEiQ+h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411161F01825;
	Thu, 22 Oct 2026 18:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792692214;
	bh=14WjTagRVG96HvUs9DGj5AXFV5bwPENUsEFHhBB8VkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPNEiQ+hcrOkkOCDwtqBPVYElOVzP8nKYeuzDLSuN67lR2QUwSGr4eYP7NbGiXe2L
	 GaqNiNt6kDp/e10WPTum9mH0RILgTf0XpcMH1iiL+ixtq252lCKoamYVuLGrbQVGZo
	 pGJnYodlwo7NzJNS+fr8YVPVHAVqAkv2kISlonPVE8XrJyNTrFQHCjjNOy1hXTn/hz
	 M5dpNVrXB8Eqjy2w2K4OuXNKFODi+zgpYrp+w/yBZvkPWPiCyFFJyOm909kDy5EvNK
	 WRPO1LKRYwblqKCYUAVi0Vz+V6XdBhWlcgcUMtHeNl6YUX+IA2FDNoXwxXc8vXhDkT
	 DTx76QrpI+vJw==
Message-ID: <sashiko-outbox-181900@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 1/4] soc: qcom: pmic_glink: Hold back notifications
 over system sleep
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladyslav Tymoshchuk" <tvlad744@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022164151.592-2-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
 <20261022164151.592-2-tvlad744@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 18:03:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] soc: qcom: pmic_glink: deliver_work() dispatches messages before s=
ervice UP
- [High] soc: qcom: pmic_glink: race between pmic_glink_prepare() and deliv=
er_work()
- [Medium] soc: qcom: pmic_glink: pmic_glink_drop_deferred() leaks num_drop=
ped count
--

commit 3dadaa06ca7997c9a5f8bc5601e0bf726bf560b1
Author: Vladyslav Tymoshchuk <tvlad744@gmail.com>

soc: qcom: pmic_glink: Hold back notifications over system sleep

This commit defers incoming PMIC GLINK notifications and service UP events
starting from the PM prepare callback and delivers them on
system_freezable_wq from the PM complete callback so client workers do not
access suspended devices during system sleep.

> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 84fd0c82c0c4d..748b335be6ef7 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c

[ ... ]

> @@ -149,13 +166,77 @@ int pmic_glink_send(struct pmic_glink_client *clien=
t, void *data, size_t len)

[ ... ]

> +static void pmic_glink_drop_deferred(struct pmic_glink *pg)
> +{
> +	struct pmic_glink_deferred_msg *msg, *tmp;
> +
> +	guard(spinlock_irqsave)(&pg->defer_lock);
> +
> +	list_for_each_entry_safe(msg, tmp, &pg->deferred, node) {
> +		list_del(&msg->node);
> +		kfree(msg);
> +	}
> +	pg->num_deferred =3D 0;
> +}

[Severity: Medium]
Should pmic_glink_drop_deferred() also reset pg->num_dropped to 0?

If pmic_glink_defer() drops notifications while the queue is full (or on
kmalloc_flex() failure) and the remote service subsequently goes down,
pmic_glink_state_notify_clients() calls pmic_glink_drop_deferred() to disca=
rd
all queued messages from that remote session.

Because pg->num_dropped is left untouched here, pmic_glink_deliver_work() w=
ill
later read the stale pg->num_dropped count and log a warning for notificati=
ons
that belonged to the discarded session.

[ ... ]

> @@ -217,13 +305,18 @@ static void pmic_glink_state_notify_clients(struct =
pmic_glink *pg)
>  	unsigned long flags;
> =20
>  	if (pg->client_state !=3D SERVREG_SERVICE_STATE_UP) {
> -		if (pg->pdr_state =3D=3D SERVREG_SERVICE_STATE_UP && pg->ept)
> +		/* On UP the clients use the remote, hold that back as well */
> +		if (pg->pdr_state =3D=3D SERVREG_SERVICE_STATE_UP && pg->ept &&
> +		    !pmic_glink_deferring(pg))
>  			new_state =3D SERVREG_SERVICE_STATE_UP;
>  	} else {
>  		if (pg->pdr_state =3D=3D SERVREG_SERVICE_STATE_DOWN || !pg->ept)
>  			new_state =3D SERVREG_SERVICE_STATE_DOWN;
>  	}
> =20
> +	if (pg->pdr_state =3D=3D SERVREG_SERVICE_STATE_DOWN || !pg->ept)
> +		pmic_glink_drop_deferred(pg);
> +
>  	if (new_state !=3D pg->client_state) {
>  		spin_lock_irqsave(&pg->client_lock, flags);
>  		list_for_each_entry(client, &pg->clients, node)
> @@ -233,6 +326,40 @@ static void pmic_glink_state_notify_clients(struct p=
mic_glink *pg)
>  	}
>  }
> =20
> +static void pmic_glink_deliver_work(struct work_struct *work)
> +{
> +	struct pmic_glink *pg =3D container_of(work, struct pmic_glink, deliver=
_work);
> +	struct pmic_glink_deferred_msg *msg;
> +	unsigned int dropped;
> +	unsigned long flags;
> +
> +	guard(mutex)(&pg->state_lock);
> +
> +	for (;;) {
> +		spin_lock_irqsave(&pg->defer_lock, flags);
> +		msg =3D list_first_entry_or_null(&pg->deferred, struct pmic_glink_defe=
rred_msg, node);
> +		if (!msg) {
> +			pg->defer =3D false;
> +			dropped =3D pg->num_dropped;
> +			pg->num_dropped =3D 0;
> +			spin_unlock_irqrestore(&pg->defer_lock, flags);
> +			break;
> +		}
> +
> +		list_del(&msg->node);
> +		pg->num_deferred--;
> +		spin_unlock_irqrestore(&pg->defer_lock, flags);
> +
> +		pmic_glink_dispatch(pg, msg->data, msg->len);
> +		kfree(msg);
> +	}
> +
> +	pmic_glink_state_notify_clients(pg);
> +
> +	if (dropped)
> +		dev_warn(pg->dev, "%u notifications lost during system sleep\n", dropp=
ed);
> +}

[Severity: High]
Isn't the ordering between deferred message delivery and
pmic_glink_state_notify_clients() in pmic_glink_deliver_work() inverted when
the remote service starts or restarts during system sleep?

In pmic_glink_state_notify_clients(), any SERVREG_SERVICE_STATE_DOWN event
discards all previously queued messages via pmic_glink_drop_deferred() and
notifies clients of SERVREG_SERVICE_STATE_DOWN. If the service then comes up
while pg->defer is true, SERVREG_SERVICE_STATE_UP is held back, so any
messages remaining in pg->deferred at resume arrived after the service came
up.

However, pmic_glink_deliver_work() dispatches all of pg->deferred (and clea=
rs
pg->defer =3D false) before calling pmic_glink_state_notify_clients(pg) to
deliver SERVREG_SERVICE_STATE_UP:

1. In drivers/power/supply/qcom_battmgr.c, qcom_battmgr_pdr_notify() only s=
ets
   battmgr->service_up =3D true on SERVREG_SERVICE_STATE_UP:

   static void qcom_battmgr_pdr_notify(void *priv, int state)
   {
           struct qcom_battmgr *battmgr =3D priv;

           if (state =3D=3D SERVREG_SERVICE_STATE_UP) {
                   battmgr->service_up =3D true;
                   schedule_work(&battmgr->enable_work);
           } else {
                   battmgr->service_up =3D false;
           }
   }

   Delivering post-UP notifications before SERVREG_SERVICE_STATE_UP causes
   qcom_battmgr_notification() -> power_supply_changed() to trigger property
   reads while battmgr->service_up is still false, failing with -EAGAIN.

2. In drivers/usb/typec/ucsi/ucsi_glink.c, pmic_glink_ucsi_pdr_notify()
   schedules ucsi->register_work on the non-freezable system_wq:

   static void pmic_glink_ucsi_pdr_notify(void *priv, int state)
   {
           struct pmic_glink_ucsi *ucsi =3D priv;
           unsigned long flags;

           spin_lock_irqsave(&ucsi->state_lock, flags);\
           ucsi->pd_running =3D (state =3D=3D SERVREG_SERVICE_STATE_UP);
           spin_unlock_irqrestore(&ucsi->state_lock, flags);
           schedule_work(&ucsi->register_work);
   }

   When SERVREG_SERVICE_STATE_DOWN is passed on immediately during system
   sleep, ucsi->register_work runs ucsi_unregister() -> ucsi_unregister_por=
t()
   -> ucsi_unregister_partner() -> typec_set_mode(con->port, TYPEC_STATE_SA=
FE)
   while Type-C mux and retimer devices are still suspended. Then, when the
   service comes back up during sleep and pmic_glink_deliver_work() dispatc=
hes
   post-UP notifications before SERVREG_SERVICE_STATE_UP,
   pmic_glink_ucsi_callback() schedules ucsi->notify_work before
   ucsi->register_work re-registers UCSI, accessing the freed ucsi->connect=
or.

[ ... ]

> @@ -386,10 +519,35 @@ static void pmic_glink_remove(struct platform_devic=
e *pdev)
>  	if (pg->data->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
>  		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
> =20
> +	pmic_glink_drop_deferred(pg);
> +
>  	guard(mutex)(&__pmic_glink_lock);
>  	__pmic_glink =3D NULL;
>  }
> =20
> +static int pmic_glink_prepare(struct device *dev)
> +{
> +	struct pmic_glink *pg =3D dev_get_drvdata(dev);
> +
> +	guard(spinlock_irqsave)(&pg->defer_lock);
> +	pg->defer =3D true;
> +
> +	return 0;
> +}

[Severity: High]
Can pmic_glink_deliver_work() race with pmic_glink_prepare() and clear
pg->defer =3D false while the system is entering sleep?

In kernel/power/hibernate.c, hibernation_snapshot() calls
dpm_prepare(PMSG_FREEZE) before freeze_kernel_threads() freezes
system_freezable_wq:

	error =3D dpm_prepare(PMSG_FREEZE);
	if (error)
		goto Complete;

	/* Preallocate image memory before freezing kernel threads and shutting do=
wn devices. */
	error =3D hibernate_preallocate_memory();
	if (error)
		goto Complete;

	error =3D freeze_kernel_threads();

A similar situation occurs if a second sleep transition or hybrid-sleep
suspend starts while pg->deliver_work queued by a previous
pmic_glink_complete() is still pending or running on system_freezable_wq.

Because pmic_glink_prepare() sets pg->defer =3D true without flushing or
canceling pg->deliver_work first, an in-flight pmic_glink_deliver_work() can
finish draining pg->deferred after pmic_glink_prepare() returns and set
pg->defer =3D false, leaving notification deferral disabled for the rest of=
 the
sleep transition.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022164151.592-=
1-tvlad744@gmail.com?part=3D1

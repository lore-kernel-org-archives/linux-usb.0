Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307951;
	b=Om+nHG/QKOhmtsh38vLCqJx+x62eXBF1rGUIpEWckBpnXpq96CjFoxGr/3JUYzte4ULH
	 wXMBZ71S5zF6MSmCFsfT4kJq5ERKvS8rAl36/P+CLyrqFIZH6RKFc8wpmWM6XGtlKB1Zl
	 yhiShz4p8nw37XyHyxsEB5Pzh8a0OTD0L3OfQ5+vp9gcYsRwwE/V7KBsU0n1my+uvjmzO
	 29MWdypoRGceAXl6nbHv48hfTujceB3rFgSggXLgMaLz76ykfyUEJLLEBxtbU6Y41QHpJ
	 oyClRcSrfNw94ODYKr/GYJKomq9tL+GDIJx3FdUCTt/DYisUmUUSWMIsuf9mzzPZk1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307951;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3Etb+nfiDsoWTz/LyOKz5W/yENWKTSQEQSgT8Mc1H+o=;
	b=rr/+2vYa7jcyoXhz2khkRofLBuV3wJO86phnYdaWFcKhvVsqocI8/EKym0rLtxmnU0aZ
	 XfgcgIBiX1WqvMj9Hvn7kYLqdhHqitQcZ5PWAWpy7jETII0TNhtnOkhXjHiKKIwFka/g9
	 AW5eKQ74gT4qaYCPpNGfVXJ64errhUH5idF57Nunwtk2DKZRzkFhH07v6NESGPyREgjyU
	 vIwk0GNrderfgdJY4gArCWLQbAUB97s7Sa2QxOBzu/GP0BCFcjgOmYpzImkpTLWS2WYnH
	 79+w/gcaJAhZYrFPnS3BhDhGIqjv45WkzRBmodl9d4ao2tHdLwaNRenKIPyc9qOyyhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="lmai/xZp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA2606A32E;
	Tue, 10 Nov 2026 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lmai/xZp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537AF1F0089F;
	Tue, 10 Nov 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307950;
	bh=3Etb+nfiDsoWTz/LyOKz5W/yENWKTSQEQSgT8Mc1H+o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lmai/xZpKjnN971+SgAgIBfGh8AFqcGqKDuz6auDLi0VCqwenyHJ9eR/nS7mgnXwn
	 jobwAHMx0SnO+AzWxPrdLQxmz/UiL+VItbRl/WAzKegNLLh6WNOpL2EuMCWrf/XXLS
	 +w2ZFPb2tJzPgV7Rr5s8d3X8eBTQd+h7kiS09/F1HnchFJ3rHQD5ilct3Lp3bUapRZ
	 b+J5QO2MeYmkO1qV8D4WuIs72ZQ7Umuvr2kLnKgEvcmaaEjTYttj9r4c9uO4+jtdOH
	 xoQ/+fhmEM0HgsOZESghkHqboj7uxX15+xrMPLjzifHc3NbAJC8MNAVlkAOURoLxsN
	 +5At5nQFmmGKw==
Message-ID: <sashiko-outbox-206898@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: typec: tcpm: Don't cut a pending state delay
 short on a re-queue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-tcpm-attach-reboot-v1-1-7657cc1e2dca@gmail.com>
References: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
 <20261110-tcpm-attach-reboot-v1-1-7657cc1e2dca@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:52:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] usb: typec: tcpm: use-after-free in tcpm_unregister_port()
  [1]
--

commit fc426c7d09bd548d8d6ca702db9699249b1a96bd
Author: Arun Iyengar <aiyengar1990@gmail.com>

usb: typec: tcpm: Don't cut a pending state delay short on a re-queue

This commit checks whether a pending state transition delay has expired in
tcpm_state_machine_work() and re-arms port->state_machine_timer for the
remaining time if the work item was re-queued early.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index d721baef52104..0a19b7665555b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6569,6 +6569,18 @@ static void tcpm_state_machine_work(struct kthread=
_work *work)
> =20
>  	/* If we were queued due to a delayed state change, update it now */
>  	if (port->delayed_state) {
> +		/*
> +		 * The work may have been queued again for another reason
> +		 * while it was running, for instance by tcpm_init() at port
> +		 * registration, which sets two states in a row with the
> +		 * port lock held. Do not cut a pending delay short; re-arm
> +		 * the timer for the time that is left.
> +		 */
> +		if (ktime_after(port->delayed_runtime, ktime_get())) {
> +			hrtimer_start(&port->state_machine_timer,
> +				      port->delayed_runtime, HRTIMER_MODE_ABS);
> +			goto done;
> +		}

[Severity: Critical]
This problem wasn't introduced by this patch, but can
state_machine_timer_handler() trigger a use-after-free on port->wq during
tcpm_unregister_port() [1]?

drivers/usb/typec/tcpm/tcpm.c:state_machine_timer_handler() {
	if (port->registered)
		kthread_queue_work(port->wq, &port->state_machine);
	return HRTIMER_NORESTART;
}

drivers/usb/typec/tcpm/tcpm.c:tcpm_unregister_port() {
	port->registered =3D false;
	kthread_destroy_worker(port->wq);
	port->wq =3D NULL;

	hrtimer_cancel(&port->vdm_discovery_timer);
	hrtimer_cancel(&port->enable_frs_timer);
	hrtimer_cancel(&port->vdm_state_machine_timer);
	hrtimer_cancel(&port->state_machine_timer);
    ...
}

Because tcpm_unregister_port() destroys port->wq before cancelling the
hrtimers, an expiring timer on another CPU can pass the port->registered
check and queue work onto the freed worker:

CPU0                              CPU1
tcpm_unregister_port()            state_machine_timer_handler()
                                    if (port->registered)
  port->registered =3D false;
  kthread_destroy_worker(port->wq);
                                    kthread_queue_work(port->wq, ...);
                                      <-- use-after-free
  hrtimer_cancel(&port->state_machine_timer);

Cancelling the hrtimers after setting port->registered =3D false and before
calling kthread_destroy_worker(port->wq) would avoid this race.

[1] https://sashiko.dev/#/bug/linux-3223298d-cf35-4f30-825a-9241513c9ba5

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-tcpm-attac=
h-reboot-v1-0-7657cc1e2dca@gmail.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477014;
	b=t4Y2L9MgqqnHL07IpttwKw625u83TOVx6tS7873i1I6RzfUR/vFeaPckHrgHLsGiYXWp
	 CsNaeL7fUZAOBdDucjlH4+G+EeEMqX3+l4+UOW2PiZpOnAJpHkQiN6n6H3kgYGIsi5BJq
	 PqjLm4y+kGFlr8zlZOvyTUtK2ZxqngWXgv7y8XhCugLNZ2rLVuwFeFrQiInxAi6aI5m/l
	 EJNEPU1HSn/3w4tQsglFUq/eKr7oRIOupMnpDR9abHV2AzSVNIyNVsSVs+ltFMeG8ox2w
	 esS+4+lgZ0t+BshI3MtvUQgoKz8TJcSc04WX+jrwx5ccRNZnW/ee++3eYWxncHLcx2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477014;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2CO4QFuVLJPX2iTRGvK9EBPG37mo7/9P+a1t8dz5rsw=;
	b=fYdUgH2eEdkC+x/R3SomgzcnxgDHkl8saCu4yeNtlZD3QWNKAg0vQ0NqfEpVuGKyKr3A
	 Ohlt8e6TNmlBNif71YJfZY9nD3Mly3cIF84bX/++4/1PqaVFNEbMcGOpL41gUUILzxX6L
	 cLhxMeAxr7w2m45OdROLHLjgX61pvTFNWQ+95uQzFo9lF29xxOh7JkJDYhY3zrbkw56wL
	 n9ueWZdVSxabKv6fgCmFEsVWiE7sb78ffaXbxp1i0KKyciGVN8N+Qyawvlpyv4eI8eZZa
	 0WiNNU2qzQuFtDTD/d8CIL35crTjK0gfanMKXjvgiJr1s7HKuAfViIu0nCENSRuigEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X9x41sYe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F2606A32D;
	Thu, 12 Nov 2026 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X9x41sYe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0881F00A05;
	Thu, 12 Nov 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477014;
	bh=2CO4QFuVLJPX2iTRGvK9EBPG37mo7/9P+a1t8dz5rsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X9x41sYeRLEabC0tRnqW+fHdw7j3ehg1prAh0Vcntm6V8tjGh/rJ9BV6huBaK7LAx
	 sgZRZJZRAloQ1jYDh4DT7pxttlsgcZMB+ay/dVEMx0grflifGXDK1FEL2eYgMqgG6N
	 zUB0H3CUKU0KNwkU3tz8aOnu6rermSYjrEAYmIiQYX4G+FKtxKmIyTfXnEyj1PlJs3
	 HbeKBeNIkSRH2d0ifWAUfoMw5u4NYGfmcpeWJVCxWnOaSzjvfSHShJ7Wd0Cfm2o2+a
	 7dt2Kk/HpJwMszGG8nlBToLuvpscCuQSjeBdlTmSOx8dz/ASBP+FRUklTDDJe4eofz
	 1snNVmYYt7bdw==
Message-ID: <sashiko-outbox-210905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: stop asynchronous work before destroying
 roles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261112092556.2747348-1-xu.yang_2@oss.nxp.com>
References: <20261112092556.2747348-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 09:50:13 +0000
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
- [Medium] usb: chipidea: stale OTG event flags and teardown race in
  ci_hdrc_otg_destroy()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] usb: chipidea: uncanceled otg_fsm_hrtimer in
  ci_hdrc_otg_destroy() [1]
--

commit b8def951ac8ca82d212a5f915b8e9c3017f3be77
Author: Xu Yang <xu.yang_2@nxp.com>

usb: chipidea: stop asynchronous work before destroying roles

This commit reorders role and OTG teardown so that asynchronous work items,
interrupts, and the OTG FSM are stopped before the gadget and host roles and
workqueue are destroyed.

> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index fecc7d7e2f0d7..ec11056dddfaf 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -264,12 +264,21 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
>   */
>  void ci_hdrc_otg_destroy(struct ci_hdrc *ci)
>  {
> -	if (ci->wq)
> -		destroy_workqueue(ci->wq);
> +	disable_irq(ci->irq);
> +	if (disable_work_sync(&ci->work)) {
> +		ci->id_event =3D false;
> +		ci->b_sess_valid_event =3D false;
> +		/* Balance disable_irq_nosync() performed in ci_otg_queue_work() */
> +		enable_irq(ci->irq);
> +	}
> +
> +	if (ci_otg_is_fsm_mode(ci))
> +		ci_hdrc_otg_fsm_remove(ci);

[Severity: Critical]
This problem wasn't introduced by this patch, but can ci->otg_fsm_hrtimer
fire after teardown [1] because neither ci_hdrc_otg_fsm_remove() nor
ci_hdrc_otg_destroy() cancels it?

In OTG FSM mode, ci_otg_add_timer() arms ci->otg_fsm_hrtimer with
ci_otg_hrtimer_func(), while ci_hdrc_otg_fsm_remove() only removes the sysfs
group.  If an armed timer expires during or after teardown,
ci_otg_hrtimer_func() dereferences the freed struct ci_hdrc and queues work=
 on
the destroyed ci->wq workqueue, causing a use-after-free.

>  	/* Disable all OTG irq and clear status */
>  	hw_write_otgsc(ci, OTGSC_INT_EN_BITS | OTGSC_INT_STATUS_BITS,
>  						OTGSC_INT_STATUS_BITS);
> -	if (ci_otg_is_fsm_mode(ci))
> -		ci_hdrc_otg_fsm_remove(ci);
> +	if (ci->wq)
> +		destroy_workqueue(ci->wq);
> +	enable_irq(ci->irq);
>  }

[Severity: Medium]
Can leaving ci->id_event or ci->b_sess_valid_event set while ci->work is
disabled cause an unhandled interrupt storm after enable_irq(ci->irq)?

ci_hdrc_otg_destroy() only clears ci->id_event and ci->b_sess_valid_event w=
hen
disable_work_sync(&ci->work) cancels a pending work item, and it disables
ci->work before hw_write_otgsc() clears cable->enabled.  An extcon event
arriving via ci_cable_notifier() -> ci_irq() before hw_write_otgsc() runs
(which disable_irq(ci->irq) does not block), or an earlier OTG FSM transiti=
on
past OTG_STATE_A_IDLE in ci_otg_fsm_work(), leaves ci->id_event or
ci->b_sess_valid_event set with ci->work disabled:

drivers/usb/chipidea/core.c:ci_irq_handler() {
	if (ci->is_otg) {
		...
		if (ci->id_event || ci->b_sess_valid_event) {
			ci_otg_queue_work(ci);
			return IRQ_HANDLED;
		}
	}

	/* Handle device/host interrupt */
	if (ci->role !=3D CI_ROLE_END)
		ret =3D ci_role(ci)->irq(ci);
}

Once enable_irq(ci->irq) runs at the end of ci_hdrc_otg_destroy(), any host=
 or
gadget interrupt during role teardown takes that early return in
ci_irq_handler().  Because ci->work is disabled, queue_work() in
ci_otg_queue_work() returns false and immediately calls enable_irq(ci->irq)=
 in
hardirq context without ever calling ci_role(ci)->irq(ci) to clear the
hardware interrupt status.

Disabling OTG interrupts with hw_write_otgsc() before disable_work_sync() a=
nd
unconditionally clearing ci->id_event and ci->b_sess_valid_event after
disable_work_sync() would avoid this.

[1] https://sashiko.dev/#/bug/linux-8569f327-701f-4376-8f59-b4c911b172bb

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112092556.2747=
348-1-xu.yang_2@oss.nxp.com?part=3D1

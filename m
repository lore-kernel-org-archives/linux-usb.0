Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793345551;
	b=FjhIe+IZBVno+X0OZdC6A2NR9aOzpMq9lJ0574qcVOmMyn+tJ8PVUwY8Qao/ANia85/7
	 NClNWmPreOcMTUGdGTsppHdSRSx/Rrw8cpBXY6p30QdKo34qCLY2hlSg6mU5UW4t1D26j
	 fEYogQgK3enbAzGhy1+nBZSS5OYplwzofMQc+Bb7vKwKMT1WcVSy+Yl3fEgjaZf+H8bAM
	 zWBTkfS+DjJOyxCmXpHPgt5yWzqJ+cYT+SYTMwOYTwvp3M3R40eWqqHWIsTURRh7Dk9Y3
	 XruyUVhDEPTmR1urwqp1m/ddZO0j8FXzUR0giy+GrgVOLRAMiZUA/td8MSWrgnv4kPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345551;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kRyqcdXxJbUqcYKj5QrDTA1tbWLyEREzU9hHyreb+ms=;
	b=YtoIYkDnQzjDoEd+1zbQ6kjazDt5f0wGt7+uzVm+2OnnfvyIuGfPmGl1gZ4U1QB64ajA
	 ankd+tkul9qIDH9cVXuKTBKu6Um3CSf0XZZDycxoTsdMp/YmsfmY07bITvUcWGXuQP4wG
	 wgsr43zwUGgO3ZYemcFXBPD6TStAhxgjfHJEvWY/wWoGiyymLYUwylh5NswNYltFFtSD6
	 5Ma1i6KAmQDMemAvAJIi2Tov+BzHSIfJ2tXs2I3F1Ql1mM2PXGMy2G6sBa5JvrojSfNu0
	 eOkeBhm7+DgCJOSjR6620StFwyBuGJ9rwGlKJN5kuHLN8Zq4+AESwH9aYX8CHPknN1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2VJjC3p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421A606A31C;
	Fri, 30 Oct 2026 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o2VJjC3p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C1D1F0093A;
	Fri, 30 Oct 2026 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793345551;
	bh=kRyqcdXxJbUqcYKj5QrDTA1tbWLyEREzU9hHyreb+ms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o2VJjC3p1nXXay2wxIp//mudg7YZR3pmBgxLNBaMaSb7GBN6WIFRMCKOFGLP3Cp8z
	 tM6iYuDuK5NCyo0WXcFGFxXDKS/XMCJ1yMLmyUsJ4/i/M6YM7TJm9DPTkE9ai/tAXv
	 rtIIDvMCng2Jgj6HjPNmB4C2LEUhd5BXRtLGCAbMQefepklzRywNWZvOGxwbigso+H
	 5KjlRf34qAwsMNlhz46ZZTYQ9Il3jXolNSmO4MR33gyOY7ROrLGq3q6ydJPCleT0mK
	 VYqK/k/y6U7gfaJ2yY9oJfZzHQH/0a8SY+/gmI8aWAyshUTmHW48ZmBcGpUlaT3/if
	 AJ6nSDbLAHlqg==
Message-ID: <sashiko-outbox-190647@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: chipidea: otg: fix fsm deadlock and B-device
 gadget registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261030071921.276377-1-xu.yang_2@oss.nxp.com>
References: <20261030071921.276377-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:32:30 +0000
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
- [High] usb: chipidea: ci_role_start() in ci_hdrc_otg_fsm_init() zeroes ci=
->gadget
- [High] usb: chipidea: mutex_trylock() in ci_udc_stop_for_otg_fsm() drops =
FSM reset
- [High] usb: chipidea: ci_hdrc_otg_fsm_init() starts gadget before IRQ and=
 PM setup
- [Medium] usb: chipidea: ci_role_start() failure in ci_hdrc_otg_fsm_init()=
 leaks wq
- [Medium] usb: chipidea: ci_get_role() in ci_hdrc_probe() overwrites FSM c=
i->role
--

commit 654769b6450cc8234eb867172a8eeda3be413ebe
Author: Xu Yang <xu.yang_2@nxp.com>

usb: chipidea: otg: fix fsm deadlock and B-device gadget registration

This commit addresses two OTG FSM regressions from dynamic gadget support by
using mutex_trylock() in ci_udc_stop_for_otg_fsm() to avoid a self-deadlock=
 on
ci->fsm.lock and by calling ci_role_start(ci, CI_ROLE_GADGET) in
ci_hdrc_otg_fsm_init() when starting as a B-device.

> diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fs=
m.c
> index 642729893cc20..6d6baea69b687 100644
> --- a/drivers/usb/chipidea/otg_fsm.c
> +++ b/drivers/usb/chipidea/otg_fsm.c
> @@ -840,6 +840,12 @@ int ci_hdrc_otg_fsm_init(struct ci_hdrc *ci)
>  			hw_read_otgsc(ci, OTGSC_BSV) ? 1 : 0;
>  		/* Enable BSV irq */
>  		hw_write_otgsc(ci, OTGSC_BSVIE, OTGSC_BSVIE);
> +
> +		retval =3D ci_role_start(ci, CI_ROLE_GADGET);

[Severity: High]
Does calling ci_role_start(ci, CI_ROLE_GADGET) here wipe out
ci->gadget.hnp_polling_support?

Earlier in ci_hdrc_otg_fsm_init(), hnp_polling_support is initialized on
ci->gadget:

drivers/usb/chipidea/otg_fsm.c:ci_hdrc_otg_fsm_init() {
	...
	ci->fsm.ops =3D &ci_otg_ops;
	ci->gadget.hnp_polling_support =3D 1;
	ci->fsm.host_req_flag =3D devm_kzalloc(ci->dev, 1, GFP_KERNEL);
	...
}

When ci_role_start(ci, CI_ROLE_GADGET) runs, it calls udc_start(), which
zeroes the entire ci->gadget structure and does not restore
hnp_polling_support:

drivers/usb/chipidea/udc.c:udc_start() {
	...
	memset(&ci->gadget, 0, sizeof(ci->gadget));

	ci->gadget.ops          =3D &usb_gadget_ops;
	...
}

The same memset() in udc_start() also runs on host-to-gadget role switches =
in
ci_otg_start_host() -> ci_role_start(ci, CI_ROLE_GADGET), clearing both
ci->gadget.hnp_polling_support and ci->gadget.is_a_peripheral, which causes
composite_setup() to reject OTG_STS_SELECTOR status polling requests with
-EOPNOTSUPP.

[Severity: High]
Can starting CI_ROLE_GADGET inside ci_hdrc_otg_fsm_init() also trigger OTG =
FSM
work before ci->irq and runtime PM are initialized in ci_hdrc_probe()?

In ci_hdrc_probe(), ci_hdrc_otg_init() -> ci_hdrc_otg_fsm_init() runs before
devm_request_irq() and pm_runtime_enable(). Calling
ci_role_start(ci, CI_ROLE_GADGET) invokes udc_start() -> usb_add_gadget_udc=
().
If a gadget driver is already registered, it binds synchronously:

usb_add_gadget_udc()
  -> gadget_bind_driver()
    -> ci_udc_start()
      -> ci_hdrc_otg_fsm_start()
        -> ci_otg_queue_work()

Because ci->fsm.id is 1, ci_udc_start() immediately calls
ci_hdrc_otg_fsm_start():

drivers/usb/chipidea/udc.c:ci_udc_start() {
	...
	/* Start otg fsm for B-device */
	if (ci_otg_is_fsm_mode(ci) && ci->fsm.id) {
		ci_hdrc_otg_fsm_start(ci);
		return retval;
	}
	...
}

ci_otg_queue_work() calls disable_irq_nosync(ci->irq) before ci->irq has be=
en
requested and queues ci_otg_work before runtime PM and extcon are set up. W=
hen
devm_request_irq() subsequently runs irq_startup(), the IRQ disable depth is
reset to 0, causing the later enable_irq(ci->irq) in ci_otg_work() to warn =
on
an unbalanced IRQ enable.

In addition, if usb_role_switch_register(), devm_request_irq(), or
ci_extcon_register() fails in ci_hdrc_probe(), the error path runs deinit_o=
tg
(destroying ci->wq) before deinit_gadget, where ci_hdrc_gadget_destroy() ->
udc_stop() -> ci_udc_stop_for_otg_fsm() can still touch the OTG FSM.

[Severity: Medium]
As reported by Sashiko on v1 [1], if ci_role_start() fails in
ci_hdrc_otg_fsm_init(), does this error path leak ci->wq and leave OTGSC_AV=
VIE
and OTGSC_BSVIE enabled in hardware?

ci_hdrc_otg_init() allocates ci->wq before calling ci_hdrc_otg_fsm_init():

drivers/usb/chipidea/otg.c:ci_hdrc_otg_init() {
	INIT_WORK(&ci->work, ci_otg_work);
	ci->wq =3D create_freezable_workqueue("ci_otg");
	if (!ci->wq) {
		dev_err(ci->dev, "can't create workqueue\n");
		return -ENODEV;
	}

	if (ci_otg_is_fsm_mode(ci))
		return ci_hdrc_otg_fsm_init(ci);

	return 0;
}

And in ci_hdrc_probe(), a failure from ci_hdrc_otg_init() jumps directly to
deinit_gadget, bypassing deinit_otg where ci_hdrc_otg_destroy() would destr=
oy
ci->wq and disable the OTGSC interrupts:

drivers/usb/chipidea/core.c:ci_hdrc_probe() {
	...
	if (ci->is_otg && ci->roles[CI_ROLE_GADGET]) {
		ret =3D ci_hdrc_otg_init(ci);
		if (ret) {
			dev_err(dev, "init otg fails, ret =3D %d\n", ret);
			goto deinit_gadget;
		}
	}
	...
}

> +		if (retval < 0) {
> +			sysfs_remove_group(&ci->dev->kobj, &inputs_attr_group);
> +			return retval;
> +		}
>  	}

[Severity: Medium]
As reported by Sashiko on v1 [2], can ci->role become out of sync with the
running role when ci_hdrc_probe() later calls ci_get_role(ci)?

ci_role_start(ci, CI_ROLE_GADGET) sets ci->role =3D CI_ROLE_GADGET when
ci->fsm.id is 1, but ci_hdrc_probe() subsequently overwrites ci->role by
re-reading OTGSC_ID without starting or stopping roles in FSM mode:

drivers/usb/chipidea/core.c:ci_hdrc_probe() {
	...
	ci->role =3D ci_get_role(ci);
	if (!ci_otg_is_fsm_mode(ci)) {
		ret =3D ci_role_start(ci, ci->role);
	...
}

If the ID pin changes from 1 to 0 between ci_hdrc_otg_fsm_init() and
ci_get_role(), ci->role is overwritten to CI_ROLE_HOST while CI_ROLE_GADGET
remains active, so a subsequent ci_role_stop() will call host_stop() instead
of udc_stop().

> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index c29b2d0dcc7c8..1e0d295f5431a 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -2167,7 +2167,8 @@ static void ci_udc_stop_for_otg_fsm(struct ci_hdrc =
*ci)
>  	if (!ci_otg_is_fsm_mode(ci))
>  		return;
> =20
> -	mutex_lock(&ci->fsm.lock);
> +	if (!mutex_trylock(&ci->fsm.lock))
> +		return;

[Severity: High]
As reported by Sashiko on v1 [3], what happens if a gadget driver is unbound
from userspace while another thread holds ci->fsm.lock?

For example, if userspace unbinds the gadget driver (gadget_unbind_driver()=
 ->
usb_gadget_udc_stop_locked() -> ci_udc_stop() -> ci_udc_stop_for_otg_fsm())
at the same time another CPU holds ci->fsm.lock in an OTG sysfs store handl=
er
such as b_bus_req_store(), a_bus_req_store(), a_bus_drop_store(), or
a_clr_err_store(), or in otg_statemachine() for an unrelated event,
mutex_trylock() will fail and ci_udc_stop_for_otg_fsm() will return early:

drivers/usb/chipidea/udc.c:ci_udc_stop_for_otg_fsm() {
	if (!ci_otg_is_fsm_mode(ci))
		return;

	if (!mutex_trylock(&ci->fsm.lock))
		return;
	if (ci->fsm.otg->state =3D=3D OTG_STATE_A_PERIPHERAL) {
		ci->fsm.a_bidl_adis_tmout =3D 1;
		ci_hdrc_otg_fsm_start(ci);
	} else if (ci->fsm.otg->state =3D=3D OTG_STATE_B_PERIPHERAL) {
		ci->fsm.protocol =3D PROTO_UNDEF;
		ci->fsm.otg->state =3D OTG_STATE_UNDEFINED;
	}
	mutex_unlock(&ci->fsm.lock);
}

In OTG_STATE_B_PERIPHERAL, skipping the reset leaves ci->fsm.protocol set to
PROTO_GADGET and ci->fsm.otg->state set to OTG_STATE_B_PERIPHERAL after
ci->driver is cleared, preventing a later gadget rebind from re-entering
OTG_STATE_B_PERIPHERAL and enabling the pull-up. In OTG_STATE_A_PERIPHERAL,
skipping a_bidl_adis_tmout =3D 1 and ci_hdrc_otg_fsm_start() leaves the A-d=
evice
stuck in OTG_STATE_A_PERIPHERAL without a bound gadget driver.

[1] https://lore.kernel.org/r/20261015084140.61544-1-xu.yang_2@oss.nxp.com
[2] https://lore.kernel.org/r/20261015084140.61544-1-xu.yang_2@oss.nxp.com
[3] https://lore.kernel.org/r/20261015084140.61544-1-xu.yang_2@oss.nxp.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030071921.2763=
77-1-xu.yang_2@oss.nxp.com?part=3D1

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9E04908AF;
	Thu, 15 Oct 2026 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055903; cv=none; b=QhjlzVHi0qVpbLdBZh0J9xp1AGUxbTwAnBglb6S0LxezGCVKpXZeQXG1wvlnEbV1nyhXzyjHKJozwd2zofNUv2zamDJBmxTFlKEd2ThdnbdJcOGE5/BFb9ArJgE33j7XNR9q0aB+nG9JlxKLpvEQdzWfu+RnpSk1jSSaw8ti21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055903; c=relaxed/simple;
	bh=99OWVA7qzNNDoX8gL0gzJ8GQOJyhSiGEbNZEf+X+AZU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=I0CWUtWqTrEY+dXQ/caW6jGz8u9sWwSctyQYBVg42TWrHoW7OPsmBRtSmJFChzvYp5tAMNQMKtqeYbgOfnM/gDnWxLsQD/mTYOWtF5E7VS4rqnUkdVemJtijpjUNUQ4+iYYhzygPIBkQxkCZCOhJO2NEt0NuCQ9ZZXwvC1CXoz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fVkdIizr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fVkdIizr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F8D1F000C4;
	Thu, 15 Oct 2026 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055901;
	bh=j/GId1WSGt3DChVkrft8jp6mc5PUb7LWRrXmjYk0mTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fVkdIizrDvmdZxECxXtMcxOmRbnctW+DYly9QfkGSXH+amlWDVlmqu7qd1FhqvjGn
	 1InvS7IPZOXilXviOu8WJb0rchmfSWA0tAjwyyl9evaEAPWGvV4PK57+PHG1I2u2f+
	 vKxHPTvwnzCL3QUpJ7OGE8MZR/qHotSW+LoyTwGOLfQzekzb+4wxLv2L/BnpJAfydu
	 lB1kGqOdvLWvw0Jtqmk1Ln0Mq0+anz+lg4bJbGPdkhpY5WnLGiDKvbtfFd2n58UyX/
	 LLNQJUfpMQZOThD1FCJBXWVgAkTnowss0hJ4OlJn9dCGUFzavlS2IKQV4d0Vpm3IT6
	 EiKTkiKgzistw==
Message-ID: <sashiko-outbox-172558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: otg: fix fsm deadlock and B-device
 gadget registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
References: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:18:20 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] usb: mutex_trylock causes FSM state desync on concurrent gadget un=
bind
- [High] usb: chipidea: ci->role tracking overwritten causing role leak
- [Medium] usb: sysfs group and interrupt leak on ci_role_start failure
--

commit d4ddf8577a4cff784c649763c60a4691a5af4109
Author: Xu Yang <xu.yang_2@nxp.com>

usb: chipidea: otg: fix fsm deadlock and B-device gadget registration

This commit fixes a self-deadlock on gadget-to-host role switches during
OTG FSM state transitions by changing to mutex_trylock. It also ensures the
B-device gadget UDC is properly registered in FSM mode by invoking
ci_role_start.

Closes: https://lore.kernel.org/linux-usb/8e659c4f-723b-4241-9c2b-8ea42c6c3=
600@gmail.com

> diff --git a/drivers/usb/chipidea/otg_fsm.c b/drivers/usb/chipidea/otg_fs=
m.c
> --- a/drivers/usb/chipidea/otg_fsm.c
> +++ b/drivers/usb/chipidea/otg_fsm.c
> @@ -840,6 +840,8 @@ int ci_hdrc_otg_fsm_init(struct ci_hdrc *ci)
>  			hw_read_otgsc(ci, OTGSC_BSV) ? 1 : 0;
>  		/* Enable BSV irq */
>  		hw_write_otgsc(ci, OTGSC_BSVIE, OTGSC_BSVIE);
> +
> +		return ci_role_start(ci, CI_ROLE_GADGET);

[Severity: Medium]
Does this return path potentially leak the inputs_attr_group and
ci_otg_wq resources if ci_role_start fails?

Earlier in ci_hdrc_otg_fsm_init, inputs_attr_group is registered in sysfs
and the OTGSC_BSVIE interrupt is enabled just above this new call. If
ci_role_start returns an error, it appears this immediately propagates up to
ci_hdrc_probe, bypassing local cleanup like removing the sysfs group and
disabling the interrupt.

Furthermore, returning an error here propagates to ci_hdrc_probe, which
jumps to the deinit_gadget label, bypassing the deinit_otg label where the
ci_otg_wq workqueue would normally be destroyed.

[Severity: High]
Could this also cause the ci->role tracking state to become corrupted
during probe?

This new call to ci_role_start internally sets ci->role =3D CI_ROLE_GADGET.
However, when returning back to ci_hdrc_probe, the code unconditionally
executes:

ci->role =3D ci_get_role(ci);

If the ID pin changes from 1 to 0 in the brief window between
ci_hdrc_otg_fsm_init and ci_get_role during probe, ci->role is overwritten
to CI_ROLE_HOST while the CI_ROLE_GADGET role remains actively running. When
the FSM later transitions and attempts to stop the current role via
ci_role_stop, it uses the corrupted ci->role state to stop the non-existent
Host role instead of the running Gadget role, which can lead to both drivers
being active simultaneously.

>  	}
> =20
>  	return 0;

[ ... ]

> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
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
Can this mutex_trylock abort state cleanup on contention from unrelated
threads?

The commit message notes this is to fix a self-deadlock when the FSM thread
already holds the lock. However, mutex_trylock returns false if any thread
holds the lock, not just the current thread.

If an independent thread unbinds the gadget driver (e.g. via sysfs or module
unload) while the FSM worker thread happens to hold the lock for an
unrelated state transition, mutex_trylock will fail here.

The unbind thread would then silently return, skipping the necessary
OTG_STATE_UNDEFINED and PROTO_UNDEF state resets. This would leave the FSM
in an inconsistent state while the driver is unbound, causing it to ignore
future events.

>  	if (ci->fsm.otg->state =3D=3D OTG_STATE_A_PERIPHERAL) {
>  		ci->fsm.a_bidl_adis_tmout =3D 1;
>  		ci_hdrc_otg_fsm_start(ci);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015084140.6154=
4-1-xu.yang_2@oss.nxp.com?part=3D1

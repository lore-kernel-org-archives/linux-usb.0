Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794440111;
	b=W5xHsNKSazczOfkh+V/lCgwymZJFRjmw5yOCuyxNP5jpTUtPeI8DUjSUVnA7RlabIXqu
	 jyf8Zug59JPW2YnFYJeud+Y0liR0xAYaSAHhCWq6Xcr4hlRaGjO/P7B0oGNyZuf78OJvI
	 6BqyIMuzAp1M8w2LR3BWugCFIxFw5hCiq/eXXNhkK85CbTJIyRJBflbyz/PMwnD9ZQFxq
	 guA5MTT4ZRp5TRMDU0iPLcsGyBfLe2lm0U9sThXu5A0D8yj+h+fk4uUho4pMVpTmuoe/5
	 Bb02Jm9vmi9oH0/W5tDUdR/tQkWdfwV7kAFNvSh1zG+gtAev8eDMyIdTBod57eTG6/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794440111;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=niHYVZTKxVrEgNK9Ga4N8DZfbphYs96qrtKGlto1+dI=;
	b=FbJTfk27QotzNnwtipJIxG4j5lIIKHmAttuB08sZHR4WjNxRPu9rAjiYjGu4PCssl/kf
	 0Bsz35X+cC6K1RcDBP/ENvM/dAYW0k3t4p3+Q0MRyLy8FHXGkBP91Cr0TbL+vy0KCHFFH
	 iRfHrxk7s4uraNrBbZAfEH6qLpNBOj3cl14FMbWRXHjrr8e248FD7N2qaR3sk8ubH7WNK
	 3KSSOLWv9hgAnbUS4j7e2ESB+oOASbbva3/k7CIaLVztKsYQWTpGVR50FqCIYfoPBOmzK
	 GLEqXDy3hNH3MxChUOmhSBiG0EZ6UWTNLeCkink1C/5uaDtNYlwUZlPo2cNjCUv51Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdFxmjj1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CC606A32E
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 23:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdFxmjj1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7B81F00A07;
	Wed, 11 Nov 2026 23:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794440111;
	bh=niHYVZTKxVrEgNK9Ga4N8DZfbphYs96qrtKGlto1+dI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mdFxmjj18v8M4IryTp3ZdCzjAPW7Ez/5zLoH42Hm5oWV+Lc3EJU0f9LX0Mt6EjPBW
	 gUN4vxH/ZLq26wQLwisrrh5Ch1mGRnkBEnAPyAZ0eb92KorTf6AOzKaIdUT5tQXJhL
	 VFRPNJ3flyfnJI5OlLnH6PSnFwM11BftGCoK00Qk+nJ9KrTYXdfezQ7oGcEKuo5dkN
	 Tn9WTS6Mab3PjcijzeDjuE4CHSI0XYmiwTJfvPgq0Bmah5dpropVtc2HASjJprdYbd
	 od8TOJuKoOtc+xxcZVs+sU5b16ZHLuTSMDXPj9523noUfuuI7s1RF65+MaeS3DDA82
	 oMzrbYoydbJ8g==
Message-ID: <sashiko-outbox-209858@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: Optionally keep PCIe tunnels up through
 suspend-to-idle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Rusu de Castro" <arc@empyreal.works>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>
References: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 23:35:11 +0000
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
- [High] thunderbolt: active ctl channel and hotplug work during s2idle
  in tb_suspend_noirq()
--

commit a20dd878deb9dda7dcf5deb8740b9a979bcccdaa
Author: Andrei Rusu de Castro <arc@empyreal.works>

thunderbolt: Optionally keep PCIe tunnels up through suspend-to-idle

This commit adds a thunderbolt.s2idle_keep_pcie module parameter to keep
the domain, control channel, and routers running during suspend-to-idle
when a PCIe tunnel is active.

> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index 24611f05b3cda..168a286cd516b 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -535,7 +535,7 @@ int tb_domain_suspend_noirq(struct tb *tb)
>  	mutex_lock(&tb->lock);
>  	if (tb->cm_ops->suspend_noirq)
>  		ret =3D tb->cm_ops->suspend_noirq(tb);
> -	if (!ret)
> +	if (!ret && !tb->kept_running)
>  		tb_ctl_stop(tb->ctl);
>  	mutex_unlock(&tb->lock);
> =20

[ ... ]

> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index f54ab2189cf42..c453153c2ef12 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -1145,6 +1156,9 @@ static int nhi_resume_noirq(struct device *dev)
>  	struct tb_nhi *nhi =3D tb->nhi;
>  	int ret;
> =20
> +	if (tb->kept_running)
> +		return tb_domain_resume_noirq(tb);
> +
>  	/*
>  	 * Check that the device is still there. It may be that the user
>  	 * unplugged last device which causes the host controller to go
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 418ad0a61a5de..641502ec2efa4 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c

[ ... ]

> @@ -3106,10 +3108,45 @@ static int tb_start(struct tb *tb, bool reset)
> +static int tb_suspend_noirq(struct tb *tb)
> +{
> +	struct tb_cm *tcm =3D tb_priv(tb);
> +
> +	if (tb_keep_running_s2idle(tb)) {
> +		tb_dbg(tb, "PCIe tunnels active, keeping the domain running\n");
> +		tb->kept_running =3D true;
> +		return 0;
> +	}
> +
>  	tb_dbg(tb, "suspending...\n");
>  	tb_disconnect_and_release_dp(tb);
>  	tb_switch_exit_redrive(tb->root_switch);
> @@ -3177,6 +3214,12 @@ static int tb_resume_noirq(struct tb *tb)
>  	unsigned int usb3_delay =3D 0;
>  	LIST_HEAD(tunnels);
> =20
> +	if (tb->kept_running) {
> +		tb->kept_running =3D false;
> +		tb_dbg(tb, "domain kept running, tunnels intact\n");
> +		return 0;
> +	}
> +
>  	tb_dbg(tb, "resuming...\n");

[Severity: High]
Can leaving tb->ctl running and tcm->hotplug_active set in
tb_suspend_noirq() cause hotplug and DisplayPort bandwidth work to run
while devices are suspended in the noirq phase?

tb_ctl_alloc() allocates ctl->tx and ctl->rx with Ring_Flag_No_Suspend,
so the control channel interrupt stays enabled across suspend_device_irqs()
without arming wakeup, and tb_domain_alloc() creates tb->wq without
Wq_Freezable.  If a connected monitor enters standby after the GPU
suspends and sends a DisplayPort notification, or a cable is plugged or
unplugged during suspend-to-idle, tb_handle_hotplug() or
tb_handle_dp_bandwidth_request() runs while runtime power management is
disabled on all devices.

In that state, pm_runtime_get_sync() fails with -Eacces, a plug event
calls tb_switch_add() -> device_add() -> device_pm_add() under a prepared
parent (warning and placing unsuspended devices on dpm_list while their
parents are on dpm_noirq_list), and an unplug event tears down tunnels and
unregisters switches while downstream PCI devices are suspended.

In addition, returning early in nhi_resume_noirq() and tb_resume_noirq()
skips the nhi->ops->is_present() check and tb_free_unplugged_children() if
the enclosure was unplugged during sleep.  Should this path set
tcm->hotplug_active =3D false and stop tb->ctl like tb_freeze_noirq() and
tb_domain_freeze_noirq() do when keeping tunnels up across freeze, and
still check presence and clean up unplugged devices on resume?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-tb-s2idle-=
keep-pcie-2a2a66a2@empyreal.works?part=3D1

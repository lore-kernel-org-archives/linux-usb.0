Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793162030;
	b=ugycKpFxi9dvfN009IsrSx4Xtsqcrg5yLVGlhBDQiBLjkZWhA8xxMQ6/8d0LCK6LfEXF
	 w4bUCnQ7ZtqAi4owaSnzMk6pY32j1otoaqIuba0Swze4oljuMoViP/JbYZfbjX4sxfiMZ
	 Q12aLeeGDorOXQaf+3Pc0wROjnxCpu8ltoue+wY2jyTH0BL+mDGH/k2QWLnMVI1nnaxpy
	 hgMEPOd7dsZ1o0Z2bgH657FIEmdOKmmjzRjkxRM5c0cq+mgZ0Z8FenN9tUUGcMO2a1Q8K
	 3FSleiwo+S9GHFpvuKKaDT0m1MMD7mfMbn9WbrxXfJw0wjOBSdZ5eHWEwdU8GBkCsOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793162030;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nzsX/irIZtRm7d+8R9X4ir9Wlwvtj7BHG7BG+dJa/QY=;
	b=r4o+WXkRqgoi4EAbRPtA8mlGsyi7W3f8QqDNwKtGD0EDsQ47QPByGqFszyT5F7NcKZAR
	 bse4HhD9/sQXScNnpqMBBFfP71t+9RHXuJyOOhjvcvGvLp3ZYHJ2ld3yspYq+QJH+QxYy
	 ewEW4dAdXzSjOKE45JavZkP1zTtWJNptALIg1WbZy0abm2Mh9pU9RLWWXupJs3mh1oCPU
	 2Dhpiij9/qMV3+L0WnxeG/P7zmv0dYgTJ3U4BJnH7dvK0kgRQPK4JKCklqZ0WviATnYar
	 algURkG5+8aXsmRUuWUUiI07z3g/BvioPkMOpqTrFz8QXgjKrspt5j23O2w+Zn92M3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDtZfOfy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E23606A31A
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UDtZfOfy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9A51F01829;
	Wed, 28 Oct 2026 04:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793162030;
	bh=nzsX/irIZtRm7d+8R9X4ir9Wlwvtj7BHG7BG+dJa/QY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UDtZfOfyzjAvPncHKorW+N6wmfGZdy5PyG+KgsdvVHlrO6EKDSDpeegWdG4R/1RYP
	 fKy1I0naoBD6nJTK+Q1fyBK/kAm00y7WJeEB7dCY0Uq1Zsk9xU1b2RkHNlBQk9qTx7
	 uxGhXcz1zZ6PAQ76S1oUdqYIILYh7uapS+7fko0MCfsl9u6U/GBo55fU5wYnsZ7EBU
	 IcD0V1/4q070F4uDkH2N7U199BOyfcRHzVOgJeP/FzpkuDf1My3vq6jM8RWdzRbD7w
	 UvNuCVJtS5w8jn4J2tKGLL4ThMkkgKWujy7/DMRVrontEC0FkXfJmybCv9IRP/UmB/
	 n1o9q40tP07wQ==
Message-ID: <sashiko-outbox-187489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: raise root-hub autosuspend delay to stop a
 busy-loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jianping Liu" <frankljpliu@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261028041859.1061836-1-frankljpliu@gmail.com>
References: <20261028041859.1061836-1-frankljpliu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 04:33:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: core: usb_runtime_suspend() clobbers root-hub autosuspend_d=
elay
--

commit 60580cc9fa143b8fbfd60c5978507dea53f76384
Author: Jianping Liu <frankjpliu@tencent.com>

usb: core: raise root-hub autosuspend delay to stop a busy-loop

This commit updates usb_runtime_suspend() to set the root-hub autosuspend
delay to 1000 ms when runtime suspend fails while the delay is 0, and
resets any non-zero delay back to 0 when runtime suspend later succeeds.

> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index d3a61ebc6afb0..30965d6ffd677 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -2008,6 +2008,20 @@ int usb_runtime_suspend(struct device *dev)
>  	if (status =3D=3D -EAGAIN || status =3D=3D -EBUSY)
>  		usb_mark_last_busy(udev);
> =20
> +	/*
> +	 * Root hubs use 0ms delay, so a persistent -EBUSY retries with no
> +	 * wait and pins one CPU at 100%. Set autosuspend_delay to 1000ms
> +	 * on fail, then back to 0 ms on success.
> +	 */
> +	if (!udev->parent) {
> +		int delay =3D READ_ONCE(dev->power.autosuspend_delay);
> +
> +		if (unlikely(status !=3D 0 && delay =3D=3D 0))
> +			pm_runtime_set_autosuspend_delay(dev, 1000);
> +		if (unlikely(status =3D=3D 0 && delay !=3D 0))
> +			pm_runtime_set_autosuspend_delay(dev, 0);
> +	}

[Severity: Medium]
Can this unconditionally overwrite user-configured or driver-configured
dev->power.autosuspend_delay values on root hubs and drop the runtime PM
usage reference when racing with negative delay writes?

First, userspace can configure a custom positive delay on a root hub via
autosuspend_delay_ms_store() in drivers/base/power/sysfs.c or
autosuspend_store() in drivers/usb/core/sysfs.c, and child USB device
drivers may also adjust their parent hub's delay during probe as noted in
hub_probe() in drivers/usb/core/hub.c. Because usb_runtime_suspend() does
not track whether the non-zero delay was set by a prior suspend failure,
won't the first successful root-hub runtime suspend see status =3D=3D 0 and
delay !=3D 0 and reset the custom delay back to 0?

Conversely, if a transient suspend failure occurs while delay =3D=3D 0 (for
instance, -EBUSY when a device connects to a port) and the newly connected
device keeps the root hub active afterward, dev->power.autosuspend_delay
remains left at 1000 ms in sysfs.

Second, __rpm_callback() in drivers/base/power/runtime.c releases
dev->power.lock while dev->power.runtime_status is RPM_SUSPENDING before
invoking usb_runtime_suspend(). If userspace concurrently writes a negative
delay to disable autosuspend via autosuspend_store() or
autosuspend_delay_ms_store(), pm_runtime_set_autosuspend_delay() calls
update_autosuspend() in drivers/base/power/runtime.c:

drivers/base/power/runtime.c:update_autosuspend() {
	if (dev->power.use_autosuspend && delay < 0) {

		/* If it used to be allowed then prevent it. */
		if (!old_use || old_delay >=3D 0) {
			atomic_inc(&dev->power.usage_count);
			rpm_resume(dev, 0);
		} else {
			trace_rpm_usage(dev, 0);
		}
	}

	/* Runtime suspend should be allowed now. */
	else {

		/* If it used to be prevented then allow it. */
		if (old_use && old_delay < 0)
			atomic_dec(&dev->power.usage_count);

		/* Maybe we can autosuspend now. */
		rpm_idle(dev, RPM_AUTO);
	}
}

Inside rpm_resume(), because runtime_status is RPM_SUSPENDING, the caller
releases dev->power.lock and sleeps on dev->power.wait_queue waiting for
the suspend callback to complete.

When usb_suspend_both() finishes in usb_runtime_suspend():

1. If status =3D=3D 0, READ_ONCE(dev->power.autosuspend_delay) sees the neg=
ative
   delay (delay !=3D 0) and calls pm_runtime_set_autosuspend_delay(dev, 0).
2. If status !=3D 0 and READ_ONCE(dev->power.autosuspend_delay) read 0 just
   before the concurrent writer set the negative delay, it calls
   pm_runtime_set_autosuspend_delay(dev, 1000).

In both cases, wouldn't update_autosuspend() see old_use && old_delay < 0,
overwrite the negative delay with 0 or 1000, and execute
atomic_dec(&dev->power.usage_count), undoing the usage_count increment and
re-enabling autosuspend?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028041859.1061=
836-1-frankljpliu@gmail.com?part=3D1

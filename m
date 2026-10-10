Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BB363C73;
	Sat, 10 Oct 2026 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626365; cv=none; b=Pqi71+0bmPMpJdHJaqZrkEFtL9SmM6iE4JYMaZcZcDFe2ZwCD7dUWnKKqPMO0V4BJM4HYedHOliPVDpwfdNnTUNdcetSuXKIYheew+0qT+puU7jOX3NiUgmrTTEiQgqX/kTFgxZKaa4FEWxncjZWdpAqoJGxYqF0EjYdCi/nO8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626365; c=relaxed/simple;
	bh=AjElDOUm60v1Ix01VHxWS47/dRXXxpB47ZgYBE+CEy4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tDsT+/hcasP3wlIvILLln9jQ0VI2vzG/Lzt5g63WrfTtJ2le0uqC8UHO5avVYsD3Qb2yFhdTRe1rLLkF0HYKkAVowrCtmstb4z8786NbTDwxijzNadO6eIOcmg9b+GRuj9Y1LoPVEEflcst5lBxhT/xkTn5KTGiRi0H+XIh5rt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TB/BpCxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TB/BpCxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F35E1F000FF;
	Sat, 10 Oct 2026 09:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791626363;
	bh=OL9qrSFNi5Uyz2iM7mk/hbZcYsSEjsXWQqERcUGbsl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TB/BpCxP4cfJGAAiNhi4ZMG+PP8DFAVzPbND+T677HmfriDxgftINhZK4nXdFMbol
	 FvI87PaeK1PrkpzV0ntPI+D50dmsdbm8EtoloAb7E7ATbD3KzEfoXIx3WESfekOUXA
	 nhEnjtkJFU+dz2YkWOgUtCHsIgAx/5ALe8T/Z3RjMjI3D7BC1Nav3p2ATBaBJgh4ak
	 J8hiDuyXw9GWS9zAHNghNEuKrkmrRcmLKUoOVt27iA182vC3FIJI+jn6mHF8VnjHvO
	 6TumxIzl6D0AJjBQyQKM0IIb6Mmh/+4f58G+bVdBJGKjvINzetjSRM5jeYFSvh7050
	 zcYe6VqPYoUIA==
Message-ID: <sashiko-outbox-166407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v7 3/3] usb: typec: tipd: Add sn201202x support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261010-tipd-ace3-v7-3-317218a96c01@chaosmail.tech>
References: <20261010-tipd-ace3-v7-0-317218a96c01@chaosmail.tech>
 <20261010-tipd-ace3-v7-3-317218a96c01@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:59:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: typec: tipd: Use-after-free of update_work on probe error path
- [Medium] usb: typec: tipd: sn201202x misses no_mode_control flag
--

commit 40f5bd6453edf7ec57cd88e8cdccab03d3c071c0
Author: Sasha Finkelstein <k@chaosmail.tech>

usb: typec: tipd: Add sn201202x support

Add support for sn201202x (aka ACE3), a tipd variant that uses a very
similar register map, that is exposed over a "logical register"
interface on the SPMI bus.

> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1962,11 +1962,32 @@ static const struct tipd_data tipd_tps25750_data =
=3D {
[ ... ]
> +static const struct tipd_data tipd_sn201202x_data =3D {
> +	.irq_handler =3D cd321x_interrupt,

[Severity: Medium]
Should .no_mode_control =3D true be set here?

The sn201202x Type-C controller autonomously manages alternate mode
negotiation in hardware. By omitting .no_mode_control =3D true, the Type-C
core assumes the OS can control alternate modes, incorrectly exposing the
active and priority sysfs attributes as writable.

If a userspace daemon attempts to activate a mode via sysfs, the kernel
state will update without any hardware action, leading to a disjoint state
between kernel and hardware.

> +	.irq_mask1 =3D APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_PLUG_EVENT,
> +	.tps_struct_size =3D sizeof(struct sn201202x),
> +	.remove =3D cd321x_remove,
> +	.register_port =3D cd321x_register_port,
> +	.unregister_port =3D cd321x_unregister_port,

[Severity: High]
Can this cause a use-after-free on the probe error path?

If devm_request_threaded_irq() or any subsequent step fails in tipd_init()
after .connect has been called (e.g., when a partner is already plugged in
at boot), the error path jumps to err_unregister_port.

This path calls tps->data->unregister_port() (which maps to
cd321x_unregister_port here) but fails to invoke .remove or explicitly
cancel the pending cd321x->update_work delayed work.

The probe function returns an error, causing the devres framework to free
the struct sn201202x containing the work item. When the scheduled work
eventually executes on the system workqueue, it dereferences the freed
memory.

Is there a way to ensure cancel_delayed_work_sync(&cd321x->update_work) is
called during this error unwind?

> +	.trace_data_status =3D trace_cd321x_data_status,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-tipd-ace3-=
v7-0-317218a96c01@chaosmail.tech?part=3D3

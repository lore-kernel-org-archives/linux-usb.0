Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E404BD0FD
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827517; cv=none; b=iuVBe1+nZxMgCOGnT2tNjyi8VjHyAGl2FFQn50YyksDIomEhr9Horu5JviWT8Wybd2WdPZwKTVjJ1pxubR1t7be7IjpWsDhkpqDG5h7D2qcQTznLmnc8oj8t13yMOsI0iZzl0gjVUw1yUD2DERjYCHKqg76gUlOS/5GGoNbzAX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827517; c=relaxed/simple;
	bh=FPeZO6kRnaVnfEa6tJEzq+IPci3uemVVqh1mMlnlWes=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hUU7lj4eoIMwRmaH6ROjILdypjvDCfzS+ePs2ubrU1UmpOAkpIuJztOhCKR1KyZYOOeT01sXagdOs2Je25CwMBErxY6o4POXrkkz8P/9aubkAdKSe4ifNRAAmxRqAEFmB4MIB008WnAdRCTsqKS/E2rv82nSnsWikqsA2t8IeGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fl8FBaTY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fl8FBaTY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEA31F008A1;
	Mon, 12 Oct 2026 17:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827515;
	bh=VElHZhPATFcGfnb/C0CUTPXhLyMgVMt7Wp/pEevrMtU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fl8FBaTY0cxS8gTXzWYFKkRFz492dAerHMv6CnDi6jq7jtB3WBM0eEw+44pQcdY+o
	 hNpl+vFluOb8e4EUaFSGd//Ysb2bAU6lY+8XFiO3B6vw1XC3M7+FcTn6iQu0z1w+LP
	 tasuK1zGEjdqxkSCfBPIAaALP+YwtmpoEkkLVfWLIrVsKuokFYCgPVa+opns59U/I/
	 wtSMnn+S//LhQsZFh4EcszNBDODB5Fhjp6XjiOKZ7BKmB7WwLrf4gjmoYPcdYLytvo
	 vdgfpYx+C0XWlvaOkGYHwO68d/VNral2m5lfGOGyV4Jgg+kNK1sHlQyFbaa2FPCLVH
	 ve5QBjJQujACg==
Message-ID: <sashiko-outbox-168499@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] ipmi: Add NVIDIA LSTP IPMI BMC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:51:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] devres: device mismatch in devm_add_action_or_reset causes UAF and=
 resource leak
--

commit 9f3744092e4398b83c4dd08ac11a951e27142671
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

ipmi: Add NVIDIA LSTP IPMI BMC driver

This commit adds a BMC-side driver for the IPMI channels of NVIDIA LSTP USB
adapters. The adapter carries IPMI messages between the host and the BMC,
exposing each channel as an ipmi-lstp<n> character device.

> diff --git a/drivers/char/ipmi/ipmi-lstp.c b/drivers/char/ipmi/ipmi-lstp.c
> index 0000000000000..787d633d4ada7
> --- /dev/null
> +++ b/drivers/char/ipmi/ipmi-lstp.c

[ ... ]

> +static int lstp_ipmi_start(struct lstp_channel *ch, struct lstp_ipmi_ctx=
 *ctx)
> +{
> +	int ret =3D misc_register(&ctx->miscdev);
> +
> +	if (ret) {
> +		dev_err(ch->dev, "%s: ch_%d: Could not register miscdevice (%pe)\n", _=
_func__,
> +			ch->ch_id, ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret =3D devm_add_action_or_reset(ch->dev, lstp_ipmi_stop_and_deregister=
, ctx);

[Severity: High]
Are these devres actions being attached to the correct device?

In an auxiliary driver, devres actions should typically be attached to the
device being probed (&auxdev->dev), not its parent. Here, the driver
incorrectly attaches its teardown action (lstp_ipmi_stop_and_deregister)
to the parent USB device (ch->dev).

If the auxiliary driver is unbound (for example, via rmmod), the driver core
cleans up actions attached to &auxdev->dev. Because this action is queued on
ch->dev, it will not execute and the miscdevice will remain registered.

When the module is unloaded, the dangling actions remain on the parent's
devres list. If userspace opens the lingering device node, or if the USB
device is later disconnected, the kernel will jump to unmapped module memory
and crash.

> +	if (ret)
> +		return ret;
> +
> +	dev_info(ch->dev, "%s: ch_%d: Started as %s\n", __func__, ch->ch_id, ch=
->display_name);
> +	return 0;
> +}
> +
> +static int lstp_ipmi_probe(struct auxiliary_device *auxdev, const struct=
 auxiliary_device_id *id)
> +{
> +	struct lstp_channel *ch =3D lstp_channel_from_auxdev(auxdev);
> +	const struct lstp_channel_init_info *info =3D dev_get_platdata(&auxdev-=
>dev);
> +
> +	if (!info)
> +		return -ENODEV;
> +
> +	int ret =3D lstp_ipmi_init(ch, info);
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Booked first, so it unwinds after the node's deregister action. */
> +	ret =3D devm_add_action_or_reset(ch->dev, lstp_ipmi_ctx_put, ch->priv);

[Severity: High]
Similar to the issue above, does this context put action also attach to the
wrong device?

By registering against ch->dev instead of &auxdev->dev, the context memory
will leak upon unbind because the driver core will not execute this cleanup
action.

Additionally, if misc_register() fails during probe, the devres unwind
targets &auxdev->dev, leaving the lstp_ipmi_ctx_put action queued on
ch->dev and leaking the context.

> +	if (ret)
> +		return ret;
> +
> +	return lstp_ipmi_start(ch, ch->priv);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D11

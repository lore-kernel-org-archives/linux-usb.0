Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C804BD0FD
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827495; cv=none; b=V5jUVw+PqgNZfcCTSeZ1HZzCLwdkyqw1FEcPTqfJwoMwZD/3HcsgYZx9QGvkgCAIqyT6v5pAZVf0Lj4dOR/C77uTQm+0IozyKxxTWO9AwupaX9yuZfW2jUg0fAYw3AKEFWnXCcPCjgoE3mXwlBNDlZOeGtLKVjRjOZhPz8ipx2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827495; c=relaxed/simple;
	bh=e5jCTIzXhe8qVz3DI7JauRyiKOoyXnLKXQwdu5RFWmk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=InivVXvIRNakZ+UMuxwFJ0QCNR6wpIeS6cntx2Qj1R82sSL4SwpMBpMnpCM21An8eUjPGvsYorDl9id8ADtobJqt7MhnXMPN74iggnLvZbzvkzACbbTtgDiQDifLLX1poSBEYxVVA6yRtlCPrxfcDGTeFuFzxW8ySRMRFjsJUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYJWEnWO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYJWEnWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9CB1F0089B;
	Mon, 12 Oct 2026 17:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827494;
	bh=9icPAU6L3GH2aAEVW80XfC50TfsCLXLWqgANYi8ScCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYJWEnWOvL8GAyQ9Ep+tZtlZ4qzH/rVfPa+jMs35eUZKr1sJ85pso9x1MH4DYzEde
	 c7kr8ogjrnHjNESehPP3HBTZriaetaDUuhd6a0LLa0MeLStn7aD8K+sHAJilCotHjx
	 2aAabb0IlpYc0iE9lqjJhniGpJJD0vkqQfPpGahx+ebEGZgguk0DqjFIAesaEZ/FR7
	 pbV7PZcRdk613te0PCAN0BekxkS+i2tvPBMUWn5i61/RmMHHhXeUh4NO+8V6H5de+p
	 fA4GHWysLVatjgIDdfyG/JU6ZTnpoyKGTFdvIOCL2g7ScJ0ipsjk0YkCfr06Ea7MSM
	 Aw5ysHwpi1o8A==
Message-ID: <sashiko-outbox-168498@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/11] usb: misc: Add NVIDIA LSTP USB adapter driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-5-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-5-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:51:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] driver-core: devres leak and broken unbind fence due to early acti=
on registration
- [High] module: use-after-free race in lstp_live_objects tracking during m=
odule unload
--

commit 1d5a9ec5ec6f0f561150a37e199ecaed8f91799d
Author: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

usb: misc: Add NVIDIA LSTP USB adapter driver

The patch introduces the NVIDIA Low-Speed Transport Protocol (LSTP) USB
adapter driver. It multiplexes various channel types (SPI, I2C, GPIO,
UART, IPMI, MMIO) over a single USB bulk endpoint pair. The core driver
discovers channels and registers them as auxiliary devices for subsystem
drivers to bind against.

> diff --git a/drivers/usb/misc/lstp.c b/drivers/usb/misc/lstp.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/usb/misc/lstp.c
[ ... ]
> +static void lstp_kobj_release(struct kobject *kobj)
> +{
> +	kfree(container_of(kobj, struct lstp_kobj, kobj));
> +	if (atomic_dec_and_test(&lstp_live_objects))
> +		wake_up_var(&lstp_live_objects);

[Severity: High]
Does this code have a use-after-free race against module unload?

If this atomic decrement drops the counter to 0, the waiting thread in
lstp_module_exit() could unblock and complete the module unload, which unma=
ps
the module's text and data sections.=20

If that happens before wake_up_var() executes, wake_up_var() will be called
from unmapped memory. Could we use a completion struct instead of atomics to
safely wait for module unload?

> +}
[ ... ]
> +static void lstp_channel_free(struct lstp_channel_priv *priv)
> +{
> +	/* Here, not at bus removal, so a live device's id cannot be recycled. =
*/
> +	if (priv->auxdev_state !=3D LSTP_AUXDEV_RAW)
> +		ida_free(&lstp_auxdev_ida, priv->auxdev.id);
> +	mutex_destroy(&priv->tx_mutex);
> +	mutex_destroy(&priv->cfg_lock);
> +	fwnode_handle_put(priv->pub.fwnode);
> +	kfree(priv->irq_buf);
> +	kfree(priv->auxdev.dev.platform_data);
> +	kfree(priv);
> +	if (atomic_dec_and_test(&lstp_live_objects))
> +		wake_up_var(&lstp_live_objects);

[Severity: High]
As with lstp_kobj_release() above, does this create a use-after-free race
against lstp_module_exit() unloading the module text and data?

> +}
[ ... ]
> +static int lstp_aux_bus_notify(struct notifier_block *nb, unsigned long =
action, void *data)
> +{
> +	struct lstp_usb *dev =3D container_of(nb, struct lstp_usb, aux_nb);
> +	struct device *cdev =3D data;
> +	struct lstp_channel_priv *priv;
> +	const struct lstp_ops *ops;
> +
> +	if (cdev->release !=3D lstp_channel_dev_release)
> +		return NOTIFY_DONE;
> +	priv =3D to_lstp_priv_from_auxdev(to_auxiliary_dev(cdev));
> +	if (priv->usb !=3D dev)
> +		return NOTIFY_DONE;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_BIND_DRIVER:
> +		/*
> +		 * Before .probe(): book the re-fence. Devres is LIFO, so it
> +		 * fires after everything the driver goes on to register.
> +		 */
> +		if (devm_add_action(cdev, lstp_channel_quiesce_unbound, priv)) {

[Severity: High]
Can this cause a devres memory leak and a broken unbind fence?

The Linux driver core issues BUS_NOTIFY_BIND_DRIVER before calling
devres_open_group() to create the driver-specific devres group. This means =
the
devm_add_action() call here attaches the action to the device's global devr=
es
list instead of the driver's group.

When the driver is unbound, devres_release_group() will only clean up
resources allocated within the group. The lstp_channel_quiesce_unbound()
action will never execute on unbind, leaking a struct action_devres on every
bind/unbind cycle.

Crucially, the unbound I/O fence is never raised, and priv->bulk_tx_urb is
never killed. A subsystem that retains a pinned channel could then continue
issuing hardware I/O and submitting URBs after its driver has been unbound,
breaking the intended isolation and lifecycle guarantees.

> +			/* lstp_aux_probe() fails the bind on the raised fence. */
> +			lstp_channel_mark_unbound(&priv->pub);
> +			dev_warn(cdev, "%s: ch_%d: Could not book the unbind fence\n", __func=
__,
> +				 priv->pub.ch_id);
> +			break;
> +		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D5

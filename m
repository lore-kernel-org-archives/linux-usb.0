Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794589592;
	b=r0TJt4N8Gkye8tSKQczA7bfscC4rZNIaH48V9xOnyQb6sxAC8tTkwdemkP/MyCzPXOAG
	 3bSDxtJtBHXuyLEXUwPWIVawpC1wGljGaLdV7YrNdTahVESO5S30kM5WlewnKXJfWb8Ke
	 DyesK9xLKf/5DQVZ7MOmPqbY6jUNUnTE8xHVWsZF1ibwFjgXmQ8UNgdlpigULV2avpoQl
	 tYhtQGmgygiy2cQhaDn13DHhhLfmPbrtmV37UndSkKS7CviyOVI9wL8PB5MpDVOIJaoMf
	 aQSSF1i3Cifv8Q0s2fQxTSsIRqyAj+fHks3O1J9WrcS+OfNiBvk3pQEF0ZQdrr+Pisg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794589592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6AurjohRKk0j0LXGMtcnkWK+YbRAKBomZSw1goiQgnU=;
	b=CqyNwyR1TNBkfv6BdatRo9rcphrAZ9AcBEuoA9KKoe6957wp3knTYm4FtAgaF+rMRI3k
	 BF79TdCJCB/V4liRUkLwy40ZZgDUVpwJ5tNOv/1Ltnq/4OWpNrSwj+UuBMtKP1B1TQSUk
	 Wi7E2jkvyF4RIau1umTIjYZZvPHLmcsh/XlVh+yochfD+4GC1aMiA6Byx/aFeSa0Z4epm
	 gelhvHOstDW1cWaxdqqqL0uRmvwDOIc9N4K+SWUm+cLevQ8Z1FoDIJAI85C9AucKpZPHh
	 NkeT7H0QpHmg9SXhgti56fQxRHFnwAZzPyXvF8OF2IZJddmo2/LhV9A1bcvfZI040Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oT/Qj9Mt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEC606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oT/Qj9Mt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538501F000C4;
	Fri, 13 Nov 2026 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794589591;
	bh=6AurjohRKk0j0LXGMtcnkWK+YbRAKBomZSw1goiQgnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oT/Qj9Mt392mnromIzYAFDjfkl5TAfRI2MfkHsU2r1IWACeaAxVxREZ4W2eHBNvpB
	 rcOCbcXMIZvmkSfRQLhHE9lkh3/zAqt4IOW0X5Pb9JbqTWX2Hfc+fJQ2MHxj0W9abY
	 /k8PZNUj+WTPx3aQvahYa6/v4i34vMejp0jgKq7uoDpl69xq8i6nucI0Yffzms+HoP
	 Xf7/D2wdZgXAoY3tlo/HUeNMIyzx+OLMjuxpdR+o4wahlzQZNW+fk6IVE+wytuu/we
	 jmgZhXKDghXU2KoxFTe0AzATNi56pTygkPR90quZsyl+JQqRaqU8eqhpj1fXkGy8V+
	 3Te+6a1iYeJHA==
Message-ID: <sashiko-outbox-213270@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] usb: typec: tcpm: add device managed port
 registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-2-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-2-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:06:30 +0000
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
- [Medium] usb: typec: tcpm: leak of port->pd_list[i] on
  tcpm_register_port() error paths
--

commit 4732c69a74cc6f816813133462e97f8deba7b034
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: typec: tcpm: add device managed port registration

This commit adds devm_tcpm_register_port() to support device-managed TCPM p=
ort
registration.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 07d2a03d2b8d7..7d6378acf0183 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -9013,6 +9013,31 @@ void tcpm_unregister_port(struct tcpm_port *port)
>  }
>  EXPORT_SYMBOL_GPL(tcpm_unregister_port);
> =20
> +static void devm_tcpm_unregister_port(void *data)
> +{
> +	struct tcpm_port *port =3D data;
> +
> +	tcpm_unregister_port(port);
> +}
> +
> +struct tcpm_port *devm_tcpm_register_port(struct device *dev,
> +					  struct tcpc_dev *tcpc)
> +{
> +	struct tcpm_port *result;
> +	int ret;
> +
> +	result =3D tcpm_register_port(dev, tcpc);
> +	if (IS_ERR(result))
> +		return result;

[Severity: Medium]
Does this leak port->pd_list[i] when tcpm_register_port() fails before
tcpm_port_register_pd()?

To prepare for devm_tcpm_register_port(), the preceding commit "usb: typec:
tcpm: allocate pd_list entries non device managed" switched port->pd_list[i]
in tcpm_fw_get_caps() to non-managed kzalloc_obj() and freed the entries in
tcpm_port_unregister_pd().

However, if tcpm_fw_get_caps() fails after allocating one or more
port->pd_list[i] entries, or if a subsequent step in tcpm_register_port()
such as usb_role_switch_get() returning -EPROBE_DEFER fails and jumps to
out_destroy_wq or out_role_sw_put, tcpm_port_unregister_pd() is bypassed and
devm_tcpm_register_port() returns before registering its cleanup action:

drivers/usb/typec/tcpm/tcpm.c:tcpm_register_port() {
	...
	port->role_sw =3D fwnode_usb_role_switch_get(tcpc->fwnode);
	if (!port->role_sw)
		port->role_sw =3D usb_role_switch_get(port->dev);
	if (IS_ERR(port->role_sw)) {
		err =3D PTR_ERR(port->role_sw);
		goto out_destroy_wq;
	}
	...
out_unregister_pd:
	tcpm_port_unregister_pd(port);
out_role_sw_put:
	usb_role_switch_put(port->role_sw);
out_destroy_wq:
	tcpm_debugfs_exit(port);
	kthread_destroy_worker(port->wq);
	return ERR_PTR(err);
}

Each failed or deferred probe on a PD-capable port then leaks the allocated
port->pd_list[i] entries.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D2

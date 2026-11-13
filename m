Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588919;
	b=gnBzzmGem0QkzzrUMDNep5EbJdQ8nqMkfP5XbFQMqdjc9bolV8vA+zfMlJFPxGhe0r5R
	 qhTXzrGEZ2yJP28zvKZpCe1Gq7utVGMTyWTF/WBx0LaaQgkI+xy1iIj2s5IU/06PKpjHx
	 AgS/WqsXXHmcRplfDY5iPGez70vKJhrl5Fj9h+HWnHWv3kwaNjv0nW1LbUmDLLvoP+ef+
	 S6Ph1waCPzNl4dTCOMLR0eTcJ9adt7Ix0xQyemQy57LyeYt9BiobdK9GOOzq4znRfMx+D
	 2EoDmqd8FDYtUVKfuNWIiwUMHcA9Mv65baW8upcAU6h4fRyWQmAb4vVSouRheyAYFNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eTTMnxQfChTWNHZ9dtMMRmgV1O+mRpq+7E7e/vg2DyQ=;
	b=jUaOJtvq41afzs4gqVN6TeSk0QCdtWHr+8BPQlVvlJsDcvMA53ynhL3nV+YQcM1lrn7h
	 JYuv7LqgbxwC5PWaoBcW7MBXS1UmeNCFGVrvgdJBNXJvr2ygjCwsfpavyEh4c4EkZ+1Gx
	 nYDyMMrJCWtKvGrWeX7dI/ubaHCkIuiNlfRQUE4ST0BBsFXgAU1X25j6Om7HCYNan1ISF
	 Qu9bO1RlOsb5n+Wgfh1w8kK14Jz2oVMXScdI7TDxon2KfshaPKNJN/3TtENIqBi++uR+3
	 x7JCXeABN4a1cIthdN5FuMp8MJ9dcyOLzhx8ODaSqXSSOThg0dRJ49Q2nbZMhDVG7CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp+3AzEZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0209606A335
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 16:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gp+3AzEZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9C01F000C4;
	Fri, 13 Nov 2026 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588918;
	bh=eTTMnxQfChTWNHZ9dtMMRmgV1O+mRpq+7E7e/vg2DyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gp+3AzEZoGll7Rv86ir8cdmFCnAN/BnwD/doaTJF2tHgvj2FlbesJ0/tuvAKdk7uz
	 4SWhUM01cSInyiZLJ5fb/yq5uAICW3QC5xLJKjMnQsD0aa1lj7aCXP3GptST9nqNkK
	 AmrzYLB7JBEfoBnrOxhIDbNarTYctsIE4WjaSaJy+qNkhUGG/8gN5IC6Nf6a9oxGvm
	 pyyXnegp6tnTDPQOrODnAbCrp/AbZIkeNfSsd/Hf4K7ZTz6T58kYL/a1aH/kP/DUKM
	 w0bHx5kyboWzRnACGyKHu9nt4Fau0dhxVawDHRFA+z+uL7p/2sr2j559Yshwc4m2yB
	 BS2qWHfH4v9RA==
Message-ID: <sashiko-outbox-213249@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/8] usb: typec: tcpm: allocate pd_list entries non
 device managed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-1-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-1-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:55:17 +0000
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
- [Medium] usb: typec: tcpm: leak of pd_list entries on
  tcpm_fw_get_caps() error paths
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] usb: typec: tcpm: fwnode reference leak in tcpm_fw_get_caps()
  [1]
--

commit b86bde7535f2bafb293f7e234db00124b8e22755
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

usb: typec: tcpm: allocate pd_list entries non device managed

This commit replaces devm_kzalloc_obj() and devm_kfree() with unmanaged
kzalloc_obj() and kfree() for port->pd_list[i] allocations.

> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index bb90211660cae..07d2a03d2b8d7 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c

[ ... ]

> @@ -8391,7 +8391,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,=
 struct fwnode_handle *fwnode
>  	}
> =20
>  	for (i =3D 0; i < port->pd_count; i++) {
> -		port->pd_list[i] =3D devm_kzalloc_obj(port->dev, struct pd_data);
> +		port->pd_list[i] =3D kzalloc_obj(*port->pd_list[i]);
>  		if (!port->pd_list[i]) {
>  			ret =3D -ENOMEM;
>  			goto put_capabilities;

[Severity: Medium]
Does switching port->pd_list[i] to unmanaged kzalloc_obj() leak those
entries when tcpm_fw_get_caps() or tcpm_register_port() fails?

In tcpm_fw_get_caps(), neither put_caps nor put_capabilities frees already
allocated port->pd_list[0..i] entries if a later loop iteration or PDO
validation fails.  Even when tcpm_fw_get_caps() succeeds,
tcpm_port_unregister_pd() (where kfree(port->pd_list[i]) runs) is only
reached via out_unregister_pd at the end of tcpm_register_port(), so earlier
failures such as -EPROBE_DEFER from usb_role_switch_get() jump to
out_destroy_wq or out_role_sw_put and leak port->pd_list[i]:

drivers/usb/typec/tcpm/tcpm.c:tcpm_register_port() {
    ...
	if (IS_ERR(port->role_sw)) {
		err =3D PTR_ERR(port->role_sw);
		goto out_destroy_wq;
	}

	err =3D devm_tcpm_psy_register(port);
	if (err)
		goto out_role_sw_put;
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

[Severity: Medium]
This problem wasn't introduced by this patch, but jumping to
put_capabilities when kzalloc_obj() fails on iteration i > 0 leaks the caps
fwnode reference [1] acquired by fwnode_get_next_child_node() in the
previous iteration, because it bypasses put_caps where fwnode_handle_put(ca=
ps)
is called.

[1] https://sashiko.dev/#/bug/linux-d106a4e9-4871-4f7c-8575-50cb448be123

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D1

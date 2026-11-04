Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759451;
	b=iNEWKJuJ6kEM0JkJqDA9LRF0Sa1BsETzgZdHqNBaIrX+s98mbKCaCfKJx3WKp1HFEpxG
	 KOgrXpkaWMWv9Wx/KlFZxLhAlIVIYK0DPhwAoLsKaUqx4mEqSjSl+ik95NvsBk42NOT+w
	 AO54CzNz1z5slxxkvSl+Ctx9pVppIFUP9+iQEpoYT/Q4ooJ63MMIbt71vtw0Qi6JkL60n
	 3zaMOUW+kBxeIpMdPEG8dOvDgeutEpa5srZXbsgZktRMbaKx6+dDPTV83044bJo0uEGUi
	 GaOLbb1UJSRitQuTsUSCQnI8nuAYbCseQreaK8XUnxGTZw2tqcq9K5rwc/9sIbJU28g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759451;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=P3YAJANBzX9wkt4k1gVx2izXPHdViGNOiAxMtBymVXo=;
	b=3BAfSRZRK1rXlSlCcljy3LpIlfG4gla2SSFwMY0su1z7Cp9mTWfdBGeCr8rj6G4KgiEm
	 LJXqde6qgeIbB9HB8o7CGDHYDQ6huGZNmLNtK1u5Kmoj/2pUtCNu8udBs5zR62r+roFj4
	 GOIxEJ3IvHWrsMfUX0uhhPcde10x5anxKLRbAX/ze4xW8gjp0ddbdnYDhF/ZEGIVH7lWD
	 iiQYvb01YaFba+d4OCqA7+av4DstulDzF677vBFGG3O6Dkp5pH3nZi3cn9VlC0qqrx//V
	 1tNkirn3l+y4qRd5jq72rMbMzNsnohBMvatxZzZ1mlTCzWfj25nhVsjU6bpdyDf36GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApDNA+6C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D6606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ApDNA+6C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459C51F00A15;
	Wed,  4 Nov 2026 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759450;
	bh=P3YAJANBzX9wkt4k1gVx2izXPHdViGNOiAxMtBymVXo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ApDNA+6CqaudcoE+AOrYFy+OQAFRDVmLZNFii44OcfXhr67M+7H96+mB5OOvl30cc
	 5g75i5B+ct3y7T+HvqStyvIriRZsYc1UBJErgLjKNGNQplkbaPos3d3qb12ms105qx
	 NIMHFhVntcC1BPujIPSxarnFUsnJi4y4XmGKiCdXSgvh3xfBJnvYxNm8lWULX9GqR+
	 pSjkCfC1Wkq79ZB7JpeyiH9foU6Sjmsa68Slf2/urXzR9PD75Y5PpJ26Ki91Kgk4jb
	 3pBxcfOxHlPKZHBOtts4uJK0qHcuX1xH4a5OeIX5jWQqIFRgltwxpH4epsYhMoVMkW
	 Vssalxjy5fJSg==
Message-ID: <sashiko-outbox-196476@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: rt1719: unregister the port on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021514.1468596-1-vulab@iscas.ac.cn>
References: <20261104021514.1468596-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:30:49 +0000
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
- [High] usb: typec: rt1719: missing typec_unregister_partner() in rt1719_p=
robe()
--

commit aeb856a2c764adde23b2f8df2e3537e93dbc9fee
Author: Wentao Liang <vulab@iscas.ac.cn>

usb: typec: rt1719: unregister the port on probe failure

This commit adds an err_unregister_port error path label in rt1719_probe()
to call typec_unregister_port(data->port) if rt1719_init_attach_state() or
rt1719_irq_init() fails after the Type-C port has been registered.

> diff --git a/drivers/usb/typec/rt1719.c b/drivers/usb/typec/rt1719.c
> index 0b0c23a0b014b..61fa865637c70 100644
> --- a/drivers/usb/typec/rt1719.c
> +++ b/drivers/usb/typec/rt1719.c
> @@ -902,13 +902,13 @@ static int rt1719_probe(struct i2c_client *i2c)
>  	ret =3D rt1719_init_attach_state(data);
>  	if (ret) {
>  		dev_err(&i2c->dev, "Failed to init attach state (%d)\n", ret);
> -		goto err_role_put;
> +		goto err_unregister_port;
>  	}
> =20
>  	ret =3D rt1719_irq_init(data);
>  	if (ret) {
>  		dev_err(&i2c->dev, "Failed to init irq\n");
> -		goto err_role_put;
> +		goto err_unregister_port;
>  	}
> =20
>  	fwnode_handle_put(fwnode);
> @@ -917,6 +917,8 @@ static int rt1719_probe(struct i2c_client *i2c)
> =20
>  	return 0;
> =20
> +err_unregister_port:
> +	typec_unregister_port(data->port);

[Severity: High]
Does err_unregister_port in drivers/usb/typec/rt1719.c:rt1719_probe() also
need to call typec_unregister_partner(data->partner) before
typec_unregister_port(data->port)?

Before rt1719_irq_init(data) is called, rt1719_init_attach_state(data) runs:

drivers/usb/typec/rt1719.c:rt1719_init_attach_state() {
	...
	if (conn_info & RT1719_ATTACHDEV_MASK)
		rt1719_attach(data);

	if (conn_info & RT1719_PE_EXP_CONTRACT) {
		rt1719_update_source_pdos(data);
		rt1719_update_pwr_opmode(data);
	}
	...
}

If a partner is already attached at probe time, rt1719_attach() or
rt1719_update_pwr_opmode() calls rt1719_register_partner(data), which
registers data->partner as a child device of data->port via
typec_register_partner(data->port, &data->partner_desc) with
partner->identity pointing to &data->partner_ident.

If rt1719_irq_init(data) then fails and jumps to err_unregister_port,
typec_unregister_port(data->port) is called while data->partner is still
registered. Because typec_unregister_port() only calls
device_unregister(&port->dev) and does not unregister child partner devices,
data->partner remains registered in sysfs holding its parent reference on
data->port->dev (leaking both data->partner and data->port), and its
partner->identity pointer dangles into the devm-allocated struct rt1719_data
once rt1719_probe() returns an error.

Since typec_unregister_partner() safely ignores NULL or ERR_PTR pointers,
should typec_unregister_partner(data->partner) be called right before
typec_unregister_port(data->port), matching rt1719_remove()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021514.1468=
596-1-vulab@iscas.ac.cn?part=3D1

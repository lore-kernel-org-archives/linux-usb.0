Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511197;
	b=GmHD3Uui924gcRMBchBZ1W77902YzXgrbpKnS1gCE8YIITwYeLB2OqdbWVGCEx8kHgX1
	 wSTzGrGtLn8p5lvB/ykhP+xCvf6VvpQ5gMB6ygl9rYpnv72syp/8sbKs4TAXsbL8WaIz8
	 eaHe4mz9f2Y54EriGc4YWe1iXHB7Bu6HVmnXclxDdAKPLMO9M2q2nvhVIiwM5fdLjDjZW
	 ftk1qF62zNN9oEtr58r/TIr0l4kxCMrbNV9+jmhCJqoPIkcsjwz39mJMF0vCdt1O06uSL
	 nlenSIR8zk5CbrHX7ZIcRxxxXKbVlnnQM2J1stQwLnFj3v3HKm6elzhkIasGnLwNTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511197;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V1H1mA8ErB7LbjpmKu2ntuhqLtTnZzH5ntC87y004u4=;
	b=Vv3kTUKWV89KGhfUOX1dm+DJGMuo863jrcbZqjA3GbbcH7WYIXXc2x6UUv+gObgpKWUF
	 W8bijnAwddXolk1mchA2pk7EUySvXPhNOVvo4THEOtRi9QrPwqhI3XVnNy2jwO0cM59EG
	 9xN/OmmpgmvUj14ObL4mVO68F5wD/eKtOtG7B+QO9Rst+sP3BsRyEJN6hVE76zW30wopS
	 SGYfXCw9vXJd17mtRzGkAVxHr9H+AqZvfEW8jJkRxpaErMT4D2XU1OofVRXFVIfQmlmBS
	 lpmlpBsdw62YKsPz+VLG3zJ/sKeuXDKY3lQNBU96V2wJ0ZQtWGroQryjMILPjw59Ngg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LdLKY1nf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78810606A31E;
	Tue, 24 Nov 2026 09:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LdLKY1nf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8F11F000C4;
	Tue, 24 Nov 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795511196;
	bh=V1H1mA8ErB7LbjpmKu2ntuhqLtTnZzH5ntC87y004u4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LdLKY1nfKm9OJIFqVrZ5B0wGjS0bM7pAaTBxIiv9mKm40XAJyVIYQxVW99pVEzaHP
	 oizwu0swqTLz1qxNfQMLYwBjc9dcxwHhMMnnAIQdtB3L9TVEop6LUbTKSPbva0pzO9
	 reFMVLm1EiJ+pv08YHOByBqM6LwjBYriC73lFObLNnU9/Bcgq9dBAurOCkZ25mUwfC
	 QtcimDMdhrJEC77ZSchSSRa+iMjl/EFqHafBlsHTfR6K7VjjlST6a8BAeGq+XjN2Qk
	 kpwU9Ym0m+BaTa5dpiyR5bcVlKsWGQH01tt8ax9IibMb8cwNput9VX+8tz+PvF4448
	 JDU5LOT6qPj2Q==
Message-ID: <sashiko-outbox-230787@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] usb: typec: ucsi_ccg: Add CC orientation sensing
 via GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-4-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
 <20261124-ucsi-ccg-cc-orientation-v3-4-73cd114e5393@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 09:06:36 +0000
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
- [Medium] usb: typec: ucsi_ccg: wrong %pOFn format for fwnode in
  ucsi_ccg_probe()
--

commit 4f8b454feccd38f23c3b043c36a16ff7ae4ab46d
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

This commit adds optional per-connector GPIO sensing to report USB Type-C
CC orientation on Cypress CCGx controllers via the orientation-gpios
property.

> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/u=
csi_ccg.c
> index c560d45393024..06c536d876940 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c

[ ... ]

> @@ -1506,6 +1553,34 @@ static int ucsi_ccg_probe(struct i2c_client *clien=
t)
>  	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
>  		uc->port_num++;
> =20
> +	device_for_each_child_node_scoped(dev, fwnode) {
> +		struct gpio_desc *desc;
> +		u32 port;
> +
> +		status =3D fwnode_property_read_u32(fwnode, "reg", &port);
> +		if (status < 0) {
> +			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> +			return status;
> +		}

[Severity: Medium]
Should this format specifier be %pfwP instead of %pOFn?

device_for_each_child_node_scoped() yields a struct fwnode_handle *,
whereas %pOFn expects a struct device_node * and applies
of_fwnode_handle(dn) (&dn->fwnode) in device_node_string(), causing an
invalid or NULL pointer dereference if a child node is missing its reg
property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-ucsi-ccg-c=
c-orientation-v3-0-73cd114e5393@oss.qualcomm.com?part=3D4

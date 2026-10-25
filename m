Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792961565;
	b=SuzmUP79MBDsVGqgXhcmEWhM9IkvV0PWpKkWo7GRxsq2bMBODnegWxO6KRt8t1WxyiiM
	 f0gTrDZKs8GVbicgCL9qxwW5YEVBhj8f71GhxLokw+6/fl2VNntLJbGgNQDT1f9Nro9cI
	 rfDDG0Zf9m710H3u3Ib5P2MOMhblVjo8jRgpaJOhVeF8c3H/aUvE8lGsSdggv67VRVpZ3
	 Qc9TEpxFfvxKspgBtoZOXV4hznzDXhUjoI9wViE7NkJ8hpo47bTqJoFjKYQq3/XW6tLPj
	 W/+l2tcQMVCD75H9TqNtQFHwS5FTJmeN/NSoAVRp/realeeZB8mxZMy+X6caU4xGw/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792961565;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wsgxXvvBkFP5P/ZeWQe90TuSXADwtcQSdSOnm3o1qgk=;
	b=y1c/eDSpGVIW8HUTP62H44tbZo58ziO5k3nz4oY71wd457pZZAoVTBZ1NFF0pu/p+RRg
	 13+DSaCZ8+4+TDYX+1zULyqq7GfmBfWaXH7KBUqx9JvAwd6UHJlvGFKf7CnlNt5wb4Jvv
	 RFERUzyn+SyvDj2pe+k0Ov3HtoBqGegEs9ybvytRovNi9ZjAhbr168mUo/H2lbY/jEEzl
	 dtFIxis/qxoDP4G7XliMqAvHwnfqQJ9lw+m6Qv6r/vIaIFi35kIw2lnsoHAh2CNw8k6XO
	 FJxK4YMIdbA2wjPUb5XzaQ2v7tpAqquJ8BUna6X9+vA2h3RIeVtkroW9WvT3FuxwOnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DW+odPHw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A419606A31A
	for <linux-usb@vger.kernel.org>; Sun, 25 Oct 2026 20:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DW+odPHw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B271F01825;
	Sun, 25 Oct 2026 20:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792961564;
	bh=wsgxXvvBkFP5P/ZeWQe90TuSXADwtcQSdSOnm3o1qgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DW+odPHw1DIo9dhPJgO50btnqov+i2aHtdZ0tBiezpGl5rKJp4ZPI1R193Rfh9rN1
	 cValHkwvoYhgy+ym+kGKKhW9uvEE7hzxVjvRV1GJV8ssz/ZdFKJTE8HikFsRQ6S5KR
	 DuJStB1mBxlt97ulUG2VNYXPd3Bn/jWFLRyytWcogR1XiYxk4VWoVtv8K5uJFQVE+e
	 VWQ6Lwph47soAycJ6RkS+Fc3nsge8Xwc5rlD9JJgJxJu9nbZKzsccXBf6TIOuURp9N
	 YR6kMfDhfcx0F8G3mV8tRVqZkQv71DLwp7rjAWhi/cZNjt7WBcw5mdh+UJYHSq6G+y
	 wUjM8i3cycSRw==
Message-ID: <sashiko-outbox-184441@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: fix connector fwnode_handle
 leak in qcom_pmic_typec_port_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selby Mashiki" <mashikiselby@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261025203151.455062-1-mashikiselby@gmail.com>
References: <20261025203151.455062-1-mashikiselby@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:52:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In qcom_pmic_typec_port_probe(), device_get_named_child_node(dev,
> "connector") acquires a reference to the connector fwnode_handle to pass
> to_of_node(connector) to devm_of_regulator_get_optional(), but never
> releases the reference.
>=20
> Call fwnode_handle_put(connector) immediately after
> devm_of_regulator_get_optional() to fix the leak.
>=20
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the=
 connector node")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025203151.4550=
62-1-mashikiselby@gmail.com?part=3D1


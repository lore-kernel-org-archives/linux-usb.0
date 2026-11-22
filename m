Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795361448;
	b=JFWu7xZcD5vRJO4jnN0txfIaTe6NH7LVBILsdkYifqY7Ad/RrsjQDBVv9HZcfgFqKzw9
	 TMWaA9g+n9Bx1pYeBpGTHXqxFXFxVZ9dsussgRyPG74eSC4TFct8SOPjaAupFX4xPH1mH
	 7jQbshO/PTdugiTNPJpxgGVxxQjnClq2J7m5h1OnTZmU7wN+p7PCWVYLtb27O0vf7jAZL
	 wJfDW7OgXES9+zXsdefmylSoWTYHbFN6dQb20D9aHCtwpfbh+c2hzPMzAcZCkD2oGyul/
	 hmhXrJd7UBP01FyEokMxMiI4whbwCdfLMP011ny7QjRydRiG8Bb3NCd/ZLZl8y88DZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795361448;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DrOkMf3e5TkZ0axNk8QrG7avSj+ygxqIh/bs7QVioXI=;
	b=IQqeTcQMfBcFB37s9zs8mbUEgjVmrvHnu4cvUXJauydu7AlfmX+n8xo4DrC8ogtC09ic
	 qEme762qjQ1rUY9qRrW2hGg3GyYLGgOGEXDWIJp4T5btD/jaL3ORLkpN7AjbWfuh2uj4Z
	 a4/ZKVpormrIn3/YHtQCjFncnP9btzDPfq0KeMcxY7A+386bSk70/2X09Zq9/4Kl2GjML
	 V8h270qWQE7qsEJUuXhydneP9CaK85LWCSCDT0x8FJ+K+r2A89mqXQzw7VxMGSbrgh/7c
	 +xhj3d/F+fskb7MwP/0gnMfVfXPQ9BEUNo29SOZwik7UzVw5LsyP8x38CJoOTIHGFAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMz+eiq6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C100D606A330
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 15:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PMz+eiq6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6DE1F000D0;
	Sun, 22 Nov 2026 15:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795361448;
	bh=DrOkMf3e5TkZ0axNk8QrG7avSj+ygxqIh/bs7QVioXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PMz+eiq6F7WUed9OwQ2lrLHFIzYnhEgnwtz1R9CWuDFIs7pqUGua7ir/la3IZ9tqp
	 NyzOT5MD0WdzLZmXqf1XZOXul5AKOgx6wwLQQwG2ODxUml7HMoKyAKEeZ1zmhTvZuo
	 iPe4Yt3PEW/tngKtgWkCqt/oBnJtSvYfaFWj088QYz2P20B/KUAoYemyJnhLUZkfFH
	 XX6nXs7Epskypd9a0j9u3HjU03kIpDnVxVdoIMyXjFEEtXatH+rbl79jtjQ2IPqfZT
	 WN+FOKHZ6vnejXtEj53ROVR5FYvIG7nqEl38erfpQP4Rt0SFSMCDCLLYHeBBh1cLnK
	 Htto5plM5DUdg==
Message-ID: <sashiko-outbox-228042@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] phy: qcom: uniphy-pcie-28lp: Rename the PHY type enum
 values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122152857.1113943-1-sashal@kernel.org>
References: <20261122152857.1113943-1-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 15:30:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit b28eecc89399 ("include: linux: phy: Add phy attribute "type" and
> associated helpers") makes <linux/phy/phy.h> include <dt-bindings/phy/phy=
.h>,
> which defines PHY_TYPE_PCIE. That clashes with the driver's own enum, and=
 the
> build fails:
>=20
>   include/dt-bindings/phy/phy.h:15:33: error: expected identifier before =
numeric constant
>   drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TY=
PE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_P=
CIE'?
>   drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TY=
PE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_P=
CIE'?
>=20
> Give the enum values a QCOM_UNIPHY_ prefix.
>=20
> Fixes: b28eecc89399 ("include: linux: phy: Add phy attribute "type" and a=
ssociated helpers")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122152857.1113=
943-1-sashal@kernel.org?part=3D1

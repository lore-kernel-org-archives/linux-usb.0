Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7739DBCF
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 22:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499523; cv=none; b=DFmkaOjGhOtMtJCDEdN3yWSSigDsxCJzLxUzC206vm1OOUA5HkofFCdaHFRY5of45oxAfAaj4nODTKQM8TxuG41fM6Vj1+yE/zqn8UHpV6iWds757aLMuFLphPtRXaZ0kaR3O9vD1pAOdPgsu/C18QCJaqCXkBdZMhX5zsaCoDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499523; c=relaxed/simple;
	bh=UAzDXA25CohFs7YPn27YrBzAslDH+x0Dq9s0AVTq8f4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=S9qds3+rjkEqV9nCUnv7U0GK/gxWmmcjJf3bFEMbFK7JVXMY8Qb1Mw9yLsiAKPddiPLazCARYQE/o52IKgGoia3B2uUdzhh7xWyQKbj7a1rqq8entQ6kVqiMlLvenN2+FJKscoMXjKTCWcEbehk/0NAdSCK27Vt0p46ZJ6be2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcWeA+Z9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcWeA+Z9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520A11F000FF;
	Thu,  8 Oct 2026 22:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791499522;
	bh=UAzDXA25CohFs7YPn27YrBzAslDH+x0Dq9s0AVTq8f4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EcWeA+Z97EeDxOdU68yHWbqpnlhxlBG6ZvJP+lbyVWhmv+WukbELAzdSvkCRoB51L
	 XiyJSeNXNnvyDeK95TUvuWvHK5Xxww8fYxCizFPcEgd7Xd/dwVg+Oj10Ccr4RDClHx
	 FCaf+P7irHFScCyhJb/UiD4VtoL9PUebFeEIZ/u/IV1KQ/myGbiVxbcMaI0/V2ivFn
	 ZYiW7ZDtVyn6wzCPIJ18e/MZJq19pQO5m1OCBY4BMcpG8jA6qF7CIWX4tpoGc9iuED
	 qrB/kJv9DI6NN6dRfqAI9d66nICWmR04yrCNwabGwm1y7Lm/vlCHOLlVTDyRA+Qs/+
	 ue1uhR/GaNMGg==
Message-ID: <sashiko-outbox-164638@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Add quirk for ASUS ROG Zephyrus
 Duo 16 GX650PI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksei Berezin" <8967858b87@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>
References: <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 22:45:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Aleksei Berezin <8967858b87@gmail.com>
>=20
> On the ASUS ROG Zephyrus Duo 16 (GX650PI, BIOS GX650PI.314) the firmware
> loads the EC-based variant of the AMD CPM UCSI SSDT ("CPMUCSI"). Its _DSM
> read function only copies MESSAGE_IN and CCI from the EC into the shared
> mailbox and never fills in the VERSION field. The only code that sets the
> version (M31F) lives in the "UCSIPLT" SSDT of the I2C-based variant, which
> is present in the firmware image but not loaded on this machine.
>=20
> As a result ucsi_register() reads a zero version and the probe fails
> silently with -ENODEV, so neither Type-C port is registered and no
> typec, usb_power_delivery or ucsi-source-psy devices are created.
>=20
> Reuse the existing zero-version workaround from the Acer Nitro ANV15-41
> quirk and assume UCSI 1.2 on this machine. With this change both ports,
> the PD partner and the UCSI power supplies are registered and report the
> connected USB PD charger correctly.
>=20
> Assisted-by: Claude Opus 5.5 iasl
> Signed-off-by: Aleksei Berezin <8967858b87@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-usb-next-v=
1-1-95a2288ad9b2@gmail.com?part=3D1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756542;
	b=TNJDiqONTOM7008DYUa37ort20/G7Qa9WTY/RtFvbaOcBrAM5eVt5zwLbfirXt85lTrq
	 X6xO0KeJl/4En5H1fM/X30njsTqBVxJSA6tLcpTDcUNI6RsaVAd3bp3Y4P5gf+JRzlOV/
	 l25jNIedO32ElpV9py65UHdJ6QfwWUfPHZQvY0tmk9uhbs9bJ7ihL5xLTMBV8dpLOD2Om
	 lK/Eu4LUkTi1Wd56YRomcKMEq4DNCLeG1NffUalxUJbvYq8K7UIfHHGbE3tGVHCGDF5U1
	 8cgMH2iBzib5Oeouiq8RJcUw0cPr7orM77DixQlSD51NcithePx89IGwRz3AVsqdPIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=getszLpD2Q8sFazJ3wpQwQEqdBoM+duiapuRjNlhCvo=;
	b=2SZmjS9/MqEvqT1n2sqrwm6E4WzBlbXeg1Roi1oM4O8aOrdjhEW8WLq4ya59pWMAawjV
	 MPgkMCdAeNwKjvvV08TH5UGICrxdx8IkeoZEoMflh0y2ji8hFZd58pkyL9C1eHxBo5gca
	 r8yvgfVLBjbxr0BfwLnwr9ZK5e+s86CIJiUsKwXCXgRfrWQRDa+76NpKTOK07okGtDvsJ
	 +1wCZoewJ35VLQZLcJAZMKG9CdfLaP7D6yDTPP1Vy0wSsk1Hd0n25Gku+FlvLq9w/VH5d
	 kGm0uiPItHOLHD7Y3BKnTRpKPAbBiQL6PD0BUKUxwOnCGeLq0JQhWQaKSLFutFgSFkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YU9Aogw+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13494606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YU9Aogw+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853331F00897;
	Fri, 27 Nov 2026 05:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795756541;
	bh=getszLpD2Q8sFazJ3wpQwQEqdBoM+duiapuRjNlhCvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YU9Aogw+iWARqK7ZWKGUjGD7FALmRZ0VSebkteUEvaejt4YHKmfSHdLb20M0LYN41
	 tZ3bu39ux0C/gukRwRjuAEu5Zpjpt6d/zyLy+r398nIcNtHW2DyMXhfPSkef2cNZQf
	 24fr6kxTxE1ZQH31nTzE1oXrZS+Y84Cah8PtZKU1y0PTTjKdh0YD9Li+oarQe5hNL5
	 6S8MciTaNqqICvDGrBtR9xOUdTrHYZgpdBQ4ZZcSKwxv/RrDVlEmmh79PsYmTx2Psb
	 O2QAbL4ray04+QfoA8L7PaDSDtdEjAH2AmMSFJTG4ncIdTKN5UDG2FAhRlRE9SbrDg
	 hl8tkpsygzkVg==
Message-ID: <sashiko-outbox-236640@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger
 types on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felipe Infante de Castro" <felipe.infante.de.castro@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261127050938.2150497-1-felipe.infante.de.castro@gmail.com>
References: <20261127050938.2150497-1-felipe.infante.de.castro@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 05:15:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM high-speed
> PHY interrupts to a single edge, chosen from the speed of the attached
> device. The IRQ mapping outlives the driver, so after an unbind the
> mapping keeps that single-edge type.
>=20
> On the next probe the interrupt is looked up again from the device tree,
> which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with a
> trigger type mismatch against the existing mapping. Because the wake
> interrupts are optional, probe still succeeds, but without the DP/DM
> wake handlers, and USB wakeup is lost until the next boot.
>=20
> Record the trigger type of each DP/DM interrupt when it is requested and
> restore it from a devres action. The action is registered after the
> interrupts, so it runs while the driver still owns them. Unmapped
> interrupts, unspecified types and types that already match are left
> alone.
>=20
> Seen on a Microsoft Surface Laptop 7 (x1e80100-microsoft-romulus15) on a
> 7.3 kernel: after unbinding and rebinding a controller the dp_hs_phy_irq
> and dm_hs_phy_irq handlers were absent from /proc/interrupts. With this
> change they return on every rebind.
>=20
> Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during=
 suspend")
> Cc: stable@vger.kernel.org
> Signed-off-by: Felipe Infante de Castro <felipe.infante.de.castro@gmail.c=
om>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127050938.2150=
497-1-felipe.infante.de.castro@gmail.com?part=3D1

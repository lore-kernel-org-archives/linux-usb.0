Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599002;
	b=5aiK2E8xYvgjaej/vJOrvsQ+FdIRuAkybj0o+xEGyLNGe6mgukXigelL3YLIW4RQaNhC
	 l4Jf1hq/lMnItsmul8JnlMeAOYrFD5d2V++5EgcLghQEqJFfT16UJd+HGYSx4QXUeJMvw
	 QcQxnHX9WCM7myBR0GBivOggynof/P33F9oPfhLAe4tuRE7huyQx7byXTS/6HUSplEHvh
	 SMRFTMmCiSM2NEWjWzkMCjce+1Gdjfsj9bXaxQkM8YrS+lKCK0nFVDcbrtZub6mUbgP7s
	 Fi3dBzEejgCV4fIU4Om4AI97MVz/1Jg9V/YKEL/XcYwtnjrtW+/fetz7rkaCMihFEGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599002;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aM9UhgltJPsrqk70yRkYK68Rji2JD1XAePrK5PuAiIY=;
	b=xCXo+rPa9Tt44PLj6VdLJzQ757Cs39PoTKB1hlUyEbUi09cbAuAwnb4F16RKwXIEg9w9
	 RZxxmRQrZHiLXkMjI7uDuAfdrnTqYnW3nNiXzx149TsoifTwGTaUPXgc6eSk4yUxvbOmB
	 5FTBX9OQfFiss33mQEh8X3FASHbpwPvxh5ER7KlkRRfq5LMinFUMoGlUwy1/ENBV313uf
	 yskflVM2sAh/keztcvc3kZXEzNuZ860CLChtt02tFgTboCMxT3Q967AApVe/ecXVAxBPS
	 ow5Yc1PWDsutFQeEok1QtjfExXoMwhzFtKbn5BTnxMiHcCEv2GV+E/U2QNucxhgTigg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ldHUVA89;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8C606A32D
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ldHUVA89
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FDC1F000C4;
	Fri, 13 Nov 2026 19:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794599002;
	bh=aM9UhgltJPsrqk70yRkYK68Rji2JD1XAePrK5PuAiIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ldHUVA89ULBG+anqewABkCb70E5wJs/zhNrYFY54naTWvcLVDNH6VtngO9o/245yV
	 Q/aKIR4QR7B30rZNSux/pLUKvyviAy65Yjdh4x2h0+8MJLlTl2cJtwyQC9cxhEvEAE
	 Eo2D8pxy7tpwMwdhmg5NLN3xMb0dPJxZ9G5f+LZYN/M7GYOw6ZElRF7T8Pd+pFQdlb
	 deCjNl4D/nYGOQBW9h8oG1LGaHo7DuBlcx43uIH5Xn9tX0Pf/MkuU+XLsuNMryyyh3
	 u2GImey0lFvZhWfjIeYwfMTM9qQqpD50IPtKiNYERieRUxm6SVBRzxm2mBljiSRGzK
	 sz4fz23eVBqkw==
Message-ID: <sashiko-outbox-213566@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] usb: dwc2: fix a possible interrupt storm on
 stm32mp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-dwc2-low-power-fixes-stm32-v4-3-08a8c962a09e@foss.st.com>
References: <20261113-dwc2-low-power-fixes-stm32-v4-0-08a8c962a09e@foss.st.com>
 <20261113-dwc2-low-power-fixes-stm32-v4-3-08a8c962a09e@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:43:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On stm32mp1, upon resume from low power (stop) mode, in host mode, a
> port interrupt storm may be seen before the hardware is accessible.
>=20
> The core is able to generate interrupts during system resume in
> platform.c when calling dwc2_resume()->__dwc2_lowlevel_hw_enable(). As
> the PHY and clocks become available, a resume IRQ can be seen with a
> Host Port Interrupt (PrtInt).
>=20
> The wakeup interrupt handler make the controller to exit power down mode,
> but the HCD handler returns IRQ_NONE, due to the HW accessible flag has
> been cleared in _dwc2_hcd_suspend() earlier. It ends-up with the bad_irq
> handler.
>=20
> So set the HCD_FLAG_HW_ACCESSIBLE flag when the resume IRQ is handled to
> exit from power down mode.
>=20
> Fixes: ef5e0eec4764 ("usb: dwc2: Add clock gating exiting flow by system =
resume")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dwc2-low-p=
ower-fixes-stm32-v4-0-08a8c962a09e@foss.st.com?part=3D3


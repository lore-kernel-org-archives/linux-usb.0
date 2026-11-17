Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935749;
	b=QGtZHsuMOkkQsVxkv/2F5YhY/eDw36fjOrje6bw5FBqPHE0FcZiBsT2iSkzjpMPkcdW5
	 Sx/4poXzxVdMJtE0thCJZ3Qx1VVNcKQEy6RnvtquQeCUXyACtX/YlvU4sD7NbxmJbMqvW
	 Us51sAyOmvvupnNIA+EYXT/tSJkHmpg5fIsHDJgQ89qWlGhRcAaKoFf//Rt/Ee5vXmyBx
	 tHKXwMhx+TmGRHd/v/6H1/QP664VZEZ0KMEAlLJyOi7q1mNsVLrKuKjjtk0xjDeHJACki
	 NhISSh+ZNyxlZVg5Jzv6wrFnYPNhtJx50JFCjYrS9lzrZWMfwSx89Ee/+ivrYG2UsbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935749;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vToLdIOWBNcDinGPFwwAvbcmLcNmim0ZbjHkpbxY880=;
	b=DZ5iRkGryuu6innuvatxYmE1P/PZkKdPn22ZlegrS7GR5ZceDNk4EJGARoO6PAiY6oxb
	 DkEUVRPLoZK64nl1HLfZ++vsuw0aHEDqpy2DXNnN/eiErRsQT3877HZATQaMNVwEisWLH
	 sKFL2mWcWIPPQqxcarqK4jP7k/noljFlNq6XcFFXZmv4Ivew3MhUHUCuOmemx8qsMyB21
	 BS7JT0fFKR8kE6sGCWYxOigNJNvSzRLWgwv8ieeq80gmesJFhTdfCnWM5nn4NPlxv8reL
	 rXQ2bPi74QKG/TLOiH+dQ4EE7ztD+xAgTr9TSmZdBCpfHiWudJBeXt59xb9HdeddoiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLB0Pn1w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82DC606A335
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PLB0Pn1w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852F91F000C4;
	Tue, 17 Nov 2026 17:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935749;
	bh=vToLdIOWBNcDinGPFwwAvbcmLcNmim0ZbjHkpbxY880=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PLB0Pn1wq56zz2G2ewYOfK/V2eK/DOqALqpRetQME+AOcaKlWOd+ugVFAvb91yUH8
	 l5O4nmY+ANP+HfuLrO7tpAHrOOei7u6i1C2P9iKYqvYdjhPXW+jtKe2KQ3ZlO49+80
	 QgtcoxzpyQkkzyTtfn656w4y0XzSBFQXQQ1Qc14z15oDEUVvy+G1ExU95oEHvGkW3Z
	 m+Py83WI/s9eu20sXxLofe30ixx3a+7hpb5UNA1gngZakj51syyNKabZbXANxW9iOd
	 OI4L8Rww+72DGwC4cJ9LlkZPYIrKZyCkOmuk8BiVvHy61KhESpDdQVuo4ExWbtEaBN
	 NzLeT/c4T8NAw==
Message-ID: <sashiko-outbox-219220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/7] usb: dwc2: fix a possible interrupt storm on
 stm32mp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-dwc2-low-power-fixes-stm32-v5-3-0f197e0e6362@foss.st.com>
References: <20261117-dwc2-low-power-fixes-stm32-v5-0-0f197e0e6362@foss.st.com>
 <20261117-dwc2-low-power-fixes-stm32-v5-3-0f197e0e6362@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:15:49 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dwc2-low-p=
ower-fixes-stm32-v5-0-0f197e0e6362@foss.st.com?part=3D3


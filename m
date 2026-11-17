Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935672;
	b=XRDZz8wVqgd54OPocNihoPQ7l+tZB85LFaTHiXhxy5DkgCozaT2B2eut72hIRzPzpMPG
	 P4emPljs322ve4/9o9I/QWE7mBDAtfqxJHFSwDrdM9+Fk7W1iKMwju9Uvco4AiY4mRraW
	 WEhUdwluP89LF61E+tET93iOp7igKDax2gR+xliKIEAQ3j1o+vOXTRHPs/LlUfzDTO00j
	 6aubPIz//WpCyoZ5vMcMEIZ4EtkkoejYKpQCTZmRxeQKnBk1b+Qgb+UwZZvPCOfsjVZVj
	 9yHsQyVntgiQ8Fa+zq3hdbWXYJ2HXCeQnI5eY8owKMYKTnSGW60MzRW2+KFtiROx3MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oOa/pHUizeNnM0H2by68zJNgNh4JNLayFa9WExsSias=;
	b=5BmiZ6tqYugB5OJ+GuJkz7ug0FmRUj2bIRNVy9LU5X5EQgCQFyNILUymBUIX46X/cLZi
	 p3YJORuWwnvdf1UeUWBIYwc51hwixzfEOQJCEawSNBDD+1xW6ttzYSoOfO1fNoN9yhPm7
	 lH3eK2/oc3S/zHIii03mlU4XnwE0qFBu6D34kkvZY9A43tzLvJE5LsXYEY4wZcVXOYf1H
	 6BzjiFu8RTApshKaQBAGpsObzbvrmyvHZ3JkuxWlG1+ckpDul2X09QN+ncnCgtaUrh8gj
	 7Z31BdI/qu+7FKdDHme70LNL62g6NDFbChpxWkwjy1YHP753c+d0QYWANBd1gksJ6ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijBO5MVB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EEE606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijBO5MVB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B62D51F000C5;
	Tue, 17 Nov 2026 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935671;
	bh=oOa/pHUizeNnM0H2by68zJNgNh4JNLayFa9WExsSias=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ijBO5MVBvIVQVmqfQ3Ofa0r7chOtljN5j5kg0WVgq2rRdJSVLN84BH95u4FtPzl4y
	 8SYuf7OpoYxbBLB+VJCv63+YKRd6aP9r2XMxtGyI93657N+8RckuzCWF5Yj48RovFR
	 aw/NFebYc+JsyXHKP2TUp7wxQmQFBgnx/oJy3JX9/vT6jbP1PX0zn1d/8+G4Oq5hOm
	 Pt3t0WrVBbTv+zBdIJPGQ7zH+oj436KIpKMZ6tfZDBGldGdAcTAAWkYUBuS4qQ55Uu
	 kk33Wrw7ALJyOaAkMPteb6j1RVu1DoKL1dDWOPNx+msgZG4YSQhlaXmOVO1KUIvrqt
	 KaRf9+z04+R9g==
Message-ID: <sashiko-outbox-219216@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/7] usb: dwc2: fix a possible interrupt storm in hcd
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-dwc2-low-power-fixes-stm32-v5-2-0f197e0e6362@foss.st.com>
References: <20261117-dwc2-low-power-fixes-stm32-v5-0-0f197e0e6362@foss.st.com>
 <20261117-dwc2-low-power-fixes-stm32-v5-2-0f197e0e6362@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:14:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The host interrupts are re-enabled in dwc2_hcd_reinit(). So there is a
> race during resume between a possible hcd IRQ, and the HW accessible bit
> to be set. This can result in a bad_irq to be reported (nobody cared).
>=20
> Note dwc2_hcd_reinit() "Must be called with interrupt disabled and
> spinlock held." So, move dwc2_hcd_reinit() and the glocal irq enabling
> inside the critical section, after HCD_FLAG_HW_ACCESSIBLE has been set.
>=20
> Fixes: ef5e0eec4764 ("usb: dwc2: Add clock gating exiting flow by system =
resume")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dwc2-low-p=
ower-fixes-stm32-v5-0-0f197e0e6362@foss.st.com?part=3D2


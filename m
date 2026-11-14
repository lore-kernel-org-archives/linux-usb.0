Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794671371;
	b=i9MWE8ISff/+hiXwxUwv50DC35llnURYIMvhrTFefXw8wB0Yln1SMT6qQsRl79w75cbP
	 xo0LSKEpDMVEk3brBbjdlIhSfWkBcTtJe8ad1YBoVKIfc34D2pxkqNWwxGvYMjh2NHEgm
	 qmAxKBMnjxgiE3LjXQl2d2Yc8SSIghcHxIS1aVmJl1u8tLWfL62pDv+7geCPibG/LhobL
	 SV1SwDEMe6M4fOJTq/CsHBjKhYFbNuvx2E2kFD/7uk+bNBDjnNmhQOvprHHen+U/10njF
	 xlOy9Rtc/XM7x+tdDemfZj7k1PCt4sU1TBixuElIihFoXkVJ4yrE72s6IMBOO2P0s3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794671371;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6+lS7qA+3ib5dXid9QigGICVKXeCPC34tUc00QI8nrw=;
	b=swlJduR48x+glLclQSb29XmjKUUDg3aCOdiP0GeZHSPU4h/aUdYehyv7atm8NTDul8X1
	 FLaoIP/d0XrCFXIBybmLLAMTPs971oY0yS+VUF+/aSEMhvGFbBc4fvOrMMEmzqYNzKfy/
	 HfVEJ3Duf/B9FSsX/WqjRGLYaP3nqrxXnISkLX2ogWYsmreAuAp71PrTrgSFoJBi/cyYc
	 krH07HyKjsrDsTCQeKhVtG+qvoEmOJDS7yAu2HqOPf0xKAeebwPDHP5U0UPHOPYi9Fq4F
	 zjo7R3cTHqm8ybinCfpdAOQvGkHDSRzwD4+v7XfBVmxqax1sbp+I+2ccm6bGpd7gyVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vhb9h7ys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08F606A327
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vhb9h7ys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452441F000C4;
	Sat, 14 Nov 2026 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794671371;
	bh=6+lS7qA+3ib5dXid9QigGICVKXeCPC34tUc00QI8nrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vhb9h7ystiGMb4LVeEtwu6rG6bJXWbCAU+hYck5v9aQl987H1lps/2+xogdjYM5zz
	 s7CgGWmuSo9akay8apZiUVdita3x+lRXbdLS1hZhwmJIKG6xOIOWAJIttohrDaPcm5
	 vYwBfgo21Dr8JgCfJ8zOZwdMcL3Ol+BcpGwCXwPdzH8BHwinsv9Z7ZcuYgynm4vcjR
	 78WQ+u5Ss4ZThOFAO1BjMcI+u0tl+4M1zipreRiKfCM30f4NLBmV5lkcvJBgy5ZOSM
	 SK3ygXl5bdnuvnOUEFj88bL2vwKhOD04gfUAQiK8CkgqPhR0vSBIyHlRTDh9uFbsAl
	 19LBIxQfzU+Vg==
Message-ID: <sashiko-outbox-214729@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Opaniuk" <igor.opaniuk@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-qcm2290-eud-v1-3-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-3-b6157b817377@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 15:49:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Describe the EUD: its CSRs at 0x1610000, the mode manager register at
> 0x1612000 and TCSR_APSS_SPARE_REG1 at 0x3e5018, which the secure world
> writes on behalf of the driver, and its interrupt (eud_int[1], GIC SPI
> 189). Hook its port to a second endpoint of the dwc3 high-speed port so
> the driver finds the role switch, while the board keeps the first
> endpoint for its connector.
>=20
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-qcm2290-eu=
d-v1-0-b6157b817377@oss.qualcomm.com?part=3D3


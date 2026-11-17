Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936728;
	b=ZSUQAyMTIfhSM0ZeEveLLTWguGuVHtPJ6tYpey9ElvFeW4+J1V06J6UrrfBwTMFTaMwn
	 DptrMq4iIX47xelGywT7NP9jMSrAAzaIu9IIZuHUWiK2kwXpCQ4Fahi+gmHNXVoSYGs+D
	 4VPv52WNWjbhhN7t51EEptwJJgHjCm34yAsNCgU+aN4YxpA4P5DZpTUXrdjp7noQL68Uh
	 yGDFZZNhfP6Bj7mO/SRWjZptrG5e7FIh9Dd5WURCxmthDRXZ2Kk8uK2IFE4r5dysTEuKb
	 aFyqGQMu2YQn9yWYDyzRcg4HhydgcDsBe/2fdVzyI0yt2IF+f3xtzlonXRBOwRTktVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936728;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UHKVyPJtGiUCmiDIXyd17oXUPg9eZG/Ai2LJhLbh2nU=;
	b=LBEj0H+RbSNfDpppGiCOxhdpstK2Zh5nwqpSastzS2DjuP5u9/AvaELgbaX51faMXGkc
	 Oi7pR68n1/G4rsmpk8Kka6DEVa69Fb/4TV4wiouFZmndlT8Ab0OV0UTWrLVsZb2HB7vqF
	 tZa9fUkZxEc/SBMJgXCSvXbeWYis5FTYeB/A8LejWynWjo4yB/V2e9c3nBDzbWPkPRseR
	 jI4hZob6p0/NTRXnw27qqcu49pyBNk9hqzJAF5K48C5qGg0vZVgtyvgG9KvcSqX31onXL
	 Pe+Fm5dSsu6cfzf0HEAHrxpXgCi+t8MA1KDwqkBAPA7sBMw2yFHoxZEmRk6XUblRggA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQNRbFT+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FDA606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQNRbFT+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F3A1F000C5;
	Tue, 17 Nov 2026 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936728;
	bh=UHKVyPJtGiUCmiDIXyd17oXUPg9eZG/Ai2LJhLbh2nU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQNRbFT+QfyrI0JR2Mc14U4b9HKIpPwW9+UsH635BU0ftilkOqT9Rcq4UQH8as4db
	 2Lfge/Tla+FI1KSNGw2yXQSzcuZjiyyO4NZuGJ+SiP4lWE5oPn5vRKoV5T2s6xknMG
	 I/ArEWCGRHZdohc75zF41FgFCjGR6c14Q1tv6aRxaFG6Sg21wywpNA41aVdoSwBJ+4
	 JF8L91JigsTLyjfZq395nSut0PPlCqKxaQmWXrsKutAYZ7uRPxrMqglij4qK4UKF3N
	 qNwniGwZq4Qmu623vhLMT0mG9Dk3S2AeKPqLecCOWgKpYaKOUoDj39JuOOr4kNJtgI
	 bHNYvV1PZAeow==
Message-ID: <sashiko-outbox-219238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] usb: dwc2: platform: fix stm32mp15 detection
 logic power management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-dwc2-low-power-fixes-stm32-v5-7-0f197e0e6362@foss.st.com>
References: <20261117-dwc2-low-power-fixes-stm32-v5-0-0f197e0e6362@foss.st.com>
 <20261117-dwc2-low-power-fixes-stm32-v5-7-0f197e0e6362@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:32:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On stm32mp15, the STM32 detection logic can remain enabled even though
> the other hardware resources are disabled during probe in peripheral
> mode:
>     /* Gadget code manages lowlevel hw on its own */
>     if (hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL)
>         dwc2_lowlevel_hw_disable(hsotg);
>=20
> When entering system low power, the detection logic resources would then
> remain enabled because dwc2_suspend() checks:
>     if (!dwc2->ll_hw_enabled)
>         return 0;
>=20
> If the stm32mp15 enters standby, the register contents can be lost and
> not restored, leaving dwc2 unusable. This can happen when no gadget
> driver has been bound.
> [ ... ]
>=20
> Fixes: 2b94b054ac49 ("usb: dwc2: fix hang during suspend if set as periph=
eral")
> Fixes: a415083a11cc ("usb: dwc2: add support for STM32MP15 SoCs USB OTG H=
S and FS")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dwc2-low-p=
ower-fixes-stm32-v5-0-0f197e0e6362@foss.st.com?part=3D7


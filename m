Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600029;
	b=GajMKFEX+5ppqElYvZkogh0cD4sbyBlejp8UnDVkpsSxqIiZTfJqi4Rq7dMkaju7CTv4
	 Yg7gXxAno0x+XEaf098GUcs7V3vIXohWY66Cx4DeQIzMd8qHkdPoTMYtIEsj2eiJ5x0iw
	 Fc2LdSnjLc/D/fei/93gBq1yKpstcxpQ4s+M77dhUb31z/mVA7SU7fud5b2enEGdgEKhz
	 t7DSVHMMrF/QADXPo6fQGd12zFO1iytteebhzTfI4dEc6clGlHOYFqn/tPqw3SzMBbLjS
	 Rmal5sH8b73cPjtCz9tD8eVh4rSKdQydwxZlib8oWHs5pfyvxOeGrSJON+y/RCiOOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600029;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HCTzl5QPNY0kyc7RRfIfwM/O5RJ0ZgJ4Y45LLdSNAdw=;
	b=XwMlagxkPeRlqeMLbPtltZa5kjO0pBQ5sCPpZUrNLyf10O39T9bvYeY4JVuPaVG6a3l7
	 z6FMVQs3uA1Nv5eNBZ+oS+UhRxivg79C415bKl3SXeJgXSaNkjoOPe0TVON7HpByZn2tr
	 yiwjAe4/wJLaXEQ6sbYkDWdbsvdXS2stVCiZmoCvTUdN5M1sJB18oxXj2qAl9UIkeC4w3
	 ReW9q4EehXTFzWPzlBvcingq5pogOYZC4oS7l1hUPNOQfLvBrXmm8YPA8uv/dcHEN5vb/
	 zL13qRRI4HqttuKaJV6sNPPSHEx/CPEvO2GbWgyMJx0xkULkvMQPVkRsVRO9GtXLLow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShECmRCV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6592606A8BB
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShECmRCV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B4C1F000C4;
	Fri, 13 Nov 2026 20:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794600029;
	bh=HCTzl5QPNY0kyc7RRfIfwM/O5RJ0ZgJ4Y45LLdSNAdw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShECmRCVJT8wq+L4yMBz0sBxQIcqAG0IcMy3jqjFAl3w1sPQ6eGG2o96oL95HiBjP
	 pDN/f5CGxieEJFyVTNO7+svUOkRgFap+IqIcgFXhib3wt5k1iRD4nsYnR6gfddAtwn
	 nIRcDC9MKeg2t4tkSNCcw6EvUkMwZbWHRmdA39msiOZZZupFI9vUV1HMuK6SCjhIt9
	 ylVcmzr1Gfa/8DRhcLiTPQRHosM04s/7h4K3yx3OyoKKlyDkZ7nqpd8t99xNZ0xCTA
	 dkswbq08RW7H6LktDZCNCRQpFPE0gtnptvgmZnbvlVk7jhC59oEyhH0UdwG7+ZsMg2
	 8rX0QX/oqQnTA==
Message-ID: <sashiko-outbox-213598@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] usb: dwc2: hcd: don't disable external vbus in
 system suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-dwc2-low-power-fixes-stm32-v4-5-08a8c962a09e@foss.st.com>
References: <20261113-dwc2-low-power-fixes-stm32-v4-0-08a8c962a09e@foss.st.com>
 <20261113-dwc2-low-power-fixes-stm32-v4-5-08a8c962a09e@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:00:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> It's not required to remove port power upon system suspend, as explained
> in commit 113f86d0c302 ("usb: dwc2: Update partial power down entering by
> system suspend"). It can be addressed with hub ctrl (USB_PORT_FEAT_POWER).
>=20
> When PM suspend flow disables Vbus while in host mode by
> calling dwc2_vbus_supply_exit()) in _dwc2_hcd_suspend() and the core has
> been put into clock gating mode, it triggers a disconnect and a resume
> IRQ (during suspend):
>   ++Disconnect Detected Interrupt++ (Host) a_host
>   ++Resume or Remote Wakeup Detected Interrupt++
>=20
> That starts the wkp_timer in dwc2_host_exit_clock_gating() that will
> finally resume the port, e.g. call dwc2_wakeup_detected() and set
> lx_state =3D DWC2_L0 after ~70ms.
>=20
> It races with PM suspend/resume flow. During _dwc2_hcd_resume() the port
> may already be in DWC2_L0 state skipping the dwc2_vbus_supply_init(),
> leaving the Vbus disabled.
>=20
> So remove the disable of external Vbus in bus suspend to avoid this.
>=20
> Fixes: 113f86d0c302 ("usb: dwc2: Update partial power down entering by sy=
stem suspend")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dwc2-low-p=
ower-fixes-stm32-v4-0-08a8c962a09e@foss.st.com?part=3D5


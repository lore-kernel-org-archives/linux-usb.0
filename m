Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935702;
	b=ARc2OBe6N0EouJ2YE83IGelSFMG07grqL/AKF76UYyCsdG2IY35IsqKHK2cjz0ptluXq
	 QCYrSb2SD0IxQGLtRCD0MVqcj08Fr8z4HRP3v2swoEY/fHtHTwl8+e52oM8ynfs4r1sLf
	 iR8ZoON0wOqdYFfkoYHq6v/iuulG1TKjVWVzJGamsBxNpeWe0LKXNrCGFTHAtGucn/3RA
	 m4dUpDfAEXrfQcPyNyjV3QYkKFHyCTTQwYax/afxdyJEuUQblF/BSL9vPGSHkvLpu7Qrh
	 AVPDfr0HY929He/eyHC5aqLdZbYYUu/DcI/Xo7qlI5LZBZuxXSCb6YRlw9ehxR9U14Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935702;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UhTw0KjxQ2hyXKM4Woxai3WXkF0oe3Aql8G71QjavxY=;
	b=QFKVmbjzRVRIodQN2PBlgt1QDYqG4gMNGy88ojJAkQLYdhMjoIGHqfgp4kt3grrZ/8SP
	 h+y2czSyOMiEDdDxxQNnlia0qfpBbhTLaK1jg8WN5MKjX7lJ2JLMtxVu3ly2FdLZSH8ii
	 c6lKW2oCO/uf4U/jPkqk2Nv9U/qX5Y2FRGCv4iV9xncXJHInO4y+6C+MJE3LTFFXDYMP2
	 f95RXI2TT2eVBNSXVRd4T+3tp+a9rycbYH6xdJI+TBAwv0dKanS86luR8D9RPwqeMFyON
	 7kayk5N2rfMCMbw44qFeLEqLquIUOooTq3WelEDaOYxDsFFuI0Vncm+LR9I1tWsKLpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H77UZZuq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E3606A333
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 17:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H77UZZuq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD001F000C4;
	Tue, 17 Nov 2026 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935702;
	bh=UhTw0KjxQ2hyXKM4Woxai3WXkF0oe3Aql8G71QjavxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H77UZZuq1qUYqiT6Bw+qhwYs51O/owNg97K1PiGO1vaCU6GiEQhAf48+lw7tlplxy
	 X7IxeBdJR2zetC//UoJVXF48tJu10yveul7mLBEbD+p3CtQG6fv9kTRrWPY44JkX+v
	 O7nr11heppqsS9tFsPncgYKj5B40PvyW6AsOh8sC7ETUQr3ueyCfGA3XIxn9r86vre
	 QCRT9UGyycbesmG4umHJZs7N1jVNTjbehYjVTlXLyC8AWZA9eP4uFW2SQN8169gW/y
	 QMXPmOsPFlxBp/jz7rw0fWNC87mZ+W2A5V+jnTVKskLiDC+xSQCKIzS2hDG65h6Nre
	 zORh7GVTZxQ6A==
Message-ID: <sashiko-outbox-219217@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] usb: dwc2: hcd: don't disable external vbus in
 system suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-dwc2-low-power-fixes-stm32-v5-5-0f197e0e6362@foss.st.com>
References: <20261117-dwc2-low-power-fixes-stm32-v5-0-0f197e0e6362@foss.st.com>
 <20261117-dwc2-low-power-fixes-stm32-v5-5-0f197e0e6362@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:15:01 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dwc2-low-p=
ower-fixes-stm32-v5-0-0f197e0e6362@foss.st.com?part=3D5


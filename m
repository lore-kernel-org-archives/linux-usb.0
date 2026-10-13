Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5183C9ED5
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899880; cv=none; b=DncI31bpxC9wjL8JXr+QtNA+bnD3rwXj+JsLoqAc9/+eQEGAVygTMYPP9po51eNnfZoEPpl/h/zTbGCokBqMmzcFvsnj+cXXnQK/OYRD0EAXC5wrqRLXG2RcCGTFDJg8xmTfZgXLU90fQn6yiYe4UGlw++Gmc+q9ipYkZ3/lg2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899880; c=relaxed/simple;
	bh=KPgUazZzsfpZtWwOFC5xbUYIoiMtWse1cBKGSCKn42c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lMZnC1ez74y6yb3rdL4lTHHREPxXVXU0KSrdzmoVtycGWVeGYpXwflZVfuVaFe8MEHgwkEvLoIforFZANxPSw/conP1KJYzgQx08CIpEoRkyVacW6VPNzi6SzP32R9uSZU5TdaOPJaN9Qrev5x0dBMOUBGAONZlbEhOl9O7VnAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6wN8Bsq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6wN8Bsq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810FE1F000FF;
	Tue, 13 Oct 2026 13:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791899878;
	bh=KPgUazZzsfpZtWwOFC5xbUYIoiMtWse1cBKGSCKn42c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L6wN8BsqCYg9no5QKn7m5eLzGtXWC2z/u2leJArZcZgV4pPrtmwdUcJ7aXPKEPHbs
	 Hgz9IB0AcWC20GdiemnbS2JxTLr0UK5T0ZosCBr9ivCiEGLzzyUl50l+44lR4U+cMe
	 gZ6N6dM5Hy0WKAscwRTud3QzoJEZ65Io9h2pqhV1heeAuBrkh9Ajl2eX64+IYdwUhx
	 0umNc4e9X0+E1zDHtmjWMU+4vWKz4/s5nc6c77p98M/KvoIbTxCq6IA9KSUWxDQf9j
	 2zXE24DUAPy7UWE2xVbezUA47lIkAH0sZjpBC+L6xQq2h9O3wrzq0lFJuLamWf2yBy
	 CekeHKci7MIrw==
Message-ID: <sashiko-outbox-169875@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] usb: dwc2: fix a possible interrupt storm on
 stm32mp1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261013-dwc2-low-power-fixes-stm32-v2-2-79865a4f1b63@foss.st.com>
References: <20261013-dwc2-low-power-fixes-stm32-v2-0-79865a4f1b63@foss.st.com>
 <20261013-dwc2-low-power-fixes-stm32-v2-2-79865a4f1b63@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:57:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

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

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-dwc2-low-p=
ower-fixes-stm32-v2-0-79865a4f1b63@foss.st.com?part=3D2


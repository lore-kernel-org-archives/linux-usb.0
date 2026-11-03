Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793730119;
	b=R1gvlvuC8NvF53lLU4nKq9nv0loDz2seURcZc6QMV0myn6vgbtozp886eBt3IobsvR0u
	 Nyz17bpUNqB5+e1LlOuJfK4D2EMH+xFwEOOmbcgx+CJpVBc4WDQTRfNjIVWmQfmVVG+6z
	 6iI144+369EkzxBxjDZj1UVZ8T3ZjboYmbeIF2fZIPDd5fpIglv9QIjtcVENQz8Dh6qbR
	 YFJ6nlErvqsqS6O9WNDx//x1F887X4RaD2DB7rrFc1FB/wExyWy3YAn/EmONhYdDs6ZTn
	 f1s1eHsUkYZVpWhxSc+fp1O/pP//CxAt+DxaiB5P0zHZUqJUOspzM6fbF6L4L2FRSQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730119;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T7pFyIh1qwNoHvcvlvBt9zmmakWwCXJy2Aeq4jqBd6o=;
	b=Ibi3tv2lbPnAMJWYw3fKIz2m3dJ/XDTBx6LjycFetq49wQUtBcgb9ArGGtyLES9ztLPp
	 QxeC4qoicTP2eun+ldT4XlUDHEtSkmFMFenl5OO0Av/i8X39eoeS/BcCbICYRMWBum5+v
	 uD3YvLaMlc+bPON5J0wGqu3GFpWjkOHqxz3GWhKwnBij5f070HxUpbQc2VD4pi+cOJ8qI
	 g15gvqyp8lPVAHINHqp2x5VDHIrmTL12dTebsWNh2KxbCzJ0dML1dD3PHJAZttFyS1pGu
	 XX/5QbsktVqKbB+LAw0N2XCeRKMQosHaPaaX93CpwaEKDaRXQ4grtp89Gt9rHyC8+yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+k7Uw0M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E8606A31B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 18:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y+k7Uw0M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2791F000C1;
	Tue,  3 Nov 2026 18:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730119;
	bh=T7pFyIh1qwNoHvcvlvBt9zmmakWwCXJy2Aeq4jqBd6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+k7Uw0MIuRLorSEz0Ewa7OG43kWZffwt1tDavvtDR+5tFYr3/MBgiYDmGvIGxK8L
	 T6IPelBQylGUKWtAQqtdaAdgLLB98Q4Upo42jipuQU82FVPkTPCOHZFCETMS9zdPwl
	 SkWBdpjvEAmWe1XpNeWe5eCsOa7k8mTj5O5Ou6pOJFo2pwwcn0xfEznlgb3NtG1cCA
	 PCpIEoxfiLyburu6iLG+d0k9v1C4bMw/UHTvhwcKxqNJTeOWqq/Rp2SxrTRWX6KaTl
	 4h+BQz/EyxIxHgbXbmz30cMrdx4PvrtnLXBlC+PrHFZAranzoiMPvOykic7MyGXlw0
	 F90+nAzAjhKUA==
Message-ID: <sashiko-outbox-195821@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: host: ehci-xilinx-of: remove the driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radhey Shyam Pandey" <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
References: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 18:21:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
>=20
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
>=20
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string, no defconfig enables CONFIG_XPS_USB_HCD_XILINX, and
> the compatible was never documented as a binding.
>=20
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
>=20
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
>=20
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103181722.2174=
208-1-radhey.shyam.pandey@amd.com?part=3D1


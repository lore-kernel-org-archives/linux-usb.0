Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630656;
	b=HPN1G33Hy8eGNB36NULju6wK8SYLX4l97WG5Dfn84nDaB8pPiqqDOeEJ8CEg1H1CHpwS
	 hlyROlXblhPrtbTQUtXVBikiCPr0VEldj4L3c3FjJgY62ym5DsCvX9u+VK8Bfq/r5M9vz
	 HiuXPBMnrWSMD9USDcDzmCHxPsURHScaI5b59uQX1FczoZzTYdvwxq/Dtna6QNHK4cRvr
	 qO68iVtWKP3RTkvAcdZn1jlE5vEgsLbN4dlr549Mn8TcMGG73qmqJBeYu18NCL6VK6/y4
	 V/1HjqYXsb2SK25iXGq5R3IoNbe3DG37yuhwRXRMl7o794cdY7DOtZX9TzR+52ImE3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630656;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UdWyVsanblT+GXBXEHdHTAsy+t1SqQ/JmaIuzNP8vos=;
	b=NdyCQPvD2eBvYAFnlCLdOw48dByBMf6k5ZYdpNv16Ahjuvx06zCoIcSFCNjfYV9j+8O1
	 1YnGhHH/tRsvO4FN/mOLy4cjQzv50/EJNIWu0isq4HDF9joJqM6nknB15e6KlqxOpBiHb
	 YFP74FIt2my3D1sYNjA2q5bBN/LujeKdeNd4ItLzXh2GMDIHrJfPvI/t3YogFngBX9xqM
	 apJ9m2HLG+1q8Tw6ZZ74QR8a5hy7YCR8x0w6vnXqwxB1PaP714LWMVt8Tzhs0HHHu6VdD
	 SCKnsqR0qn99blJCY/OxK9lQzSiEDwm9WjttncxKEwoAmr5jDIYfjqX4pZ3u3BT21pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4drZ4OZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D3606A331
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G4drZ4OZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E2D1F000C0;
	Wed, 25 Nov 2026 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630655;
	bh=UdWyVsanblT+GXBXEHdHTAsy+t1SqQ/JmaIuzNP8vos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G4drZ4OZI6NVepWOhYFySnUmguFWzcOZsmUV5U0i+v+W6mCzCVq+dvNq0xk3mdNLB
	 xeTOFqXY8iReGfCUaLuO69cOa1DVI5URXeOuOtIBXt3sGCJuBNf02u0/OZGtiu6uno
	 qyhddi1fjixgzAASNsMmd+ZnHtglOVx1GbiqQeXgh/0EWCyql4xzMVNGeZ8e9dav3L
	 AsLE21jmhHQxWEwu3jvl5xYjzs17rwOpeptWlF+guTzwSGts58R8m0gdOb1FgEPut7
	 8Bs0Cn+9c/BM6NIWdiTH3jPEGrFkKs+9SOOyjLrsRs7UCZQfMaO9rl1L7umCwCHX5g
	 Bi3YFQ6jh5fYw==
Message-ID: <sashiko-outbox-233954@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: dwc3: tell xHCI that it lost its state when the
 core is powered off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125181116.121-1-26rote@gmail.com>
References: <20261125181116.121-1-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:17:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> dwc3_suspend_common() powers the core off for system suspend
> (dwc3_core_exit()) in OTG mode (DWC3_GCTL_PRTCAP_OTG), and in host mode
> when the controller may not wake the system or needs a full re-init. The
> xHCI registers and the state saved with the Controller Save State
> command are gone then, but nothing tells xhci-plat: xhci_resume() takes
> the "state intact" path, writes the saved registers back and asks the
> controller to restore its state (CRS).
>=20
> xhci-plat has a flag for exactly this, power_lost (commit 668cc6bc1178
> ("usb: host: xhci-plat: allow upper layers to signal power loss"), used
> by cdns3), but dwc3 never sets it.
>=20
> On a Lenovo Y700 Gen 5 (TB323FU, SM8850; DWC3 + eUSB2 PHY) with a USB
> 2.0 hub, a USB 3 flash drive and a Billboard device attached, and USB
> wakeup disabled, s2idle then broke the host controller on resume: either
> [ ... ]
> Fixes: f09cc79b4b33 ("usb: dwc3: add dual role support using OTG block")
> Cc: stable@vger.kernel.org # 6.15.x
> Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125181116.121-=
1-26rote@gmail.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794598466;
	b=MvFZhriG4BnirHSnbHXoCaqG5pP5CZHw1qS/eV4ZRgLnzZ03mUl/w3GXnTQ+i+O67CxW
	 XxRtyqGMWnPUYUOcYR0ezHpHnS/BrMqHZ1WhnS+ObgocmAInciOgBz01V1ZVHgtSHlqmQ
	 rQzBVKOaihkpPnrPy9coYi4gb/owVT2ZUY9b5OhtHoaL7tzeSUcR5awI7L/SZhXvcEoFY
	 H2thguXqvta3yC8onHaKHxTsVkYG8lz/LOZsFrsShZ+qlbRLHqR1ZsHDf1oxFmzz7HjNf
	 ZlsuBp3ksw1A9QxKVdaecaMEMyXmBqpBNR3/mvJN1pNjLuxQHddbCRsg+ncZdyQoqKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598466;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i5YQxaCh+yIhV0RwHtEKRg1dHo3Mi+ZXsbaWT2d+4N8=;
	b=QhuGMbVvOEeD9FEm09ki7xEKHqRkfGTnxMdp6DbCFyNNl34dJkPYN6dyeJ5anxY0rl/6
	 yRM9jCixrWXGyL9lAp7vXBTB+faTW9//ltHYFp6WL3649wt1MQLRySUdBWp/505OG+24a
	 M0hR0OzzKdLjTVFHnu6pyysu6FM6P7vISyFIcTk6r+XvemNoiDYLhQA0EE89Xrbyp7MSl
	 pEQQMeLmDYmshtm9q0V7BZOQ0lnajfaWMfHJ/jkfLqh8NX2yw1XXbTECeNBy0650noY/e
	 RoRck+3KYxBp1eSxmwrK1hKNbJjVo+69EDiXwAn2OkTOmxVVpRGAeKD+vQ97JGewciA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ws38CK6y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64A4606A334
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ws38CK6y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75DA41F000C4;
	Fri, 13 Nov 2026 19:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794598465;
	bh=i5YQxaCh+yIhV0RwHtEKRg1dHo3Mi+ZXsbaWT2d+4N8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ws38CK6yvDBqEELwvI32Ws1FgVSswt/uNm10pbtaaj2SUQoLL75omgDrNeLf6fVx6
	 rY0mJOQgCejr+v8P5ljbkMoSzcdcky2Rtdv5DLncj2WXY6njonaJa6l71qdCwj4SBV
	 4GuqahLr6FUpMuesMwPerqJwQsuuIWO/tkZqQqk+/yWWHyTpvLlU0i3O+5wogx/PrO
	 xZaVa0pYpClctVFgjSNe3dV6rEEx3nwZ4gO3j3/Gm082cmhHB2Vg3DDDPTh+mIUlP5
	 kaINTE53IpfctBWEDlAaAQcWFopwTuGmlAjmT/TuXHKrLlOEShvwhvkLaPdWzevOoB
	 NlaR89XgtXQNA==
Message-ID: <sashiko-outbox-213555@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] usb: dwc2: fix a possible interrupt storm in hcd
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-dwc2-low-power-fixes-stm32-v4-2-08a8c962a09e@foss.st.com>
References: <20261113-dwc2-low-power-fixes-stm32-v4-0-08a8c962a09e@foss.st.com>
 <20261113-dwc2-low-power-fixes-stm32-v4-2-08a8c962a09e@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 19:34:25 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-dwc2-low-p=
ower-fixes-stm32-v4-0-08a8c962a09e@foss.st.com?part=3D2


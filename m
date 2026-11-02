Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614273;
	b=MrnQ4pVdDd4iDMOap0YZDRsNKYg6yNnbeuTJtwJ86CS511+VsJOBOM79e2OBqIztRPMF
	 ExChYKTkUjSRFuwffYPo/c9nE+Ov8AJqH2EdOmVzgMeRFlHM/hc2PPJbj/PhD8l4rqpUV
	 frsMdxqReelyjTfkOT7u2kf30XsAaxRJYYn40tZtlwED47KI2eMKdg4LLuzJgx1Ln5+nT
	 P8FscS4OuN9+r3+tyP59B8RDNaTkPHtH8EigGiN31O73F0KyrMg3OBF/EPNDdlTpwlDeB
	 udCzJhpvjYNg43KpuSN5I0HNMjPov7p1A2aXo2CQUv9mYl8oBzde8n+u4qKZpCsV5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614273;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7mgqERDEVR3xbkG34BZOb+hN28NaBacM4cl/N4Di5hQ=;
	b=3NM9wy+JUeM01Ih/a3OlXF6lp1mVfS7nwovoJnwRp+0XRS5UtdpzrLRLtzeVcunY05GF
	 I1hQd3G97HUw3sk+d6dOJ+n9PBElRfC7AS8cAqH1rCiHYPM5+nESDcrIYGtz/SlblZwEz
	 YgJgsOxYy1RtktnqVgTQDGLoYZ1ChQHxnLVkjg5v/n3wtMyMsH9EjgYmvHgRLZv8rEMhL
	 gBkmOHkvDrjawu0yCYyY6HOMVNltvNOrSqamIT6eiju/1toTbKZxjyb9u53R3pz60MO+U
	 NLdPfhyCPrd0o9UIKaP4rBYr+Zds0U0Z9g89ajlHiKlyG5AtltjhmpwWPNx8LlDHeNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVG2mJdx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77DB606A324
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oVG2mJdx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CCF1F000C1;
	Mon,  2 Nov 2026 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614272;
	bh=7mgqERDEVR3xbkG34BZOb+hN28NaBacM4cl/N4Di5hQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oVG2mJdxVKCMvhUIrcxS603QstqEGex4XSL6unbeNeBzPi24p9dEqymcEgLLMW7wj
	 wVfjwbG/qviXFSwp6RO+hb3CK0z/tVpUoT/x6BRlp0hVj5VKDWAFZcXlwk9/5ohTVj
	 NEtbh2+q+I9QD2cIzEazhgfuwAKB3d+ga/IoFu176VIGeJD0LhV06cgZ19IxWL1uiL
	 DOrj3z5Mlw1mycII0VpXmBlrKayo0zbhNBpiMMr4XEH9cWp11+gVY/NQrUNyPMHmpc
	 +/mi/4d5V1AH5SSrWE5X4on9cUBRcz5E9SDBMxDj4f0rh1i6cZ+UpvfPeN9D/6kmKu
	 zyN94xyiIPqEQ==
Message-ID: <sashiko-outbox-193240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: Fix clock leak and unchecked
 clk_prepare_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102100455.600-1-laixiangwu@cmss.chinamobile.com>
References: <20261102100455.600-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 10:11:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On on-chip configurations r8a66597_clock_enable() enables the clock
> with clk_prepare_enable() but ignores its return value, and if the
> subsequent register access times out the function returns -ENXIO
> without disabling the clock again. The caller r8a66597_probe() then
> only does a clk_put(), so the clock is left prepared and enabled.
>=20
> Check the return value of clk_prepare_enable() and disable the clock
> on the error path.
>=20
> Fixes: 9b547a882e9f ("usb: r8a66597-hcd: Convert to clk_prepare/unprepare=
")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102100455.600-=
1-laixiangwu@cmss.chinamobile.com?part=3D1


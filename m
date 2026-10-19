Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386C3603E0
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376352; cv=none; b=oZlogZusVwu2LHKqQmwBkM/tLTaDF6dHkyBeIydjxOZNrazAPgM5UuV1uFrCtkrYVgks3aqzJWM/bbImAvzjcv61qVngRLlA8CwOx1+CKMlTulqkPigBhKuGGfecPJpnA9wJoJiFci4kT/lQdeGc7dxZZQIjaKiAb9AIuFPWBSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376352; c=relaxed/simple;
	bh=ovGYmiPNvUti7fGA0kKKU03MMj20A7n37KNbRhr01pU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=nMk8fIQDZX5y/QEz01MjLeAfXdnoyJdhhwW756GpeFK7dHxk9BSHk2/UcHNjCpSzFV0f3pfnYAvzRHf+8WAlnnL2Yauhv8nVOdAr57YiECFURkXDIm1rcJidKwzBkYkVpwmGJOxjUnN/BRT9ouD+hmWdTmTWmIIPYxH8PvVrTIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMwCPCtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMwCPCtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177DE1F000C4;
	Mon, 19 Oct 2026 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792376350;
	bh=ovGYmiPNvUti7fGA0kKKU03MMj20A7n37KNbRhr01pU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMwCPCtGngO57ZHaxfjPBRVkvLJHkUfxgsm6bMxciAt1b+xk8xrobgZ3C4zPibuLC
	 xmJdmywF6Ce+MBFegjxE+eDi/ati03SNL/D4ap60kpSiN1LG2S5Mf+bXjQjieVCfst
	 CrO9PIhJMmEUFi1ZpRn/SSVgeHwSefg7CjduoEnhJMh7GIWg5K8P9Ew0YIFzqy76DM
	 NA4g78CG06zdrwSgfOFvjiKZ9U/IJetztU1bFCW/GHnPVbOddzNSEqnAifLxaNx7ln
	 rfRPHCBV3L74KiX3DH/jzimwIC/fJXIfd5/6kU22sFn9xbvN07Q7+Kw5GkTgiry8vj
	 MqNSH+m8vVYgw==
Message-ID: <sashiko-outbox-176527@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set
 snps,resume-hs-terminations for USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Chen" <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 02:19:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
>=20
> Set snps,resume-hs-terminations on the Hawi USB controller. This makes
> dwc3 core set GUCTL1[10].
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019021547.1694=
088-1-peter.chen@oss.qualcomm.com?part=3D4


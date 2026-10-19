Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560B35E55D
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792376348; cv=none; b=HfaQg7qeeZpN6W+Qp4Ym+H8JL+Jil4ju0k9UlOOMwwyQOerH4t49IMOcGbHlDAnhTv+lONYiemlIGVjkHxs/5aPJih9JVGQ2aA/+CxkRXdE+ULd0bDteDb2/1zUXk/FcVICgytSrq8FSI4ubv0rD5ZEOfvo7yLMoXRuAgZbZSTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792376348; c=relaxed/simple;
	bh=XyXfrDmcHl0W8Lr1lP3YsJFjo0BQtc9oF0XE9CT+JTA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gGHGUziDiRbRRrT0zXv+XbNOw1vVRIzXRf4ephFy4X9qrk/zbT6va1ecgGdrplQ0C+kQabthY+CPzzFg0v6RLIfKWSeKagnFUnvfkG4pBd7k3etccITi9EmoAlvFVlhL5UC6hLjOco7EdpOLlyx2xkcVkU6FR0bEBjEKACMP9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5HX9GwW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5HX9GwW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868171F000C4;
	Mon, 19 Oct 2026 02:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792376344;
	bh=XyXfrDmcHl0W8Lr1lP3YsJFjo0BQtc9oF0XE9CT+JTA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P5HX9GwWneRgAvZK8rIuPETrSJykV04fF/nDr2D2Dwg7Vfib3Yp2Rau+WaOl83Hwe
	 ZAuxMC+b8gHzIyklgrj2l0LXOcF0rK87Z4JCpYPfmsL6XQWTek2SAne9kSXMGc4ael
	 xViUI8YyV8UaKo6zuRT9WM5TtPGLQLa0VHxJyuGQYBODh4eGrKXMPFjkLQokV5aRB2
	 wLC7QY8qQjFp7I7L0OQrrrIg8jO8Ih9f0dTE61wzd6dOlXCc5bCpra7pcWAsmS/poY
	 sApWNhBFhMxgSBf37c7m7kXz6SufT2LjJbmhHdpqHI8b3iT3piFjsmCszR0oXmvMfK
	 CChsMQ2Iodtlg==
Message-ID: <sashiko-outbox-176526@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Set
 snps,resume-hs-terminations for USB controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter Chen" <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-4-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 02:19:04 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The DWC3 controller on Kaanapali is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
>=20
> Set snps,resume-hs-terminations on the Kaanapali USB controller. This mak=
es
> dwc3 core set GUCTL1[10].
>=20
> Fixes: 3d395de80a46 ("arm64: dts: qcom: kaanapali: Add USB support for Ka=
anapali SoC")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019021547.1694=
088-1-peter.chen@oss.qualcomm.com?part=3D3


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F51F938
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052440; cv=none; b=fBLmndKgiVPt0tzISqbZcbprUidub0JRCVPNtRvqPtlq1yqBv8PEOTIQfvg9P4PpN9g0qtpl6ca7WjI4G/OjatF3ug4v9ZdbVcKSejr4gGeRrDbvu9m6T9cIS6HxEngJMooFTdmXSTLyve0/nXsVDcNA2hFqCKvf2JBGrOwsfCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052440; c=relaxed/simple;
	bh=DUmLmUtlwfPVFTYjiv2zAlLsFvobbHBofhGYIAtEAkA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OpwUgd7XiB82zEITy3U865i5+W88NRgbGaNpmuLQPDIcNfZ0Wf3oAaiadTqwD/msd9zmXj7Wsp2npQr4XYmJbr4ztnRYVv2ol83FtVTb8YpzO8KzjCbJNVxWuwdvlscGpQW0topOVKga+6iFbyk7yl5YfRACkHBf/gxnb+jXIHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMR4g6or; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMR4g6or"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DF21F000C6;
	Thu, 15 Oct 2026 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052435;
	bh=aBp0fCi9dohkoxTLz4+vUOUVkrAG6csKtoM/7LuXEj0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jMR4g6or4B9YGCu9SfGFtcZ+1Qwf3yvpILOLk79pTE1To0xNCwDnQAf14ltt/0S68
	 DSJfZNoHDPxK8/UUDa73REFJdupZchLRtBcXIH4ghOMeTYVE0LhUvtRSFeslonbQ5B
	 3z8Ufhu7692GnUiEXlVR2pkFeprEexsxvNe12eIyE2+GYTcEd3qnMWwNTTyTq2oM9H
	 FFvu/8l0TOCNAJPa4xrsgT8VWoedyQEHnpzQXYCCnwmzjicBpQIGDfM9vpIcLNNzgN
	 /ziIp6L0hTZrNXsKcZMbf2Zh31H7D9+v5boHWlmTLpQh/kJL2t94vF3q+jTESy7W7s
	 wu+wCvcRDfMrw==
Message-ID: <sashiko-outbox-172464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 05/10] r8152: fix up and down register
 settings for RTL8156/8156B/8157/8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-6-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-6-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:35 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The per-generation split was kept behaviour-neutral, so the new
> callbacks still carry the settings that the shared functions applied
> under tp->version range checks. Several of those were wrong or
> missing for the chips that now have functions of their own, and were
> invisible as long as one function served four chip families.
>=20
> Per the datasheet:
>=20
> - RTL8156/8156B need PLA_RCR1 BIT(3) cleared on up. The shared
>   function had this clear under "version >=3D RTL_VER_16", so the
>   RTL8156/8156B path never reached it.
> - RTL8156B (VER_13/15) need Clear_SDR enabled on up, which nothing
>   ever did for them.
> - RTL8157/8159 need USB_SPEED_OPTION's RG_PWRDN_EN and ALL_SPEED_OFF
>   cleared on up. The shared function had this under
> [ ... ]
>=20
> Fixes: 195aae321c82 ("r8152: support new chips")
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D5


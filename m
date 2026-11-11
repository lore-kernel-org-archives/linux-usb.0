Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367512;
	b=dY+WldSxbJva8wBgRtw6M8LzSHtff8Rf5aBhgV0MyAA0jqyFgTrqKaGCOn+gB9/auwH6
	 mzUpZMRmPVLAT2ymyUjDgifspHYukwHWgpH25+SLnY9B4kI7ICttpJ2+NbdrmugOZPlA9
	 fLQDkJzEsCTBX18YKIouhVzSyB0jwvaUuXy06mdLoRsEWxogniJcMhBclWZL0ve9d61tQ
	 pHjrpSpHWxKngxYgDBHCcWxIbFWCQGk02GHHnZWCtzHGqGkE0wwY/KwIuqqd336FRfnim
	 RONK8v70WGbLwE7Mo4jphAItSh9HpTR+7SpAIZ7I9PjezuQ6WDQkhbHDbYYQGsbR9/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367512;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jValvgbWVEDHc4KqTlDPkjH/aW2uJ9n4rPjUO1VlPYA=;
	b=J8BCs0IwLztIcXTQo3A7Vp7PfVAM62W46CrtRFJI61nHcnmTDzNaizwgu0mypf+WKSlg
	 WeqGaU8rbx9hs6q/f7RhuqiVExByaOUKnmAr+XCoDnCcpJL7vSJdPlNiAIWNXHDJYw20r
	 n7JThIjD7VToHf6eTRiIgObxmOu917WrUUpd5JdZDpBDPWEKlOankq0AfiDI9Gt7omp6i
	 JKFRFUamamYjx+waLXoKb8q3wGmDEJuYh8EBCXkdEpANPuhrwB5Quc12qJauvM8DtWHrB
	 i70MhqjAnRii5P7A/AcSVJF13ikOcor/jNnIdCoucuL/v98tVcVp7bNd3eBxpK0+6Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DA7eCkUD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B473606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DA7eCkUD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FF21F0089F;
	Wed, 11 Nov 2026 03:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367512;
	bh=jValvgbWVEDHc4KqTlDPkjH/aW2uJ9n4rPjUO1VlPYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DA7eCkUDiLi+j0nXZI4NYv58rU/MFQd8UIzJ1vKjMQk7tn2msYBLZZ4r8pUv2peFY
	 SHyZJorrbGqV+NZN+SvIoy3hJP0+BHygBjwzBNbCgIK0IGkO+o7mXD2nrFOJ7CTrLt
	 Ybvlfa91vYI/fCPhcGxcsvPseaeXrmlN+zdD1fVDujhr6lApla05daU0PcLu6hVyvb
	 QKDlFTOMCB5BF0TdTu44NNmUPBD8Rp6r7pniWomrX9Yl3ieS8TLOmNKKMVmY/ZltS+
	 8vx2m42Efimj12jDQTgZqcflb0lLC7AjT0zPMC1faFUUAVGApjeyfJmvk0gIGHD7P9
	 C1fbXd8fukoDw==
Message-ID: <sashiko-outbox-208182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 01/11] r8152: fix
 RTL8156/RTL8156B/RTL8157/RTL8159 up and down settings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-2-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-2-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Several settings the datasheet requires for these chips were either
> missing or gated on the wrong version range in the shared
> rtl8156_up()/rtl8156_down():
>=20
> - PLA_RCR1 BIT(3) must be cleared on up for all of them. It was
>   cleared only for RTL_VER_16 and later, so RTL8156/RTL8156B never
>   reached it.
> - USB_SPEED_OPTION's RG_PWRDN_EN and ALL_SPEED_OFF must be cleared on
>   up for RTL8157/RTL8159 as well. The "version < RTL_VER_16" check
>   excluded precisely the chips that need it.
> - Clear_SDR must be enabled on up: USB 0xd3ca BIT(15) on RTL8156B
>   (VER_13/15), and USB 0xd378 BIT(7) set plus USB 0xcd06 BIT(15)
>   cleared on RTL8157/RTL8159.
> - Entering OOB needs PLA_BDC_CR's ALDPS_PROXY_MODE and PLA_OOB_CTRL's
>   DIS_MCU_CLROOB. Only r8152b_enter_oob() and r8153_enter_oob() set
>   them; the RTL8156 family down path set NOW_IS_OOB alone.
> - RTL8157/RTL8159 OOB RX settings are PLA_RMS 1526 and PLA_MTPS 10K,
>   not the 1522 and 6K they inherited.
> - PLA_MCU_SPDWN_EN is not used by RTL8157/RTL8159, so stop managing
>   it on up/down for them.
>=20
> Fixes: 195aae321c82 ("r8152: support new chips")
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D1


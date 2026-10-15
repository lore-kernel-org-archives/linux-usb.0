Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3318377A8F
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792052441; cv=none; b=smLTwNzXLf3hmiy1kmDU0yPr+A24QMsLwA674Kld24RVvCXic/XgtR1+LZrTwah8p+TEckKSdp6TqSLHojfBqNeTCssVepN5iJTJ8bulPlhWRVfZM+9hRyiVA3tXOo6YkrePVGB+AOgcmVmq25EoFrR4sPdBTmv5ilJPzGPN4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792052441; c=relaxed/simple;
	bh=MVSNORonzgN3U48cXI0yYeBS4NkrhzrHyaPOo/P8UHk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Np7UWVplyJCpSnLm2ujnTmdTu0Jk/vmjBDjxKUTtLsGbkrrQgpl66+2A39lbHojEbG0eIKDxm0Smaa3tAK0zyLEVsTnGmGMRHbeeTzZQvUzzd0cn+FMaKywRDKFz/VSAX9nwGvH8jSEWZbrtcGrkwIHrYBaRtOZIeRbzibT7JZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPW5uT/t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPW5uT/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1CC1F000C5;
	Thu, 15 Oct 2026 08:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792052435;
	bh=LEoiuzTsvpFjQYcfxh+XvfC3to8rfkCiJCe/P6Z/Fl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OPW5uT/tXGtWal4uIfF6/XynCeYglhqBXmnOMOD+h4Xqpc4j6a/9DLsqGHLT/vYIE
	 ebxV5uRO9hG26B9OgQbd2aS+84UjhxzzV68FwV2AZpeZlHftAYdbQYLMyYeftdbsbq
	 YuDdsojuJ6sVF/Uz87dTp+S9ASImjrtb0nO/sBwUn6N7a5Ybma9mc031HSvc8qlbJW
	 HY82n46J0AnPokCatM8ew9Z+ib8tQRRSIgll6mI3ZDJi0IecytJ25TAJUXOtW+rQ4s
	 cfGJVeld6zLd/e2Y9iRJdk1E8J/fdIjiw6U9FTkO+3xXAJ4qMvfvm3gKGOOlUqMBhg
	 otP4ckdpRG4cg==
Message-ID: <sashiko-outbox-172463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 02/10] r8152: add new init writes for
 RTL8156/8156B/8157/8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261014081904.6491-3-nic_swsd@realtek.com>
References: <20261014081904.6491-1-nic_swsd@realtek.com>
 <20261014081904.6491-3-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:20:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Bring the per-generation init functions in line with the vendor init
> sequence by adding writes the shared r8156_init() never performed.
>=20
> - Clear PREBOOT_OPTION and RMT_WAKE_EN in r8156_init() and
>   r8157_init().
>=20
> - Add r8156b_u2phy_backup() for RTL8156B (VER_12/13/15).
>=20
> - Clear AUTO_SPEEDUP in r8157_init().
>=20
> - Disable interrupt mitigation (0xcf04) in r8157_init().
>=20
> - Clear the Warm RST / Bus RST event flag (0xcd06 BIT(11)) in
>   r8157_init().
>=20
> - Clear the FW u1u2 patch option (0xb9a6 BIT(0)) and enable the u3phy
>   patch backup (0xb9a2) for RTL8159 (VER_17) only.
>=20
> - Clear RX_END_TRANSFER_EN (0xd406 BIT(11)) for RTL8157 (VER_16), too.
>   While it is set, incoming packets are buffered in the RX FIFO and
>   Bulk-in transfers are suspended. The bit is zero by default and
>   isn't used now. Clear it unconditionally for safety.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014081904.6491=
-1-nic_swsd@realtek.com?part=3D2


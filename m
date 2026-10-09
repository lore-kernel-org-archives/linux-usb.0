Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56541368D60
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533843; cv=none; b=VMOxQtK9RvcM754Q0OmU0pLj+d0lGb3OjatQduW67dB5Mrot+XGV+PRUume4ykfbG4PkZzT3EUyyKfA/YX/sjEKYmAkBhp9yzN1aKvrOeZcuHTVPKHZ5BI9KEF10dOMS54oV3R0GAZEKipUYJ18jLSgHt+tsB4R2DqEOIsryRQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533843; c=relaxed/simple;
	bh=JDqiY7xDEeMhc0GR4DqoYfE50NPk5Ablu2f9kEjbheo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jCzZ2vetq7JXcBIUMP45rSYv04CsSonUP7UiHB2vO3uhtuwfs6dHSnnayD69L+D4el88Jg6Lxa+4d5Ai+Nk8dXLxo3cwvl9dNlQnamfpgjuZ4NUjfwaNnIiZ3GYxS4OdoQ0h2Tuav3nj41oG+xQ7NCASmmr26SHk90Zsuv4zwoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lhj2f9A0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lhj2f9A0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4171F0089A;
	Fri,  9 Oct 2026 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791533842;
	bh=UwZd0fACEVKLRgTKc96tR7pWLy4u/U2GW33zT1Pyn8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lhj2f9A0Z2H+DKRCayGer7VtcQETG+lRX32bY4/YSYqZZuitHcYkllebxbg3KKUcf
	 guKbukSAIL332Io2AScwba2RN9uGwLtcdlfuOSASniJ8OjU4NQ2z7vL4uYVW1+MEMz
	 Z9HZUsKpXEmRA1GcCnbpIF/dLTKrOST1mDTLjxzDVoWbwmIN7YG981FJJAzJq4Yufq
	 4ruCEd204EJqBF5bP5YgADKqYyz9New4SaLEipYcVQL+RJobQ5uzeGMl6aoK+t2rw/
	 6RpTIJyU1WheNxxC46tVj7QU2Bw+eR+0uXYvdOLvh2dxX7rgUhcaqW91JIFjgHTAu6
	 KCXmSFkPiHn+g==
Message-ID: <sashiko-outbox-165066@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 05/10] r8152: fix up and down register
 settings for RTL8156/8156B/8157/8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261008081556.47901-6-nic_swsd@realtek.com>
References: <20261008081556.47901-1-nic_swsd@realtek.com>
 <20261008081556.47901-6-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 08:17:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The per-chip-family split was kept behaviour-neutral, so the new
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008081556.4790=
1-1-nic_swsd@realtek.com?part=3D5


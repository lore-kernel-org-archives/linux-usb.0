Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385802;
	b=un0ooJNgHLpWAe/DAyZuGGwfbQ6UpfxcK2xfjmTYIQ7FU87ttMxEL7sncwWDMMLgSZBF
	 0InaTU4cjmHArJnemr7bKoi2GNZ/4raapLwl0AlW2vNrsSwt2LWYldhTBXDuhxAke6YJZ
	 gAwcEIxVyCU5BVxYfUOsLGB66VQ+9cJQn5o8xDyJbV2h8Rq7r07gJZoI6ydj0TQgTTA3a
	 Z0etC22Yf7OQHXi/23TF2Lv3phLiUk/CO4DYiUBXdC6TP6AuA9pMmyQI8bO0w/7MAAX6b
	 5qwZnrxI0YHNIr3rEIM4rElgcAlm1E172HyR/Q/QwmbnKXz7I1hCkaajVHWsUJKBZzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385802;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wff6gLg15YpPPisw9Ye/pqv8JQTRcdUVONRM3fOZNu0=;
	b=WFSWnemZM3+IalUTedsc4byye6V0CoWeolVq5UcusaN7YqyItwe6QVPXKqn790QBht3E
	 Mxe8f7HDMLK5Z7UbW8xbVoJmkGifefcimPcEXJGtfusPtL939JhcXBnswZyO9f3kz8ho7
	 lGecBRrmtybhabhZsqpAzK9NJtiRHRouZtp+RFJhHJaoI46+O7xULqcMxYXM2jpkaXNKv
	 BZba/vXuvYBqUipglhhuUBnvQUfxdRH5GqRs0S/WZT6YBXDmu/eUXcu0K2cPsGzdhU6ix
	 2515sKiJo7HBgEzNs41AV5Q7Mp/naeq+oJY5c7tZtnsYoSv44sl8YfIy7m1M/hUBIig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKMTFGgk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37B606A32E
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKMTFGgk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04EAC1F00A08;
	Wed, 11 Nov 2026 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385802;
	bh=wff6gLg15YpPPisw9Ye/pqv8JQTRcdUVONRM3fOZNu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QKMTFGgk5/eggF665vt3lYFZ6quFLNjCYrhBYVQmDH0TFSGQajq2/zLjYvxjn+uWF
	 YIoRXBUlCnSBHWVB1HtcR2R1qPyo6FyW2iHZzsrqQeYJDOvvFaKR7HoUOtPk1EES8/
	 Ubsrjcx+jlFXUtYUqeRQoPOxTmMyVlyh1R3d+DzUwRHwhUhXCHkwQW215UHzzXPJz7
	 JZogXaFrrbcMxvjYRQj+PhwLZA77QU8of7FM6jKWAkiaGWWg8Z+I7fwhUuKS7do9l4
	 W/29m8lEUFKBSivG6wD7WX0qwkLWTW+/O+YCQuRan87gSojWunvY4fYwCPZDsHtDjz
	 NuqDzCRSxgVDg==
Message-ID: <sashiko-outbox-208606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] usb: dwc2: Add Siflower SF19A2890 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-sf19a2890-dwc2-v2-2-cba9dd4a4256@telaak.dev>
References: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
 <20261111-sf19a2890-dwc2-v2-2-cba9dd4a4256@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:30:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> The Siflower SF19A2890 has a DWC OTG 3.30a controller. Limit its
> transfers to 65535 bytes and its AHB bursts to INCR4, the settings the
> OpenWrt port has run it with.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [Joseph Telaak:
>   - take it from OpenWrt's siflower target and rebase on v7.4-rc1
>   - commit message and subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-sf19a2890-=
dwc2-v2-0-cba9dd4a4256@telaak.dev?part=3D2


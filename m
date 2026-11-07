Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794025652;
	b=YKE8aK4RHQI8YEEwvywmjVFV3XIVXrArVjUqWcwJRUgVv+Rvm6k7miGCcfzG1L42DyXI
	 LSYtvhDLxq2f5ScfgX237UjvYzZa1haHfESTUePa+ySwbH+x531hlIcLFJVsauzy5oFkR
	 pS6G5yBv07Q75XxkhFmx8JzyXh3x+/D3t9hUapd4Fr04q6ekYYfVPpCHU5xyAAtYSZTrH
	 vuu4PlTvHeLpHPCmMc7DIJUUD27PpOcXGzNpyqDSOD8HGbv8ltycWQC7av+emr4Ms10qc
	 qpwqSS6sLKgPFaqcsspCvrtavt8IWDLeDdL1qhG9OVfIaR+llMAlMrtnPjL0E61dq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794025652;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ROSjoSMfdMLpruchbQoOj1ks/y4oRKqxEG0NfKUY8Fw=;
	b=ZiVyF/VeGiDt/8TAbLVv97+MXVC7IE5zqbWyuYR/v6wflqzQIDQsiaKjXzUans3Z7MXV
	 wOytP6K/FrqAXC/fYpSKrNjkj70dblX0TxZo+FRJXa0ZnKCvV/6OrbQRf7dI363rtDFWc
	 dRgMTi9kVJwyVAH/8/LHudEPsPltK1ONXikdhVBiiXOmw7Thit3cTBjMH+PEgscu0/TyY
	 +HJWVfp/feDI8q7lxbHiGuLF40U+nsJIwFXw8FbvAV4wJZC8kP+9VJbW+tN8AAe+icmzB
	 cvXHNcbUFaVng7HyQgHUqY9EUWruMJnFFACkajekIcoFXi03anIi8Np+D3x0zPb8lNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HY24Rw8B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C12606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 04:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HY24Rw8B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED371F0089F;
	Sat,  7 Nov 2026 04:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794025651;
	bh=ROSjoSMfdMLpruchbQoOj1ks/y4oRKqxEG0NfKUY8Fw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HY24Rw8B6fvipDHi/WSA3rf7REdLBcrVaNOT2mlYAsR5Oqm2f61mwB2MJgSnXSC2J
	 wuoJbnZYyGaB9hbHA/9b20nzBdj7MDvggmN8w/CFp4UvS82zS8ewWv4Z5SkvFKHFkN
	 cWwgqx6+w2hs2szt3kCg1NATElbGb4Nyyyy/VgGFKxTiZIG7UcRYlZJ8BpKWbW7Lwg
	 i7IZmMardRgRGQIeAcYDh6MAwAKzb52ck+PaWgVguC6/Xr+v8k4zxmfpiDvb4wk7DA
	 fzNBSwYlm0WN71trVLXX0D7FTZvvIKUhXLAYd75gkevaQAPSfNPX0f5AFkRsXqpY8p
	 NYgyfxxoHMCHw==
Message-ID: <sashiko-outbox-202581@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: Constify struct configfs_attribute pointers
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-b4-configfs-const-usb-v1-1-2a2afda5817f@weissschuh.net>
References: <20261107-b4-configfs-const-usb-v1-1-2a2afda5817f@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 04:27:30 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In preparation for the constification of configfs attributes, make the
> pointers to struct configfs_attribute in drivers/usb/ const
> and use the new ct_attrs_const field of struct config_item_type.
>=20
> Skip f_tcm.c as its attributes are registered through the
> scsi target subsystem and will constified as part of that.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-b4-configf=
s-const-usb-v1-1-2a2afda5817f@weissschuh.net?part=3D1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109687;
	b=0CPh58Co+9aXsCb+tN+fO+Uif80l36y8vCq8tVe/2XqN461iGgGOvt36guW+vkmQmEOg
	 iigluh9cW7Ail6AudVHyl41jwCaHlF0UbjVfg1LSq3vByz90Guy+6FFelvayx1/i//1le
	 3oN70bQammoOdLqNoZrsfBd7oYP3FvJLbqqRxna3HoMVhjqdFv/oBU/+DUr3t2Bd+0aRL
	 LmbvtCcBxxljC2KM6fzDqhI38HI7hTPpNgnAYAycqXgQvc4LaBSExPiVN7TktZZ3aH0lt
	 Fnh7O4pSsKahI1Tibu2N9jUwD47XgfLb6DA56Kb9WOFCritW+BDlqYZ1mB1Wbei9akg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109687;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AAG0wshKlIxaH2CejhfytgVKOxLJUAvBB4aG24XfyMc=;
	b=nJudZ1iL574L6paCRXfVoZgFUtimFsoKUWtUqy4WFjeLpkoY2l3eQRi/fz3ym9p8Wxj1
	 Rh+tVaszTgLe3k5zKgtl43bxHKLDl7DeVuj5/6IKBVTzKSVpHrRFGRbI2hy/sksbab0GC
	 0EPArh//6PWy50tz10y/ZPSD+Cha1a08HxEgXS2irTHDidCbaZrYJm5Q6AlrCKQgvtN48
	 IdJqJFd+nALB/EuXE4GuF8hLcroLBvQAV+3yQstj5D1zxc2mGosRdutb+4utmBa19Tgn0
	 K3S+urSyf/DRvraVHBYeBzbLgLDxyPCt7Zt5xHIIgABozBr66D0Bg6UVu7MU+Dl07wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N6K/Kaow";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FCE606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6K/Kaow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01541F000C6;
	Thu, 19 Nov 2026 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109686;
	bh=AAG0wshKlIxaH2CejhfytgVKOxLJUAvBB4aG24XfyMc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=N6K/KaowiW4VDTjO1GV3+UrLqF1N9E8vfjzxLPxAkLJZnTy5BRAXFuntzFNLb4geF
	 uXYzUbDqzDn6GAiZlfUjheHp3ZffvIHQ69Rcht2B048ip7wVBkG9fteM8m0Y3Jjh7i
	 isgnCXtcjb0V60NhzJc24sEnrm3pIiiCXVGCqFTXzgopoe678hTP5FLiWSGIWEt3M3
	 +C9+us5tMFGuwMM+/CkX3oWyuEPLPB5IWGHdFAZBAcQmJVA9EWtWHoo4jG+cMvF4kU
	 Hl2C6aiaBSBH4XoxncbuR7f+eqf41FemKmbJGcFilIRBK46W/BQr8DjJfptOJUxndG
	 ROrGF+loiTIOA==
Message-ID: <sashiko-outbox-223705@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/18] thunderbolt: Tear down DMA tunnels on every
 XDomain removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-3-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-3-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:34:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> Currently we only tear down DMA tunnels when the XDomain is unplugged
> (and when service drivers explicitly do that) but not when the XDomain
> is removed as part of resume or replaced by a router in tb_scan_port().
> The tunnel then stays in the tunnel list until the driver is unloaded
> (or the router it goes through is removed).
>=20
> Fix this by always tearing down the tunnels when XDomain is removed.
>=20
> Fixes: 7ea4cd6b2010 ("thunderbolt: Add support for XDomain connections")
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D2


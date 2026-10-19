Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19D4F55AB
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413762; cv=none; b=WaXlKRUPMrLA3jw7f/TbZeJPv0pCCroatUUOpuuz60qSAussJjitI3/JtR2XobSLb5Kp9nNVcXn5SO4sSh+EgE9Hy/76UJNxgr1afXyfdyUXuI3h1Minkj/dryRB6bQbweJpDSqZpDrrmjtenx3ERAU+Q2KPwpljmjo2T7BbK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413762; c=relaxed/simple;
	bh=mWq9bziQ+GpRs/mM19YYEFkl7tmAsTZTtk9UxtV1u5s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jsK5ZZczHveDtcf8MOidrfiYs/lB3SDzzG2Nmu5kmm/+/jLRDWvrE8a3zi1nwR3eagWsS8dcIe9yT758R6WyKqTneiCFmcnuM1cwYexPdk4nerUTcRtKXjs7OxG0Cr+YnyllBYON0YhCplfgcJz/Wmxlfj5932ppO24Cx7RteTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0P/hWhd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0P/hWhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B1B1F000C4;
	Mon, 19 Oct 2026 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792413753;
	bh=9AikoSLVBTL8oMvtCQL6w9m+A9oTAEsb63qXjzwl6Fc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l0P/hWhd/iKTP6UU0xUj/GFfxzlIogRYKUQlGnhcCSif7YDUvzkc9/zVRYTRJp2yQ
	 oVPOMH/3j9znW15/ypKuvQI1EZ5AKdRi+SOLdC8wo/QSEZEi+5L+KBOMbGCu5OBkG2
	 +G2Tp3kdJtABlx8aAeJZfcuDs8V3ZKnZdTNmbVKz0OrUGNUxAAaYFbNjShG0BaHUQa
	 eS0FgkEK9TKZWtzwItEM85O3kb3pX7SVVpnxvOeGkH6uUCJ/lVC2gjal2Jjg0rEImQ
	 jN2sX3TBJ/gZ1+hhM0pJhFSjfYfuWjTMmhiY7mhwz8q3gtf9RD78GSd7zaSsQt2hnx
	 /cXKNr75uRZTA==
Message-ID: <sashiko-outbox-177078@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: cdc-acm: fix NULL-deref on hangup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019123755.2008384-1-johan@kernel.org>
References: <20261019123755.2008384-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 12:42:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Make sure to take a reference to the port tty when processing carrier
> detect changes to avoid dereferencing a NULL pointer when the port is
> being hung up.
>=20
> Fixes: 3b563b901eef ("usb: cdc-acm: add PPS support")
> Cc: stable@vger.kernel.org	# 6.6
> Cc: Dan Drown <dan-netdev@drown.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019123755.2008=
384-1-johan@kernel.org?part=3D1


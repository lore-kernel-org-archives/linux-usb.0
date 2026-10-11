Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448323C4551
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 04:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694497; cv=none; b=sYirJ1JP4rF4gCmz9k14XUE7zt3fppZhsuvnmn7oCFfd0htAPVEhBo3WbiYUBtlHyMkzKikyQCJsaixKhb9cbwah6vgNUZULeoX0jfGiKa5NT6/R7WJq31Z0HkwZkHNmjebJB40F/BDKoIyEoh+SIWFBOxB8O6vvR7IyadCSvtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694497; c=relaxed/simple;
	bh=qUZXw5Z9VILksRHN4Nn4Jp+AxJ+kn+lqozmcHLhXVUI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=u0bkUQlVwt3Ogc+FzgQLu2XgOvzmf1aRDUWKm+MUvV8BuCd40NJB7fxH45pv8aPESYSTT43+mQ16hebhZffIeDhz5hktbea1XEHeWKlHappicyEvgplHsWaBMaM60NLwaJ332xyiMAG4PQhrhCPyCXYGrEsmNWZUUtYG3p/D15I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tw4DTzoy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tw4DTzoy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36E11F0089C;
	Sun, 11 Oct 2026 04:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791694496;
	bh=qUZXw5Z9VILksRHN4Nn4Jp+AxJ+kn+lqozmcHLhXVUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tw4DTzoyQ4Ocx5nux9s5SxEwXgojbkzoyZudUdIdyvHzWYrK/woHM5uPkdDnwmQW5
	 EZewuDotOHUDirrKvphpQsOnjDQ3l2Gf9dLvxKoNUlS//8+I7PTLDIPT0SshCo64xf
	 iplovuIGpbs//T9i4u/u1nt3Enk3WLvLrBic2QaThg++p+OR/kZluHQOSo4U3NsuW1
	 83M+/q5M9MQP+LV/uxSVpDT4bDNBtffZ6JBYIneHQOfc9CKeXYZjeJRMeCLH4S3pcZ
	 dvG0p83R4vJt3qroQ8hkAt7UiAb03DyDynsxEj5HJr9K6Ah6jq4/zgVOEv0kxZjr8V
	 o6YBbOScIc7Mg==
Message-ID: <sashiko-outbox-167012@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 10/13] ax88179_178a: Add ethtool
 get_drvinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261010-ax88179a-v19-10-7475173cfb56@birger-koblitz.de>
References: <20261010-ax88179a-v19-0-7475173cfb56@birger-koblitz.de>
 <20261010-ax88179a-v19-10-7475173cfb56@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 04:54:55 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add ax88179a_get_drvinfo() as implementation of get_drvinfo, in order
> to provide information about the device firmware.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ax88179a-v=
19-0-7475173cfb56@birger-koblitz.de?part=3D10


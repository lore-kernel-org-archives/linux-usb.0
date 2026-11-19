Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110296;
	b=asOULxy1FbwyfGIleKZvzeWwNuXG0qnPbrW96BNR5+EhyQ862LRNuf3nefz4Za9shEDx
	 2H4wKiBvw2IfAjH3WbOUHOJaiRf/N0a5olQUGMa6G1ksP4hshfk810X9eB3uMqmJKTo/s
	 n017sXaHAphA7ZIInxyHm7OC8j38vreojKAmxcbKfGiAppoZS4ny8gkFO1T/ofkZg4+Rk
	 3ulRnkJETV+7feW6dpoFTDvOLxazhYsIIe+ZqojrmrnX7UarHtelLWv3FT0cYo0aY69hE
	 qXoUVijOvHPKNDmDEX+EuwcjQETvV3FNTZ5vvqGil+iyBiz4Zqzvk+ZpdD5R0UqpKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110296;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GTwmWD88Aq32p25LmbKuEufSbV8SEQEuDL8PNuDji38=;
	b=179/cz1lGnpMUcILGVG0eLaloHX+8+8GeKcH7oDDioRhS7L4Yc+PqjKiZzuor63N6SFJ
	 y33z8lO9MOOqeTiHmE0LtE5IQwMjTGhyNIQwOWJnZpudBoLNhU+H3u6/XlQgG3ZNpDmoz
	 T7mk+BuSsAeotHeOoDJJKFkBafOUttO0kp9lSeD2BrB9MChnQ6moM5IpqOdqQj8asercd
	 c+CBphQRXmio757ns1nKpHRY96mWx3dqwxpN6Sgk7jGegbEqtSriO4iy13T6ia+gsOmIk
	 GIrJxezLUhfrZKhcrTZgK5ymyRmn3uj+QE5+QwX3zqrvGAbcgJq8qJ73GmTvgHkMwGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYmNJKUi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517EF606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYmNJKUi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F041F000C4;
	Thu, 19 Nov 2026 17:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110295;
	bh=GTwmWD88Aq32p25LmbKuEufSbV8SEQEuDL8PNuDji38=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=LYmNJKUitAQoIVdtC31fcKNCNOIO/uE5Ht13ASFXgFbKltTNT5O6bPz18NfgzwSQD
	 lpFBiEZTyUKu0cJ25wNkOSBdCCywFGKfXPq2sOR8u33mP4QneL8A0GL7c0NOgOUreA
	 Lv2IP43XebqVb4p60Ip0rXutyzhW+bT1kf4fPiP0jzfP2KQGdEMik3GatL1McQ34Ya
	 z4wbAWuncNlihLA5mteRiLcInO2pOTnCj6r0WhxMReAs7uN4ws9Pd3a7deXnkPR5Ly
	 QuFujk5ANMtbmVbJ38qhTGTs2Lb/zwIAvoVQgcWCzS8aTGBZinjYdQzIEEq+dwFwdu
	 1gsvCRHasaf1Q==
Message-ID: <sashiko-outbox-223719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/18] thunderbolt: Reset topology after suspend-to-disk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-12-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-12-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:44:55 +0000
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
> The hibernation image is taken with all tunnels up, so after restore the
> tunnels the restore kernel (or boot firmware) created may collide with
> the resources the image still holds. Instead of discovering and tearing
> those down, reset the host router on restore and re-create the tunnels
> from the image. DP tunnels are dropped and re-established from plug
> events just like we do on system suspend.
>=20
> Links can take some time to retrain after reset so we wait for them to
> retrain before resuming the connected routers (and we mask the hotplug
> during that time). Because the plug events are masked we perform rescan
> in complete phase to pick up devices replaced during hibernation (or S3
> for older Apple devices).
>=20
> DPRX polling is put on hold while the control channel is stopped so that
> it does not pointlessly try to access the hardware during hibernation.
>=20
> Cc: Rene Sapiens <rene.sapiens@linux.intel.com>
> Cc: Pooja Katiyar <pooja.katiyar@intel.com>
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D11


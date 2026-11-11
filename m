Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400949;
	b=TNK+vidBni/L+i//FjefWEvhoyw0AJESOPAEYItbwGFtVD/bTH/DHjQLSh5PPQXHxSFn
	 L29iZhGY6l6FtYPH7dRoY6OC324JP5HJWr0/3oe582X/c8yDBs9UfO8gL28tTOygSkd+f
	 hxsydyitfauKo7FbWy1EfhLfbuD5oPVJV7S8LDuvqx8g3tkKpgTX4HjsHOVaiy5cVZY4D
	 aEIBEhQqqDr0l8V/o10Jlf4XeaCnv+UAId62IX08TBQperSjapn9u7Ceke9LbSfBGa1/8
	 9jb03lqVCPEBEOQJw4v1gTm2/JCd5oS1OEcxlBgOaMxNLEDaG4V8/D2KtZ1K2hjM2ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400949;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u9QGNpn9CKl8x53cDpkXafDCGDJaAxJgYWi0WId0fLg=;
	b=DKfaTI5cnVgB/65y98QtMuuEmXDFYvdsDexbrrnYjDDvaVJ/6/nymjmr3PZgxOk2dp3n
	 yJKHInKV2waV11JQTXYGx83A5Uj5JP9J5ZR5mHe5U381y5hoMb7avl09iOrTSOTN6Lec6
	 CTW5Oc3+R2xSJKt24JsVW8kuzCb7Z8i0FIwlGJnJDxlQhOni1wkziTcPTI7WC/71r3E76
	 /9j0Nss7g8cnZczv8t5Dg8w4gUB6OTrvqHRQKeddXAYDmha35b3MhhwlnzZH9/S9VDf6E
	 GbSwRmg12Y2lUNFNFgLMLGCbAMFTZTP5hVfUp4yoU3WVe5I8D8EGWyIxLC2BlCdBIAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpTQe4by;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AABA606A31C
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lpTQe4by
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019131F00A05;
	Wed, 11 Nov 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794400949;
	bh=u9QGNpn9CKl8x53cDpkXafDCGDJaAxJgYWi0WId0fLg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=lpTQe4byAaVLFys90Tm+g4VDWyBXelxNRcANUtrHeb1D71wqaOEB7l0MDgQvTAzLv
	 DCDcwNf7KHbuIf9kuWOk1aZ8bLcJkKCvAvxf0vWO3qslQcERTp0CohsGAVpn5NBDub
	 N06BJnhZH5tKmAFmVL1H0hsjlIo3vpnwnUdomFOffBWCx/TsQW7ESS+v1kxnq193FX
	 cTxiHmWTrVupxQFYIDCXnhLAgME3Yt+KhlkV81vxWK3uT4lvN8kJknzZuGth+maZQ0
	 C1L47T3seIgmY3Dt3YgAxPF0UHUwDSngdsFa2aPpBuXn41TzfyP7wN5XJTEtxm1Ibp
	 UhqnT0e6RTthA==
Message-ID: <sashiko-outbox-208999@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: debugfs: Use DEBUGFS_MODE with path
 config space access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
References: <20261111123248.1312997-1-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 12:42:28 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 398da8e64321 ("thunderbolt: debugfs: Add write capability to path
> config space") added write support to path config spaces but forgot to
> update the mode accordingly. This fixes it to use correct mode via
> DEBUGFS_MODE.
>=20
> Fixes: 398da8e64321 ("thunderbolt: debugfs: Add write capability to path =
config space")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111123248.1312=
997-1-mika.westerberg@linux.intel.com?part=3D1


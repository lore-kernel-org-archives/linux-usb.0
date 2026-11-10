Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353412;
	b=TTcAjICoe2w352fu3Kv2M4cz5v51EoUPqpmMce981Axni9iXj7CG2yCZH/GNCnQyTKvu
	 KqvcP2ul6cHQCbKXGxslYtnEDfj2Up/VSiewXYDGN03I3qSJ1XGa+dfDofW0FKYf8qU/c
	 caxoY2IPk0fGW2QnG/MwwZh2mYSEfTylwoDczsLqlYT+UOq9ecOF/ME/3ILEYT/6Gdfp7
	 H775aTZHZL3OltEHSSmK39y9lptVvAdZ8Drb9jAAE7hMKWZygcmGKjuW9eayGFBm4AgrR
	 PNE1DnE1583jT7NldmZvOVfM1KzsFHuhEt/Xqf9ccjyCUKWd3K31p6xm0M5ppeKa+Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SQ381YkllEhb73Y+1NwCAZIZy8ObTMoOUtV3P5xd0AU=;
	b=AySMeuGSBCWW8wBF+DrJBtW416zxxVm80TBL+s+GfZffX6kBXL/PrKAO3VBVRKdhejdb
	 nPbwdBf0097uhxE2uirp+g6iwI8SSdnpoooIzGRXPZy/1esDyMUOzT+LI4KCX94/+2sc/
	 W7g/xa5p3A4ctF1XOF7hHZQftarXmlw0M+EpiVRSVFO/Kpxow7MYrduvFmEqENG1bf/YT
	 ar2ELs6dceVo+8Eu9wxjwwBIJyDJVh1+TFIvZtuJpatCdApCfEeuxrIwmq0ll1zouodQF
	 6q4qgcQsJVl3t9813sZF8D2CexSSx8nRHovNApyB598BjoTBLrFtRNgzfaVPhDPKYsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzoPbDB6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56782606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzoPbDB6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E091F0093D;
	Tue, 10 Nov 2026 23:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353412;
	bh=SQ381YkllEhb73Y+1NwCAZIZy8ObTMoOUtV3P5xd0AU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LzoPbDB6EDSJtsH6vvx9Ps8+ZimjgoG5w729v/s2Q9tlTTrWwXKOdyn3mKSmcgA0L
	 cIvey5CBCI5iqbGMCeP8RY/oKmAITr8tgQCYnQ1WNB1rTDmGoZDEH/MI0adRWKvOqs
	 IIXDp/d89xS2UMTIUpyF/U+Cqlooxo8G4tdY3uYULHtWP60PeUlNkj7lrla4ioeCZU
	 S9/0KOkTMv4cwymrkb4LQ5xYN29JjY5mntIytY4dG26FNd5Rd1XfJpNLfp08LCbN+h
	 M4yQoX/+bn7LB0g2RBFFzJmvHZUwiLDkc9ShTEezoY3bDG7ScTD7Ta7/Bp431ydgMO
	 VMuBOuMrG9NOg==
Message-ID: <sashiko-outbox-207917@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/22] usb: common: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-6-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-6-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:30:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D5


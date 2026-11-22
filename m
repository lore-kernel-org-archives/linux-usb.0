Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348877;
	b=sUUhBI0D44rCGu8QMrOYyanlFsPDt2mNyVOHqXlFtSPJ8lmhSINSGllTI1giB4J+7V1f
	 265HLApu4GVFAXig7VR4Rk0wolnDuiaOWHCUNUtQzr81bJw3yIhcAkevrSGcndqKc0XwI
	 1sD3W0xW2dOJLSoPOrTFmK4F1tlqbnyYo4cDpNWaXGGg1dSs7norRBvDpz75Q/YGPh6M2
	 fg5CZPKoHh+ISr7s5RdRRaXoswmc3VGmzrRzPvmKaV4Y3UY9I25r6Xa6QUqBe/ZBY109u
	 rMdf6HHs5RRXaTCoi/mg1TxCrGCjGXFTu8T5GgKsJFyfwGAa95YdWmHuPr7IMl+YaNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6Yt3q8N1TxMdGtgGXC6Xvkh4aufM7IDzo+j+Qp4GiQc=;
	b=rS7AckgReAn6RLoZJ+FjE6sSjsCHTDCUuHSGsOZUIqmJz9zGfkZmRpt5XI42dAJU0db8
	 968G++GlwkIsprWE518Hq+ElFg5DaD9XVHQ340vPzLDYXNsY1W+ESs+ynALstx7rfU84G
	 KaggBZhAMWB43erih5IYjSqPmiMNnD9HKP5FbTGZcagvfuLK4rSMM8Ut7Jx2BO0V3MwHN
	 Tn3FsuK6IAnKgLogBe9HClOJZZcut6UJgvUMS12uMzLwC2qgd5LHiMMeNAqoons3Hro9T
	 h1P77+wdslgN5pB5iGVjoGqR+S9mylrYRZ8o954fsOuAmgBU5C2lmb1V9YZw4p6fFTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9lvUM8k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACAE606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k9lvUM8k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A88D1F000C0;
	Sun, 22 Nov 2026 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795348876;
	bh=6Yt3q8N1TxMdGtgGXC6Xvkh4aufM7IDzo+j+Qp4GiQc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k9lvUM8k+fhfg78vmYO2zyHct/Y9vP+KJTAafvbwpcCmKm4sWmAsa8HnLov3/DI+1
	 8kn98TjxbHQzPKkz4wNEx2ZvYq8tlncsk8mzVazQJVUBsQxxuuIWC4m0Lbji8zH6CA
	 60nxmbbwrQQsPojsr7yAMtYEvBeCV22HyA96UfYBYnwmmVSyyJG2IKEB6Pv4IMBEgu
	 i0rBOxXEQLJHlS51/0B6clTD6S5vMPpuz7Cktm2CY3h6sq/JYS38xizD6FWfQSum//
	 soeCyFAZMDV59+OnHH0GogCqAk6H+P62Fl5q+3z/8YzK4TxqaHtfUXDlPvbwFz3126
	 XdoMfN7SQF6RQ==
Message-ID: <sashiko-outbox-227916@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: fix missed frs_sourcing_vbus()
 call during FRS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Max Andreev" <drunkbatya.js@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122115639.2912666-1-drunkbatya.js@gmail.com>
References: <2026112206-lapped-unvalued-8696@gregkh>
 <20261122115639.2912666-1-drunkbatya.js@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 12:01:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Since commit 0908c5aca31e ("usb: typec: tcpm: AMS and Collision
> Avoidance") the TCPC reports sourcing vbus while the port is still in
> AMS_START with FR_SWAP_SEND as the upcoming state. Because of
> _tcpm_pd_vbus_on() ignores this state, frs_sourcing_vbus() is never called
> during FRS.
>=20
> On Pixel 11 Pro XL after an FRS from sink to source the phone keeps
> showing the charging indicator, and about 20 seconds later VBUS drops
> and the attached device reboots.
>=20
> Call frs_sourcing_vbus() from AMS_START when the upcoming state is
> FR_SWAP_SEND.
>=20
> Fixes: 0908c5aca31e ("usb: typec: tcpm: AMS and Collision Avoidance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Max Andreev <drunkbatya.js@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122115639.2912=
666-1-drunkbatya.js@gmail.com?part=3D1

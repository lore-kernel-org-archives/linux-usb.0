Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353592;
	b=0UwQxEimNmgjcjPXEXK0f62inTKTg/xEfb8kMy0aT49NhF3dSwxh1biwqroGhSnaL3BF
	 xA5iiWPSAxJEeF73VS+cvRkN7T4z2EaBFHxXmN2Ck1lS5WH6X73y67Muaem2giX/ffRWn
	 ytnyDVJLFQc/Wxwk5QU04V0BD7H7qbobvf9Mt1lRGx5hXOPDyG8TBe7G0vZK0YzSxruYr
	 0ZSE58gEkwpsfuioPFJpjEUmhGDs9HTxesI8jcyw/NYfXpvSy8Dp9ZF3KCJkdaPjjLmi3
	 rhy80bATaDj5wSX11Rl2Ohdm70qBt3y/HSE8e6rH+nbFlNBmZlbOx3eoD7nC2Rf5uVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353592;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LpAwOHXncYKPl0dStHfISS/og9dUJMKOe/sAaQXelGw=;
	b=OoCSmGwpHHoOeZ8M4+zH1wG1VC8i8eDlUsei8kYSm9xdqEH3zqaaWX1NLjZuuZZ/TzAz
	 2ZK7BSu/XIAkCLMZRNnTXh3KB3D9SFwE78YZfsMvqlsA6yBtZOEfJOMmapwO0QiGQmK2L
	 trixAmy0Mm9GpEXHYAj4pbBeHa0sA+CHsbGZz3TBpJgvG9qBFU7Z7WAhzvqIW4jc/hQbU
	 8Sp1c3dj+n6aQJO57ZJphA2Yzln3pmexek1jIC8r/750UskhPHxHNK0K7h7cJKbIHktx6
	 X4PX7itXB/nl9JMDmFEtd+8OQUFs71qtTcFT17aBeQ+53AZ9o6rJJs1NsUufMbHhi2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXNcZTdI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E615606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RXNcZTdI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B9E1F0093C;
	Tue, 10 Nov 2026 23:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353591;
	bh=LpAwOHXncYKPl0dStHfISS/og9dUJMKOe/sAaQXelGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RXNcZTdIsmpA8BSvflP2JJk2bmonZ0gI2Gpt/wejkxmos7uzCHtZwPZtKKUF3tpwG
	 7071gU22Xnk8x7mKoUuSuT9zmkH/vfvTnP+C0MoZO1aEX8/mvrV+6Qj819/tSY4DRa
	 r1GySivl1HDwA18QP4TLtiG5/wj+nORnohMfUoreKltqRDBrofTRV0ziypiWAcFmFt
	 VKP03AI52kGjoBh0UCpSOt+PMKKwbBJiBgwHmPWzzWoFFRfwfsgPJE7g6Ax1d7Yux2
	 XKox5/uw/Dzfel2pG/vRSmerWBlwIn+h4QTCxIGhNy+/OsckR+s1XoyxdDA84Jko4C
	 XZLbh2LrY+0LA==
Message-ID: <sashiko-outbox-207930@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/22] usb: misc: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-15-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-15-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:33:11 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D14


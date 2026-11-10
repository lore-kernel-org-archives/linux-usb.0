Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293326;
	b=YCf3C5JGUubm8Bv+X4HjE6bsvTVChgDH3uxr5hVNNEMUsXVM56uZyPC8SiNBJrTAsDaq
	 gdV27eFw9GqEfyjZ2K8wk91iaL0NDNEm+4U10Oi1Cf4SzPVEqi7Utp4y2SWUND16plqXG
	 BifTfTzfpa7Y5R8vGvxwSFZ3DHU+6SwmfqeB3U+C1kDJ9F6imCGK7PTs7DYWOgQlMfkWo
	 SUargO7BGk/JEgqC+j8dlll1VAIoRZCAX1h4KM0KwYsF48Px5rRRg3EJfyHNGuRhQiI+F
	 +ijFpefw/ClS5+cARBC0na3WgnycExF2vAZMXjQfSK5NM4BcuejM+5CXhm3KJZSG9mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HP16hQ5uRKUy1kXGdhs5BfgGw+cW/SfyfUA4rYkeI3I=;
	b=JjMhB7FfGl3xEmSU3iZaSzmvcC+1tIzW25aA3MvTug3HG/JWLsQPu3cLTNOklefqkru4
	 +dDDW3I3C8sfSafQ9Oh32JlpnsMyy8be2U4iTT//N/Wi9Rb6I78up9QWg3SiDY6ADqPZO
	 wzhIV7c7g0xXyRfBq30khkoj3UclIcaIP94dw6bzJrW8LdRIJXVedjhB0NPHP1VmI181T
	 bJ9UmmLn0kKGN5fZgwm6VTUbJhDD+ykXJ/+jQLAnflQl0Eu4ibUeXfWSkSvfHnfaFzkpI
	 6TOba5JtjRE80nJbkCcGBvBNRWTjhwA1Er1f26erymKnD6jAmukyrjO3xlEGfNyGXww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aa416I/0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3359C606A321
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aa416I/0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9211F0089F;
	Tue, 10 Nov 2026 06:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293326;
	bh=HP16hQ5uRKUy1kXGdhs5BfgGw+cW/SfyfUA4rYkeI3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aa416I/0trvhDwNPkjan2uDQHO8Ng17pYHWJuhKGwFe1Y4WQ56JVpCaHhvF3JqEoh
	 Cfs1tjx6pO5+PMxpX8MiyAQcg/piJ44ngrzRUKYQmmlM5QHwkATV+jFWNVvtAIpHvV
	 SB9QTXV3XdKAQ595cts+FuKzLDzM8k4MXpSWOBhUUD/1r4hSqQrMPLv3tWGWoGR8oi
	 NxWkfmGF4sfHDwCOwWdSTDDH6Zu9IFYJsX6vJMfl1Ezbx0DAT0pmTmQcakUat6DxBQ
	 nZ1ftEqC2zjpbak0LoDp9IjQtP0syxnqw7T+JRXHLV4PG/pMdcnTB34ET4l6Hd64iY
	 /WyGvZFvqeYQw==
Message-ID: <sashiko-outbox-206448@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/22] usb: dwc3: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-9-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-9-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:48:45 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D8


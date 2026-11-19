Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108940;
	b=WbCKJpwQToRrs3+IUuAtbZvc6Od5vx47RToLC2R5UgsRAyJy1CsaI9qjXknHnJrSg8eb
	 DUbi/7VNP1xzvtov7D+4RpmkJCwS9Yq465RAbsKap1I/mX8bE/lwVagx+QBBRXy8ODMu5
	 VcvWIXfIsEqx1Hei3JsMCvOFgK3spULSdKSUKDGgpi6O6EMvIrw48c2N3uMjnUvoO0ljG
	 hN/4iPDuMo7hjnTYBEmL2otRJU2l1N/p2mts+X0aM/SZIHHyfvZKulM/0UhFLZ/ZZfTJJ
	 FsMvnQ9Rjigz8PzEqCKkVXJVtFPmTCrIlT+c+iEzQmsPQ3f8dcr9+5XzW1jd+4oKNWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108940;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SeqLCgBnbI4XrLu7OIhbl+zArehNsovkrPSTKMlRxC4=;
	b=IP8ByG/sqoyykeD00dJBakPryorHk/d/cufXotblMmtjWpwBJQMM36sfDIMPsqUrhEZV
	 95DUF5vr786XPiaDz/TVx92bz19CVcfH+UtxtUJQm5vb1L2wzAz5GMcU9OUxKZ/mWLWil
	 oN0vuAXP2Vrh0mpuZJQ1cAh7ayZMsYWNS24fSvb8eNg0I703res437lOCcLUwNm7g1I2X
	 vGlIqkENpMM1fo/HawLiApRzjXrSmPuv7xIR/lW9rLdmZyipzfhQ38iiBet+7UtQzHD2x
	 /BUZnbHkld2KA3XCVR/0FwNi8xLlQ4f9vEKKQReRwFdmmbLsY00tv/1nOXBP0uIPOEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kNU6PF6E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02D6606A32C
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kNU6PF6E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749C81F000C5;
	Thu, 19 Nov 2026 17:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108940;
	bh=SeqLCgBnbI4XrLu7OIhbl+zArehNsovkrPSTKMlRxC4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=kNU6PF6EXEymX9KhNSbm5wJ+icc2pgN9TPL10GOeBE+pH300WyR4RLgr+qw8eF4Kp
	 aYBUIFeuWd5QoHxk4/Ubt98UzNV6NtrSM6SrXtRRDegUs040YSqQf4l0xNWAe2PIP7
	 L4SH0eao8Gy+NyMKBifr3gy3IQlg9yjPQJ8C/Y481d0/6k+2eFxPfW3bVyT3JsRyNW
	 8D1LAGhhBJYGa0dLVtOzHcq8XmdUEE8gHkLotesIFi0zhkSJaqfyWSHgMqYrM27HLu
	 TGLeqN+me79VHrpGlqdLHCH3ElAsDsl1SWoa1ar8gLXtyX+ZcX4fqOuNGBUUsa936j
	 5rOZwzd9sVIjQ==
Message-ID: <sashiko-outbox-223687@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/18] thunderbolt: Add tb_port_state_is_up()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-10-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-10-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:22:20 +0000
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
> Move the check whether the link of a lane adapter is up from
> tb_wait_for_port() into a helper function. We are going to use it in
> subsequent patches. No functional changes.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D9


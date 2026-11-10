Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794295293;
	b=4cgQnqXiFOtN3WUoDYJlTmca7wxn73jk7QI2MRKk4MMTxQOgueEKhoB4335zxySeE9lh
	 jHK85WefrIAp8oLzmO2PdPuKTTXfCLtPcu4aguYXMySzIRvmDBvF/je8k2OTgdqfBHZsU
	 gD+o1nucJn/79gr3KYO8UVHiIk/qouFrEBbqh3KT4CoEFF939xSzQA5P2wCoKBmgKdW9J
	 w6BYsNyEZJpmbbTRAMN5xqv3lWffY7xGsRU5Uk40B13fzyWi5cGgufzGwLE3MGMAvpMaB
	 1q7ztl6zmAuGC6myYimNuNeT9PmBQHZWaoIch09ntq1MRBNPGXkVT37AebKFf+eSiKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/AC3XbnUrq/MbfeKUzF6j5+BhAWrMILHXXbGeoHkBzI=;
	b=sdsjuRUG1R2cPMm80r9+5UjoyyXXscNyal5PuLPUvJBnfHr6wAtXw5aof0tECVWMxJDO
	 Nd8zgtOv+VfGroOaxAHND0Gty9aJcvdwd+zemnrmXpPnYM85ZbGnqpmph6x2v+zrHeSsk
	 RsqIu6LUgb+64s+XZuWE5eRdbgKndUlrAOxV+27zNCt6hTa6q0zBnqtS0ieTEKIVh3T+F
	 ueSTYAQwov9vusV3a5nN+cM7dVqgXNEaDSzlh7UFs0DVFvDH+y499cT3bMJgKV3RmrskA
	 vfekS1CjPkSkNUZSUq28aAhBivgVwshVyvo104sAbb5Bjm/Hv1uBPAfUakV5hmUypuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kv+O7uXT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9E1606A32E
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kv+O7uXT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC561F008A4;
	Tue, 10 Nov 2026 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295292;
	bh=/AC3XbnUrq/MbfeKUzF6j5+BhAWrMILHXXbGeoHkBzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kv+O7uXTRtB/Svgfh/3eour6qnwJ0Ya9mAG8dbK212wuCNPxmTpeaD2sFKHHaa/W2
	 IFJTs0kouUrzZQLTjP/2cm540qIW0s4aTLXQRdX6e1JbBU2rF4ZqY0SuTDxWmHf5B+
	 3mX6KKUQOMgo8mO9jE6Qhq35L/MjArG42uXdFpJXzSHGDgGaNa/dwNltPoXRGrw2IJ
	 HZVZ0S6PcqbDLpqmlftGZsX3vgM4w1tLKiT5EecXNSARQLXXNB8nGzTeSBZc0vQ0jc
	 PirW99SwxzKSdEYFqCCtVvDgxvoFjMQnR12d06lrrIHgAdZOQ7yqcvknWriau6UEB1
	 QJDoVH74jsKBQ==
Message-ID: <sashiko-outbox-206478@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] usb: dwc2: gadget: honor pullup requests in
 core_connect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Inochi Amaoto" <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110070627.217946-2-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
 <20261110070627.217946-2-inochiama@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 07:21:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The connector ID work initializes the peripheral controller and calls
> dwc2_hsotg_core_connect() even when no gadget driver has requested a
> connection. After a host-to-device role change, this clears SFTDISCON
> and lets the host enumerate an unconfigured gadget.
>=20
> Check enabled in the connection helper. So the device will keep
> disconnect until the controller is ready
>=20
> Fixes: 510ffaa48eac ("usb: dwc2: Initialize the USB core for peripheral m=
ode")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110070627.2179=
46-1-inochiama@gmail.com?part=3D1


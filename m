Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919375;
	b=EYWYrMO0WpfdVWXLKCix8CigyDeV6NmY1sAruNF3l1aRAAw9BU1hQwaAcrjNpdbCNilW
	 sfcIY6mG7zegpuXAi4zSEdmV83toUIeGRdIv3g3wvv3BCHSZ/ejTjO3E0ZMfA+QWWYRqd
	 qmh3zhoVSUxwDlWOinBs31RPC0+t+xhL+EgNI2+pyAOEd8Rf/3ef2zMopYQAZXMK7m+7k
	 yZbNriMkHtv8Str86qDxi9TN1c4QD1vemtgGf0zHbARcjOmRVCY4WQXTyzllWQh3gcBUD
	 iT1swP4+kBoknikt5tB9G2mvQIaQTllJ7KhqXgVwu7LXE2OC5eEGWahQlHLUSJkpjcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919375;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zijCtRZYQK0PO96lsXyThaiWbth/svadjPCCEF14s8w=;
	b=UrDmnNmIGx8ncm2wvandB5etkKtf4cR9Fa3niS8z51ijCgqavpHWbqCkhU2aJVoyKqVF
	 n57OZJUjeenqraraMOjbIo9H4fAdpbsIR+USCNq4W7WufhPxecK8By4EzXQZ4j4sZlJb6
	 4tynN4wa7mpRHGFDQARokwPGuIf+lNr735GTLaHzUxljz8gr6ELFnR68hR1FCSry7lT70
	 EeTjmuZOZ0YilKUKdvzffW4R0PYsp4UdGFBrbEqq28mtP/idvytZGBWac/T36ou72QFGy
	 NIjhcDmt7FobZ4iZKwOLMSMPh49x1AZj9+0U+OHN9qSHEASsVK0Osl6J7duX194DB7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZM8wl99;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9156E606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kZM8wl99
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39781F000C4;
	Tue, 17 Nov 2026 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919375;
	bh=zijCtRZYQK0PO96lsXyThaiWbth/svadjPCCEF14s8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kZM8wl998oXY7+Tx00JO/WbhPBmIWRsoPx4Xq/eJHT28tPBMPzXOwyFYvMfib89QQ
	 zVc1EzwY/V897x0zpvhJFmU6zaR1zC1G753iPCCIyCA2Q9quh9QoHxM3r3KVwIqm5h
	 tsoBacm6RE6KPxI6hcnKl2PnR0PCghmC3tcJ3tYgP6WB6aoRINpereO6xJXrGornee
	 OAiUB39yAqxsZGmAbyBgm1VmWAwLNRvltzrivzY0kIrFbhjPRybqsbKqYKHffJf5sg
	 bW6k/2N/7JRzlgRdt/BU/nxJ1TCw9KhLetGZtICqm0k6PL82gE6w3ElzMIc2eq6LnR
	 jYLszA32Qx2Cg==
Message-ID: <sashiko-outbox-218782@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/9] usb: chipidea: usb2: drop the ci_hdrc_usb2_priv
 wrapper struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-3-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-3-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:42:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> With the clock no longer stored in ci_hdrc_usb2_priv, the structure only
> wraps the ci_hdrc platform device pointer. Store that pointer directly in
> the driver data and drop the wrapper structure.
>=20
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D3


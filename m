Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353479;
	b=u6Qb2bWfg2BkotFmYjOllUqkLojFv0SLEzZTxpNi4omQWRN3M4H6pq4t2E4GhINovjM8
	 bca37HJ3r8QnVOIPr67y+EhHYSbCyCStWX0xx1jXKVES/NZUmvRr0LtXZX1XPjeg4RreM
	 md7el4vTjlMZr+L5o39n8PTreTBZ3qf1NJ6Izx22iHK6yKncSLdcb4IvBazoz2d2DyJDn
	 O4cYHzFcv3NyPR1SBn0j89n3FvOKbgBYQc4NKdFIUkBURDbOtDfhfbdJTtKZoaf97f2gT
	 p2cSLbtNILxjtLGtP4AGGY8UMGpHYHkvD5tpg3Y7twn+RKj2ObJbvlVlL+ZfqUMGSZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6UxfTDqS25ezNREx56sD/0dYrGfqiu8wQrmsZjyWI34=;
	b=gaCx1/l+bJ8gq3Bmsz2ca024+67IHYn8j928Ne6Z/ZhW1CLqiqnlnYo8WoxisjyoQ4kI
	 G5vyIiO8dZWec3DgsOvXcAAdvduiEqio3MJS6Q3xR6IqjIr+RKPNGnD7J3WnIXXmrzW66
	 HSBAxhFxK5wBy4GAAkwRhpjCpP5DRtrPDwKjmNjwoWV4iAoz18GkchXvvA9o8fA3l9ER0
	 4Jh8JSSXgm+GV86mXnm3rL3jD+FtRgVk1a9O2LPtTi50D8FEBr/n6UMTZTZvWbNsGA8k1
	 bJuCkhebOhkunzwqQ5vuTGQbOYw7utQpjZFFdrrwRaD2owS/XJByaToJEsfRznHZH0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q48jfk/d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8355A606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q48jfk/d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3558C1F0093D;
	Tue, 10 Nov 2026 23:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353479;
	bh=6UxfTDqS25ezNREx56sD/0dYrGfqiu8wQrmsZjyWI34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q48jfk/d9GnzTb4srptimwBkJUvftWHUX7RXuZYJLvCo7/b56Zc72sJNBcRmawi2K
	 xz/wiipJKzp2TICVmH+9IYrOrpBJym1qZFRhw3uiqv1lAVQbyMgjDgTHKtcvHeSwdb
	 fhifTQb21kPbmsHYGl+0dw7Su3hXvrdwS0E2iifpeusj2dC/wCn89bHuQMRlHI78w6
	 otMj8PYoJdr1kHh6cgyHjbuyg2e8t8VxntMB/S35unHFbg/C8luswEdH1WAuUrieZZ
	 R9gtjoCW8KCNCSZR6a6XfcoIR7bGusfW5zkhDbtL8zWwuXQ/ATIafkTyvf8Smjr1BE
	 Y+RXXy3UeP3Xg==
Message-ID: <sashiko-outbox-207921@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/22] usb: fotg210: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-10-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-10-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:31:18 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D9


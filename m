Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279838;
	b=jgMAXz8j0DnTrEUQiECUotwocmjTpo64poEahy/9QyIfW/KpqseMHwvuS3hCTIqr+lNh
	 OSUgDKk6lRBM7SBxgFsmk9FirSlapbPmR6LR31IAuhS48K5NpgWJJVmLX7jwrL8FeryiF
	 3Iugg6xl932ut6MXUysy6YC5hx61+FIZj03oYPlDqTsVaYMjR3/lbHeio1t+DuvxZtZes
	 ULUvs/q/UFF/w7JWe6j6AZEW579bsxv+m0BYywmvkoJwuNFlmIrHU07nLXQjkZdC76wWh
	 BfDVH87qbHZjzehup62XbETfYHYMEyWSSeBcEwbZNDRrFX6lPp3OAh4AIFq94XkFheA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2wlU9b6oa6QhBi002pusU8U1d25udj7VEJINV7Y4koo=;
	b=ETri5Cr+rkVyATe5akdaJ1zl3u5sv5we2rKD7crVFr5B/HCKHgcHbKdJ82DfQtcoj+7f
	 rAblxl7TcFq7c8kKtXo85LmBcNAHfLRllBRIXlQ6P2G2r5c8IZbCdbVypio8w5E8xIBN9
	 AnBAK2l63vPNURosfW2XZbDNf4OzCqkwotfipff8tj2sOWa7Njmo7+dnntYZ7qum/yCaI
	 T5amRVlz/1nTyR8vGvXFndAG1o5w/En7AjnZR/TghfLFk0DM+D/qKdiE5A5z6MDVuIgZw
	 u5gciWK3MF77WU8N21VXCdvjU8Jx5DOwhBT6GVWJo8q1CWux9mD6mUihlRmH3JXYKyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DacusnGW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7D3606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 13:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DacusnGW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A881F031E2;
	Thu, 29 Oct 2026 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793279837;
	bh=2wlU9b6oa6QhBi002pusU8U1d25udj7VEJINV7Y4koo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DacusnGWezeksuveVBH/A4gPYMwnldvIRUenBHFGz5p06fKh6kEk6zkQWJoNnBtHv
	 XNs+VuIDX8aT9VWL2a4i3B0RJI1TJ+bOdNLUtzVX6J6C037AUneQMSY9oL4zKQiJUM
	 Rt9EDsfn0DmsVhWHvDLl2kRFtcDSzqTzC9UrjtAaNb3JSLln7fsSe4+Ropd0lG3F2/
	 VIOZQhB9kOCQqYG2C8DPJqmLI9FZ36JeXIs+nj0aSR8pp+CQ76aD6L5zBJe0CAs8In
	 c8cZ+vk/qW1PTOpMliMmeYKNqoK8t4w/COqAelwDSgsA94yO2eJaDPcs1/5Ri9MQDs
	 7KW+gDUlZeopQ==
Message-ID: <sashiko-outbox-189363@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: usbsevseg: cleanup sysfs show handlers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029131401.676734-1-dmantipov@yandex.ru>
References: <sashiko-outbox-189323@kernel.org>
 <20261029131401.676734-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 13:17:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Prefer the convenient sysfs_emit() and sysfs_emit_at() over
> sprintf() and strcat()-based quirks in sysfs show handlers.
>=20
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029131401.6767=
34-1-dmantipov@yandex.ru?part=3D1


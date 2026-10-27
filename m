Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072066;
	b=aSn5elyw/fWBoxsJPvdZ9GdC7+IqCYEg0BduPZJOZGwW5U1nxTo+nTdU3+NX7Spk144X
	 gBLjdaAA0ywGYB+ocG+o1sudKQSKNYTYpJUoLvl99K8zrCpPD1adYlumZnKFhdIZMUPOz
	 2AlvGE33jNOVo33/egiUqZcDCz2Gsh1WEH7V5+RU4ciQD+7LQPxf9NQK5hOCdbxHPkXoM
	 ZrMSI94NLk8KITZs706vdkEG5IdJGeWDBeQyH7ztt91vwHxqC7/82UXZjhwUBkHoCtWow
	 6xZtfBxkKNyPYCzPz+hSkcmGYgfugr2aCCsWyMg1qujvtC6LgvU0VLeFXs3gCRoEZPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072066;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JuYpAk9A5kLlCQxRMJLy6Zuh2AK9ItH5xcFKXQvUUU4=;
	b=K7q/pVIgAR1ISDN3iivJXS3KSv8iAzbaqro5r+P1ITT1/mUsSNJ0tAJg8sHRjrVlUaFX
	 u4jTOrudQoSnxVZi+sEXOrKMDyJ6id4PMnhdTkfnZXyyPj4MN5/70CIX13IynFhQh7aLc
	 CPZ4trpumkRext8ok9ZU2Xreae1qt5MFqVqW+qqjdcoRA83m/cLGqNxasX7lGLtCR4aev
	 z/Mj9iWr7MjIW8nfjNefvFW9iEm/RErL0XlNeYlcFYVMYE9dQKig8BQnfeZtsO4P+N5gQ
	 pAMx37a1DHgKmblC+M6bFcov1SSyaCGQuS+6muynn640YGx2KnPvSJ/LB6aUwOehDJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJYlZZSO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A542606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 03:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJYlZZSO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A9AF1F01825;
	Tue, 27 Oct 2026 03:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793072066;
	bh=JuYpAk9A5kLlCQxRMJLy6Zuh2AK9ItH5xcFKXQvUUU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJYlZZSObmo4DDVIA55NeJFIPSvch03DXEcJJkEgeJu5X4vOgn3MzrXrU9kfcF18/
	 hV/A18jP6QnD7ZMvsuOaIAjVNQATNXTFuRj8u8zTlmYQT8pIyRocu5uc4D6RfTGUb+
	 Lco+vbFtiiG+HEMGrYgNcOwpV6Q2UxlxJlApB/XiSd/xLrRmCgoNs72SP4m/XZwzi2
	 y7L4vutKtZqMKcTo5oAS9jxnAE/rUuvQBiP8s0p38Vn7iJ2wGGliUBnoPVAQhdhYR2
	 haUSCvnbzVDQyX3Gr/sWXAvf6YV8HK0M1xE5vVqtUo0AD9h2o/on/7TgDrOJ0nRmzr
	 pdkdNYO4rDi5g==
Message-ID: <sashiko-outbox-186054@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix dangling ep->desc on
 enable failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Chao" <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027032332.1945140-1-liuc63@xiaopeng.com>
References: <20261027032332.1945140-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 03:34:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> raw_ioctl_ep_enable() assigns the user-supplied endpoint descriptor
> to ep->ep->desc before calling usb_ep_enable(). If usb_ep_enable()
> fails, or if the subsequent usb_ep_alloc_request() fails, the error
> path frees desc via out_free but leaves ep->ep->desc pointing at the
> freed memory.
>=20
> The UDC driver may have captured the stale descriptor pointer during
> the partial enable sequence and may dereference it in subsequent
> operations, resulting in a use-after-free.
>=20
> Clear ep->ep->desc before jumping to out_free on both failure paths
> so the pointer never outlives the descriptor it references.
>=20
> Fixes: 97df5e5758f7 ("usb: raw-gadget: fix gadget endpoint selection")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Liu Chao <liuc63@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027032332.1945=
140-1-liuc63@xiaopeng.com?part=3D1


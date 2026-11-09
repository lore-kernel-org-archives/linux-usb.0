Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204298;
	b=Qu4JMTz7dJb6xbqRmU/QbAkBRYwCjHBt/2SCiDjpGtYOBY9t5eubYUCSAXUzkeSVc4Ut
	 gaCQify3cwGtw76ihxezyhC8eKSdY3ItuqRYjqSMPa7lc9bHsCHd6TRbivlY3lKIYoxtk
	 tlEVWNkv486PNxzqFAKrvTdLy9cOwg2DgtR/GcImBGfpld4/Y8oKgotYFlOCIbBshrQat
	 3jCuE1iwoPTDyFxSsQaDRs24gg/th+dT+1dUOKck1PbeOaCud72GJ1ysh1ggCcodHCVYf
	 TP7uR7sGGECSW5TNQhUzDhe5J4OQC+Fp5Q5eqJ0WfrdkFoAxpHzH+xTscEUN1qHnn/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204298;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yxzX9GIh/S0qD2c4lqG1nUxS9U4zMOhnvxYR/xETTrs=;
	b=sr0/VPrKOBRB85lwgVDRWYSQlzhO6yj8SDxeFphVNyoa/UEX3QzJ/0hMzUBpVlT06tWO
	 lCoqugkoDXijUSs78gvlD15zBjk0PvSCuSDMtDKQseNU02Xu8jFcmdNsV25iRMJWE3NkL
	 cQNWXH4QfqpLtJaAoKYTQmJb+KIdhHDvblBsQi/PsXLLm7RYcn+Klreo5Y+neUpHnBqDM
	 bMb+iyEoxPG+PnJRiRBngE2PQ1aM3lI2LSoMYiM1+w16yuCMb4PQuIBTseAVazhEgLOBH
	 AtZo42HMJdBO6zGfbA71OHDjz+njgeprvE4TE0kS5RxTmvVPllXIz9Ytd06/bDNBcrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7GNk5ga;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1A9606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 06:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f7GNk5ga
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5451F0089F;
	Mon,  9 Nov 2026 06:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794204298;
	bh=yxzX9GIh/S0qD2c4lqG1nUxS9U4zMOhnvxYR/xETTrs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=f7GNk5ganfL21JYBNSbl11ZgKXV4prTt978MVODsLU5PoUU0KE7I/vysNVwg8/Z9Y
	 2C4kejwFXnqej40ZBSGkSm2pMUuPeVh9sEr2M26ktddsbkYde9N3yWKnGnzVjKPHBg
	 8sOyoWTVa9mIIuRZwBH7zPrq/KashDOWRMJWJKMJgcry0kLsX3ZKkcOJzRpN93oEFI
	 uoVdtJ62Di6S3OuHI5vgEtmpTFgd1SrAMLd4behzJcTLB7UVW4z3b//lYKWcu66xUg
	 CYrbeJBJSSyJbmuwEFgyI/WI4KqqcEa2xAHUEfpG/2Alu0n1yd09+4JQBlaXF+C2DI
	 kq75MAmLP0XtA==
Message-ID: <sashiko-outbox-204482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH usb-next] usb: gadget: f_rndis: prevent double-free of
 OS descriptor table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xinsheng Zhu" <xinsheng.zhu.ny@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261109060018.71063-1-xinsheng.zhu.ny@gmail.com>
References: <20261109060018.71063-1-xinsheng.zhu.ny@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 06:04:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> rndis_bind() allocates an OS descriptor table only when
> cdev->use_os_string is enabled. However, rndis_unbind() frees the
> table and resets f->os_desc_n without clearing f->os_desc_table,
> leaving a dangling pointer.
>=20
> When a ConfigFS gadget is unbound, the function object can be reused
> for a subsequent bind. OS descriptor support can be toggled through
> the ConfigFS os_desc/use attribute, which determines
> cdev->use_os_string on the next bind. If this flag changes from true
> to false between binds, rndis_bind() skips the allocation and leaves
> f->os_desc_table pointing to the previously freed memory.
>=20
> A subsequent unbind may therefore free the stale pointer again,
> resulting in a double-free.
>=20
> Set f->os_desc_table to NULL after freeing it to prevent the stale
> pointer from being reused across bind/unbind cycles.
>=20
> Fixes: de7a8d2d534f ("usb: gadget: f_rndis: OS descriptors support")
> Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109060018.7106=
3-1-xinsheng.zhu.ny@gmail.com?part=3D1


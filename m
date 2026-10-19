Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F447DD44
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399860; cv=none; b=K09hXWXaL5adzQ+OGBtbr4+lUJLYYyqtdZHt/LhgrB2tmeOp4S5ycg4i5z2oGtSiUDUzNzEEEAw0BjHFEKr8PxianD2Jlc9N2LdPwYvwlxMwZJ+F+UsuPVcW0u+/cEiWgYez49b46ZaULOPKNPq3nbBZakwcQF8h04KJ/mVvoP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399860; c=relaxed/simple;
	bh=/r5QHZ4vCsiTjDklMrLz9ro5sNaI/s/UpsAOgYC5e2s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ZfNTa5YK/tHeBxg9W+qUpXzqiz2qQ3q2R4v0lcVWy1IPK3yN9PknKECmiq29gMeoUwFVygOlbnLYh9LMYqpuyCF0SXzt3Im/EHpSUvL0c04DjLWu4QSkcmPrJ+lc0P6Bavo5Vs/kTqMdXAIoZFgS3NdDli40Dhu9dgNzn67SQAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnfBRvda; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnfBRvda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C04B1F000C4;
	Mon, 19 Oct 2026 08:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792399859;
	bh=GpCmAFM3H7RVmEgnEnv2Do7d5qTxkxPkaFVeJg4UNPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZnfBRvdaFcfL8ZgN/GeOQAmXfjNB2a7WQL7xtz+XOgvXxLZaPK3cP6yKCAvnKTpIL
	 b9DSgwM36oRnYRTkNolJdD5RUY57CvKJ67UrH/G4zyqbhih5t5FW1QNMJLSmilgJlF
	 q9+gQmyMEX7S96AZqhi/A2vilj5u/KglogosB3pYquumlJjyc+VvRmFOIonMfMmPWz
	 GMmMg1ZzU7pvGpR23iJRQ4YNNEv8tVXH0Sef83xbRbUZdUy9kg53N6UsXCL/ZTYD6E
	 6eDIS4a3j5jTXSOaaffHULvJzA/LiEvLcrRqtNCPEKfXIXZv40LqQyNvMty1t7bN5c
	 pwZGQlxxbsMpA==
Message-ID: <sashiko-outbox-176848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: cdns3: imx: fix kernel panic on remove due to
 kfree of static platform_data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019084944.2051097-1-xu.yang_2@oss.nxp.com>
References: <20261019084944.2051097-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 08:50:58 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Xu Yang <xu.yang_2@nxp.com>
>=20
> When cdns_imx_remove() calls of_platform_depopulate(), the child
> platform device is destroyed. platform_device_release() then calls
> kfree(pdev->dev.platform_data), but cdns3-imx assigns a pointer to
> a static global variable as platform_data, so kfree() on it triggers
> a kernel panic.
>=20
> [   56.809541] Call trace:
> [   56.811982]  kfree+0x44/0x398 (P)
> [   56.815300]  platform_device_release+0x24/0x4c
> [   56.819747]  device_release+0x3c/0xa0
> [   56.823413]  kobject_put+0xa0/0x120
> [   56.826906]  klist_children_put+0x18/0x28
> [   56.830920]  klist_prev+0xb4/0x1c0
> [   56.834325]  device_for_each_child_reverse+0x7c/0xc8
> [   56.839294]  of_platform_depopulate+0x34/0x80
> [   56.843664]  cdns_imx_remove+0x34/0xcc [cdns3_imx]
>=20
> Fix this by iterating over child devices and clearing platform_data
> to NULL before of_platform_depopulate() is called, preventing the
> invalid kfree().
>=20
> Fixes: ff6d6e6c6778 ("usb: cdns3: imx: add glue layer runtime pm implemen=
tation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019084944.2051=
097-1-xu.yang_2@oss.nxp.com?part=3D1


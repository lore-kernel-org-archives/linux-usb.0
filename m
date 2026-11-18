Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004588;
	b=ZxwsAyCzQSYicNt1z5QorTrZhTf+YoFJV+PaoI4Ty+rG0wizZ7u8Rbrkkj52/LCgbdX/
	 4u0pWMtqabFsy85tWI9o6veJtwyFYVvAw/nDvP48WR4UWN8dxLwegmSTa6/c2cm8NeNYt
	 g9CZN4ONHbrChxmyF5OHyv38H8B1S+Z+QvYaqc95C1ov+VUoHfyjrjcIghV+W+l1/LlM+
	 sA+gBzobqrb1+trDsjxgCLZDZdhhgpzvjFn6CWMI1VAQKTS8ZDAfJKe7r5dRTtTrP6PbT
	 0rPKH4gGnRBQ8aimsmcev8itHhCUCzB3DkMlpE6/JlwOtokxOQAnLOJ3LahdFBXQahA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004588;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=teUn8v05ajInL9dbZECpDR1n/lMIQHXMP817QWyMH5g=;
	b=aH3rdSHE/5KRtvH47LtyVarPqfVv8GEtyIznVDlhqaRBv2wX7Eu43bBCp1bSdkQHVbB0
	 NvOJP1gZ9fP297cBVroiaYbOWRJBKO3gpATDUcEl9PvZXAhnGGOrtfaDTFRFDDGok/oGc
	 hXMyG7zvGCoRifl+VyDzs0SwWDrTbWwYFWKPFXGB8fceokE9m1AsmUwUBBLdfuzvev7CH
	 iBGRuR0FPzNDiBOxR1HNdK0QKmNckCG3Eexmk7rbcQ340erd5zPvDVcBeEAp73aMSlbtH
	 DSGbYQH8U+F4U/4MS00BexV1S4HtuMw9dE2wlyEijVttFLAbj9+JnRC/Kmdvo9Rtc9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaX3pu24;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693C606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GaX3pu24
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDC51F000C4;
	Wed, 18 Nov 2026 12:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795004588;
	bh=teUn8v05ajInL9dbZECpDR1n/lMIQHXMP817QWyMH5g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GaX3pu24dyORPVeWkvfSudqQ4xijSuBePb+lz/hLtaNc+syVoJ+2Gup+MftvIHMaI
	 j/F6Dua6wbLbf4v3t+9PS6X159HIOQFWzCyIZYvcG9KSLkJBbAMZcArvXbMmnGCyW6
	 tusvSnv1JQ22Rj4nUggs2ZgJBUv6aIOCb3+x1k/MD9UeEuyAlpEG0NYSoYr5J66Pn3
	 lH9d8sqbQG74RkccmSWW8SVBZFyVD4CvxiBdX4Gubx2HCwvGSUe2IzeX29FA7lcq0B
	 z5TyqRXcF0oaCFq67QMS9cGXttKTJSi3GgDcbKYtB6e8YToBT0UcTeyuJXwY9AcDUv
	 qIjEE3YR4+MPA==
Message-ID: <sashiko-outbox-220906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: cdns3: fix NULL dereference in cdns_host_resume()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guomin Chen" <guomin.chen@cixtech.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118120816.1974909-1-guomin.chen@cixtech.com>
References: <20261118120816.1974909-1-guomin.chen@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 12:23:07 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Guoming Chen <chenguoming88s@gmail.com>
>=20
> cdns_host_resume() assumes that the xhci-hcd child device is bound and
> passes platform_get_drvdata() straight to hcd_to_xhci_priv().  That is
> not guaranteed: __cdns_host_init() creates the child with
> platform_device_add(), but the child is only probed once xhci-plat
> registers.  cdns3/ is linked before host/ in drivers/usb/Makefile and
> both are module_init(), so at boot the child stays unbound until
> xhci-plat's initcall runs; when xhci-plat is a module it stays unbound
> until the module is loaded, and it is retried even later when its probe
> returns -EPROBE_DEFER.  Platforms that set
> CDNS3_DEFAULT_PM_RUNTIME_ALLOW (cdns3-imx is the only in-tree user) let
> the controller autosuspend (20 ms), so the parent may already be
> runtime-suspended by the time the child's probe actually runs.
>=20
> [ ... ]
> controller from scratch, and xhci_plat_priv.power_lost is only consumed
> when an already initialized host resumes.
>=20
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to=
 xhci")
> Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118120816.1974=
909-1-guomin.chen@cixtech.com?part=3D1


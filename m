Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597901;
	b=JAy2n2ph4rCaqIyKC/Wdv6SpIrQP6RkyAoOySroySNbvY9ysBH6jLt/43sFISzvOnpox
	 sEI3tklFzO+E5z3+C8/S8+kIcIrOw/P3/gPAo7inOpuZnYB+0Ve6YW/vZ8DnCMJ2/CGGQ
	 gJSpN/67e6/lybn+F4KxoEWfGFYk+iE3Ng++zXV0lJ8ialCFCIsoggB1ovDO66puKsU1D
	 bASWeY4ilr55aa3+JYBRwNMY9B7muwvdd9utFfPu8bF6sHEJWd5TpVt0pIWvb4ib9YDKk
	 U4JzlXQQSG5R6bCkt0sU0WgY8UNY1X1q6+89znsjtc1whu6ahSSxt+WwUpTXvssZ+ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597901;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dtloLtsEUGyicGaIBzMOdodHDN85y10QVyJC10CYwz4=;
	b=TWx/uHt/vsRUaqfGKThSD7A2Y25blzADp6wJgg2NgoeXnZjccBHCWvdSQ7HGatUHMUtX
	 8AhTfSskG6PWETYQSZc3SjKi0tK1BqtbAkt+BFSv+KUlmRXDMxL38MeOgJ9c75O3jPtoM
	 RJ4hgcVq48kbKE9NPXFo52tHU2ZJ+iO3oFCiqQLARoi6lHDJ04g8zUCYg6BjLJv3jutez
	 ho+c/G0M5Xvmbz+RAYAIidATWaKR1lLcmwABT98ur6YBLxmyMtgUtvoE8EkvyqJKW+UOE
	 rd3GU5uloyMw7mng/6VNQ5Q86kGxIvqiSvBAd4WviKd27s17sGiw8uS9uC3ErjY1Sqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqXIeRId;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6773E606A323
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqXIeRId
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BD71F000C4;
	Wed, 25 Nov 2026 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795597901;
	bh=dtloLtsEUGyicGaIBzMOdodHDN85y10QVyJC10CYwz4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nqXIeRId+6LkU+i3m7RkGvWgbSbMVcPbL+wg2AIA3uFC0UVGsWSt5G1z5+cGGu3xG
	 6ZuPFqt+T850nSfidoHJGIKIpyqkgTa2mRrrcQPOnqZRXLFwSGnuGJE/hfvjF06zxM
	 b5IrIQLc/bt2+pSAyrirU2WsVufcdLw0HDNOuo4JxOuVmM9s51QlEslQ98rf+YwpQd
	 pMCCMzD6NL3C7AW35Jz5mxD7Zp2QmYEtPalaRwZzFCnIH9lSc8Oyg6xstGhNWcvNt7
	 BD4apIi5byceLo5svfhLacxPl4/iYVe2nvij927x2IRDQQFVlbdCy+vD2GgaevF7JP
	 tSmoyPRLsnPgA==
Message-ID: <sashiko-outbox-232975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] usb: cdns3: fix NULL dereference in
 cdns_host_resume()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoming Chen" <chenguoming88s@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125090115.2993-1-chenguoming88s@gmail.com>
References: <20261123075116.3868-1-chenguoming88s@gmail.com>
 <20261125090115.2993-1-chenguoming88s@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 09:11:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> cdns_host_resume() dereferences the xhci-hcd child's drvdata without
> checking it, and both the child and its drvdata can be NULL:
>=20
> - cdns->host_dev: cdns_role_start() sets cdns->role before calling the
>   role's start callback and keeps it on failure, so the next resume
>   still calls cdns_host_resume() after a failed host start.
>=20
> - the child's drvdata: __cdns_host_init() creates the child, but
>   xhci-plat sets the drvdata only in its probe.  The parent is resumed
>   before that, by __driver_probe_device() when the child is first
>   probed and by a system resume in between.
>=20
> Commit 87e4b043b98a ("usb: cdns3: fix role switching during resume")
> only covers a role change during resume.
>=20
> [ ... ]
>    xhci_plat_init+0x44/0x50
>=20
> Fixes: 3a85c1011540 ("usb: host: cdns3: forward lost power information to=
 xhci")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoming Chen <chenguoming88s@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125090115.2993=
-1-chenguoming88s@gmail.com?part=3D1

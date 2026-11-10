Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312137;
	b=RlWiEPFP0Y84/oOmVXuxRfs35AtTMRuYQrspv6lWRWoH9F0/sFQgIgo7bxsFTPaqmOIT
	 RMB1B0PFcJJt2UwFZqnStDdkM77+JWMXU1yeeEzNfhNuAQ8bLp4jMe/I5Lj3TX9PQf4AH
	 WAYfFyfAH6XwlWPfKRW00Q0x8RQNzzsj3MOipgSRPBCLdKyXqELDvaH+UJQiyZPXTiGJV
	 M3IdWwYQgCg/21C6IkVgT5JGfETu362WBCyIR8AOGdhPLJFpvXaW0LnMdTPLNs61bbV8+
	 QAbMSoIopbhH+1NMaD8JQ6AjRtWvjVaPyw0fDjaxcFEb4lVFmxX/EQXk4QaXtfAiJXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lpR9BlFZBScPR4jEZ5T2v2BDJZSrxUhWCsrP2/l5W5Q=;
	b=20ldXOLPIy9Mch8JsTsVXPH90GXf3wgHQVoqqVSi6j64zWb4EFZTl+DKoH54hjb4zfYb
	 Wub+Sx8zjZfmap3JGdA6eUAtbgqQYK2t04WEtC96SaAlTdFCq5HKlkD1ah+46YNjt8XmW
	 Ku9Z25KGMjsm1mAsZb+QrtZ0uIRx+8NTYMNYFoB8aOJq9tXfXfFS3DPJI6DoxWj94NGmB
	 EWxj2tFg4tIpD2oNN33sNglQ260BKgtDvDrSg66reZmJzOyWFtdb5A32msL0NO3OcvZg4
	 4f8QOxnMA7LSei+MVJ18eSZwWAEs3/tgFkDila2RRbtxt23GpxYG+e3PyPOvXeyZYcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iARGUTDf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621E606A325
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 12:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iARGUTDf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8FC1F0089F;
	Tue, 10 Nov 2026 12:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312136;
	bh=lpR9BlFZBScPR4jEZ5T2v2BDJZSrxUhWCsrP2/l5W5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iARGUTDfeuvPwGeFXQFgY5DDwJr32oXRreb5StEoVBzYb+F3EoSrZpg3oBoRfhpmN
	 PbAszpK7fhzlDfJBTsIcGiOunIurWoQ6gRe+lyAk36n0WoyFLavc4lFTY7kHDIL1Xi
	 kqw4tzf2igWmKrUG62t93IWqJjndZTLgBbSw59k6ylgAh0CnMYKPXpkNlhxTOZ+gCf
	 XGi4QTNnEQZBGmClfpLAp4DLp/mwk1Z+bRoA1UyGnfAFJ7jIAYJpvsUsefrIAblzJw
	 qCScMoGXoekxVzfK6Yu8L1PtC5Xlhah8SlMnE2x71ptup1KSWbirq/HkW+H66bLm1z
	 dR9eeEK3XdsLQ==
Message-ID: <sashiko-outbox-206972@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] thunderbolt: Move ICM mailbox functions to icm.c
 and internalize interrupt work
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114925.722014-3-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 12:02:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In preparation for modularizing PCIe NHI and ICM support as a separate
> driver, clean up internal helper functions so that they do not need to
> be exported:
>=20
> nhi_mailbox_cmd() and nhi_mailbox_mode() are only used by the Intel
> firmware Connection Manager (icm.c) to exchange mailbox commands with
> firmware running on Intel PCIe NHIs. The Thunderbolt core framework,
> software connection manager, and non-PCIe platform controllers do
> not use this mailbox interface. Move both functions into icm.c and
> mark them static.
>=20
> nhi_interrupt_work was previously initialized in pci.c within
> nhi_pci_init_msi(), requiring it to be visible across files. Move
> INIT_WORK(&nhi->interrupt_work, ...) into tb_nhi_probe() so that
> the workqueue item is initialized by the NHI core and
> nhi_interrupt_work() can be marked static in nhi.c.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114925.7220=
14-2-chunfeng.yun@mediatek.com?part=3D2


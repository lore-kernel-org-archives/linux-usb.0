Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798688;
	b=KCadUtA9mM7xJcGduWLnG064mOinqvu6sREA01yo2rNLu7BQ83JnDZyLXq/0QKdcX86M
	 1WVrXG70tPr2mOkkbf9iJWucp0d65AP24vPaHK+KcigpLRuyX/OmEOsf/y32UttDnd64I
	 MP6RE8zDTfqvEbWTSjiAiqR4098AwH3HVjJz82tt1vpUUimcmdM80A/2VvmTXOUAO9b51
	 G1IU9D1C8Dz2lEPMgT3/9xyCT/jL94ijyvYzydf27HouGOjVVqrmTQvHgRVFmVH6SgLMl
	 K4MpxyG3vyIi+wCy0yLvS2IuHosQpgizZGEWcPLStJN24n2XLoAVywGjrYEzRTEAWVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798688;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HGEj1TjC/FBcrViZb3N9R4QCAeNyjUQEV3Q1FYbphaI=;
	b=brs+kM08HKBWlTUfbKEMv1VXXEj34gI4MzI2Auf7gegtP7qIYjanHJHZIcX9ntxf+Oqi
	 Vi2kz1K8CwqMbbOIq5/L2Ea5Bb3HAeWra0dHNE3hLyUIKlSNaet/5SJdoFMtKSKEQQCJ4
	 SHetqFyZviw55xbqs2qsF10NMOypa//oriNwOnSGqacjMgI8kgSPNbx0r9f9OEIxQqpQ+
	 LLTWI/0nqTAnmzb8bRJPhhLm/pKpXlzsW3PEmkmpbMePSKjOyRyj0SDFm/+3ZK5dRvq3f
	 FdurQ/62tHAbsXnG4XiJXuAW5EiDcJV2egOL2vMvEmOjPDpnS18vp7gIIBhCMFpAcUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fICQZ7av;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B1C606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fICQZ7av
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE521F00919;
	Wed,  4 Nov 2026 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798687;
	bh=HGEj1TjC/FBcrViZb3N9R4QCAeNyjUQEV3Q1FYbphaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fICQZ7avxoqosoyme795V1hlP+GFYa1eYqSzg6n7OvRzkFlgrTpWKhzIzwZEKhhNt
	 zgVAT7GBTXRFHsonPEpA64QZvAaVDsxtpQJgE87CfRflrqcMUHhljq3xYhlNAa/QEu
	 nhA4rWMlTD0KEQLPBZc9YJKJiJc2TEbgoQiFspNAxO5sRhhN2HakT53stKxjxybdh2
	 Jobz9scaFqTWXqCGF+XuvF7JB3lK/H751Y+ApRShjpwh21yN8PPXrVOEddhbNn8WoW
	 4MSUpaPV58CjbsNJxAB7jIQT0DlY/zIJ6rndzKkS3I/6FwheFij57PdM9kC47msW3c
	 yLLJyyzJcqgKA==
Message-ID: <sashiko-outbox-197339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: dwc2: fix fifo reinit in
 dwc2_hsotg_core_init_disconnected
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104-dwc2-fifo-fixes-v2-v2-1-2bb13820f662@foss.st.com>
References: <20261104-dwc2-fifo-fixes-v2-v2-0-2bb13820f662@foss.st.com>
 <20261104-dwc2-fifo-fixes-v2-v2-1-2bb13820f662@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 13:24:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Currently, the fifo gets re-init, with a running DMA, e.g. when
> using_desc_dma():
> - dwc2_hsotg_init_fifo -> Flushes the FIFO, DMA may run in parallel
> - DCFG_DESCDMA_EN gets cleared (e.g. disables dma desc)
> - then DCFG_DESCDMA_EN gets set back again.
>=20
> So move the dwc2_hsotg_init_fifo() call after DCFG_DESCDMA_EN gets
> cleared e.g. DCFG write. Then the FIFO can be flushed safely, before
> DCFG_DESCDMA_EN is set back on.
>=20
> A BNA interrupt may happen on EP0, before this change. When it happens
> we can't recover to a working device.
>=20
> Fixes: a5c18f113150 ("usb: dwc2: gadget: Enable descriptor DMA mode")
> Cc: stable@vger.kernel.org
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-dwc2-fifo-=
fixes-v2-v2-0-2bb13820f662@foss.st.com?part=3D1


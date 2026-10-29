Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278962;
	b=5WvP4LTCH+o5DX4ZeyH+Tb5fDqipX44pjrjbVBHiPg/xrBDUi03PI3G4kcLZeIh9WZMh
	 VwYPPjTIjnve7nZs7HY3/k1onAthmVR/1PqIsrzbB3iaBWKyTDgnl6SGdP9W+c28MQtr2
	 lhv9yjXRfmEguuMBldv+LBQ9/v9xuU0bEQTn8FW+v8vTydZDTEOYhu41+EFARkbaoB42H
	 Fjhbq77HpRFlPemoqlpGWMs0znsa5WdXgt8g6pw+5FM3m0kmSq1AxiwHS5THyieBOXZsO
	 9G3KCUz9K52kVzLkwHq/KcksBhi6phS5WU0PK3RQzkPhiQWrVOkpZrQLxEuPx3/dg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278962;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8KYV9RpdYKdz2BZA1fr5J+QoKwQZoh9kOmG6aLlnVCM=;
	b=bD1nMdyVxIKYzGdJfN70b0o8gmJnbV80/MT7DZfoYvqsMxyLI2J3+/xaBk1qmjQ/cZw4
	 lRbiYGPLSeZDJXRvCzT4ct888lOd4ePg1Lkaj7So+nr1UjhN3jHTlYZ5vlfjMIfr8ihxr
	 MpEEgGBG9vfLLAYITwTiLpo2VBetAE7y6YEHcbUJP/L8aKks4n53BksobxyYH5fVgVjIr
	 kIDmuwJMCyLXxNfLGVXsUkwpgJDcMkkdg4tEFM0c5nYiTqXhj7BwHdcH3l+0tbYvwCZ/c
	 XnfUo1xj6ATZm68y2gcg/HqrSS5KNX0FMY9hgYzKd1LE91ClRBzunDlxZoBmk/qsiCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hPb/7bjX";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B882606A31C
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPb/7bjX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CA01F01825;
	Thu, 29 Oct 2026 13:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793278962;
	bh=8KYV9RpdYKdz2BZA1fr5J+QoKwQZoh9kOmG6aLlnVCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hPb/7bjXkBPxKS/RgS0j3MddCa4I/xN1k1t7L/NYzvcDj5HFmbBzOis7BP99wVA42
	 kEzdSqjA7ZslCxi8e2jl+X0yC+iguaDzAShZ69CHI8UgY4qWGaPvZyRsfUVPIiCVr3
	 x6ZGTWyTZK+gS4/e+8xevdSpD5EvWRLhiTE+IUiCx6ntlrFnY/kFpKybB96/yO1bhX
	 7sgn80M3QSWE63efv+k4VIvnGTu2WpoddzvAetSSNVOkwGF1JYaNpUDjYOTiAVDwns
	 YDxFFE5Jl16tPOYdxSd5ZK33n9htb9SCkC/zGoPtOu0JIK+wIuU82sZ1ZfLwrJTs2N
	 NS1yqB49T+6og==
Message-ID: <sashiko-outbox-189344@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: Remove deprecated dma_fence->ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Philipp Stanner" <phasta@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029125143.1744481-2-phasta@kernel.org>
References: <20261029125143.1744481-2-phasta@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 13:02:41 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The dma_fence_ops function ops->release() has been deprecated because it
> prevents drivers from unloading. f_fs's implementation merely frees the
> fence. The dma_fence backend performs this deallocation automatically in
> the correct manner if ops->release() is not implemented.
>=20
> The backend simultaneously correctly frees struct ffs_dma_fence since
> struct dma_fence is its base class.
>=20
> Remove ops->release().
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029125143.1744=
481-2-phasta@kernel.org?part=3D1


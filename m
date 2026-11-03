Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793750184;
	b=JFK+lTvfu2HaHz7WkPZeu+oHBsNHLAJrknbAAMHlaNsfPLF3d7MjGB1kdSHEDOvE9TuK
	 QajxksDMflFiwJa/Lil3/7tTIqAOqDA/1RLGJEiSun9iaphr+kaY8ATVb2Tps3o0w0o8q
	 X3VWtB4CCVxW4EiZiZ04afSXcf0EGKwfEFnvUCln1ZVtH/Ld6igeVEI51sLgqrgOo46tB
	 DH4gshuN3luo9eeH46ej9SE8BLTjSCugHBOw3Ii3h5vqBQDoP8uzWe2zgSRvxS0ejq3as
	 T5gC1hUJjv3V5ldmSqUNqlgFOygUaByr8aC+YbsX2fN7wumzhuxEvbIdQ6llDyWXjeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793750184;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k4vwqmYcIj/uNC/DRL+QzkUxcI6H/YEEprbtzK8nfgk=;
	b=5AKXPRjsxZ6ScuOUZ+ccibDwEpNgAAuvXw4Sq50YZPEidLyIVB8KKjwgztUCothl8tTt
	 n82OPDSdkVRbgsXxi38NmkASgiufy+0lOmGiJim5dJkXHs8T7cqox9eMJ+kvkdkgRMZFH
	 3VPswAn0oGBeblpITA0pJ8T6yLufQBuFHFT9sBKMjdDtgoIEAKpze0yz2/QPu5ekAmDq/
	 8QUvZ+lQWuA0VFor6nrQ/6Y3OJsjcatN0SACdTMDbXLnJnB7bq27dAE2NOLaVKOVHvTLn
	 wFVzR7oAwbEclfdxN/h5CzDm+V71Nv5siPzo880DWo9giz912TS2r+ZTRLvgBoVFN5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHsLSx7R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71474606A329
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHsLSx7R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004FF1F00919;
	Tue,  3 Nov 2026 23:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793750184;
	bh=k4vwqmYcIj/uNC/DRL+QzkUxcI6H/YEEprbtzK8nfgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jHsLSx7R3uWpq28mCTK1ZymXP1BjYsa7ybDZ6A0csrnZS24oQlM4dW3jQawDqL/Qz
	 xuDCyUvREaKhrGG+iq+ug/epXPpaALbO7vNZs2pkBYYDqDBUQKTuHCLjCRF64wtoOO
	 WPKEXKvR3ktdbqGVluh5pnd5ZPZq+qAP503tS71moxUNaU4TRP1Kcm6gNoxSQi1i0l
	 zUbzo9iU5oY2DBRzy08zWqQG76Qsy4kYJCBYQMkZvPa5hWuLQAkE0j++Iy9sYrlsL+
	 iOEdsNAyJBlqK5lRM7w/i9SWDObTJo6IfeE8MM4D1DkkeYSK+heJPL+VInr9bgvzjh
	 yeRt6UsKs666w==
Message-ID: <sashiko-outbox-196257@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] usb: xhci: Allocate sideband ring segments with
 dma_alloc_coherent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-16k_offload_v1_b4-v5-2-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
 <20261103-16k_offload_v1_b4-v5-2-67184126e91c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 23:56:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Ring segments are normally allocated from a shared DMA pool sized and
> aligned to TRB_SEGMENT_SIZE (4096 bytes). On kernels built with a
> larger PAGE_SIZE (e.g. 16K or 64K page arches), multiple segments can
> share the same physical page.
>=20
> A sideband client that maps a ring buffer directly via the IOMMU
> (which operates at page granularity) would then also expose any other
> ring segment sharing that page, as well as the dma_pool bookkeeping
> kept in free blocks, to the entity handling the offloaded endpoints.
>=20
> Add a no_pool_alloc flag for endpoints and rings, which has the ring
> segments allocated with dma_alloc_coherent() instead of from
> xhci->segment_pool. Coherent allocations are page aligned, so each of
> these segments gets a page of its own. When PAGE_SIZE is larger than
> TRB_SEGMENT_SIZE, xhci_sideband_add_endpoint() sets the flag for the
> [ ... ]
> the endpoint already has a ring.
>=20
> Suggested-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-16k_offloa=
d_v1_b4-v5-0-67184126e91c@oss.qualcomm.com?part=3D2


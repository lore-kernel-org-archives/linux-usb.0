Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749612;
	b=wjQKX/K9F087t7wGxuHatUo1JHaMPzpxPHKa41vSWg0O6yqDyfH0Wz7UoLPDj94Z+fO+
	 E2hDpzOnX4v4pFgXAId8BwUQEjtKEsywvLw2OKQ0O2qodR7VFjpWyp1SDHiaNvebKjdAS
	 YllZ+XITqzxlcUY0fot1a3t04V0jHN34WB6SmGO4ToHmTlUMwW0p9zvV4hhE0ATLyhYt4
	 qY9dQE9QCv8Gb0MJjYuG8rtjnodTLiVgx/9vPfg6iZ+mht2Zr9m+72L2bCuPUOsXb9pD+
	 R5Y40a7taHQrY3F+daUJYVhuDn1G19tPXVzr3MIXQ+rMNQcjlwBCIPMo4fovSiEAfYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749612;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CnKqlEKYhTWxx9zcg6JIeH90hG/2olVX1Iab/V2RxEU=;
	b=wUQ3lVXw3z9ZmRDaJmNBpv3sUkAkEWVpPKaAhR71e87GrUi3JjYhRy2uC77aO3K/3uxS
	 4lE8DU0un7K4ccCySa8Gt4ksc0JS2kU1UOKX7yUCyruvLu7XQRIokxmrsXr7t7aSb+3yp
	 sHPl4NIlNlSIFjNvZnqChWa6+GZDCDmwI7L/ovUooXH+pg20FZ/oxQQZEa+xpsjYTW/JG
	 QzB07iyYn6cIKuN4wrdHt4ZX1yJMw2PGZ3GcsrvRqOIFQClweDvL1xKZC1M3mSlVU+kqY
	 nFV49fwyqgOq71zYlrOwLxRu54/hQTvijnL0bhY9BmE4jwBGaQutwjy3n8nh+ybLkKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dx8puXEP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF828606EEA3
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 23:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dx8puXEP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B79F1F00919;
	Tue,  3 Nov 2026 23:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793749611;
	bh=CnKqlEKYhTWxx9zcg6JIeH90hG/2olVX1Iab/V2RxEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dx8puXEP8R2Z1WTBvLZaBqYg6UqYSOAKV+MZ6hVpkFUR1vF8QZCwglUY2+qaWTJd6
	 gF6BzrVKJgCuqqN4xZrJjRSxEQidz7dKdN4vD6hNDAnZNOxEC6AHYANCyAlj10nQn0
	 NneCdEUYWdAt6XBs8Nm6Nzvd0/tWXgLNk/HPM7sYFSzCC25efNIqE5TmD/58x7Ayas
	 rSbJMiWbdJaO5kFUQYADnX21FmYGLQVO6fRN+2zVFFXPrjrQWIO0+Dn55VDgdBxy/h
	 lUGzZBHaH0xcxkM4OWmEJGPYCWy8RUTZWmJfZNfVy9zA3zFoQzSAB/YXFa4xPsWOhT
	 5+fbrqfCo0rtA==
Message-ID: <sashiko-outbox-196235@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] usb: xhci: sideband: fix ring sg table for
 sub-page TRB segments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wesley Cheng" <wesley.cheng@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-16k_offload_v1_b4-v5-1-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
 <20261103-16k_offload_v1_b4-v5-1-67184126e91c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 23:46:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
> per segment and sg_alloc_table_from_pages(), both of which only
> operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
> can be smaller than PAGE_SIZE, these helpers describe a full page for
> each ring segment on larger-PAGE_SIZE kernels (16K/64K), and cannot
> correctly represent segments that share the same physical page.
>=20
> Build the sg_table directly instead: allocate one sg entry per ring
> segment with sg_alloc_table(), and fill each entry explicitly with
> sg_set_page() using the segment's own page, TRB_SEGMENT_SIZE as the
> length, and offset_in_page() for the exact intra-page offset. Walk the
> table with for_each_sg() so this also works for chained sg tables.
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-16k_offloa=
d_v1_b4-v5-0-67184126e91c@oss.qualcomm.com?part=3D1


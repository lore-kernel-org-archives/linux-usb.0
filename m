Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647011;
	b=Ng6FocCX5Ya5BwbF0i6hxGVdyqtzyzSkf0W4VtWMpW4aD2wbuZ3S4fOjg+F1EdTCgx4C
	 AQ5jQePb+i29oyJEQWSv9zEJ82APR+JO1YStrom0GGignnicvrmINcLw/jv52cTJogtuu
	 CxG5zNCrhiNQNYGJ5MiMM08fXgITd8jfS7KHFsNbxcC6omjjm3qNUop7Pp4ydh011ZosH
	 7L9hYzcoaktMdkDyele/tiV+IhojqGy3asw1zt29lYN5s4WMfln7/X6iy2mpqcScUOnS0
	 0mUNFI97ch/iuL7cMTC+h1LnROmXgncWwvF1IAQhKbQtb2dg+++/IolXgC+evwm5gog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647011;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6+a6QGFbut/l2JWLSOJp6z2so5bPHvYtH4rd/K8Evg4=;
	b=O8G73oxRVQxPOn8L3tz1Dv5gFXzy7UgKmwhwg3NwU8RpeFKrqxr1+RS+jWhGwA/r6J8R
	 F2cSVvNxrjPgism5SteUCUXF+/4WqmSGt7eVmWnKaiVWtB+lWmhMLgfcQUFKb5GSV77An
	 UYrwyqSNledYgRktuoif9URXRv07plNzcGUy1fZGyN9Zdk7SMIQIqYxd1zEypjBL9/hTh
	 nViF6aGvxB1TUzkI/4b2OLSFrLZ40DlNUMsIQUhyFNBmooWkO22pw7VuBeQvdHjtbkhZC
	 MbhNDHlRofcDHJ69Ki4PYZtJeA1QpOfyhkJA78xxilSoOGXACSO1GgSDXeUM+Gm998g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egcyiZH5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC8B606A339
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=egcyiZH5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F081F000CF;
	Wed, 25 Nov 2026 22:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647011;
	bh=6+a6QGFbut/l2JWLSOJp6z2so5bPHvYtH4rd/K8Evg4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=egcyiZH5K9xPloii9Gm8PnmzAF5haD6yKWkZGg216mmd6jewxId2d029ZPZARbf5d
	 jPrXF5uVdtA7Y+0DYU1P9GbbWWEO77JLmbPiiPiNSckv+mA98pnC+lha8g2QHSdOoe
	 LrdSOavjn+mwg7OVDRSi1AhMwFigJp4fGWCBgvbZk1ndEleSS3Ehe0OHI+klScGL+3
	 kBEvJ+/lShrjj1p8kTSxqK1smwVhS6Q999CmJjrxtdBVPIACsH3C751k7TPlk5gy/N
	 IUnjXA2IUo+ho4Lq/T4xFKjxwz00pmxmp2Rf8mKQU+DPeOu6aiIpuLH4XDn9lYb00A
	 AMXN1F48jgDTg==
Message-ID: <sashiko-outbox-234283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: udc: clean up bounce buffer and DMA
 mapping on enqueue error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elkin Cruz" <elkin@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125222212.1434148-1-elkin@google.com>
References: <20261125222212.1434148-1-elkin@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:50:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In _hardware_enqueue(), sglist_do_bounce() allocates a bounce buffer and
> scatterlist table in hwreq->sgt and swaps hwreq->req.sg and
> hwreq->req.num_sgs to point at the bounce table. If
> usb_gadget_map_request_by_dev(), prepare_td_for_sg() /
> prepare_td_for_non_sg(), or hw_ep_prime() subsequently fails,
> _hardware_enqueue() returned without unwinding the bounce table, DMA
> mapping, or allocated TD nodes. Because failed requests are never added
> to hwep->qh.queue, _hardware_dequeue() and _ep_nuke() never clean them
> up, leaking the bounce buffer and leaving hwreq->req.sg corrupted.
>=20
> When hw_ep_prime() fails, flush the endpoint and restore TD_TERMINATE in
> the queue head and any linked predecessor TD before freeing allocated TD
> nodes, unmapping the request, and calling sglist_do_debounce(hwreq,
> false).
>=20
> Fixes: edfcc455c85c ("usb: chipidea: udc: create bounce buffer for proble=
m sglist entries if possible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Elkin Cruz <elkin@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125222212.1434=
148-1-elkin@google.com?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353389;
	b=WRLGfpbr5vphIrorIWySbfQFjcYT8evbrMKOEC/UnLOYB/VBgmCikKOTL9yifqPiu4R8
	 2whRTtxsLwGrakXLFF1V9g3+69t9r6dqsQc6kskouNYACWV+w6NzsT99nTIFsqZKZJREB
	 FsYbbQMv+7swG5zERjl2t5uK2BhHJ9AjUaVfL3YGrcaaJPcO6Qt0kxW+l+hlkjEfUCLj0
	 huLNe9vbe00V+95kcMhVzy2wW/eH4U8yoC3wePr8SlBQJGnoaY8X2zyXDWxuoUCItD9HJ
	 Hobhj6WydAmXxoWbeFLr4XJsNMygcWRH/Tprwzh853wuVu0MoUBkp6Gop+nRNBdgl9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353389;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=up8gpEizPyiYQAM8jQvPOJpyVbSnXeZAMK+4WfyMFRY=;
	b=2937TMFy0+Lj25GgVn8wIy68GBsDuSSSgkbFJMmgyoHS+piCNHbnu7W1seoKkJSZMaBz
	 evvuqXcaC6A444y1mGcbfw6jB+/p3vQCGZVQDvXhY9FkYRFrH2Ld0h24ILo17vcNC2L6r
	 VTRIX0Q62W/tkPsncS4cqDKopEe0fo8WscvMDh0Rf41xlQAWofOFZQ4M2ZYN46NGqgnWg
	 O9mtgovXLH1kqu9L64vwVuq21VqhfTRmm7Dkf9gA9pOxfgCfMZ8sxQZPxKCsJeZjNXTsY
	 6C7nZWjiSUesMMW3fq8NnIy16xhKGd/i1xOw7K0yQtmhugYjh+UK//XMcKONshNZ9SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWOJHj2m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2E606A320
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JWOJHj2m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E06B1F0093C;
	Tue, 10 Nov 2026 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353389;
	bh=up8gpEizPyiYQAM8jQvPOJpyVbSnXeZAMK+4WfyMFRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JWOJHj2mY/A/UVztqEJvqtmI8zjnWFXK+jDKAAdChDUf8t7xUcgI/dfShpeZ3Cjce
	 5Ku102fRWpTBGilJ3xuVoV+rTsYPxVidD7lB/WhMCzwvcQkAXopSSgfT9tehr4mPkS
	 oIhnbx27dz4damyCt8DBe5m7iYdGrz2uh1AGbLfCXu/ADb8JjzX/4s+CzIuTRTBBNV
	 RHUTOJJBk0rXjh/EDY30/kQtix45dGrv6tXoltPGzt+dpuIT77VvEk16I9uzDO5awD
	 3WTqieKlgqNraO1w9P3gB+v6DCcH8jgbsqIWW5c3J+XWx1einRkCDhQvyUONjvrOH3
	 pa7r4jBDXC5hQ==
Message-ID: <sashiko-outbox-207914@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/22] usb: chipidea: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-4-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-4-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:29:48 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D3


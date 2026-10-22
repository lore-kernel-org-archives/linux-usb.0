Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641636;
	b=eioDd9pxUI91hkwYeBbSAkqHAHyTIrWEzCNgQE87IWAZw9QPIB4F46iePWDRrXVpmLZf
	 MErEecm6+b9sKwWWIi36+bNZQO3ZPU1JA1vpJBgtO8O3SI7VzwOWMxvH5kxBnqMKyH2OW
	 XAXGXaeaMVuk+0nYuYgcseDjmv9PoyL5S6POT5WDttDq1+6c0CeUyvZ8iSM6NizOtarQb
	 d2RREAP5IfBU2x1BJY34x07sPrLfGfn1MbYmcIKl/u7PgkVQskZUigPCd2zIXDfy9KyQJ
	 73J9tObuAPq4FmrJ4/AbEU1JegqsioHbmgBZN/VWY3qQvZFcfhlFIK+8/pPCOAyU3GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eTd8temRef6N45Pw1XYmz+77du2P1IAGgiPSEAnJJCw=;
	b=x4Lgb5dcxMY9+nv1Q46NGMb8syIiXXiVCIP++OPlhejKUduSgARyTu0XE3LdGlBLCwWT
	 0W/JZshWRMz37Edyc0cTYAdsx+Fq2Ek4TtZVtbSA/i97XCGdLuz8EHwG0H6Ik5p3+XVt/
	 VBihe3xUhHmzu++dDOrQ6zoaRABYpvCryiTisSykQQrT/Vg0JzqqQ6sDS2PN7Ivcdit2e
	 Na4cEyZu89Ok/YkXtNRnha6bnygei9RamxeCGcH0Mm03uGvJnwuk4gb93qg62xR7uPveM
	 tSYm/zVIma6UBnCsYNxwvyroYaTTsUigeBLxtCTbzPxopnk6I6XNhxQioSTsbwvR+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kjIra9E/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1F6606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 04:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjIra9E/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CD81F000C1;
	Thu, 22 Oct 2026 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792641635;
	bh=eTd8temRef6N45Pw1XYmz+77du2P1IAGgiPSEAnJJCw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kjIra9E/eevU+7czd3gp3IFEA8OsROPXxIeecHZOvE6eML6eoVI0nMSenJ3PUGOwH
	 pClw24UXI0/XzTfJQWv4X6Sza5kM3T9DCrdjlMu6LC7cj7lSyv7fCpj6FXzdyV0X55
	 pLjPtsd+CRstNgy91K3Av5CihfNkrnT0GlLOAJlSVM3DrP29Y8T85bbFjd+srE6Fg5
	 GESBMZoTKcEugTtVc0UZb5kYcG8gC+VpwoScn6H2r4uJER2dAq32WrL5j8bEiDrA4F
	 IOCsycTetXD0RB+GBBUuP7rlp27zbttxO1IEPD/tgBIVAFlaTWS7+Irtf+r4TDwHAk
	 FNFdHGiHA5DCw==
Message-ID: <sashiko-outbox-180989@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: core: Fix use-after-free in anchor wakeup
 protocol
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongyu Xie" <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <179264120769.17277.3664390143604314731@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
 <179264120769.17277.3664390143604314731@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 04:00:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The API contract of usb_wait_anchor_empty_timeout() and of the anchor
> cleanup helpers is that when they return successfully (non-zero, for
> usb_wait_anchor_empty_timeout()), no URB giveback is in flight for the
> anchor anymore, so drivers may free the memory holding the anchor
> (xpad, for example, embeds irq_out_anchor in its private structure and
> kfrees it in xpad_disconnect()).
>=20
> This contract is broken by two windows in which the waiter can observe
> "anchor list empty and suspend_wakeups =3D=3D 0" while the URB giveback
> path is still about to access anchor->wait:
>=20
>  1. usb_anchor_resume_wakeups() decrements suspend_wakeups, which
>     makes the wait condition true, and only afterwards calls
>     wake_up(&anchor->wait), without any synchronization in between.
>     A waiter returns, the driver frees the anchor, and the late
> [ ... ]
> Cc: stable@vger.kernel.org
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Oliver Neukum <oliver@neukum.org>
> Cc: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179264120148.17277.=
68253767316647311@kylinos.cn?part=3D1


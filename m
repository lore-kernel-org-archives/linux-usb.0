Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385368;
	b=Bx/y0PBTnrgAxl9gHy1ZNMsUomlTDoEHawUgH6luj79VVORNAvYjYHqJEaQUZtIt47fN
	 e+00aoBHuyOM6Jvx+3gLOMhSzlwZz2IsPmprrKbfLJlS4boQjJFweRcbhbuJRxt4z4dO9
	 ipuXwrZ92gweOi/wXBR7Hix+OA3PmsphGaAsuYY1oxj0Wdt45KOCzr1AvDHt3+v0O5AgT
	 rAu9UDRxnXaH/LyzwF4nJUsntW5yS1RtfIkvMU5k5d+b7KasGxV2K8crQRKB2QMVk3fyZ
	 Xi4HRI05liH/1l1ZbRvhe3Om8/QTX3+5xP4ixXD3mge2vVmrF5RntxsDxeiropnj2tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385368;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0iKcCKCzyUgWnElJRqhbSQns3+YAI7cCoXyfhOBb5js=;
	b=h16N9Tzd6uYOUzubcajNAqHa4lxP6Z4Hn9QAbcPCqkgSE0O41k0pHV4mg9X+dppaWVkI
	 ntki9PPkbJhWRc2D7piu6h3BPObvwpgMFB9RP/LmJ1sRTsFai9cvNbsWT8GmC52ieXoi5
	 4dN00PGVRRd7NZvng0DQ11jqCsA0leEjZV0yTinIVrlKZBTFlWDjcQco/NUpGLa/SF7rN
	 pQRMigjUAZ4BHlnVtpFGro7KdB3ykr+LMqHIkr+f5Cs7rNaRJrZA9tZcgt3qx5sk42rAJ
	 yzTBRtTvuvwYBScGm+W33RCyo1BGMEqtb2KgXnNhq4GlbntusH1TBnF9g7Ld/zxlp8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnMs0AS0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A92B60A261F
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnMs0AS0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BE21F00A07;
	Wed, 11 Nov 2026 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385368;
	bh=0iKcCKCzyUgWnElJRqhbSQns3+YAI7cCoXyfhOBb5js=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnMs0AS0iyHpDviOa4s/FZTr+X6Knr4AYcZFKlal0wba/zr5m4Gfb43kq6bgGzIi3
	 4Rp++mkANR3kntCYCcFRyIyH+HqxFbbdpKosa2lsWTLuh/+9T2ghXTKPaJA4mUZZKa
	 KqZCoh1Er+abk8OXWbQ2BDvMLeNbxsCDDiYZHVi0OI+w77PblKTaTy7xutUYUFp4CW
	 7yA2e9r9xCFqa7RsRL9RHlRBMhD5JryLp7BcQHlcnAWrMOCV33HN/+7ykkFTYNisAZ
	 npJgydAjacXKl9n+oEJw5j8y4edFFZZwHtJMvxMXjVng3CPNzQZsIk1+7qKJstSZwE
	 NxBeNVfnGhpxw==
Message-ID: <sashiko-outbox-208597@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] usb: gadget: f_hid: fix get_req leak when
 usb_gstrings_attach() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111081313.16626-5-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-1-shishunbo@cmss.chinamobile.com>
 <20261111081313.16626-5-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:22:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In hidg_bind(), hidg->get_req is allocated early; if
> usb_gstrings_attach() subsequently fails, the function returns
> directly without freeing the request, leaking it.  Unwind through
> the fail path instead.
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111081313.1662=
6-1-shishunbo@cmss.chinamobile.com?part=3D4


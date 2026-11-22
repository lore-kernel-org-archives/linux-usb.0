Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362526;
	b=32E2tsYMTb3/e1avGpF09msRVzX79uQeVEkQ+BufQA7txrpv+oNGvl1rxI8sjEmi4X/B
	 wbIZlHarwRiSGFZP+lbDZ0PCMarIFRzStQIUrqzLxW5Cd5yqlqjwSun8hunoKByG88zKO
	 pRW6KipydN1KuvKSoMIOwfIjWbbe2pBtxqbq106V7LkrZyyU3bnglXYyQEhtVvIK9qD10
	 xyoeWYW5U7epB1AMEIYj1Cp+Eui7yx5KQRCccYpXdA/knE12tiF59sTmu0VolDyzUIlq1
	 nmNerIdQFRfv3oi0Jr/cxvpcHoqm7ecRHYeaGaSFVscXjjYBF3vsCsj3MCfysyNmO1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Maggbk91Kzsd6TuzTePD0wxo2g3GQhxaBrs/VdiGqVA=;
	b=COdyrij6dsxwOtQLFFYhFbPBK8dBp5ijHa/hVfBAhMFtOJ1A7oMXS5nYGykcOe4tvEzw
	 5RgULg94pq82bI/es38U3ZTMW0rYKlCoe8Tj5zCC8pzBNSKNEQ/i4Dum7KrE9K3i5uAqV
	 NIJPT534koedB9Yr38ZaipNj8Fx7kbJNJao8GCe2+8vg5MH9v9LGv2Qe8kivwEz1bAv13
	 SXLepRCUGmWeDpguqMToBgACVQMd7TQirEV7x4kXP3+18t2CE62vnUwo2oIzN83d54yS3
	 OSE4P/PfP/ao5FFYUPN5hwOi5wqwzK6qR0T4h9KuqK4wZzvCdnzGqfxz8fWWUMhcWaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NuLHho5l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6708A606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NuLHho5l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7411F000D3;
	Sun, 22 Nov 2026 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795362525;
	bh=Maggbk91Kzsd6TuzTePD0wxo2g3GQhxaBrs/VdiGqVA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NuLHho5l0XmId48L1K9Jah9/BVL7tKyKkjx2y9wX4UdvPQSAIEslWX7OLVOBHEgdo
	 RWAy0bc5N8jBtTtd3EwqXu3WphjANrnuxjGOYiH76osfy3gb9Nk5TRbHsLQAvq86OC
	 iC3sir3O4L5MqKxeIQh9Xo/xLJxm/KPhzPCcwDHTX3UitadhJvE0gk4HVI81Tlijij
	 fxmJFFrnW4W0H9zRxvTIovKD52zFamPe7BfYkCbTShC0jrd1dqqv/X3g2fNzmJp3Ub
	 +GSGeuTQ68HS4cJDyWPUESkQhQgNYqw+9EddReijHrdPg8SDCr6VWTFHWEGsJOYI6Z
	 djtwhRZNWmLGw==
Message-ID: <sashiko-outbox-228055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: dwc3: keystone: Fix missing child after rebind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122-keystone-1-v1-1-5cf9bb522f65@gmail.com>
References: <20261122-keystone-1-v1-1-5cf9bb522f65@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 15:48:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Directly unregistering the DWC3 child leaves OF_POPULATED set,
> preventing its recreation on rebind. Use of_platform_depopulate()
> to clear the population flags during removal.
>=20
> Fixes: 943befc314ae ("usb: dwc3: add Keystone specific glue layer")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122-keystone-1=
-v1-1-5cf9bb522f65@gmail.com?part=3D1

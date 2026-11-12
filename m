Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450136;
	b=Q0aGDkApVgvI89qLs/0tBJitUpb88OjCHP/VDoAkBprTFCruOOT0SywqCcdbuXXhCR9/
	 8INujd+7FdgFOmzL7hhqO4CUOVItKlFAoukOBkAl4Kz3pbkqJL6eEp0FaH9lRjypBqltz
	 L85Okefos4odJDctLbw/H4ML5/o4v96/LuQXEbDbmXs/8IUu1IT3MrAIEJ5Ulep8zafFo
	 uppYy0+cqKKjlfbajYkrJQUngoiUcBCD8oMrBShLiJxfWDSsBrE7EPkoEqHQNHwq+NjLe
	 Z47aKmYT0Ewh8S83m7ruHg9076v9OBhODzTxoO+JvYi8BTNjbCH6zqeHRMyEZ0ZyqCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450136;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MLGnhFIJOt/ivzMtHafV5VJ182+O7Dhj/TQgJli5zZw=;
	b=Ib6hgaHJqQxmZ+xJppaFcOpy4eDjIhyLF+qNxJ/uTuLaoekrfvKrZja6jbBKxQ+nEo85
	 4WayS9FGKafn7tz/4LHr9RpOhf8auAqN30Pj1McToQWCsC1rhqtu8S0V+TjpN8IJkxE4m
	 GJ97WhHLepoLuTKPLzsZoQL0PXGSlzN4m3W/4VGeyBuofuG0AAfvZfGe269RGeK9+GbM7
	 ByA0X6ElQQeJshBthpxexmQel9LSXGgjTv0Sot1DV2dWHHPWuVpkVR4wFDaYrFSstz1ri
	 NjczYgMEhzYVPbcEZysMP8T/PXMDbH+y+unvpNaolJ5M+XlghMT2/9lucSRJqWDMkEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTubbMUR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877AC606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 02:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UTubbMUR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3B71F00A05;
	Thu, 12 Nov 2026 02:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794450136;
	bh=MLGnhFIJOt/ivzMtHafV5VJ182+O7Dhj/TQgJli5zZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UTubbMURv95aLkcYozr/kxjSnK1TUqrQ5NkTAwkgLN0+cbqZbypJq7A6q0Bx9JjpA
	 wsEYap3zp0nFXsl0yomqGIOIf+FimeJxhPqZYAsb+i8Y6Xmbt4iefheSdoRSObfaCg
	 tcFApUS5okV3WTDUFQGvDCeX37Qzf7ybxjYwtq/FOiRbosFMZPp4ufSdlG9crhOJ1T
	 zM+TnwhVTX/xjU1fFOcmdeGHXzVLy5UjoD8btgfqc5/oRZ8p4yPeuD77G1JhftLG89
	 lqTMZOR0S2bLknR7rOTePMGNCzf3obMd9FvrIjIvQQ/7HH3aZJpZvxPbw4rcpM6Nd1
	 a1/SxuzXWTWnQ==
Message-ID: <sashiko-outbox-210182@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after
 regulator lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
References: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:22:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> pmic_typec_port_probe() looks up the "connector" child node with
> device_get_named_child_node(), which takes a reference on the
> returned fwnode.  The node is only used for the VBUS regulator lookup
> from the connector node and the reference is never dropped, so every
> probe leaks one fwnode reference.
>=20
> Release the reference right after the regulator lookup, mirroring
> the parent driver which already manages its own reference on the
> same node.
>=20
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the=
 connector node")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112021836.1851=
-1-laixiangwu@cmss.chinamobile.com?part=3D1


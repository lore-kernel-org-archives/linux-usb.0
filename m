Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293041;
	b=auSgEkE2n1gxYPE3S+L/avsB9+alOKWsiTatP0mkK9WyqgKjpXLI932yU2edowmXRHGa
	 U941/OzeRWc1lNP22cfzW1khZrFziuiQo8EikP2yHe2ONiqJR75Umhm/ZFrf6JDAl0r/l
	 20rZT68URAf3CmPD2cHXPCy8+ndOhQ42ZWnsaAaESRKRcmiOMIg8yqfTxnMtUYJWdXMGn
	 jFaOxL9vJ2cj86Y4Nvqg7v6wcNpwHJhVSQXXBCQ61dK8csKpcoz6jBZkTAHojjNgj1/fz
	 +QQ/n1/4qkuHGN7x7GeSd+x6bz7MKpuTPKs+6ztvsD2KfIzmF/wNdq9vcMGIczKXdmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293041;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=T+zzInlH7/U67B27dS6j9lkIo5Bo0aByAbbD7He5vJs=;
	b=GzO0av7tRF0Eal5ttch6z9gM5rLBtLWGe6kG3HtxDwWZKx3oKY8xLme+vLrdB1y/PEu5
	 MwIOOdBhFxMv3qa4SeqcfnItDfM5SSZTLm9PdFx9YiBw/2xghj9X4x8xitSS84SQXz/Fu
	 yT1+4I5+8Djm+vVwUaTS1RSJDPGbzrUQn2hF4XAZvOzgKepILbdvMTXdhTgYBIocolgZn
	 OvGVK4pliOx52LvkO2TvM36YI+EKJ5ph2Axo8o0bvNaZN2eM7KEjb82bi+oMVtCaADTc5
	 D0v50E6jCPsFsaKVuSgDzpGPlhDvrkMQPYt5bNXFCqslQTW43Hgk544pXHMCR+55i/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBjspwJk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9652606A675
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WBjspwJk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E525B1F0089F;
	Tue, 10 Nov 2026 06:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293040;
	bh=T+zzInlH7/U67B27dS6j9lkIo5Bo0aByAbbD7He5vJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WBjspwJksDWsVmgLxqmKUEUBh7pYy6OdQKNSLaKHfukYm5F8hxta1/+rs1dh9C37X
	 Y2AQwwa3mx+t18E/SsPjVDDMukfjI5teu6U/Uf1DUPixoFjyaz9x4JcAlxq8fSyyvT
	 jMofK4W/zSMrrODcVicD66aQIFqGHt8I63OYTgjp8RMN0gnqtF+DPYS5oNfY2OMZeX
	 MPi5eAf6OJFJVw6QCKpZ8ZXSny4kd0ZhRp5/OgizZcG3IN9h/Mg+Ua2tv0g6ux1A8G
	 mdHcKEhFqHt6mI1zD35g9tX9TxUDYz+LrVWi5cbgGt/Dq4wvLzeJALrZycUCacVQjd
	 FEHhLZOJA6lyg==
Message-ID: <sashiko-outbox-206431@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/22] usb: common: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-6-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-6-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:43:59 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D5


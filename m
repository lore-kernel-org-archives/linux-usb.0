Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293100;
	b=BXcwP4i4VxUeO33sRo0ocgKUxcamdi1Y+29v/O4atrKgLytMFn6yZxXSUXVAR7M7rEzb
	 iNXrDQVgCZjV9pOJGJ5Z6uJwC27UQcwrkZdHNN4kHUd0yDn5lck0vKuumpBj0h0XfLUb1
	 dabUyMairBr5j/xXcdIlKprSJdd2SF6TmNJX1qQOuXy6zSvjqautFgp6cjz6esaxfEkxa
	 +LykFgp8nbmWFppfz4w6tEOFk3KTVyUWYRKNAUSgCS4SYBXbgAwv286OrMAmS+BowhFIe
	 ge04aKzqR6yjNjb071Eo6bmc4Eocx5v+kBQUF6qa9ZGzOt+qxTrQ1e17zK7WndxgRMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293100;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s8nTOw5DB7megcgpM1aLxS0O+GWtvhzBnsIdeBNFTTQ=;
	b=lVLxAxdHv7y/QNtHEX4RBfsGWo+tFqPJzgPPd22Hf4U6r9UFTOew4xSOb8dmmt2BgKWT
	 cITlBAwqGGv/qX3a8x5GcaDatwQ7snvTZNBIBhMQLNKdIZbMxxsev1ZYLgJ4sQLXlbgJJ
	 mGfLnGqKmsyQAzUT3PqwBJFP3WYuXDbDfHbzMP1/dysviXxgqUmeESyoBzUh+JjIcgupt
	 rUyPd0+dRebg3y+yjeK7eI8xUwNQIbvZrJ00aSbeK12xq8PY/o+9yPB0f0MSvTwijrUCY
	 RYdPWO7sggUyub2dImzHZOtFtdBuvPMNJvK8Uvk3FhLABY5QHoAZHuO9u5wvyHEYr/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P/2P9VPt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498A4606A32A
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P/2P9VPt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEF6A1F0089F;
	Tue, 10 Nov 2026 06:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293100;
	bh=s8nTOw5DB7megcgpM1aLxS0O+GWtvhzBnsIdeBNFTTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P/2P9VPtQQrFAYqQv/5H9zXEjLsD2hTQqpTmUv7c/Y4soNjB2Y2sB0SqhKMcsr/YQ
	 H3PK+DVMvcAJ65ajLhOm4g70+U0e8mNCd8aUi9X62Yc58Rie/lo6OKyN8GAN6k87Lb
	 LTTlHJrdkku7OWYQlcjU3/0J67SWmP/soJPSTC6/1zH5+SCZdkN0FNv61WNSYtMdGb
	 lYBphl1LA3DdEcxI+ANE1odjcvW1xtd2N1qDjZbxWxjNyF+Kv8M/PJemvXYevwV3pd
	 0Og95qbBp0wo6zj9Yze21nscozEgaOV9QXh84U944p8c2HACQGRWY/IFrcWK3fS6kM
	 q5ms96XOSsDig==
Message-ID: <sashiko-outbox-206438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/22] usb: cdns3: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-3-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-3-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:44:59 +0000
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
5-1-shishunbo@cmss.chinamobile.com?part=3D2


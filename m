Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311738;
	b=H3Tl1nocigcLolfZiI2AklsHCBvW/sn8DjfKZkxiN06LiiKUeFh0Xqu1m07V/CXgI6yq
	 f3wflV4N261CojbQDC8c7a93hK/2IZjb/OVCXVCosYxVAJg7na8HjvX4GUjMeRYQavnu+
	 zv1NelwsLhQISina0mrHUJTQPjKwXIsGFxn1mi1gw//ICQOwztjcx5bBJzxYmdwnke23g
	 zpra8sYeyu4BfEuSmw2mciMuUtuHFYOlvApYKoS8Z+Z2PLoqyUP3e4E4o4tPItWR66FBe
	 UhPTmrys9a977F15ixDvCQEejqn8MdvzJVulpeP0ztfAajWFFYzK/i1lh195J55YROA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311738;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I1dN2lYf+ekgLhuuJxcxHkLEOVyG9biS8ZWClPbxrCQ=;
	b=xJ/s+tWB+WUFJ4I+iCbvDNyPnsk/sutw1stDHMviCCBZ9Z5aGn7xoeqdqjPKyySB6pl4
	 qPDXzAvo25vSG95aWT0WdfiY1sdcO6ahVK4gYmtXAxFykHU7qdy+wTAub6V/t9/PfndO1
	 2nDK/c2EsLAol2reYhX3JGH8ljAkOsV0LOTjC+KTUA2GJ5yoKNRngltJYxhBWdSgsKhQY
	 gaALNWWT9vZTS1d0U1hy74MgfCIsyrpqzSImWRn65aGxivtBS3rHcurGDwIsSTfFPCQWH
	 0EehDI1JCvTHeXPVP0jy6CmgJ/kwgl7pHodBtfWwGaOORp4ohgN3FAuVljhGRa47j1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S4JIwgdh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4B0606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 11:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S4JIwgdh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A1071F0089F;
	Tue, 10 Nov 2026 11:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794311737;
	bh=I1dN2lYf+ekgLhuuJxcxHkLEOVyG9biS8ZWClPbxrCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S4JIwgdhvW1sIYbPdsrXXiDFcnVlpFSPbFJj2Phu+Szmwa8dhZJEms1ThLBBV/ruX
	 AG5NnbqGAZaKcJVayyBqDodHZkTnQUMXWx+RpW1TSsqQVk53bB1iBKFyERM2kPL8tv
	 cfBq2oa+nH+qPzHVj8MBHoPGLLnKBhijfodLa3OdWKbmrVvqWNIHXu+puS7Q2eECjh
	 ow+TrjtzlgPFUe3kqkM0REeyKVNUgoxSGQrjCQo/fTwXlFiGaJKNYy0nYTOZzGz9v/
	 +oT2HiP64uSNN3/lFZrBzlGn1K92jRP3NzfuuoMdrX00eLhyJySTSLDORZBjZM5sev
	 yVhhe5zx3Kl7g==
Message-ID: <sashiko-outbox-206963@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] thunderbolt: decouple the waiting time of
 TB_PORT_UNPLUGGED and TB_PORT_UP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110114925.722014-7-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-7-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 11:55:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When usb4 is woke up by device disconnect, no need wait for 2s,
> usually the phase2~4 takes at most about 200ms, and enters to
> TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
> treat it as disconnected.
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110114925.7220=
14-2-chunfeng.yun@mediatek.com?part=3D6


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293102;
	b=QZ+lwHxaw+jdxro0KYn1VLeIxunLyGpV+x8UB0ciaatUn4xueTGIoXkSvnFqvzVZKV+C
	 MUOeiwcXjkdmAPA71sS4sWhhGBLunNlqdwray3u+4RVtcboD/sBKCPSfVuM2l0syJ8otL
	 1JqdThk2qVNIMDFw240id40EhLLz+55lCYIEjGYT9ju+5668zZWxChAdojcLzsrU8JRhm
	 XdFu1tUi/WWih41Cz4r+G7691JrmzaVaXsvd6OjdNumVxK23WfixoOn0RKX0GToSES3Of
	 Dexe+dZur272YS59HgEYUKuZW92tv0+j4Ir3VQB8GOzp6BYvYOJWBFpiwKY0CDZ8ohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293102;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=670+UuhLM6Eixn3ciIIqOnCfj/djpgYakUIXQNUMybQ=;
	b=055Krg/U4MaaDCSQp/sbBsk1TVv3CMCbrSwkG7SuMBCGr3i6sMouVcxctnszE0pQ3U4c
	 VJhuTKpcmpdVT/jPEmVEYBaaTJlUW0bxu6QzvvJhnmbblfmtcYli1vtxb/xIXt0V9FKou
	 XlE6jDSFhdd9E5fzqC+UKc8T1YsGK21p2q4KrsVn0F7nn2lqPHm4L9CWy5cVcUQ/fjAiL
	 NOZ19ryN2yLCaeymMr4ylg6arEmGC1oLbZ7InZaPPytpszD4IXgfurpVv24HCYRibmICZ
	 U1Nm0bDPp6/m1CumW/PARapIKPdSu6lFVNcNBapXqeCjrLlsnAEYVFSCAFUv0z4Eysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzohzE3t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276A4606BD60
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WzohzE3t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420D51F0089F;
	Tue, 10 Nov 2026 06:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293101;
	bh=670+UuhLM6Eixn3ciIIqOnCfj/djpgYakUIXQNUMybQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WzohzE3tcvVbG3/J+/hTDZNIXX7pxemzSLVLRNpnYrdejjRTDAOsTwt1CnbXzAXVX
	 nCpu6g17BtQ8tTvBWxEN6DfWiytCqn1fyaMLfuLuFsU31R+JsCB+fubGuRmRmhWO8W
	 TtaZ3rE4otHPCUhvImORE1KSirJ+ZJoIjaZJ4Q85gkGdg0YcSIV2MhDvq6XJPA0JcI
	 aaRT3pP/swHdjf2WrHgKDh4XE0RaLbyNwUB6GEMfuT4sbGh2VEiCH3BifXt/Ipu+9s
	 R8Oy1B1ixT5tQ55AxA1+cWuSSES/mw2HJA9Cfvmut9YL21eHsMTLudDsv4lOCwoyvG
	 0gW0G7d7V3r4Q==
Message-ID: <sashiko-outbox-206440@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/22] usb: roles: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-19-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-19-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:45:00 +0000
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
5-1-shishunbo@cmss.chinamobile.com?part=3D18


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293022;
	b=Zf0IMKwWIofRmJCvengAwM9SnfVW738i0O4FEk7qQfbkmv+pJbECwPdWFIqbf7fKOIUR
	 EYJKH22RxF5MZDS2Juka6VcdDTcczWFac5skxmvB3TDlWzGqHyNineUVZ1Q2t5wdsGyuF
	 Vq5Ntg2o6/vAmgYBUrKZGd9MN0cjsHmFwjm4+d7Ur7ZzFqJ+GkVZx4T5gtYKXXzXX7mYS
	 xc+/b1j5aVWlMlp6llHEms5qkWLxWacHgU+QiDsusVm8crLtCksBFjI7jjw6+GrIDKMDV
	 DATVxwPw90rRT4iRArBVf2zpe+JJFEpRTioJlh76HtzQZ5gmbij6qfeNAvGaPHkpxmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293022;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sZNyHDY+R31hY9Gg0U4ECnDj+cUUgWZUA5qjaiRjFRY=;
	b=B3fyGmOQkWh1pA0j2cMzKq4fng0WVH3mw22YYJ3g5HwoNenfqoeCxXG2Z3aZZ5jiU+3n
	 SjXIUyYbepA3fz+fN0u+h+4q1Y/O8tCfyfDK6ArtUJVuc/Xwu1LnHIyEgtpj2bIKbbbHd
	 q4xdUw/N1FYSuZS656HBIq2htzWtmXpOTYzKRwm5Q3Q3CuY2DO6BVrwhoYy//TEDWpqYM
	 WdAbInfVJKMEjV/e+k8wM8eY0Vov8BcRiIRAaKxkDTioXoIOpUE3IJmT+RsktW8npgThr
	 uiAz1+HOF0NVk/e1SOZ4bIEN5ruEgm0+WEeeN/y/v2Uq9jAUafo9k/UUAPEcgZeeeeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwId+1hN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48416606B1C1
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwId+1hN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC9341F008A7;
	Tue, 10 Nov 2026 06:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293021;
	bh=sZNyHDY+R31hY9Gg0U4ECnDj+cUUgWZUA5qjaiRjFRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZwId+1hNLdhvab7bMTfoo/lRJy2GE8mwhWs8GMuFseKLJf/h8oizKJvpfrHCqGEhM
	 Hm6MQH7t+wkGV6+NjHrepg/EE/GwW6gKqufFiMEl8Om11yjVxT8CnbhyN0Sq1eHltt
	 aIkOpPpn1ibfPTnAC9k+vlP9mAvbU96b/QEaIyKaoibcOk/2FJ/T/su7gpxtii+Yt4
	 pZAS9xSipkHUv588eYC4zUhdAm9fsPVFcnEEAzw24swOWvy/8eq28HtmNrv87HWeYx
	 eGiJGsyyoRwg7XHw8P4sqUtf4lqvu3je0CD7OzUjEXM6wns5dh1yCFJxvDIJflBTLs
	 ZXBaDvVV7L6Vg==
Message-ID: <sashiko-outbox-206425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/22] usb: isp1760: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-14-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-14-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:43:41 +0000
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
5-1-shishunbo@cmss.chinamobile.com?part=3D13


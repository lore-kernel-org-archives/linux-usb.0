Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802495;
	b=poks+oK+NmCPr6XdkhZbjwPe1oNabCDfmKMMDwFfFwttAoFaeivdHts3RAGmrfTjGBY8
	 SilxK+KABqK8Al72ABwz4KdDrycWGxu3RRCHCrEIyCqETaQJlW6wfeb35xy+IKqCzJAqX
	 MbeL4m4K3I1i2MNh8tpsXhfpA7jMdDn5oiBlcYoulyrybH4IE8CVLCCo0AT5DqZRqce3K
	 KK8n8epwA8+bnMo2T06pL6/jfRnDVgzjvXI9JseRXyDr9G2tiotX1WoI5NKSw00BWgBxM
	 DJuxwrfdTr7/w1+XL8pky+n4SneQA2/dbVaE3jWMNLwSNtZaRx32fms7E4b3uc5qLqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802495;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E0VlqShkYwzu52Rh0iJt1HtcshyNb/OppZNgLGlgkk0=;
	b=E+M3w8CMFFIz5RCf0FdWkdHfDxn63FEKmBIqTJhGvo9BX87gaqLNTGhKczWbEDN/coLr
	 QD5s/UKgrglQGTxZ19kSgklufivQTg99/VKTIAdHxw3+B4kJdO/cyrH6H6nUE81/J+pi4
	 oi1jOOoAYVQGHIvNtidpEVcy/wLG5wWD2BI4XvwCeuKMcazy/9Q6VyD0AZxynZEQ8qYE6
	 HGSQ+ptIlGhJJ0Dk03L4GmT+GUm1cPimaUwWh0tE3jmIcc/SlFcYu98J15S6JjMG/cLoM
	 aKX7XFVoho8s+3HKpK7mQPYQe0Z0rSQr/rzVf4dygXFX0AcLJy8SZqow+LbmraB+S0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxCOYrCd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4D606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 00:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxCOYrCd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96DC1F01825;
	Sat, 24 Oct 2026 00:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802495;
	bh=E0VlqShkYwzu52Rh0iJt1HtcshyNb/OppZNgLGlgkk0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fxCOYrCd7ZagsZPamYjvRSz9YSNKSaMU55HMz5bZliU2ifHRl4HtGw3MKpxfj7jLG
	 ZjgRHc5Kgf7zWxjnO7dqWmvGzUCyH9FSD1iqj1xsgf0LA8YIDcEz2Zc3LXJJ3sh+OZ
	 slkRuDzTlepQWSlwNk2Gxv5KawEZNdfW/4J3kOf57lKMo/6FbiymXnHA+mNGdMzAtP
	 uKn+d6IAhdX7QKopBZF2sIapb64ORIhqDAlSogBDZ84Ag4VSj82Jh4Iusz2lk8uxPc
	 BqPCzNKG68uOQr4VW2hKgWxOXdM3jACtmILCH5HtnstLzyPszRO37jh2r4Ovj7H4sY
	 XoovWUu+TkRhQ==
Message-ID: <sashiko-outbox-183467@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/9] drm/bridge: pass down IRQ_HPD to the drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-3-6ee949e7a384@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 00:41:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side. Pass down the extra status to the bridge drivers via the
> hpd_notify() callback, letting DP bridges to act accordingly.
>=20
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024-hpd-irq-ev=
ents-v8-0-6ee949e7a384@oss.qualcomm.com?part=3D3


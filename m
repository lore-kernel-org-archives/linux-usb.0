Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792419;
	b=NwhLMzMxYzmmlz8jSFiDR2A/iGP40ePzvRGlGsXzC4iqPBktbNBZMv9L++fiok/j1Afq
	 rwRyQPFQ6B/XWWbI9Yg/arata7I1yzEZPEMRkUgOTbVSWsk02/uXnlo/ZwiBjxhzjDA9b
	 qFbr7NDYZe3YFaehAX+w6q8mzQG06OSPdmI0oVlLFjzspwgylChNL1Kg4oi+R77kA0lxg
	 8ZdF8Rvgxku0VzS5sgG9ZYC85DcTcRk1cEvCw9dvMFrFwkmyRakIXZPrCfYH8KpTYiJPw
	 9C7eC74ZJrGXtgrTlFkXKZEAqROyPnojpw98uL9LFiVQpVvbrbAu3D8Rif63EkAAE+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792419;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SWLsaVl8sCHTeRUkEgT4yr8nkBdHmHw4hkPKovnUSgA=;
	b=vzYRV228KqI6yogat6TVDT4nCY2Y+72P5EKb/6c3kT0vbWm8eaS9g8AWQcx1RMCgmWAq
	 2ok5vkIOjsOmo+Z1v3SrSszXMlJoafxIuMBCYEHMKKC8T3R5/2Xa6JA8jX36fFreLhxgs
	 Uq4RfPE/07pqkFWdK7VIYEOgLRl9DRAZ8ld1BSPaG9VfX38+S5kXDUuIO6xCmFjGmJwAm
	 OWQh/Uwhm6oqVyXjJr7Ht1zTayoHhBgYv7plQCTanrigHuRLPj8B86h60tSvRWM3HgYmZ
	 Qg0BhwdgUIJwthEn040I4OyPYxly0F6Ty1zSRwu0k8uzvqWZ5Iz1eIYmPL9ouExEBWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSDH0eA6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48AC606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSDH0eA6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671DD1F000C1;
	Wed,  4 Nov 2026 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793792418;
	bh=SWLsaVl8sCHTeRUkEgT4yr8nkBdHmHw4hkPKovnUSgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cSDH0eA6tHeZLXqQBJKr8StLvJSZOK6DG7ZbAlBjgf7CK2ZbsImPRerfgWv1B37KY
	 Kgqch+LLAzJ/8Jdy1F+xdC7Bq8915a5UwGOo2w0n9sAaFo8D+zxgNc3OjTeDaeHdWh
	 W3qypdGmy0z4GsUI20yocMO2+AlAcwvqVbxOxcSY8rfCFN/grEaeQFRilB1cb9MPUO
	 bkc9B3T4+KBtG1gGg1LjYN4jJUvFXxaR47o8sxupU8wGNaw//5h/0aCpwmr3niuZnZ
	 AiJ56QHyQQ3D8FnejYoDiwL3AF7odO+IJ478u9GFc0+dVf9W9ujwIi/4rt9FwlnC5B
	 uIxtHyiIQyk7A==
Message-ID: <sashiko-outbox-197196@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: phy: Convert to subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104113412.1634294-1-peng.fan@oss.nxp.com>
References: <20261104113412.1634294-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 11:40:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Peng Fan <peng.fan@nxp.com>
>=20
> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
>=20
> No functional change.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104113412.1634=
294-1-peng.fan@oss.nxp.com?part=3D1


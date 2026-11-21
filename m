Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279136;
	b=GxrqTES8E/lwxwpTlw6AbLaygVWx19xO3/VlfD68xWAg+AJlRUIsOTON98PLxHGI1dRk
	 CkYQA99p1fR0SnnuVA/y3E7cEU4HykNZYRdLupJH0HHZ2zVryK5Ft4+ghW+kmGhMf/suE
	 ZIt85rI1XEIybKft8lwPlwtKiY/H1L9F+BbYqBK89edXe/YNUPo2YjxH48vxGWHVe+EfC
	 LBk2S5tgWZQZds2vVJJIZfRRqFTEZ2E7OwDE64OdV9PJd4iXaKnQf0XBkQUgwoWdf5XtU
	 +oruCaMdPg5BYkQZpZnRNx585jWpGa6hlCENc7weWsXYgNVtYBH7CQP1cA1c0DAMulw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279136;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kbHnlgfdNQwLVZsCixI7dUrUTaoYk4ISeYWb1s2ol3w=;
	b=oazxwFXpEkDwqWktE0RzaOHcm1NAzzUdTflzFpVRBO2/kqWP5nIRdB5gBgvWcxnasT4Z
	 rVAMEF5HyFLUJD/36MErBaxRPh1ZDAIfos1eln6npypTZbpRi2dSl4mENyhMrrzsRlgrW
	 sSJUSiyiDh9uQbNPBhrt0I1Hhai3KsF5T20m1cHmXf8c/WaaMS8ZZJmz8a0ykkJJjl5K1
	 weXlTwmmQSAPeGBO5cLUJPoqZfHHpK7JiLyR1Hp4PCl8umCAFmxci+WEV7XgWrJVVnGxq
	 Q7g9ozn9voQ5WymXKDv3xTWejLWOPNRMiOBeObKT7OXbSvNceLs6qZ1qhal69Avuhaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mydtcdEK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DF3606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mydtcdEK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A1E71F000C0;
	Sat, 21 Nov 2026 16:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795279136;
	bh=kbHnlgfdNQwLVZsCixI7dUrUTaoYk4ISeYWb1s2ol3w=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=mydtcdEKDzDKVH6wlOoWsN1EaIvMr9SOi4UimdZQ8e0mKIIRAx8R8uB7aka5QfoL9
	 rgE/hvd4za2rP9cZ5Ic6A7UZmEL8Pa0yE2I2SsycUJyEF6Vo02sWcTMxLsE9zLA5C9
	 FM3vCvDEZ6dSiiSCofcEkchNvmcWmyx4u1h+yhKdKNVZxDUFRQnUTpvTBSa8vxv74Q
	 tS8i+BavplOJmQQEysO44pnvKDLQgPcGujoJIlWMPRG6TKj21VUNrYEU35EuCIXOKx
	 LleCVYsIG7+MY45+OwBhrKD/D9eSqMkePSIhA8tCoLdHs4ANUGKjz/QnYcmvC77nzN
	 poZsj/mT2o/Sg==
Message-ID: <sashiko-outbox-227157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: chipidea: Use devm_clk_get_optional_enabled()
 in two probe functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, linux-usb@vger.kernel.org
In-Reply-To: <ab46a205-d1c4-48f2-8891-4de667f8ebf1@web.de>
References: <ab46a205-d1c4-48f2-8891-4de667f8ebf1@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 16:38:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Nov 2026 17:06:32 +0100
>=20
> * Reuse existing functionality from devm_clk_get_optional_enabled()
>   instead of keeping duplicate source code.
>=20
> * Omit a clk_disable_unprepare() call on error handling paths
>   and in the implementation of two remove functions.
>=20
> * Delete the label =E2=80=9Cclk_err=E2=80=9D.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/ab46a205-d1c4-48f2-=
8891-4de667f8ebf1@web.de?part=3D1

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605121;
	b=ZV3L5b2pjU+KcJa9xVmg8cn0hmbPOwmNiGL5p+2rbM+ATizhKz3H2wwulyb9TmVE/a/G
	 ATj4Iu6a04J0cavQxR0KE+HNYK3ChzloccakNtd9oGbhs30EtDr0jKIlWmwhGzeSfEatS
	 sSAYbpVT2+cSVb+WZyjYQX6yS1pjtAy3ArY/T0HsXjoGI/fgtr1vSIBtXjTfwZC3kmza/
	 jgXqW6oxNNOgqCKZkFwkExUbEHgan/k9BZkkY3ZmuMRIp/Fw+1hngy1CrSt2BDeHyFqzH
	 7jsM8GarcR57ZUZ9ChEllgFlvK9QnqyagnfJww1s5o98C6N6/6Aua7SXpC3zapGuylg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605121;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DDF2bi27BgientIUY+qoTjqDiVZNeGZCm3iQB8Y7FtM=;
	b=AAm49x0Y7qAen1mImyMnuaQJlKeCzgsHzGfSISBxHgDO7XutJgaZuxpKKnLkSY4VVF2u
	 0TbbRTXBDkGRnIaqSv3b61XH2uj+NlxG5qiob6YtL3xNw0dbrjDgM+UAjah4yX/j7yJ5s
	 OPGxRKsHuBMTee88As74JI0z4zXI/+XTFJTR9Xq1Out4+0liyM0fpsJQF7JZLC6xYdU2a
	 kysIQR1PRlE93HaGL5uu1213vDul8I/X/tk3GJgZbmA4uHV6t9dV5svVhDQGuxj19CD1W
	 n2A5b5jfHg6/7HvApy1vCcc5l43Ov+7weqfx4Yr7UIPnfIUhwSxoybiRnpC/KXwOJlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RjWOuP+4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BAA606A336
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RjWOuP+4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143C01F000C6;
	Wed, 25 Nov 2026 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795605121;
	bh=DDF2bi27BgientIUY+qoTjqDiVZNeGZCm3iQB8Y7FtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RjWOuP+4vmqPo/vYuJ+5N8E7sPay9n5WMKb1ijRiaKOm0j6PpB9ffRVhwrnNzfcm4
	 noODqER3jrLKcBBwkk9H8uMxWh4N1wYbS8p9waDv5qaq8ziIIUeI2ju/K5xjSk4xbp
	 CshE32i3whlv5d7EKIWjjw0OTTNS8mwDB/aRI35mmVRgAAmRy9WDyuDqaE3VJlIXa1
	 +WkmKAC7HsA8iH++fhXOMpNYS+0HamWUZNlA6QZifsOV65x2HDEfgCtwbSJ/pEWqwY
	 zgM0NwR6T+Jt0lImcacK8hFJ1RQYxVTvcFKRLtDKpYhfq9PxrW5cW1v9cZT/oKgTOr
	 8uYjzJbL3OJXA==
Message-ID: <sashiko-outbox-233202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: qcom,pmic-typec: document PM8550B
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125-topic-sm8x50-pm8550b-tcpm-v1-1-f54040ccbbaa@linaro.org>
References: <20261125-topic-sm8x50-pm8550b-tcpm-v1-1-f54040ccbbaa@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 11:12:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the PM8550B as compatible with the PM8150B typec PD and PHY
> controllers.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-topic-sm8x=
50-pm8550b-tcpm-v1-1-f54040ccbbaa@linaro.org?part=3D1

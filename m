Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675962;
	b=s8M+QXLQKEyoZKhY6BqsQ22D+bC7VJ0gkJQ7VtELKU095vrGGXJA5gWXhJ0uYCzOycMC
	 RRYJzGHWSie3SpBVht9hu3Wpsn9S1rZ1Nc+oegWF8D5NPVI/6mdxd6o1qf7LDNYvzWp5v
	 66ce59wCeiTQ9SDYcHQpazd3+bCHQZj7G090gWTzukLp37OuGFbqxi4OO40Jb4t4kPEp9
	 xMY+DUa0rzSQNxvZUhm37Av/zGs7s6oOBv4KxFRlchZkg9FabfJpXiCsti5avtCNLh0rK
	 P4fIcI4I6e92pAoTa+M0PJw4K+ZNgZnVl1YBLS0dbsct5GIgQoL/N0liu3pV9wtZ1Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675962;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=psF6X8iqSLuJCTYX384+e8I05T//0jMsCXH0QDgLQRs=;
	b=jD7bu4bjwkT6DBfQUBx3mWYETyQsex4wYvHc9irUgt+O9yhrm9AZuFcVVo8aLm8D9IvA
	 4TvohZqf+44a7nfxM9emEnOPRY6Dj5xJkeaZDgOJRcxIKXTGg8zQZK7wtn5Z1tO8jrb1Y
	 W7t+KVW52JjEbmncTz2gPa5zKfxkX6rXeYXaVQyH72nvjOGa4EtkBQf7bRCvHmx8F19oM
	 kzYQS8O8MbJuqkpO1Sq8QupA41Efup6CvRA/M94V7R3cuy2RdCxdCtIvphBEzF9k00S20
	 uS1tyekcvN4dPxGppcue1bKzzLfkrFH4l0qnXgidVsbQDQnABsu+bNHjt4/nbnNusog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hq1Zvf3t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A804606A31A
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hq1Zvf3t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BA91F000C1;
	Thu, 22 Oct 2026 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792675962;
	bh=psF6X8iqSLuJCTYX384+e8I05T//0jMsCXH0QDgLQRs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hq1Zvf3tNyQVXJMsGUxgOGvnhdMoFCS/Ucv8eAjfwd0m/Yu1l5Cd+WO1BaZAg3Iq3
	 lStR0D+5s/h32lOch44TE/vq3+93It8gZ57ZV3Mszu4o+/rpsfZP6lz0gQaOpG3qno
	 QbHEJnrxm5d52Ux6S5bsCytmvTVg1B54sZOWvvquVaMD8XpNRnxCz9ofNMQkgHbWXU
	 5RrY+tM7qwCiouWWxe7hxMYTUG9RC6wIM04nISXYLpiSFjRpPYYUHF936LdW4wW4R2
	 vJodQxoCkV/TDFoSq0+iI80sDE+jBeccjDEf6ty1YoeTxLd8b99wOHMMbrIMMfnWE1
	 OTiJJQDAO/gDA==
Message-ID: <sashiko-outbox-181543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] drm/connector: pass down IRQ_HPD to the drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261022-hpd-irq-events-v6-2-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-2-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 13:32:41 +0000
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
> the Sink side.
>=20
> Extend drm_connector_funcs::oob_hotplug_event() to pass the
> notifications about the IRQ_HPD events down to the individual drivers,
> letting them handle those as required. Bridge core is converted in the
> next step.
>=20
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-hpd-irq-ev=
ents-v6-0-337ea3ddaa62@oss.qualcomm.com?part=3D2


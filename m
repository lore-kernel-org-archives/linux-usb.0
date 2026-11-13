Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591413;
	b=ApFiCNTDsPO3fiH1D4bGyOdtyUWCWbCoxIBE6eoG3+N+bcaMF2hQOQAkXqo9gzEs34md
	 zYuwr2QOdywTNPET9Huk9hSRplUKWpJSL1kWAxJ/UrxPu0vC7cYgF7fh4GGvpGTirsX9f
	 oYVuwhXG5ahpDEOvgIponnegIwBYCdzOTMgwR5WNY+NwXY3fJEsLAmpIueh98gpi55aU+
	 6efVwghnbNgSOYSB7WMazjuW2vOJtIa28j1ZMjUOR6ziqsGFUQZJGAKFSl+R/TwDa+Swy
	 rVOc+VVWZySvXZ5BKwxyILNp13ELgPWPojVAPtF4Mz/Cf4yRK6IOACyeW9N6W+W5NqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kx2y8AovsPqFsu8PDdlFkYeM+6VsFfA0fk88NH13/jY=;
	b=Q5NZg/fEF7izNBo1uRZciMK0fx0efqB18fJ6ntKkJmHjVCxfso6Ssr8i1xj5cOOmYWp3
	 gqHxwuyv12KuK25t4nobuLOQNr0SrtVI4Vpsm6h3gzxwc+xdLAZareG/On315tFMblKlj
	 xv/veHVX2FooE4Pt/czFok1G+8VoSaNs2EA2tVo3b8EpmwK4tW83EwnnG4hqqmq/aRCg6
	 8PNjZtW7jobwA0Hn+duuQe2d/Spb8RrB1NmrotSWKLVCbI0r1VMX6e+6986zOQVz1wCHh
	 Nh6BfdC9nVGkGiUXozDUTZmSgfCK9+i0+JHsgJDyCYOR/0/NwsLNzO7ilWMoDrgJ5vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=drBADf0q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50966079D79
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=drBADf0q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E7A1F000C4;
	Fri, 13 Nov 2026 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591413;
	bh=Kx2y8AovsPqFsu8PDdlFkYeM+6VsFfA0fk88NH13/jY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=drBADf0qZ8JnJELfOTZQZ2p9p8Dl2CL9ih+DqrwhKAs+YONcQYTC7jbeVR1fcI8xa
	 y5exo/I+rrlgI/DYSvFO+BtZTyzK3ozf40ApcfMfPoPLmqHA9Qq+AZwYj0OolhJMMN
	 AiGdZYNhWs2TE7FZSyRr+TkOeiNi6Ics0lfxvKKTyrXYdj8FKPs7KNedw6tYpW1m6A
	 w4ACwdM9+hmS57fXgXl3sKPCYAPngDkOn3cMlObfOqY1sW87UTe0Urj4QebOrLCjwo
	 Gu4HG+cu9lA8Nt6oS7JFLRe/BJORhOOnWa0JOy7ugvsWwx7o4QsuklVJ3StYmPk5BO
	 b8nnrS5eDFATg==
Message-ID: <sashiko-outbox-213331@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] usb: typec: fusb302: move gpio_int_n into function
 local scope
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-6-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-6-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:36:52 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The driver only cares about the interrupt and the GPIO itself is
> device managed, so drop the reference from the device structure
> and only keep it in the function scope. While at it cleanup the
> error handling by using dev_err_probe.
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D6


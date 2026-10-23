Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763150;
	b=jx0kubP1uzY+pCFMmbg8MT9Ov+MJxbOQTz8dCe2epv88h5VBHTyEr+GcOJBwwMPIce9j
	 2RYTDBZnBdBe6kpzZMoTUdGsAdomO2blJycL37n3a68gwni719aE9HFluIk3nVdG0hLrS
	 sNEbGrfckEDAOzABd/j4gVaYrF15x/zizOiMM9TMk7HOBB498P45HceWrEUbgPYKnMn3o
	 ra9UobKm62isgaCV5tGEUfzX9oBMdkPrpuIe752Tx9LVm9NP2kgZycwgYnM9cvKl9RB2W
	 GPznsM/vmwfrg5/9yJkAPXcb5VYRpwW/NJ5OpC0LA1DNjvsi8mGD0raoZDGM+cRF3tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763150;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ElqJUYk/4KoJntQdZREJZqvHwoyti7SE6FVeFrl/aO4=;
	b=NUx1Fb3Mbt36m/WVN5y9le+BX5PloH7Jo2/T0a9YoHVxLo4u8LaeTkU+v8Qq5v/340IQ
	 8j7JVeqvWGPG6d26A5Xul6YSBXYQYGfZBl2zIah1bxem+OCbD9+sEb5SL7V7cBLB5JX1q
	 bGv0cs/vXQXqqB1/fk/wOJG+GV2NuWfx51JvZ0xqwJLtefiiZzna4OKeWf9Fp7ipu1oGL
	 cEFRDuGio9ObDzIadmygXzsK/RylqyUz77gKEs9G7Z2EYrjUsJBkfwUj+/bkkAnoWkf1u
	 6A+vAROqIW05cZs+um8ZuoWqsDLzBfaiRm0kD2EtE85Pzr2eZ8O9LWIij12jMqtcbuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RObh5w2p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F63D606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RObh5w2p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28971F01825;
	Fri, 23 Oct 2026 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792763149;
	bh=ElqJUYk/4KoJntQdZREJZqvHwoyti7SE6FVeFrl/aO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RObh5w2pShLtGmfC+ltVukbDbEnomggfie0e18dqWYuk22n6uT1JY8K+48G4RmlVe
	 V9bTTaHc93Swt2U8Vk6JnYrkncE9n1y1garV17ykoZNAMSLZKz0Uu9cyBZBI0ej79p
	 6nruq3dONv+9yS+/A29+BN2BExLTv0/DBL5BLEmdaYRyH5I+cE/3tZkrPQVpwOwDgy
	 xVqqVQd25ia4CpCzo4sY77AawPLWTCoPUmvK79VNYFbrlP5nQLo0ugoaSYq7+v5eNc
	 wVT8NkOk8DoAMvlbg012MzPl5y7NQPciXyV4GiYIzr3Y5wv4w9S40S7VKsf0CqrnBn
	 AvAggOhJVxfeQ==
Message-ID: <sashiko-outbox-182848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 9/9] usb: typec: ucsi: huawei-gaokun: pass down
 HPD_IRQ events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023-hpd-irq-events-v7-9-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-9-57a3aea3f09e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 13:45:49 +0000
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
> Pass IRQ_HPD events from the EC to the HPD bridge, letting those
> to be delivered to the DisplayPort driver.
>=20
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-hpd-irq-ev=
ents-v7-0-57a3aea3f09e@oss.qualcomm.com?part=3D9

